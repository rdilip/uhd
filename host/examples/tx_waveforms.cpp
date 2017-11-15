//
// Copyright 2010-2012,2014 Ettus Research LLC
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#include "wavetable.hpp"
#include <uhd/property_tree.hpp>
#include <uhd/utils/thread_priority.hpp>
#include <uhd/utils/safe_main.hpp>
#include <uhd/utils/static.hpp>
#include <uhd/usrp/multi_usrp.hpp>
#include <uhd/exception.hpp>
#include <boost/program_options.hpp>
#include <boost/math/special_functions/round.hpp>
#include <boost/format.hpp>
#include <boost/thread.hpp>
#include <boost/lexical_cast.hpp>
#include <boost/algorithm/string.hpp>
#include <stdint.h>
#include <iostream>
#include <csignal>
#include "usage.h"
//#include "../lib/usrp/cores/radio_ctrl_core_3000.hpp"
#include <cstdio>
#include <ctime>

/*
#include "../lib/usrp/common/ad9361_ctrl.hpp"
#include "../lib/usrp/b200/b200_regs.hpp"
#include "../lib/usrp/b200/b200_impl.hpp"
#include "../lib/usrp/b200/b200_cores.hpp"
#include "../lib/usrp/b200/b200_uart.hpp"
#include "../lib/usrp/b200/b200_iface.hpp"
*/


#include <complex>
#include <uhd/usrp/multi_usrp.hpp>
#include <vector>

#define TOREG(x) ((x)*4)

namespace po = boost::program_options;

/***********************************************************************
 * Signal handlers
 **********************************************************************/
static bool stop_signal_called = false;
void sig_int_handler(int){stop_signal_called = true;}

/***********************************************************************
 * Main function
 * NOTE that clock frequency is hardcoded in as 32.768... we should give
 * option to change this at some point.
 **********************************************************************/

static void print_tree(const uhd::property_tree::sptr tree, const std::string prefix) {
  std::cout << prefix << std::endl;
  std::vector<std::string> names = tree->list("");
  for (std::vector<std::string>::iterator it = names.begin() ; it != names.end(); ++it) {
    uhd::property_tree::sptr subtree = tree->subtree(*it);
    if (subtree)
      print_tree(subtree, prefix+'/'+*it);
  }
}
static uint32_t combine(float fq, int am, int ph) {
	uint32_t comb_fq_am_ph;
	uint16_t fq0;
	uint8_t am0, ph0;
	am0 = (uint8_t)(am * 254);
	ph0 = (uint8_t)(ph * 254 / 6.28);
	fq0 = (uint16_t)((fq / 32.768) * std::pow(2,16));
	comb_fq_am_ph = ph0;
	comb_fq_am_ph = (comb_fq_am_ph << 8) | am0;
	comb_fq_am_ph = (comb_fq_am_ph << 16) | fq0;
	return comb_fq_am_ph;
}

static void set_tone(uhd::property_tree::sptr tree, int index, float fq, int am, int ph) {
	const uhd::fs_path mb_path = "/mboards/0";
	const uhd::fs_path rx_dsp_path = mb_path / "rx_dsps" / 0;

	uint32_t comb_fq_am_ph;
	comb_fq_am_ph = combine(fq, am, ph);

	tree->access<uint32_t>(rx_dsp_path / "llr_reg" + std::to_string(index)).set(comb_fq_am_ph);
}

