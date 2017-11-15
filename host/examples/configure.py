import os
import sipconfig

build_file = "tfd.sbf"

config = sipconfig.Configuration()

os.system(" ".join([config.sip_bin, "-c", ".", "-b", build_file, "tfd.sip"]))
makefile = sipconfig.SIPModuleMakefile(config, build_file)
makefile.extra_libs = ["tfd"]
makefile.extra_lib_dirs = ["."]

makefile.generate()
