
#include "usage.h"

#include <boost/format.hpp>
#include <iostream>


/*
static void print_tree(const uhd::property_tree::sptr tree, const std::string prefix) {
  std::cout << prefix << std::endl;
  std::vector<std::string> names = tree->list("");
  for (std::vector<std::string>::iterator it = names.begin() ; it != names.end(); ++it) {
    uhd::property_tree::sptr subtree = tree->subtree(*it);
    if (subtree)
      print_tree(subtree, prefix+'/'+*it);
  }
}
*/


void USRPController::programLLRValues() {
    boost::uint8_t addr = 0x0;
    const size_t whichMBoard = 0;

    int llr_tune = 6;
    int llr_shift = 10;
    int llr_scale = 40;

    boost::uint32_t ll_values;

//I did not give you everything here but you should get the idea   --Jeff
  //  bitpack(llr_reg, 0, 31, 0, bufferFromType(ll_values), 0);

    ll_values=1051463932;

    tree->access<uint32_t>("/mboards/0/rx_dsps/0/llr_reg0")
          .set(ll_values);
    tree->access<uint32_t>("/mboards/0/rx_dsps/0/llr_reg1")
          .set(ll_values);
    tree->access<uint32_t>("/mboards/0/rx_dsps/0/llr_reg2")
          .set(ll_values);
    tree->access<uint32_t>("/mboards/0/rx_dsps/0/llr_reg3")
          .set(ll_values);
    tree->access<uint32_t>("/mboards/0/rx_dsps/0/llr_reg4")
          .set(ll_values);


}


