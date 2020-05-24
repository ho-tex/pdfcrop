README for pdfcrop 2012/11/02 v1.38

TABLE OF CONTENTS
=================
A. Description
B. Copyright, Disclaimer, License
C. Files
D. Requirements
E. Installation
F. User Interface
G. Restricted Mode
H. Author
I. Acknowledgement
J. Questions, Suggested Improvements
K. Known Problems
L. History
M. ToDo

A. DESCRIPTION
==============
PDFCROP takes a PDF file as input, calculates the BoundingBox
for each page by the help of ghostscript and generates a output
PDF file with removed margins.

B. COPYRIGHT, DISCLAIMER, LICENSE
=================================
Copyright (C) 2002, 2004, 2005, 2008-2012 Heiko Oberdiek.

This program may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.2
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.2 or later is part of all distributions of LaTeX
version 1999/12/01 or later.

C. FILES
========
The project `pdfcrop' consists of two files:
pdfcrop.pl: This perl script is the main program. The extension
            `.pl' may be omitted.
README:     Documentation, the file you are reading.

Following temporary files are produced if `pdfcrop' is invoked:
tmp-pdfcrop-*.tex:  input file for pdfTeX
tmp-pdfcrop-*.log:  log file of pdfTeX run
tmp-pdfcrop-*.pdf:  result after pdfTeX run

D. REQUIREMENTS
===============
* Perl5 (version 5 of the perl interpreter)
* Ghostscript (>= 8.0 if PDF file contains rotated pages)
* pdfTeX, version >= 1.0 (because of page selecting and \pdfximage syntax)
  or XeTeX or LuaTeX.

E. INSTALLATION
===============

1. Perl script `pdfcrop.pl':

   TDS 1.1 location (TDS means "texmf" tree, see CTAN:tds/tds.pdf):
   * TDS:scripts/pdfcrop/pdfcrop.pl
   * and a directory that is part of PATH contains a wrapper script
     or link with name "pdfcrop".

   Unix
   * It is allowed to rename `pdfcrop.pl' to `pdfcrop':
       mv pdfcrop.pl pdfcrop
   * Ensure that the execute permission is set:
       chmod +x pdfcrop
   * Move the file to a directory where the shell can find it
     (environment variable PATH, e.g. /usr/local/bin/).

   Dos/Windows
   * See requirements. I do not expect that the perl script
     run under DOS.

2. Restricted program version `rpdfcrop'

   Generate links or install `pdfcrop.pl' again under the
   name `rpdfcrop'.

   Prefer `rpdfcrop' if you want to add pdfcrop to the
   programs that may be executed in TeX's restricted
   shell escape mode. (This feature is added in TeX Live 2009.)
   For TeX Live (since 2009) see entry for `shell_escape_commands'
   in the configuration file `texmf.cnf'.

3. Documentation `README':

   Copy it to an appropriate place, for example
   `/usr/local/share/doc/pdfcrop/README'.
   It is allowed to rename it to `pdfcrop.txt'.

   TDS location:
     somewhere below texmf/doc/... (?)
   Examples:
     TDS:doc/support/pdfcrop/README
     TDS:doc/scripts/pdfcrop/README
     TDS:doc/scripts/pdfcrop.txt
   TeXLive 2008 and 2009 put it in
     TDS:doc/support/pdfcrop/README

F. USER INTERFACE
=================
* ToDo: User manual
* Online help:
    pdfcrop --help
* Ghostscript's calculation of the bounding box is faster,
  if --resolution 72 is used instead of ghostscript's implicite
  default setting of 4000 DPI (hint from Ionut Georgescu).
  Of course the calculation with higher resolution settings are
  more accurate.

G. RESTRICTED MODE
==================
Restricted mode is enabled if:
* option `--restricted' is used,
* the program is called under the name `rpdfcrop'
* or the called program name contains `restricted'.
This mode sets restrictions for the following options:
* --pdftexcmd: if used, the value must be empty or `pdftex'.
* --xetexcmd: if used, the value must be empty or `xetex'.
* --luatexcmd: if used, the value must be empty or `luatex'.
* --gscmd: if used, the value must
  * be empty or
  * be one of the standard names (gs, gswin32c, mgs, gs386 gsos2) or
  * consists of `gs', followed by a version number and an
    optional `c' (Ghostscript's convention for `console version').

H. AUTHOR
=========
Heiko Oberdiek
Email: heiko.oberdiek at googlemail.com

I. ACKNOWLEDGEMENT
==================
Anthony Williams
Scott Pakin <pakin at uiuc.edu>
Ionut Georgescu
Yves J\"ager
R (Chandra) Chandrasekhar
Christian Stapfer
David Menestrina
Karl Berry

