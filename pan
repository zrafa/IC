IN=UnidadesDeInformación
OUT=Uni
TITLE="Unidades de Información"

pandoc \
	-V lang=spanish \
	-V fontfamily=sans\
	-V papersize=A4 \
	-V title="$TITLE" \
	$IN.md --toc -o $OUT-notes.pdf
pandoc \
	-s \
	-V lang=spanish \
	-V fontfamily=sans \
	-V papersize=A4 \
	-V title="$TITLE" \
	$IN.md --toc -o $OUT-notes.rtf
	

pandoc \
	-s \
	-V lang=spanish \
	-V fontfamily=sans \
	-V papersize=A4 \
	-V title="$TITLE" \
	$IN.md --toc -o $OUT-notes.docx
	