int UHD_SAFE_MAIN(int argc, char *argv[]){
    uhd::set_thread_priority_safe();

    //variables to be set by po
    std::string args, wave_type, ant, subdev, ref, pps, otw, channel_list;
    uint64_t total_num_samps, spb;
    double rate, freq, gain, wave_freq, bw;
    float ampl;

    //setup the program options
    po::options_description desc("Allowed options");
    desc.add_options()
        ("help", "help message")
        ("args", po::value<std::string>(&args)->default_value(""), "single uhd device address args")
        ("spb", po::value<uint64_t>(&spb)->default_value(0), "samples per buffer, 0 for default")
        ("nsamps", po::value<uint64_t>(&total_num_samps)->default_value(0), "total number of samples to transmit")
        ("rate", po::value<double>(&rate), "rate of outgoing samples")
        ("freq", po::value<double>(&freq), "RF center frequency in Hz")
        ("ampl", po::value<float>(&ampl)->default_value(float(0.3)), "amplitude of the waveform [0 to 0.7]")
        ("gain", po::value<double>(&gain), "gain for the RF chain")
        ("ant", po::value<std::string>(&ant), "antenna selection")
        ("subdev", po::value<std::string>(&subdev), "subdevice specification")
        ("bw", po::value<double>(&bw), "analog frontend filter bandwidth in Hz")
        ("wave-type", po::value<std::string>(&wave_type)->default_value("CONST"), "waveform type (CONST, SQUARE, RAMP, SINE)")
        ("wave-freq", po::value<double>(&wave_freq)->default_value(0), "waveform frequency in Hz")
        ("ref", po::value<std::string>(&ref)->default_value("internal"), "clock reference (internal, external, mimo, gpsdo)")
        ("pps", po::value<std::string>(&pps), "PPS source (internal, external, mimo, gpsdo)")
        ("otw", po::value<std::string>(&otw)->default_value("sc16"), "specify the over-the-wire sample mode")
        ("channels", po::value<std::string>(&channel_list)->default_value("0"), "which channels to use (specify \"0\", \"1\", \"0,1\", etc)")
        ("int-n", "tune USRP with integer-N tuning")
    ;
    po::variables_map vm;
    po::store(po::parse_command_line(argc, argv, desc), vm);
    po::notify(vm);

    //print the help message
    if (vm.count("help")){
        std::cout << boost::format("UHD TX Waveforms %s") % desc << std::endl;
        return ~0;
    }

    //create a usrp device
    std::cout << std::endl;
    std::cout << boost::format("Creating the usrp device with: %s...") % args << std::endl;
    uhd::usrp::multi_usrp::sptr usrp = uhd::usrp::multi_usrp::make(args);

    //detect which channels to use
    std::vector<std::string> channel_strings;
    std::vector<size_t> channel_nums;
    boost::split(channel_strings, channel_list, boost::is_any_of("\"',"));
    for(size_t ch = 0; ch < channel_strings.size(); ch++){
        size_t chan = boost::lexical_cast<int>(channel_strings[ch]);
        if(chan >= usrp->get_tx_num_channels())
            throw std::runtime_error("Invalid channel(s) specified.");
        else
            channel_nums.push_back(boost::lexical_cast<int>(channel_strings[ch]));
    }


    //Lock mboard clocks
    usrp->set_clock_source(ref);
    //always select the subdevice first, the channel mapping affects the other settings
    if (vm.count("subdev")) usrp->set_tx_subdev_spec(subdev);

    std::cout << boost::format("Using Device: %s") % usrp->get_pp_string() << std::endl;

    //set the sample rate
    if (not vm.count("rate")){
        std::cerr << "Please specify the sample rate with --rate" << std::endl;
        return ~0;
    }
    std::cout << boost::format("Setting TX Rate: %f Msps...") % (rate/1e6) << std::endl;
//    usrp->set_tx_rate(rate);
    std::cout << boost::format("Actual TX Rate: %f Msps...") % (usrp->get_tx_rate()/1e6) << std::endl << std::endl;

    //set the center frequency
    if (not vm.count("freq")){
        std::cerr << "Please specify the center frequency with --freq" << std::endl;
        return ~0;
    }

    for(size_t ch = 0; ch < channel_nums.size(); ch++) {
        std::cout << boost::format("Setting TX Freq: %f MHz...") % (freq/1e6) << std::endl;
        uhd::tune_request_t tune_request(freq);
        if(vm.count("int-n")) tune_request.args = uhd::device_addr_t("mode_n=integer");
        usrp->set_tx_freq(tune_request);
        std::cout << boost::format("Actual TX Freq: %f MHz...") % (usrp->get_tx_freq(channel_nums[ch])/1e6) << std::endl << std::endl;

        //set the rf gain
        if (vm.count("gain")){
            std::cout << boost::format("Setting TX Gain: %f dB...") % gain << std::endl;
            usrp->set_tx_gain(gain, channel_nums[ch]);
            std::cout << boost::format("Actual TX Gain: %f dB...") % usrp->get_tx_gain(channel_nums[ch]) << std::endl << std::endl;
        }

        //set the analog frontend filter bandwidth
		  /*
        if (vm.count("bw")){
            std::cout << boost::format("Setting TX Bandwidth: %f MHz...") % bw << std::endl;
            usrp->set_tx_bandwidth(bw, channel_nums[ch]);
            std::cout << boost::format("Actual TX Bandwidth: %f MHz...") % usrp->get_tx_bandwidth(channel_nums[ch]) << std::endl << std::endl;
        }

*/
        //set the antenna
		  /*
        if (vm.count("ant")) usrp->set_tx_antenna(ant, channel_nums[ch]);
		  */
    }

    boost::this_thread::sleep(boost::posix_time::seconds(1)); //allow for some setup time


    //create a transmit streamer
    //linearly map channels (index0 = channel0, index1 = channel1, ...)
    uhd::stream_args_t stream_args("fc32", otw);
    stream_args.channels = channel_nums;
    uhd::tx_streamer::sptr tx_stream = usrp->get_tx_stream(stream_args);

    //allocate a buffer which we re-use for each channel
    if (spb == 0) spb = tx_stream->get_max_num_samps()*10;
    std::vector<std::complex<float> > buff(spb);
    std::vector<std::complex<float> *> buffs(channel_nums.size(), &buff.front());

    std::signal(SIGINT, &sig_int_handler);
    std::cout << "Press Ctrl + C to stop streaming..." << std::endl;

    // Set up metadata. We start streaming a bit in the future
    // to allow MIMO operation:
    uhd::tx_metadata_t md;
   	// STARTING JTL 

	// JTL CODE
	const uhd::fs_path mb_path = "/mboards/0";

	const uhd::fs_path rx_dsp_path = mb_path / "rx_dsps" / 0;


	uhd::property_tree::sptr _tree;
	uhd::device::sptr dev;
	dev = usrp->get_device();
	_tree = dev->get_tree();

	std::clock_t start;
	double duration;

	start = std::clock();
	set_tone(_tree, 1, 2.0, 1.0, 0.0);
	set_tone(_tree, 2, 4.0, 1.0, 0.0);
	set_tone(_tree, 3, 5.0, 1.0, 0.0);
	while (true) {
        if (stop_signal_called) break;

        tx_stream->send(buffs, buff.size(), md);
		// CHECKING ABILITY TO CHANGE, ALL THIS TO BE DELETED
		duration = (std::clock() - start) / CLOCKS_PER_SEC;
		if (duration > 3) {
			set_tone(_tree, 3, 7.0, 1.0, 0.0);
		}
	}
    //finished
    std::cout << std::endl << "Done!" << std::endl << std::endl;
    return EXIT_SUCCESS;
}

