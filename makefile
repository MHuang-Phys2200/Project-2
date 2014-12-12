GRAPH = gnuplot

CC = clang
CFLAGS = -Wall -O0 -g 
LFLAGS = -O0 -g
LIBS = -lgsl -lm

white-dwarf-q2: white-dwarf-q2.o white-dwarf-eqs.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)
	
white-dwarf-q3: white-dwarf-q3.o white-dwarf-eqs.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res1: white-dwarf-q2
	./white-dwarf-q2 > res1
	
res2: white-dwarf-q3
	./white-dwarf-q3 > res2

white-dwarf-q2.png: white-dwarf-q2.gpl res1
	$(GRAPH) white-dwarf-q2.gpl
	
white-dwarf-q3.png: white-dwarf-q3.gpl res2
	$(GRAPH) white-dwarf-q3.gpl

clean : 
	rm -f *~
	rm -f *.o
	rm -f white-dwarf-q2 white-dwarf-q3

veryclean : clean
	rm -f res1 res2 *.png
