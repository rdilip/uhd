TARGET = tfdmodule.so
OFILES = siptfdmodulecmodule.o
HFILES = sipAPItfdmodule.h 

CC = gcc
CXX = g++
LINK = g++
CPPFLAGS = -DNDEBUG -I. -I/home/thompsonlab/anaconda3/include/python3.6m
CFLAGS = -pipe -fPIC -O2 -Wall -W
CXXFLAGS = -pipe -fPIC -O2 -Wall -W
LFLAGS = -shared -Wl,--version-script=tfdmodule.exp
LIBS = -L. -ltfd
.SUFFIXES: .c .o .cpp .cc .cxx .C


.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.C.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.c.o:
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<

all: $(TARGET)

$(OFILES): $(HFILES)

$(TARGET): $(OFILES)
	@echo '{ global: PyInit_tfdmodule; local: *; };' > tfdmodule.exp
	$(LINK) $(LFLAGS) -o $(TARGET) $(OFILES) $(LIBS)

install: $(TARGET)
	@test -d $(DESTDIR)/home/thompsonlab/anaconda3/lib/python3.6/site-packages || mkdir -p $(DESTDIR)/home/thompsonlab/anaconda3/lib/python3.6/site-packages
	cp -f $(TARGET) $(DESTDIR)/home/thompsonlab/anaconda3/lib/python3.6/site-packages/$(TARGET)
	strip $(DESTDIR)/home/thompsonlab/anaconda3/lib/python3.6/site-packages/$(TARGET)

clean:
	-rm -f $(TARGET)
	-rm -f siptfdmodulecmodule.o
	-rm -f tfdmodule.exp
