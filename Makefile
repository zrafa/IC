DEPS = src/reveal.header src/reveal.trailer
DTAPE=/home/oso/IC2016/decktape

all: siste uni repre arqui 
	pandoc -V lang=spanish -V fontfamily=sans -V papersize=A4 -V title="Introducción a la Computación 2017" --toc \
	SistemasDeNumeración.md \
	UnidadesDeInformación.md \
	RepresentaciónDigitalDeDatos.md \
	TextoYMultimedia.md \
	ArquitecturaDeComputadoras.md \
	Software.md \
	-o ic2017.pdf

git: 
	util/github "mm"


index: index.html
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
arqui: ArquitecturaDeComputadoras.html

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
	pandoc \
		-s \
		-V lang=spanish \
		-V fontfamily=sans \
		-V papersize=A4 \
		-V title="$(TITLE)" \
		$*.md --toc -o $*-notes.rtf
	#Acces
	pandoc \
		-s \
		-V lang=spanish \
		-V fontfamily=sans \
		-V papersize=A4 \
		-V title="$(TITLE)" \
		$*.md -t plain | util/plain2acces > $*-acces.txt


#	$(DTAPE)/bin/phantomjs $(DTAPE)/decktape.js reveal http://localhost:8000/$*.html $*.pdf



clean: 
	mv index.html Presentación.html Software.html SistemasOperativos.html SistemasDeCómputo.html SistemasDeNumeración.html UnidadesDeInformación.html RepresentaciónDigitalDeDatos.html TextoYMultimedia.html ArquitecturaDeComputadoras.html attic
