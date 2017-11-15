#ifndef TFDMODULE_H // Header guards
#define TFDMODULE_H

#include <uhd/utils/thread_priority.hpp>
#include <uhd/utils/safe_main.hpp>
#include <uhd/usrp/multi_usrp.hpp>
#include <uhd/property_tree.hpp>
#include <iostream>
#include <stdint.h>

	class tfd {
		public:
			tfd(float _freq, float _gain = 90.0, float _clock_rate =
				32.768, uint64_t _spb = 0);
			~tfd();
			void set_freq(int _index, float _fq, float _am, float _ph); // Sets a frequency
			void set_offset(uint16_t dc_offset);
			void print_parameters();	// Prints frequency, gain, clock_rate, and spb
			void run();
			void listen();

		private:
			// Member variables
			float freq;
			float gain;
			float clock_rate;
			uint64_t spb;
			uhd::property_tree::sptr tree;
			uhd::tx_streamer::sptr tx_stream;
			uhd::tx_metadata_t md;
			std::vector<std::complex<float> > buff;
			std::vector<std::complex<float> *> buffs;
	};
#endif

