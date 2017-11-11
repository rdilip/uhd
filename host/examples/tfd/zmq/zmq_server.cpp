#include <zmq.hpp>
#include <unistd.h>
#include <string>
#include <sstream>
#include <iostream>

int main() {
	zmq::context_t context (1);
	zmq::socket_t socket (context, ZMQ_REP);
	socket.bind("tcp://*:5555");

	while (true) {
		zmq::message_t request;
		socket.recv(&request);
		std::cout << "Received hello!" << std::endl;
		std::string replyMessage = std::string(static_cast<char *>(request.data()), request.size());
		std::istringstream is(replyMessage);
		float fq;
		float amp;
		float ph;
		is >> fq >> amp >> ph;
		
		std::cout << "My numbers: " << fq << "," << amp << "," << ph  << std::endl;
		
		sleep(1);

		std::string msgToClient("");
		zmq::message_t reply(msgToClient.size());

		memcpy((void *) reply.data(), (msgToClient.c_str()), msgToClient.size());
		socket.send(reply);
	}
	return 0;
}
