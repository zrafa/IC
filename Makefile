DEPS = src/reveal.header src/reveal.trailer
DTAPE=/home/oso/IC2016/decktape

all: re so comp pres siste uni repre texto arqui soft demo

demo: demo.html
re: Redes.html
soft: Software.html
so: SistemasOperativos.html
comp: SistemasDeCómputo.html
pres: Presentación.html
siste: SistemasDeNumeración.html
uni: UnidadesDeInformación.html
repre: RepresentaciónDigitalDeDatos.html
texto: TextoYMultimedia.html
arqui: Arquitectura.html

%.html: src/%.slides $(DEPS) 
	util/macro $< > $*.html
	$(eval TITLE = $(shell perl -ne '/data-title=\"(.+)\">/ and print "$$1"' $<) )
	util/asides.pl $< > $*.md
	pandoc \
		-V lang=spanish \
		-V fontfamily=sans\
		-V papersize=A4 \
		-V title="$(TITLE)" \
		$*.md --toc -o $*-notes.pdf


#	$(DTAPE)/bin/phantomjs $(DTAPE)/decktape.js reveal http://localhost:8000/$*.html $*.pdf

clean: 
	mv Presentación.html Software.html SistemasOperativos.html SistemasDeCómputo.html SistemasDeNumeración.html UnidadesDeInformación.html RepresentaciónDigitalDeDatos.html TextoYMultimedia.html Arquitectura.html attic
