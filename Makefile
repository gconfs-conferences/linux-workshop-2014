DOWNLOADS=$(PICS)

all: pdf

pdf:
	pandoc *.md \
		-o tp.pdf

clean:
	rm -f {./,./parts/}*.{aux,log,nav,toc,snm,pdf,out,png}
