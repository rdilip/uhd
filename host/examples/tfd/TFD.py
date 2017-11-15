import zmq
import subprocess

class TFD:
	def __init__(self, _center_freq=80E6, _gain=90, _clock_rate=32.768):
		self.freq = _center_freq
		self.gain = _gain
		self.clock = _clock_rate
		self.proc = subprocess.Popen("./tfd --freq {0} --gain {1} --clock_rate {2}".format(\
			_center_freq, _gain, _clock_rate))
		context = zmq.Context()
		self.socket = context.socket(zmq.REQ)
		port='5555'
		self.socket.connect("tcp://localhost:%s" % port)
	
	def send_freq(i, fq, am, ph):
		""" Sets a tone indexed by i to a specified frequency fq, amplitude am, and
		phase ph. Amplitude should be a float between 0 and 1, phase should be a value
		from 0 to 2\pi """
		socket.send_string("1 5 1.0 0.0")
		message = socket.recv()


