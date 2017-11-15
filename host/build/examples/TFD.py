import zmq
import os

class TFD:
	def __init__(self):
		""" Initializes the connection to the C++ side """ 
		context = zmq.Context()
		self.socket = context.socket(zmq.REQ)
		port='5555'
		self.socket.connect("tcp://localhost:%s" % port)


	def set_freq(self, i, fq, am, ph):
		""" Sets a tone indexed by i to a specified frequency fq, amplitude am, and
		phase ph. Amplitude should be a float between 0 and 1, phase should be a value
		from 0 to 2\pi """
		self.socket.send_string("{0} {1} {2} {3}".format(i, fq, am, ph))
		message = self.socket.recv()
	
	def receive(self):
		""" Used if you get a ZMQ error that operations cannot be accomplished in current state """
		self.socket.recv()
	


