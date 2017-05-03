

#ifndef USRPCONTROLLER_H
#define USRPCONTROLLER_H

#include <complex>
#include <uhd/usrp/multi_usrp.hpp>
#include <vector>


using std::complex;
using std::vector;

namespace USRP {

}

class USRPController {
public:



    uhd::property_tree::sptr tree;

    void programLLRValues();
private:

};

#endif // USRPCONTROLLER_H
