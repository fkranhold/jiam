# jiam

In order to compile the current article and its accompanying sound samples,
proceed as follows:

## Dependencies

Make sure you have installed the following applications:

 - pdflatex and biber (preferably a full TeX distro)
 - pdfcrop (which is part of a full TeX distro)
 - lilypond
 - timidity
 - ffmpeg
 - sox

In addition to that, it is recommended to install the `classico` package from
CTAN in order to have a non-serif font matching URW Palladio
(https://ctan.org/pkg/classico).

## Compile Examples

The subfolder `./ly` contains various music examples written in LilyPond.  Some
examples are supposed to produce a PDF (p-), some should produce a MIDI (m-),
some both (b-), as indicated by their prefix in the file name.  In order to
translate these files into scores and music, run the `compile-all` script that
lies within the same folder, e.g. by calling (from within `./ly`):

    bash compile-all

After running the script, the ./ly directory should contain various PDF and MIDI
files, and, in addition to that, an OGG file for each MIDI file, so that the
sound samples can be played on all systems without the need of a MIDI player.

## Compile the main document

Finally, compile the `main.tex` in the main directory.  It requires the TEX
files inside the `./tikz` subfolder, PDFs from `./ly` that we created in step 2,
as well as all files inside the main folder (most importantly, the font files
for the Helmholtz–Ellis symbols).  As usual, the LaTeX procedure comprises
several steps.  We should be fine after running `pdflatex` once, then `biber`
once, and then `pdflatex` twice.
