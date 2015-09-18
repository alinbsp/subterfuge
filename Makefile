all:
	ghc -o sub --make subterfuge.hs

clean:
	rm *.o *.hi sub