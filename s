PANDOC(1)                                                             General Commands Manual                                                             PANDOC(1)



NNAAMMEE
       pandoc - general markup converter

SSYYNNOOPPSSIISS
       pandoc [_o_p_t_i_o_n_s] [_i_n_p_u_t_-_f_i_l_e]...

DDEESSCCRRIIPPTTIIOONN
       Pandoc  is  a  Haskell  library  for converting from one markup format to another, and a command-line tool that uses this library.  It can read markdown and
       (subsets of) Textile, reStructuredText, HTML, LaTeX, MediaWiki markup, Haddock markup, OPML, Emacs Org-mode and DocBook; and it can write plain text,  mark‐
       down,  reStructuredText,  XHTML, HTML 5, LaTeX (including beamer slide shows), ConTeXt, RTF, OPML, DocBook, OpenDocument, ODT, Word docx, GNU Texinfo, Medi‐
       aWiki markup, EPUB (v2 or v3), FictionBook2, Textile, groff man pages, Emacs Org-Mode, AsciiDoc, InDesign ICML, and Slidy, Slideous, DZSlides, reveal.js  or
       S5 HTML slide shows.  It can also produce PDF output on systems where LaTeX is installed.

       Pandoc's enhanced version of markdown includes syntax for footnotes, tables, flexible ordered lists, definition lists, fenced code blocks, superscript, sub‐
       script, strikeout, title blocks, automatic tables of contents, embedded LaTeX math, citations, and markdown inside HTML  block  elements.   (These  enhance‐
       ments, described below under Pandoc's markdown, can be disabled using the markdown_strict input or output format.)

       In  contrast  to  most  existing  tools for converting markdown to HTML, which use regex substitutions, Pandoc has a modular design: it consists of a set of
       readers, which parse text in a given format and produce a native representation of the document, and a set of writers, which convert this native representa‐
       tion into a target format.  Thus, adding an input or output format requires only adding a reader or writer.

   UUssiinngg ppaannddoocc
       If  no  _i_n_p_u_t_-_f_i_l_e  is specified, input is read from _s_t_d_i_n.  Otherwise, the _i_n_p_u_t_-_f_i_l_e_s are concatenated (with a blank line between each) and used as input.
       Output goes to _s_t_d_o_u_t by default (though output to _s_t_d_o_u_t is disabled for the odt, docx, epub, and epub3 output formats).  For output to a file, use the  -o
       option:

              pandoc -o output.html input.txt

       Instead of a file, an absolute URI may be given.  In this case pandoc will fetch the content using HTTP:

              pandoc -f html -t markdown http://www.fsf.org

       If multiple input files are given, pandoc will concatenate them all (with blank lines between them) before parsing.

       The  format  of  the  input  and  output  can  be specified explicitly using command-line options.  The input format can be specified using the -r/--read or
       -f/--from options, the output format using the -w/--write or -t/--to options.  Thus, to convert hello.txt from markdown to LaTeX, you could type:

              pandoc -f markdown -t latex hello.txt

       To convert hello.html from html to markdown:

              pandoc -f html -t markdown hello.html

       Supported output formats are listed below under the -t/--to option.  Supported input formats are listed below under the -f/--from  option.   Note  that  the
       rst, textile, latex, and html readers are not complete; there are some constructs that they do not parse.

       If the input or output format is not specified explicitly, pandoc will attempt to guess it from the extensions of the input and output filenames.  Thus, for
       example,

              pandoc -o hello.tex hello.txt

       will convert hello.txt from markdown to LaTeX.  If no output file is specified (so that output goes to  _s_t_d_o_u_t),  or  if  the  output  file's  extension  is
       unknown,  the  output  format  will  default to HTML.  If no input file is specified (so that input comes from _s_t_d_i_n), or if the input files' extensions are
       unknown, the input format will be assumed to be markdown unless explicitly specified.

       Pandoc uses the UTF-8 character encoding for both input and output.  If your local character encoding is not UTF-8, you should pipe input and output through
       iconv:

              iconv -t utf-8 input.txt | pandoc | iconv -f utf-8

   CCrreeaattiinngg aa PPDDFF
       Earlier  versions  of  pandoc came with a program, markdown2pdf, that used pandoc and pdflatex to produce a PDF.  This is no longer needed, since pandoc can
       now produce pdf output itself.  To produce a PDF, simply specify an output file with a .pdf extension.  Pandoc will create a latex file and use pdflatex (or
       another engine, see --latex-engine) to convert it to PDF:

              pandoc test.txt -o test.pdf

       Production  of  a  PDF  requires  that a LaTeX engine be installed (see --latex-engine, below), and assumes that the following LaTeX packages are available:
       amssymb, amsmath, ifxetex, ifluatex, listings (if the --listings option is used), fancyvrb, longtable, booktabs, url, graphicx, hyperref,  ulem,  babel  (if
       the lang variable is set), fontspec (if xelatex or lualatex is used as the LaTeX engine), xltxtra and xunicode (if xelatex is used).

   hhssmmaarrkkddoowwnn
       A  user  who wants a drop-in replacement for Markdown.pl may create a symbolic link to the pandoc executable called hsmarkdown.  When invoked under the name
       hsmarkdown, pandoc will behave as if invoked with -f markdown_strict --email-obfuscation=references, and all command-line options will be treated as regular
       arguments.  However, this approach does not work under Cygwin, due to problems with its simulation of symbolic links.

OOPPTTIIOONNSS
   GGeenneerraall ooppttiioonnss
       --ff _F_O_R_M_A_T,, --rr _F_O_R_M_A_T,, ----ffrroomm==_F_O_R_M_A_T,, ----rreeaadd==_F_O_R_M_A_T
              Specify  input  format.   _F_O_R_M_A_T  can  be  native  (native  Haskell), json (JSON version of native AST), markdown (pandoc's extended markdown), mark‐
              down_strict (original unextended markdown), markdown_phpextra (PHP Markdown Extra extended markdown),  markdown_github  (github  extended  markdown),
              textile  (Textile),  rst (reStructuredText), html (HTML), docbook (DocBook), opml (OPML), org (Emacs Org-mode), mediawiki (MediaWiki markup), haddock
              (Haddock markup), or latex (LaTeX).  If +lhs is appended to markdown, rst, latex, or html, the input will be treated as literate Haskell source:  see
              Literate  Haskell  support,  below.   Markdown syntax extensions can be individually enabled or disabled by appending +EXTENSION or -EXTENSION to the
              format name.  So, for example, markdown_strict+footnotes+definition_lists is strict markdown with footnotes and definition lists enabled,  and  mark‐
              down-pipe_tables+hard_line_breaks  is  pandoc's  markdown without pipe tables and with hard line breaks.  See Pandoc's markdown, below, for a list of
              extensions and their names.

       --tt _F_O_R_M_A_T,, --ww _F_O_R_M_A_T,, ----ttoo==_F_O_R_M_A_T,, ----wwrriittee==_F_O_R_M_A_T
              Specify output format.  _F_O_R_M_A_T can be native (native Haskell), json (JSON version of native AST), plain (plain  text),  markdown  (pandoc's  extended
              markdown), markdown_strict (original unextended markdown), markdown_phpextra (PHP Markdown extra extended markdown), markdown_github (github extended
              markdown), rst (reStructuredText), html (XHTML 1), html5 (HTML 5), latex (LaTeX), beamer (LaTeX beamer slide show),  context  (ConTeXt),  man  (groff
              man),  mediawiki  (MediaWiki  markup),  textile  (Textile), org (Emacs Org-Mode), texinfo (GNU Texinfo), opml (OPML), docbook (DocBook), opendocument
              (OpenDocument), odt (OpenOffice text document), docx (Word docx), rtf (rich text format), epub (EPUB v2 book), epub3  (EPUB  v3),  fb2  (FictionBook2
              e-book), asciidoc (AsciiDoc), icml (InDesign ICML), slidy (Slidy HTML and javascript slide show), slideous (Slideous HTML and javascript slide show),
              dzslides (DZSlides HTML5 + javascript slide show), revealjs (reveal.js HTML5 + javascript slide show), s5 (S5 HTML and javascript slide show), or the
              path  of  a  custom lua writer (see Custom writers, below).  Note that odt, epub, and epub3 output will not be directed to _s_t_d_o_u_t; an output filename
              must be specified using the -o/--output option.  If +lhs is appended to markdown, rst, latex, beamer, html, or html5, the output will be rendered  as
              literate  Haskell  source:  see  Literate  Haskell  support,  below.  Markdown syntax extensions can be individually enabled or disabled by appending
              +EXTENSION or -EXTENSION to the format name, as described above under -f.

       --oo _F_I_L_E,, ----oouuttppuutt==_F_I_L_E
              Write output to _F_I_L_E instead of _s_t_d_o_u_t.  If _F_I_L_E is -, output will go to _s_t_d_o_u_t.  (Exception: if the output format is odt, docx, epub, or epub3, out‐
              put to stdout is disabled.)

       ----ddaattaa--ddiirr==_D_I_R_E_C_T_O_R_Y
              Specify  the  user  data  directory  to search for pandoc data files.  If this option is not specified, the default user data directory will be used.
              This is

                     $HOME/.pandoc

              in unix,

                     C:\Documents And Settings\USERNAME\Application Data\pandoc

              in Windows XP, and

                     C:\Users\USERNAME\AppData\Roaming\pandoc

              in Windows 7.  (You can find the default user data directory on your system by looking at the output of pandoc --version.)  A  reference.odt,  refer‐
              ence.docx, default.csl, epub.css, templates, slidy, slideous, or s5 directory placed in this directory will override pandoc's normal defaults.

       --vv,, ----vveerrssiioonn
              Print version.

       --hh,, ----hheellpp
              Show usage message.

   RReeaaddeerr ooppttiioonnss
       --RR,, ----ppaarrssee--rraaww
              Parse  untranslatable HTML codes and LaTeX environments as raw HTML or LaTeX, instead of ignoring them.  Affects only HTML and LaTeX input.  Raw HTML
              can be printed in markdown, reStructuredText, HTML, Slidy, Slideous, DZSlides, reveal.js, and S5 output;  raw  LaTeX  can  be  printed  in  markdown,
              reStructuredText,  LaTeX,  and  ConTeXt output.  The default is for the readers to omit untranslatable HTML codes and LaTeX environments.  (The LaTeX
              reader does pass through untranslatable LaTeX _c_o_m_m_a_n_d_s, even if -R is not specified.)

       --SS,, ----ssmmaarrtt
              Produce typographically correct output, converting straight quotes to curly quotes, --- to em-dashes, -- to en-dashes, and  ...  to  ellipses.   Non‐
              breaking  spaces  are  inserted  after certain abbreviations, such as "Mr." (Note: This option is significant only when the input format is markdown,
              markdown_strict, or textile.  It is selected automatically when the input format is textile  or  the  output  format  is  latex  or  context,  unless
              --no-tex-ligatures is used.)

       ----oolldd--ddaasshheess
              Selects  the  pandoc  <=  1.8.2.1 behavior for parsing smart dashes: - before a numeral is an en-dash, and -- is an em-dash.  This option is selected
              automatically for textile input.

       ----bbaassee--hheeaaddeerr--lleevveell==_N_U_M_B_E_R
              Specify the base level for headers (defaults to 1).

       ----iinnddeenntteedd--ccooddee--ccllaasssseess==_C_L_A_S_S_E_S
              Specify classes to use for indented code blocks--for example, perl,numberLines or haskell.  Multiple classes may be separated by spaces or commas.

       ----ddeeffaauulltt--iimmaaggee--eexxtteennssiioonn==_E_X_T_E_N_S_I_O_N
              Specify a default extension to use when image paths/URLs have no extension.  This allows you to use the same source for formats that require  differ‐
              ent kinds of images.  Currently this option only affects the markdown and LaTeX readers.

       ----ffiilltteerr==_E_X_E_C_U_T_A_B_L_E
              Specify  an executable to be used as a filter transforming the Pandoc AST after the input is parsed and before the output is written.  The executable
              should read JSON from stdin and write JSON to stdout.  The JSON must be formatted like pandoc's own JSON input and output.  The name  of  the  output
              format will be passed to the filter as the first argument.  Hence,

                     pandoc --filter ./caps.py -t latex

              is equivalent to

                     pandoc -t json | ./caps.py latex | pandoc -f json -t latex

              The latter form may be useful for debugging filters.

              Filters  may  be written in any language.  Text.Pandoc.JSON exports toJSONFilter to facilitate writing filters in Haskell.  Those who would prefer to
              write filters in python can use the module pandocfilters, installable from PyPI.  See http://github.com/jgm/pandocfilters for the module and  several
              examples.  Note that the _E_X_E_C_U_T_A_B_L_E will be sought in the user's PATH, and not in the working directory, if no directory is provided.  If you want to
              run a script in the working directory, preface the filename with ./.

       --MM _K_E_Y_[_=_V_A_L_],, ----mmeettaaddaattaa==_K_E_Y_[_:_V_A_L_]
              Set the metadata field _K_E_Y to the value _V_A_L.  A value specified on the command line overrides a value specified in  the  document.   Values  will  be
              parsed  as  YAML  boolean or string values.  If no value is specified, the value will be treated as Boolean true.  Like --variable, --metadata causes
              template variables to be set.  But unlike --variable, --metadata affects the metadata of the underlying document (which is  accessible  from  filters
              and may be printed in some output formats).

       ----nnoorrmmaalliizzee
              Normalize the document after reading: merge adjacent Str or Emph elements, for example, and remove repeated Spaces.

       --pp,, ----pprreesseerrvvee--ttaabbss
              Preserve  tabs  instead of converting them to spaces (the default).  Note that this will only affect tabs in literal code spans and code blocks; tabs
              in regular text will be treated as spaces.

       ----ttaabb--ssttoopp==_N_U_M_B_E_R
              Specify the number of spaces per tab (default is 4).

   GGeenneerraall wwrriitteerr ooppttiioonnss
       --ss,, ----ssttaannddaalloonnee
              Produce output with an appropriate header and footer (e.g.  a standalone HTML, LaTeX, or RTF file, not a fragment).  This option is set automatically
              for pdf, epub, epub3, fb2, docx, and odt output.

       ----tteemmppllaattee==_F_I_L_E
              Use  _F_I_L_E  as  a custom template for the generated document.  Implies --standalone.  See Templates below for a description of template syntax.  If no
              extension is specified, an extension corresponding to the writer will be added, so that --template=special looks for special.html  for  HTML  output.
              If  the template is not found, pandoc will search for it in the user data directory (see --data-dir).  If this option is not used, a default template
              appropriate for the output format will be used (see -D/--print-default-template).

       --VV _K_E_Y_[_=_V_A_L_],, ----vvaarriiaabbllee==_K_E_Y_[_:_V_A_L_]
              Set the template variable _K_E_Y to the value _V_A_L when rendering the document in standalone mode.  This is generally only  useful  when  the  --template
              option  is  used  to specify a custom template, since pandoc automatically sets the variables used in the default templates.  If no _V_A_L is specified,
              the key will be given the value true.

       --DD _F_O_R_M_A_T,, ----pprriinntt--ddeeffaauulltt--tteemmppllaattee==_F_O_R_M_A_T
              Print the default template for an output _F_O_R_M_A_T.  (See -t for a list of possible _F_O_R_M_A_Ts.)

       ----pprriinntt--ddeeffaauulltt--ddaattaa--ffiillee==_F_I_L_E
              Print a default data file.

       ----nnoo--wwrraapp
              Disable text wrapping in output.  By default, text is wrapped appropriately for the output format.

       ----ccoolluummnnss==_N_U_M_B_E_R
              Specify length of lines in characters (for text wrapping).

       ----ttoocc,, ----ttaabbllee--ooff--ccoonntteennttss
              Include an automatically generated table of contents (or, in the case of latex, context, and rst, an instruction to create one) in the  output  docu‐
              ment.  This option has no effect on man, docbook, slidy, slideous, s5, docx, or odt output.

       ----ttoocc--ddeepptthh==_N_U_M_B_E_R
              Specify  the  number  of  section  levels  to include in the table of contents.  The default is 3 (which means that level 1, 2, and 3 headers will be
              listed in the contents).

       ----nnoo--hhiigghhlliigghhtt
              Disables syntax highlighting for code blocks and inlines, even when a language attribute is given.

       ----hhiigghhlliigghhtt--ssttyyllee==_S_T_Y_L_E
              Specifies the coloring style to be used in highlighted source code.  Options are pygments (the default), kate, monochrome,  espresso,  zenburn,  had‐
              dock, and tango.

       --HH _F_I_L_E,, ----iinncclluuddee--iinn--hheeaaddeerr==_F_I_L_E
              Include contents of _F_I_L_E, verbatim, at the end of the header.  This can be used, for example, to include special CSS or javascript in HTML documents.
              This option can be used repeatedly to include multiple files in the header.  They will be included in the order specified.  Implies --standalone.

       --BB _F_I_L_E,, ----iinncclluuddee--bbeeffoorree--bbooddyy==_F_I_L_E
              Include contents of _F_I_L_E, verbatim, at the beginning of the document body (e.g.  after the <body> tag in HTML, or  the  \begin{document}  command  in
              LaTeX).   This  can  be  used to include navigation bars or banners in HTML documents.  This option can be used repeatedly to include multiple files.
              They will be included in the order specified.  Implies --standalone.

       --AA _F_I_L_E,, ----iinncclluuddee--aafftteerr--bbooddyy==_F_I_L_E
              Include contents of _F_I_L_E, verbatim, at the end of the document body (before the </body> tag in HTML, or the \end{document} command in  LaTeX).   This
              option can be be used repeatedly to include multiple files.  They will be included in the order specified.  Implies --standalone.

   OOppttiioonnss aaffffeeccttiinngg ssppeecciiffiicc wwrriitteerrss
       ----sseellff--ccoonnttaaiinneedd
              Produce  a  standalone  HTML file with no external dependencies, using data: URIs to incorporate the contents of linked scripts, stylesheets, images,
              and videos.  The resulting file should be "self-contained," in the sense that it needs no external files and no net access to be  displayed  properly
              by  a  browser.   This  option  works  only  with HTML output formats, including html, html5, html+lhs, html5+lhs, s5, slidy, slideous, dzslides, and
              revealjs.  Scripts, images, and stylesheets at absolute URLs will be downloaded; those at relative URLs will be sought first relative to the  working
              directory, then relative to the user data directory (see --data-dir), and finally relative to pandoc's default data directory.  --self-contained does
              not work with --mathjax.

       ----oofffflliinnee
              Deprecated synonym for --self-contained.

       --55,, ----hhttmmll55
              Produce HTML5 instead of HTML4.  This option has no effect for writers other than html.  (_D_e_p_r_e_c_a_t_e_d_: Use the html5 output format instead.)

       ----hhttmmll--qq--ttaaggss
              Use <q> tags for quotes in HTML.

       ----aasscciiii
              Use only ascii characters in output.  Currently supported only for HTML output (which uses numerical entities instead of UTF-8 when  this  option  is
              selected).

       ----rreeffeerreennccee--lliinnkkss
              Use reference-style links, rather than inline links, in writing markdown or reStructuredText.  By default inline links are used.

       ----aattxx--hheeaaddeerrss
              Use ATX style headers in markdown and asciidoc output.  The default is to use setext-style headers for levels 1-2, and then ATX headers.

       ----cchhaapptteerrss
              Treat  top-level  headers  as  chapters  in LaTeX, ConTeXt, and DocBook output.  When the LaTeX template uses the report, book, or memoir class, this
              option is implied.  If beamer is the output format, top-level headers will become \part{..}.

       --NN,, ----nnuummbbeerr--sseeccttiioonnss
              Number section headings in LaTeX, ConTeXt, HTML, or EPUB output.  By default, sections are not numbered.  Sections with class unnumbered  will  never
              be numbered, even if --number-sections is specified.

       ----nnuummbbeerr--ooffffsseett==_N_U_M_B_E_R_[_,_N_U_M_B_E_R_,_._._._],,
              Offset for section headings in HTML output (ignored in other output formats).  The first number is added to the section number for top-level headers,
              the second for second-level headers, and so on.  So, for example, if you want the first top-level header in your document to be numbered "6", specify
              --number-offset=5.  If your document starts with a level-2 header which you want to be numbered "1.5", specify --number-offset=1,4.  Offsets are 0 by
              default.  Implies --number-sections.

       ----nnoo--tteexx--lliiggaattuurreess
              Do not convert quotation marks, apostrophes, and dashes to the TeX ligatures when writing LaTeX or ConTeXt.  Instead, just use literal unicode  char‐
              acters.   This  is needed for using advanced OpenType features with XeLaTeX and LuaLaTeX.  Note: normally --smart is selected automatically for LaTeX
              and ConTeXt output, but it must be specified explicitly if --no-tex-ligatures is selected.  If you use literal curly quotes, dashes, and ellipses  in
              your source, then you may want to use --no-tex-ligatures without --smart.

       ----lliissttiinnggss
              Use listings package for LaTeX code blocks

       --ii,, ----iinnccrreemmeennttaall
              Make list items in slide shows display incrementally (one by one).  The default is for lists to be displayed all at once.

       ----sslliiddee--lleevveell==_N_U_M_B_E_R
              Specifies that headers with the specified level create slides (for beamer, s5, slidy, slideous, dzslides).  Headers above this level in the hierarchy
              are used to divide the slide show into sections; headers below this level create subheads within a slide.  The default is  to  set  the  slide  level
              based on the contents of the document; see Structuring the slide show, below.

       ----sseeccttiioonn--ddiivvss
              Wrap sections in <div> tags (or <section> tags in HTML5), and attach identifiers to the enclosing <div> (or <section>) rather than the header itself.
              See Section identifiers, below.

       ----eemmaaiill--oobbffuussccaattiioonn==_n_o_n_e_|_j_a_v_a_s_c_r_i_p_t_|_r_e_f_e_r_e_n_c_e_s
              Specify a method for obfuscating mailto: links in HTML documents.  _n_o_n_e  leaves  mailto:  links  as  they  are.   _j_a_v_a_s_c_r_i_p_t  obfuscates  them  using
              javascript.  _r_e_f_e_r_e_n_c_e_s obfuscates them by printing their letters as decimal or hexadecimal character references.

       ----iidd--pprreeffiixx==_S_T_R_I_N_G
              Specify a prefix to be added to all automatically generated identifiers in HTML and DocBook output, and to footnote numbers in markdown output.  This
              is useful for preventing duplicate identifiers when generating fragments to be included in other pages.

       --TT _S_T_R_I_N_G,, ----ttiittllee--pprreeffiixx==_S_T_R_I_N_G
              Specify _S_T_R_I_N_G as a prefix at the beginning of the title that appears in the HTML header (but not in the title as it appears at the beginning of  the
              HTML body).  Implies --standalone.

       --cc _U_R_L,, ----ccssss==_U_R_L
              Link to a CSS style sheet.  This option can be be used repeatedly to include multiple files.  They will be included in the order specified.

       ----rreeffeerreennccee--ooddtt==_F_I_L_E
              Use the specified file as a style reference in producing an ODT.  For best results, the reference ODT should be a modified version of an ODT produced
              using pandoc.  The contents of the reference ODT are ignored, but its stylesheets are used in the new ODT.  If no reference ODT is specified  on  the
              command  line, pandoc will look for a file reference.odt in the user data directory (see --data-dir).  If this is not found either, sensible defaults
              will be used.

       ----rreeffeerreennccee--ddooccxx==_F_I_L_E
              Use the specified file as a style reference in producing a docx file.  For best results, the reference docx should be a modified version  of  a  docx
              file  produced  using pandoc.  The contents of the reference docx are ignored, but its stylesheets are used in the new docx.  If no reference docx is
              specified on the command line, pandoc will look for a file reference.docx in the user data directory (see --data-dir).  If this is not found  either,
              sensible  defaults  will  be used.  The following styles are used by pandoc: [paragraph] Normal, Compact, Title, Authors, Date, Heading 1, Heading 2,
              Heading 3, Heading 4, Heading 5, Block Quote, Definition Term, Definition, Body Text, Table Caption, Image  Caption;  [character]  Default  Paragraph
              Font, Body Text Char, Verbatim Char, Footnote Ref, Link.

       ----eeppuubb--ssttyylleesshheeeett==_F_I_L_E
              Use  the  specified  CSS file to style the EPUB.  If no stylesheet is specified, pandoc will look for a file epub.css in the user data directory (see
              --data-dir).  If it is not found there, sensible defaults will be used.

       ----eeppuubb--ccoovveerr--iimmaaggee==_F_I_L_E
              Use the specified image as the EPUB cover.  It is recommended that the image be less than 1000px in width and height.  Note that in a markdown source
              document you can also specify cover-image in a YAML metadata block (see EPUB Metadata, below).

       ----eeppuubb--mmeettaaddaattaa==_F_I_L_E
              Look  in the specified XML file for metadata for the EPUB.  The file should contain a series of Dublin Core elements, as documented at http://dublin‐
              core.org/documents/dces/.  For example:

                      <dc:rights>Creative Commons</dc:rights>
                      <dc:language>es-AR</dc:language>

              By default, pandoc will include the following metadata elements: <dc:title> (from the document title),  <dc:creator>  (from  the  document  authors),
              <dc:date>  (from  the  document date, which should be in ISO 8601 format), <dc:language> (from the lang variable, or, if is not set, the locale), and
              <dc:identifier id="BookId"> (a randomly generated UUID).  Any of these may be overridden by elements in the metadata file.

              Note: if the source document is markdown, a YAML metadata block in the document can be used instead.  See below under EPUB Metadata.

       ----eeppuubb--eemmbbeedd--ffoonntt==_F_I_L_E
              Embed the specified font in the EPUB.  This option can be repeated to embed multiple fonts.  To use embedded fonts, you will need to add declarations
              like the following to your CSS (see --epub-stylesheet):

                     @font-face {
                     font-family: DejaVuSans;
                     font-style: normal;
                     font-weight: normal;
                     src:url("DejaVuSans-Regular.ttf");
                     }
                     @font-face {
                     font-family: DejaVuSans;
                     font-style: normal;
                     font-weight: bold;
                     src:url("DejaVuSans-Bold.ttf");
                     }
                     @font-face {
                     font-family: DejaVuSans;
                     font-style: italic;
                     font-weight: normal;
                     src:url("DejaVuSans-Oblique.ttf");
                     }
                     @font-face {
                     font-family: DejaVuSans;
                     font-style: italic;
                     font-weight: bold;
                     src:url("DejaVuSans-BoldOblique.ttf");
                     }
                     body { font-family: "DejaVuSans"; }

       ----eeppuubb--cchhaapptteerr--lleevveell==_N_U_M_B_E_R
              Specify  the  header level at which to split the EPUB into separate "chapter" files.  The default is to split into chapters at level 1 headers.  This
              option only affects the internal composition of the EPUB, not the way chapters and sections are displayed to users.  Some readers may be slow if  the
              chapter files are too large, so for large documents with few level 1 headers, one might want to use a chapter level of 2 or 3.

       ----llaatteexx--eennggiinnee==_p_d_f_l_a_t_e_x_|_l_u_a_l_a_t_e_x_|_x_e_l_a_t_e_x
              Use  the  specified LaTeX engine when producing PDF output.  The default is pdflatex.  If the engine is not in your PATH, the full path of the engine
              may be specified here.

   CCiittaattiioonn rreennddeerriinngg
       ----bbiibblliiooggrraapphhyy==_F_I_L_E
              Set the bibliography field in the document's metadata to _F_I_L_E, overriding any value set in the metadata, and process citations using pandoc-citeproc.
              (This is equivalent to --metadata bibliography=FILE --filter pandoc-citeproc.)

       ----ccssll==_F_I_L_E
              Set the csl field in the document's metadata to _F_I_L_E, overriding any value set in the metadata.  (This is equivalent to --metadata csl=FILE.)

       ----cciittaattiioonn--aabbbbrreevviiaattiioonnss==_F_I_L_E
              Set  the  citation-abbreviations  field in the document's metadata to _F_I_L_E, overriding any value set in the metadata.  (This is equivalent to --meta‐
              data citation-abbreviations=FILE.)

       ----nnaattbbiibb
              Use natbib for citations in LaTeX output.  This option is not for use with the pandoc-citeproc filter or with PDF output.  It is intended for use  in
              producing a LaTeX file that can be processed with pdflatex and bibtex.

       ----bbiibbllaatteexx
              Use  biblatex  for citations in LaTeX output.  This option is not for use with the pandoc-citeproc filter or with PDF output.  It is intended for use
              in producing a LaTeX file that can be processed with pdflatex and bibtex or biber.

   MMaatthh rreennddeerriinngg iinn HHTTMMLL
       --mm [[_U_R_L]],, ----llaatteexxmmaatthhmmll[[==_U_R_L]]
              Use LaTeXMathML to display embedded TeX math in HTML output.  The _U_R_L should point to the LaTeXMathML.js load script.  If a _U_R_L is  not  provided,  a
              link to LaTeXMathML.js at the Homepage of LaTeXMathML will be inserted.

       ----mmaatthhmmll[[==_U_R_L]]
              Convert  TeX  math  to MathML (in docbook as well as html and html5).  In standalone html output, a small javascript (or a link to such a script if a
              _U_R_L is supplied) will be inserted that allows the MathML to be viewed on some browsers.

       ----jjssmmaatthh[[==_U_R_L]]
              Use jsMath to display embedded TeX math in HTML output.  The _U_R_L should point to the jsMath load script (e.g.  jsMath/easy/load.js); if provided,  it
              will  be  linked  to in the header of standalone HTML documents.  If a _U_R_L is not provided, no link to the jsMath load script will be inserted; it is
              then up to the author to provide such a link in the HTML template.

       ----mmaatthhjjaaxx[[==_U_R_L]]
              Use MathJax to display embedded TeX math in HTML output.  The _U_R_L should point to the MathJax.js load script.  If a _U_R_L is not provided,  a  link  to
              the MathJax CDN will be inserted.

       ----ggllaaddtteexx
              Enclose TeX math in <eq> tags in HTML output.  These can then be processed by gladTeX to produce links to images of the typeset formulas.

       ----mmiimmeetteexx[[==_U_R_L]]
              Render TeX math using the mimeTeX CGI script.  If _U_R_L is not specified, it is assumed that the script is at /cgi-bin/mimetex.cgi.

       ----wweebbtteexx[[==_U_R_L]]
              Render  TeX  formulas using an external script that converts TeX formulas to images.  The formula will be concatenated with the URL provided.  If _U_R_L
              is not specified, the Google Chart API will be used.

   OOppttiioonnss ffoorr wwrraappppeerr ssccrriippttss
       ----dduummpp--aarrggss
              Print information about command-line arguments to _s_t_d_o_u_t, then exit.  This option is intended primarily for use in wrapper scripts.  The  first  line
              of  output contains the name of the output file specified with the -o option, or - (for _s_t_d_o_u_t) if no output file was specified.  The remaining lines
              contain the command-line arguments, one per line, in the order they appear.  These do not include regular Pandoc options and their arguments, but  do
              include any options appearing after a -- separator at the end of the line.

       ----iiggnnoorree--aarrggss
              Ignore command-line arguments (for use in wrapper scripts).  Regular Pandoc options are not ignored.  Thus, for example,

                     pandoc --ignore-args -o foo.html -s foo.txt -- -e latin1

              is equivalent to

                     pandoc -o foo.html -s

TTEEMMPPLLAATTEESS
       When  the  -s/--standalone option is used, pandoc uses a template to add header and footer material that is needed for a self-standing document.  To see the
       default template that is used, just type

              pandoc -D FORMAT

       where FORMAT is the name of the output format.  A custom template can be specified using the --template option.  You can also override  the  system  default
       templates  for  a given output format FORMAT by putting a file templates/default.FORMAT in the user data directory (see --data-dir, above).  _E_x_c_e_p_t_i_o_n_s_: For
       odt output, customize the default.opendocument template.  For pdf output, customize the default.latex template.

       Templates may contain _v_a_r_i_a_b_l_e_s.  Variable names are sequences of alphanumerics, -, and _, starting with a letter.  A variable name surrounded  by  $  signs
       will be replaced by its value.  For example, the string $title$ in

              <title>$title$</title>

       will be replaced by the document title.

       To write a literal $ in a template, use $$.

       Some variables are set automatically by pandoc.  These vary somewhat depending on the output format, but include metadata fields (such as title, author, and
       date) as well as the following:

       hheeaaddeerr--iinncclluuddeess
              contents specified by -H/--include-in-header (may have multiple values)

       ttoocc    non-null value if --toc/--table-of-contents was specified

       iinncclluuddee--bbeeffoorree
              contents specified by -B/--include-before-body (may have multiple values)

       iinncclluuddee--aafftteerr
              contents specified by -A/--include-after-body (may have multiple values)

       bbooddyy   body of document

       llaanngg   language code for HTML or LaTeX documents

       sslliiddyy--uurrll
              base URL for Slidy documents (defaults to http://www.w3.org/Talks/Tools/Slidy2)

       sslliiddeeoouuss--uurrll
              base URL for Slideous documents (defaults to slideous)

       ss55--uurrll base URL for S5 documents (defaults to s5/default)

       rreevveeaalljjss--uurrll
              base URL for reveal.js documents (defaults to reveal.js)

       tthheemmee  reveal.js or LaTeX beamer theme

       ttrraannssiittiioonn
              reveal.js transition

       ffoonnttssiizzee
              font size (10pt, 11pt, 12pt) for LaTeX documents

       ddooccuummeennttccllaassss
              document class for LaTeX documents

       ccllaassssooppttiioonn
              option for LaTeX documentclass, e.g.  oneside; may be repeated for multiple options

       ggeeoommeettrryy
              options for LaTeX geometry class, e.g.  margin=1in; may be repeated for multiple options

       lliinneessttrreettcchh
              adjusts line spacing (requires the setspace package)

       ffoonnttffaammiillyy
              font package to use for LaTeX documents (with pdflatex): TeXLive has bookman (Bookman), utopia or fourier (Utopia), fouriernc  (New  Century  School‐
              book),  times or txfonts (Times), mathpazo or pxfonts or mathpple (Palatino), libertine (Linux Libertine), arev (Arev Sans), and the default lmodern,
              among others.

       mmaaiinnffoonntt,, ssaannssffoonntt,, mmoonnooffoonntt,, mmaatthhffoonntt
              fonts for LaTeX documents (works only with xelatex and lualatex)

       ccoolloorrtthheemmee
              colortheme for LaTeX beamer documents

       ffoonntttthheemmee
              fonttheme for LaTeX beamer documents

       lliinnkkccoolloorr
              color for internal links in LaTeX documents (red, green, magenta, cyan, blue, black)

       uurrllccoolloorr
              color for external links in LaTeX documents

       cciitteeccoolloorr
              color for citation links in LaTeX documents

       lliinnkkss--aass--nnootteess
              causes links to be printed as footnotes in LaTeX documents

       bbiibblliioo--ssttyyllee
              bibliography style in LaTeX, when used with --natbib

       bbiibblliioo--ffiilleess
              bibliography files to use in LaTeX, with --natbib or --biblatex

       sseeccttiioonn
              section number in man pages

       hheeaaddeerr header in man pages

       ffooootteerr footer in man pages

       Variables may be set at the command line using the -V/--variable option.  Variables set in this way override metadata fields with the same name.

       Templates may contain conditionals.  The syntax is as follows:

              $if(variable)$
              X
              $else$
              Y
              $endif$

       This will include X in the template if variable has a non-null value; otherwise it will include Y.  X and Y are placeholders for any  valid  template  text,
       and may include interpolated variables or other conditionals.  The $else$ section may be omitted.

       When variables can have multiple values (for example, author in a multi-author document), you can use the $for$ keyword:

              $for(author)$
              <meta name="author" content="$author$" />
              $endfor$

       You can optionally specify a separator to be used between consecutive items:

              $for(author)$$author$$sep$, $endfor$

       A dot can be used to select a field of a variable that takes an object as its value.  So, for example:

              $author.name$ ($author.affiliation$)

       If  you use custom templates, you may need to revise them as pandoc changes.  We recommend tracking the changes in the default templates, and modifying your
       custom templates accordingly.  An easy way to do this is to fork the  pandoc-templates  repository  (http://github.com/jgm/pandoc-templates)  and  merge  in
       changes after each pandoc release.

PPRROODDUUCCIINNGG SSLLIIDDEE SSHHOOWWSS WWIITTHH PPAANNDDOOCC
       You  can use Pandoc to produce an HTML + javascript slide presentation that can be viewed via a web browser.  There are five ways to do this, using S5, DZS‐
       lides, Slidy, Slideous, or reveal.js.  You can also produce a PDF slide show using LaTeX beamer.

       Here's the markdown source for a simple slide show, habits.txt:

              % Habits
              % John Doe
              % March 22, 2005

              # In the morning

              ## Getting up

              - Turn off alarm
              - Get out of bed

              ## Breakfast

              - Eat eggs
              - Drink coffee

              # In the evening

              ## Dinner

              - Eat spaghetti
              - Drink wine

              ------------------

              ![picture of spaghetti](images/spaghetti.jpg)

              ## Going to sleep

              - Get in bed
              - Count sheep

       To produce an HTML/javascript slide show, simply type

              pandoc -t FORMAT -s habits.txt -o habits.html

       where FORMAT is either s5, slidy, slideous, dzslides, or revealjs.

       For Slidy, Slideous, reveal.js, and S5, the file produced by pandoc with the -s/--standalone option embeds a link to javascripts and CSS  files,  which  are
       assumed to be available at the relative path s5/default (for S5), slideous (for Slideous), reveal.js (for reveal.js), or at the Slidy website at w3.org (for
       Slidy).  (These paths can be changed by setting the slidy-url, slideous-url, revealjs-url, or s5-url variables; see --variable, above.)  For  DZSlides,  the
       (relatively short) javascript and css are included in the file by default.

       With  all  HTML slide formats, the --self-contained option can be used to produce a single file that contains all of the data necessary to display the slide
       show, including linked scripts, stylesheets, images, and videos.

       To produce a PDF slide show using beamer, type

              pandoc -t beamer habits.txt -o habits.pdf

       Note that a reveal.js slide show can also be converted to a PDF by printing it to a file from the browser.

   SSttrruuccttuurriinngg tthhee sslliiddee sshhooww
       By default, the _s_l_i_d_e _l_e_v_e_l is the highest header level in the hierarchy that is followed immediately by content, and not another header, somewhere  in  the
       document.   In  the  example  above,  level  1 headers are always followed by level 2 headers, which are followed by content, so 2 is the slide level.  This
       default can be overridden using the --slide-level option.

       The document is carved up into slides according to the following rules:

       · A horizontal rule always starts a new slide.

       · A header at the slide level always starts a new slide.

       · Headers _b_e_l_o_w the slide level in the hierarchy create headers _w_i_t_h_i_n a slide.

       · Headers _a_b_o_v_e the slide level in the hierarchy create "title slides," which just contain the section title and help to break the slide show into sections.

       · A title page is constructed automatically from the document's title block, if present.  (In the case of beamer, this can be  disabled  by  commenting  out
         some lines in the default template.)

       These rules are designed to support many different styles of slide show.  If you don't care about structuring your slides into sections and subsections, you
       can just use level 1 headers for all each slide.  (In that case, level 1 will be the slide level.) But you can also structure the slide show into  sections,
       as in the example above.

       Note: in reveal.js slide shows, if slide level is 2, a two-dimensional layout will be produced, with level 1 headers building horizontally and level 2 head‐
       ers building vertically.  It is not recommended that you use deeper nesting of section levels with reveal.js.

   IInnccrreemmeennttaall lliissttss
       By default, these writers produces lists that display "all at once." If you want your lists to display incrementally (one  item  at  a  time),  use  the  -i
       option.   If  you  want  a  particular  list to depart from the default (that is, to display incrementally without the -i option and all at once with the -i
       option), put it in a block quote:

              > - Eat spaghetti
              > - Drink wine

       In this way incremental and nonincremental lists can be mixed in a single document.

   IInnsseerrttiinngg ppaauusseess
       You can add "pauses" within a slide by including a paragraph containing three dots, separated by spaces:

              # Slide with a pause

              content before the pause

              . . .

              content after the pause

   SSttyylliinngg tthhee sslliiddeess
       You can change the style of HTML slides by putting customized CSS files in $DATADIR/s5/default (for S5), $DATADIR/slidy (for  Slidy),  or  $DATADIR/slideous
       (for  Slideous), where $DATADIR is the user data directory (see --data-dir, above).  The originals may be found in pandoc's system data directory (generally
       $CABALDIR/pandoc-VERSION/s5/default).  Pandoc will look there for any files it does not find in the user data directory.

       For dzslides, the CSS is included in the HTML file itself, and may be modified there.

       For reveal.js, themes can be used by setting the theme variable, for example:

              -V theme=moon

       Or you can specify a custom stylesheet using the --css option.

       To style beamer slides, you can specify a beamer "theme" or "colortheme" using the -V option:

              pandoc -t beamer habits.txt -V theme:Warsaw -o habits.pdf

       Note that header attributes will turn into slide attributes (on a <div> or <section>) in HTML slide formats, allowing you to style  individual  slides.   In
       Beamer,  the  only header attribute that affects slides is the allowframebreaks class, which sets the allowframebreaks option, causing multiple slides to be
       created if the content overfills the frame.  This is recommended especially for bibliographies:

              # References {.allowframebreaks}

   SSppeeaakkeerr nnootteess
       reveal.js has good support for speaker notes.  You can add notes to your markdown document thus:

              <div class="notes">
              This is my note.

              - It can contain markdown
              - like this list

              </div>

       To show the notes window, press s while viewing the presentation.  Notes are not yet supported for other slide formats, but the notes will not appear on the
       slides themselves.

EEPPUUBB MMEETTAADDAATTAA
       EPUB metadata may be specified using the --epub-metadata option, but if the source document is markdown, it is better to use a YAML metadata block.  Here is
       an example:

              ---
              title:
              - type: main
                text: My Book
              - type: subtitle
                text: An investigation of metadata
              creator:
              - role: author
                text: John Smith
              - role: editor
                text: Sarah Jones
              identifier:
              - scheme: DOI
                text: doi:10.234234.234/33
              publisher:  My Press
              rights:  (c) 2007 John Smith, CC BY-NC
              ...

       The following fields are recognized:

       iiddeennttiiffiieerr
              Either a string value or an object with fields text and scheme.  Valid values for scheme are ISBN-10, GTIN-13,  UPC,  ISMN-10,  DOI,  LCCN,  GTIN-14,
              ISBN-13, Legal deposit number, URN, OCLC, ISMN-13, ISBN-A, JP, OLCC.

       ttiittllee  Either  a  string value, or an object with fields file-as and type, or a list of such objects.  Valid values for type are main, subtitle, short, col‐
              lection, edition, extended.

       ccrreeaattoorr
              Either a string value, or an object with fields role, file-as, and text, or a list of such objects.  Valid values for role  are  marc  relators,  but
              pandoc will attempt to translate the human-readable versions (like "author" and "editor") to the appropriate marc relators.

       ccoonnttrriibbuuttoorr
              Same format as creator.

       ddaattee   A string value in YYYY-MM-DD format.  (Only the year is necessary.) Pandoc will attempt to convert other common date formats.

       llaanngguuaaggee
              A string value in RFC5646 format.  Pandoc will default to the local language if nothing is specified.

       ssuubbjjeecctt
              A string value or a list of such values.

       ddeessccrriippttiioonn
              A string value.

       ttyyppee   A string value.

       ffoorrmmaatt A string value.

       rreellaattiioonn
              A string value.

       ccoovveerraaggee
              A string value.

       rriigghhttss A string value.

       ccoovveerr--iimmaaggee
              A string value (path to cover image).

       ssttyylleesshheeeett
              A string value (path to CSS stylesheet).

LLIITTEERRAATTEE HHAASSKKEELLLL SSUUPPPPOORRTT
       If  you  append  +lhs (or +literate_haskell) to an appropriate input or output format (markdown, markdown_strict, rst, or latex for input or output; beamer,
       html or html5 for output only), pandoc will treat the document as literate Haskell source.  This means that

       · In markdown input, "bird track" sections will be parsed as Haskell code rather than block quotations.  Text between \begin{code} and \end{code} will  also
         be treated as Haskell code.

       · In  markdown output, code blocks with classes haskell and literate will be rendered using bird tracks, and block quotations will be indented one space, so
         they will not be treated as Haskell code.  In addition, headers will be rendered setext-style (with underlines) rather than atx-style  (with  '#'  charac‐
         ters).  (This is because ghc treats '#' characters in column 1 as introducing line numbers.)

       · In restructured text input, "bird track" sections will be parsed as Haskell code.

       · In restructured text output, code blocks with class haskell will be rendered using bird tracks.

       · In LaTeX input, text in code environments will be parsed as Haskell code.

       · In LaTeX output, code blocks with class haskell will be rendered inside code environments.

       · In HTML output, code blocks with class haskell will be rendered with class literatehaskell and bird tracks.

       Examples:

              pandoc -f markdown+lhs -t html

       reads literate Haskell source formatted with markdown conventions and writes ordinary HTML (without bird tracks).

              pandoc -f markdown+lhs -t html+lhs

       writes HTML with the Haskell code in bird tracks, so it can be copied and pasted as literate Haskell source.

CCUUSSTTOOMM WWRRIITTEERRSS
       Pandoc can be extended with custom writers written in lua.  (Pandoc includes a lua interpreter, so lua need not be installed separately.)

       To use a custom writer, simply specify the path to the lua script in place of the output format.  For example:

              pandoc -t data/sample.lua

       Creating  a  custom writer requires writing a lua function for each possible element in a pandoc document.  To get a documented example which you can modify
       according to your needs, do

              pandoc --print-default-data-file sample.lua

AAUUTTHHOORRSS
       © 2006-2013 John MacFarlane (jgm at berkeley dot edu).  Released under the GPL, version 2 or greater.  This software carries no warranty of any kind.   (See
       COPYRIGHT  for  full  copyright  and warranty notices.) Other contributors include Recai Oktaş, Paulo Tanimoto, Peter Wang, Andrea Rossato, Eric Kow, infin‐
       ity0x, Luke Plant, shreevatsa.public, Puneeth Chaganti, Paul Rivier, rodja.trappe, Bradley Kuhn, thsutton, Nathan Gass, Jonathan Daugherty,  Jérémy  Bobbio,
       Justin Bogner, qerub, Christopher Sawicki, Kelsey Hightower, Masayoshi Takahashi, Antoine Latter, Ralf Stephan, Eric Seidel, B.  Scott Michel, Gavin Beatty,
       Sergey Astanin, Arlo O'Keeffe, Denis Laxalde, Brent Yorgey, David Lazar, Jamie F.  Olson, Matthew Pickering, Albert Krewinkel, mb21, Jesse Rosenthal.

PPAANNDDOOCC''SS MMAARRKKDDOOWWNN
       For a complete description of pandoc's extensions to standard markdown, see pandoc_markdown (5).

SSEEEE AALLSSOO
       pandoc_markdown (5).

       The Pandoc source code and all documentation may be downloaded from <http://johnmacfarlane.net/pandoc/>.



Pandoc User's Guide                                                       January 19, 2013                                                                PANDOC(1)
