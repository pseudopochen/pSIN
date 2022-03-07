INC = -I/mnt/gv0/brick/tools/fftw/include 
LIB = -L/mnt/gv0/brick/tools/fftw/lib -lfftw3f

psin: psin.cpp
	mpic++ ${INC} -o psin psin.cpp ${LIB}
