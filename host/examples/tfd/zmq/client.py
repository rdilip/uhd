import zmq

context = zmq.Context()
socket = context.socket(zmq.REQ)
port='5555'
socket.connect("tcp://localhost:%s" % port)

for i in range(1,10):
	socket.send_string("1 5 1.0 0.0")

	message = socket.recv()
