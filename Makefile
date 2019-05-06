DEPS = src/reveal.header src/reveal.trailer src/ic.html src/reveal.trailer-audio
DTAPE=/home/oso/IC2016/decktape

index: index.html
soft: Software.html
so: SistemasOperativos.html 
comp: SistemasDeCómputo.html
pres: Presentación.html
siste: SistemasDeNumeración.html
uni: UnidadesDeInformación.html
repre: RepresentaciónDigitalDeDatos.html
texto: TextoYMultimedia.html
arqui: ArquitecturaDeComputadoras.html
redes: Redes.html


%.html: src/%.slides $(DEPS) 
	util/macro $< > $*.html
	$(eval TITLE = $(shell perl -ne '/data-title=\"(.+)\">/ and print "$$1"' $<) )
	echo DATA-TITLE ${TITLE}
	util/asides.pl $*.html > $*.md
	pandoc \
		-V lang=es-ES \
		-V fontfamily=sans \
		-V papersize=A4 \
		-V title="$(TITLE)" \
		$*.md --toc -o $*-notes.pdf
	pandoc \
		-s \
		-V lang=es-ES \
		-V fontfamily=sans \
		-V papersize=A4 \
		-V title="$(TITLE)" \
		$*.md -t plain | util/plain2acces > $*-acces.txt
	pandoc \
		-s \
		-V lang=es-ES \
		-V fontfamily=sans \
		-V papersize=A4 \
		-V title="$(TITLE)" \
		$*.md -t latex > tex/$*-acces.tex


#	$(DTAPE)/bin/phantomjs $(DTAPE)/decktape.js reveal http://localhost:8000/$*.html $*.pdf


all: pdf epub 

# --template eisvogel
# \PassOptionsToPackage{spanish}{babel}
pdf: siste uni repre texto arqui soft comp so redes $(DEPS)
	mkdir -p ~/.pandoc/templates
	cp src/eisvogel.latex ~/.pandoc/templates
	pandoc \
	--template eisvogel.latex \
	-V title="Introducción a la Computación" \
	-V lang=es-ES \
	-V fontfamily=lmodern \
	-V mainfont="Baskervaldx" \
	-V papersize=A4 \
	-V toctitle="Contenidos" \
	-V titlepage=true \
	-V titlepage-color="EEEEFF" \
	-V titlepage-text-color="435488" \
	-V titlepage-rule-height=20 \
	--toc \
	--listings \
	--number-sections \
		src/pdf.yaml \
		SistemasDeNumeración.md \
		UnidadesDeInformación.md \
		RepresentaciónDigitalDeDatos.md \
		TextoYMultimedia.md \
		ArquitecturaDeComputadoras.md \
		Software.md \
		SistemasDeCómputo.md \
		SistemasOperativos.md \
		Redes.md \
		Anexos.md \
			ComplementoALaBase.md \
			Suma2k-1.md \
	-o IC-notes.pdf

epub: siste uni repre texto arqui soft comp so redes $(DEPS)
	pandoc \
	-s \
	-V title="Introducción a la Computación" \
	-M title="Introducción a la Computación" \
	-V subtitle="Facultad de Informática UNC" \
	-V lang=es-ES \
	-V fontfamily=lmodern \
	-V mainfont=bookman \
	--toc \
	--listings \
	--number-sections \
	--to=epub \
		src/epub.yaml \
		SistemasDeNumeración.md \
		UnidadesDeInformación.md \
		RepresentaciónDigitalDeDatos.md \
		TextoYMultimedia.md \
		ArquitecturaDeComputadoras.md \
		Software.md \
		SistemasDeCómputo.md \
		SistemasOperativos.md \
		Redes.md \
		Anexos.md \
			ComplementoALaBase.md \
			Suma2k-1.md \
	-o IC-notes.epub

git: 
	util/github "mm"


clean: 
	mv \
		Presentación.html\
		Software.html \
		SistemasOperativos.html \
		SistemasDeCómputo.html \
		SistemasDeNumeración.html \
		UnidadesDeInformación.html \
		RepresentaciónDigitalDeDatos.html \
		TextoYMultimedia.html \
		ArquitecturaDeComputadoras.html \
		Redes.html \
	attic
	rm *.tex *.aux *.log *.out


