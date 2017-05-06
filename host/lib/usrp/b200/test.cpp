#include <iostream>
#include <stdlib.h>
#include <stdint.h>

#include <bitset>

int main() {
	std::cout << "Hello world!" << std::endl;
	uint16_t n1 = 6000;
	uint8_t n2= 127;
	uint8_t n3= 0;
	std::cout << "My numbers " <<n1 << std::endl;

	uint32_t result = n1;
	std::cout << "First result: " <<result << std::endl;
	result = (result << 8) | n2; 
	std::cout << "Second result" << result << std::endl;
	result = (result << 8) | n3;
	std::cout << std::bitset<32>(result)<<std::endl;
	}