J. QUESTIONS, SUGGESTED IMPROVEMENTS
====================================
If you have questions, problems with `pdfcrop', error reports,
if you have improvements or want to have additional features,
please send them to the author.

My environment for developing and testing:
* linux, SuSE 9.0
* perl v5.8.1
* pdfTeX 3.141592-1.40.x
* Ghostscript 8.x

K. KNOWN PROBLEMS
=================
* pdfcrop relies on Ghostscript for the calculation of the
  Bounding Box. If Ghostscript returns wrong values or
  cannot process the pdf file, it sometimes helps to try
  another version of Ghostscript.
* XeTeX (and pdfTeX < 1.10a) does not allow the setting of the
  PDF version in a direct way. Thus pdfcrop fixes the PDF version
  afterwards in the PDF header. Therefore XeTeX warnings as
    ** WARNING ** Version of PDF file (1.6) is newer
                  than version limit specification.
  can be safely ignored.

L. HISTORY
==========
2002/10/30 v1.0:  First release
2002/10/30 v1.1:  Option --hires added.
2002/11/04 v1.2:  "nul" instead of "/dev/null" for windows.
2002/11/23 v1.3:  Use of File::Spec module's "devnull" call.
2002/11/29 v1.4:  Option --papersize added.
2004/06/24 v1.5:  Clear map file entries so that pdfTeX
                  does not touch the fonts.
2004/06/26 v1.6:  Use mgs.exe instead of gswin32c.exe for MIKTEX.
2005/03/11 v1.7:  Support of spaces in file names
                  (open("-|") is used for ghostscript call).
2008/01/09 v1.8:  Fix for moving the temporary file to the output
                  file across file system boundaries.
2008/04/05 v1.9:  Options --resolution and --bbox added.
2008/07/16 v1.10: Support for XeTeX added with new options
                  --pdftex, --xetex, --xetexcmds.
2008/07/22 v1.11: Workaround for open("-|").
2008/07/23 v1.12: Workarounds for the workaround (error detection, ...).
2008/07/24 v1.13: open("-|")/workaround removed.
                  Input files with unsafe file names are linked/copied
                  to temporary file with safe file name.
2008/09/12 v1.14: Error detection for invalid Bounding Boxes.
2009/07/14 v1.15: Fix for negative coordinates in Bounding Boxes
                  (David Menestrina).
2009/07/17 v1.16: Security fixes:
                  * -dSAFER added for Ghostscript,
                  * -no-shell-escape added for pdfTeX/XeTeX.
2009/07/17 v1.17: Security fixes:
                  * Backticks and whitespace are forbidden
                    for options --(gs|pdftex|xetex)cmd.
                  * Validation of options --papersize and --resolution.
2009/07/18 v1.18: * Restricted mode added.
                  * Option --version added.
2009/09/24 v1.19: * Ghostscript detection rewritten.
                  * Cygwin: `gs' is preferred to `gswin32c'.
2009/10/06 v1.20: * File name sanitizing in .tex file.
2009/12/21 v1.21: * Option --ini added for iniTeX mode.
                  * Option --luatex and --luatexcmd added for LuaTeX.
2009/12/29 v1.22: * Syntax description for option --bbox fixed
                    (Lukas Prochazka).
2010/01/09 v1.23: * Options --bbox-odd and --bbox-even added.
2010/08/16 v1.24: * Workaround added for buggy ghostscript ports
                    that print the BoundingBox data twice.
2010/08/26 v1.25: * Fix for the case that the PDF file contains
                    an entry /CropBox different to /MediaBox.
                  * \pageinclude implemented for XeTeX.
                  * XeTeX: --clip does not die, but this option
                    is ignored, because XeTeX always clip.
2010/08/26 v1.26: * XeTeX's \XeTeXpdffile expects keyword
                    `media', not `mediabox'.
                  * New option --pdfversion.
                    Default is `auto' that means the PDF version
                    is inherited from the input file. Before
                    pdfcrop has used the TeX engine's default.
                  * Option --luatex fixed (extra empty page at end).
2010/09/03 v1.27: * Workaround of v1.24 fixed.
2010/09/06 v1.28: * The Windows registry is searched if Ghostscript
                    is not found via PATH.
                  * Windows only: support of spaces in command
                    names in unrestricted mode.
2010/09/06 v1.29: * Find the latest Ghostscript version in registry.
2010/09/15 v1.30: * Warning of pdfTeX because of \pdfobjcompresslevel
                    avoided when reducing \pdfminorversion.
                  * Fix for TeX syntax characters in input file names.
2010/09/17 v1.31: * Passing the input file name via hex string to TeX.
                  * Again input file names restricted for Ghostscript
                    command line, switch then to symbol link/copy
                    method.
2011/08/10 v1.32: * Detection for gswin64c.exe added.
2012/02/01 v1.33: * Input file can be `-' (standard input).
2012/04/18 v1.34: * Format of option --version changed
                    from naked version number to a line with
                    program name, date and version.
2012/10/15 v1.35: * Additional debug infos added for Perl version.
2012/10/16 v1.36: * More error codes added.
2012/10/16 v1.37: * Extended error messages if available.
                  * Fix for broken v1.36.
2012/11/02 v1.38: * Fix for unsufficient cleanup, if function `cleanup' is
                    prematurely called in `eval' for `symlink' checking.


M. TODO
=======
* Description of user interface.
* Documentation in other formats, eg. man or info pages.
* Improved error checking.
* Units support for option --margins.
