%% This LilyPond file is heavily inspired by the snippet
%% https://lsr.di.unimi.it/LSR/Item?id=786

%% As a matter of principle, pitch differences are declared as
%% a fraction of an equally-tempered whole note.  That means:
%% If we want to express a difference of x cents, we write x/200.
%% We round all differences to a full amount of cents.

%% We set the pitches of the Pythagorean ‘white notes’ by giving their
%% difference to an equally-tempered C.  A 2:3-fifth is ~2ct larger than
%% an equally-tempered one, i.e. 702ct.  From that, we can calculate all
%% white notes.  E.g. D is 2 fifths above C, so after subtracting an octave,
%% we get 2*702ct-1200ct = 204/200.
scalepitches = #`#(0/200 204/200 408/200 498/200 702/200 906/200 1110/200)
#(ly:set-default-scale (ly:make-scale scalepitches))

%% We define how alterations (sharp and flat) change the frequency.
%% Here we calculate log_2((3/2)^7/16)*1200ct = ~114ct.
#(define MSHARP 114/200)
#(define MFLAT (- MSHARP))

%% The syntotic comma is log_2(81/80)*1200ct = ~22ct.
%% The septimal comma is log_2(64/63)*1200ct = ~27ct.
#(define SYNTOTIC 22/200)
#(define SEPTIMAL 27/200)

%% Now we define all combinations of alterations we might encounter
%% (e.g. sharp, raised by two syntotic commata, lowered by a septimal comma)
%% and explain what this means for the corresponding frequency.
%% This list is not comprehensive, e.g. we have not declared double sharps,
%% but it can easily been extended if necessary.
#(define MSHARP-P     (+ MSHARP  SYNTOTIC))
#(define MSHARP-M     (- MSHARP  SYNTOTIC))
#(define MSHARP-PP    (+ MSHARP  (* SYNTOTIC 2)))
#(define MSHARP-MM    (- MSHARP  (* SYNTOTIC 2)))
#(define MSHARP-S     (- MSHARP SEPTIMAL))
#(define MSHARP-PS    (- (+ MSHARP SYNTOTIC)  SEPTIMAL))
#(define MSHARP-MS    (- (- MSHARP SYNTOTIC)  SEPTIMAL))
#(define MSHARP-PPS   (- (+ MSHARP (* SYNTOTIC 2))  SEPTIMAL))
#(define MSHARP-MMS   (- (- MSHARP (* SYNTOTIC 2))  SEPTIMAL))

#(define NATURAL-P    (+ NATURAL SYNTOTIC))
#(define NATURAL-M    (- NATURAL SYNTOTIC))
#(define NATURAL-PP   (+ NATURAL (* SYNTOTIC 2)))
#(define NATURAL-MM   (- NATURAL (* SYNTOTIC 2)))
#(define NATURAL-S    (- NATURAL SEPTIMAL))
#(define NATURAL-PS   (- (+ NATURAL SYNTOTIC) SEPTIMAL))
#(define NATURAL-MS   (- (- NATURAL SYNTOTIC) SEPTIMAL))
#(define NATURAL-PPS  (- (+ NATURAL (* SYNTOTIC 2)) SEPTIMAL))
#(define NATURAL-MMS  (- (- NATURAL (* SYNTOTIC 2)) SEPTIMAL))

#(define MFLAT-P       (+ MFLAT SYNTOTIC))
#(define MFLAT-M      (- MFLAT SYNTOTIC))
#(define MFLAT-PP     (+ MFLAT (* SYNTOTIC 2)))
#(define MFLAT-MM     (- MFLAT (* SYNTOTIC 2)))
#(define MFLAT-S      (- MFLAT SEPTIMAL))
#(define MFLAT-PS     (- (+ MFLAT SYNTOTIC) SEPTIMAL))
#(define MFLAT-MS     (- (- MFLAT SYNTOTIC) SEPTIMAL))
#(define MFLAT-PPS    (- (+ MFLAT (* SYNTOTIC 2)) SEPTIMAL))
#(define MFLAT-MMS    (- (- MFLAT (* SYNTOTIC 2)) SEPTIMAL))

%% We declare how we want to name our pitches, e.g. cisPPS means:
%% Pythagorean #C, raised by two syntotic commata (P for ’plus’),
%% and lowered by a septimal comma.
pitchnames = #`(
  (ces    . ,(ly:make-pitch -1 0 MFLAT))
  (cesP   . ,(ly:make-pitch -1 0 MFLAT-P))
  (cesM   . ,(ly:make-pitch -1 0 MFLAT-M))
  (cesPP  . ,(ly:make-pitch -1 0 MFLAT-PP))
  (cesMM  . ,(ly:make-pitch -1 0 MFLAT-MM))
  (cesS   . ,(ly:make-pitch -1 0 MFLAT-S))
  (cesPS  . ,(ly:make-pitch -1 0 MFLAT-PS))
  (cesMS  . ,(ly:make-pitch -1 0 MFLAT-MS))
  (cesPPS . ,(ly:make-pitch -1 0 MFLAT-PPS))
  (cesMMS . ,(ly:make-pitch -1 0 MFLAT-MMS))
  (c      . ,(ly:make-pitch -1 0 NATURAL))
  (cP     . ,(ly:make-pitch -1 0 NATURAL-P))
  (cM     . ,(ly:make-pitch -1 0 NATURAL-M))
  (cPP    . ,(ly:make-pitch -1 0 NATURAL-PP))
  (cMM    . ,(ly:make-pitch -1 0 NATURAL-MM))
  (cS     . ,(ly:make-pitch -1 0 NATURAL-S))
  (cPS    . ,(ly:make-pitch -1 0 NATURAL-PS))
  (cMS    . ,(ly:make-pitch -1 0 NATURAL-MS))
  (cPPS   . ,(ly:make-pitch -1 0 NATURAL-PPS))
  (cMMS   . ,(ly:make-pitch -1 0 NATURAL-MMS))
  (cis    . ,(ly:make-pitch -1 0 MSHARP))
  (cisP   . ,(ly:make-pitch -1 0 MSHARP-P))
  (cisM   . ,(ly:make-pitch -1 0 MSHARP-M))
  (cisPP  . ,(ly:make-pitch -1 0 MSHARP-PP))
  (cisMM  . ,(ly:make-pitch -1 0 MSHARP-MM))
  (cisS   . ,(ly:make-pitch -1 0 MSHARP-S))
  (cisPS  . ,(ly:make-pitch -1 0 MSHARP-PS))
  (cisMS  . ,(ly:make-pitch -1 0 MSHARP-MS))
  (cisPPS . ,(ly:make-pitch -1 0 MSHARP-PPS))
  (cisMMS . ,(ly:make-pitch -1 0 MSHARP-MMS))

  (des    . ,(ly:make-pitch -1 1 MFLAT))
  (desP   . ,(ly:make-pitch -1 1 MFLAT-P))
  (desM   . ,(ly:make-pitch -1 1 MFLAT-M))
  (desPP  . ,(ly:make-pitch -1 1 MFLAT-PP))
  (desMM  . ,(ly:make-pitch -1 1 MFLAT-MM))
  (desS   . ,(ly:make-pitch -1 1 MFLAT-S))
  (desPS  . ,(ly:make-pitch -1 1 MFLAT-PS))
  (desMS  . ,(ly:make-pitch -1 1 MFLAT-MS))
  (desPPS . ,(ly:make-pitch -1 1 MFLAT-PPS))
  (desMMS . ,(ly:make-pitch -1 1 MFLAT-MMS))
  (d      . ,(ly:make-pitch -1 1 NATURAL))
  (dP     . ,(ly:make-pitch -1 1 NATURAL-P))
  (dM     . ,(ly:make-pitch -1 1 NATURAL-M))
  (dPP    . ,(ly:make-pitch -1 1 NATURAL-PP))
  (dMM    . ,(ly:make-pitch -1 1 NATURAL-MM))
  (dS     . ,(ly:make-pitch -1 1 NATURAL-S))
  (dPS    . ,(ly:make-pitch -1 1 NATURAL-PS))
  (dMS    . ,(ly:make-pitch -1 1 NATURAL-MS))
  (dPPS   . ,(ly:make-pitch -1 1 NATURAL-PPS))
  (dMMS   . ,(ly:make-pitch -1 1 NATURAL-MMS))
  (dis    . ,(ly:make-pitch -1 1 MSHARP))
  (disP   . ,(ly:make-pitch -1 1 MSHARP-P))
  (disM   . ,(ly:make-pitch -1 1 MSHARP-M))
  (disPP  . ,(ly:make-pitch -1 1 MSHARP-PP))
  (disMM  . ,(ly:make-pitch -1 1 MSHARP-MM))
  (disS   . ,(ly:make-pitch -1 1 MSHARP-S))
  (disPS  . ,(ly:make-pitch -1 1 MSHARP-PS))
  (disMS  . ,(ly:make-pitch -1 1 MSHARP-MS))
  (disPPS . ,(ly:make-pitch -1 1 MSHARP-PPS))
  (disMMS . ,(ly:make-pitch -1 1 MSHARP-MMS))

  (es     . ,(ly:make-pitch -1 2 MFLAT))
  (esP    . ,(ly:make-pitch -1 2 MFLAT-P))
  (esM    . ,(ly:make-pitch -1 2 MFLAT-M))
  (esPP   . ,(ly:make-pitch -1 2 MFLAT-PP))
  (esMM   . ,(ly:make-pitch -1 2 MFLAT-MM))
  (esS    . ,(ly:make-pitch -1 2 MFLAT-S))
  (esPS   . ,(ly:make-pitch -1 2 MFLAT-PS))
  (esMS   . ,(ly:make-pitch -1 2 MFLAT-MS))
  (esPPS  . ,(ly:make-pitch -1 2 MFLAT-PPS))
  (esMMS  . ,(ly:make-pitch -1 2 MFLAT-MMS))
  (e      . ,(ly:make-pitch -1 2 NATURAL))
  (eP     . ,(ly:make-pitch -1 2 NATURAL-P))
  (eM     . ,(ly:make-pitch -1 2 NATURAL-M))
  (ePP    . ,(ly:make-pitch -1 2 NATURAL-PP))
  (eMM    . ,(ly:make-pitch -1 2 NATURAL-MM))
  (eS     . ,(ly:make-pitch -1 2 NATURAL-S))
  (ePS    . ,(ly:make-pitch -1 2 NATURAL-PS))
  (eMS    . ,(ly:make-pitch -1 2 NATURAL-MS))
  (ePPS   . ,(ly:make-pitch -1 2 NATURAL-PPS))
  (eMMS   . ,(ly:make-pitch -1 2 NATURAL-MMS))
  (eis    . ,(ly:make-pitch -1 2 MSHARP))
  (eisP   . ,(ly:make-pitch -1 2 MSHARP-P))
  (eisM   . ,(ly:make-pitch -1 2 MSHARP-M))
  (eisPP  . ,(ly:make-pitch -1 2 MSHARP-PP))
  (eisMM  . ,(ly:make-pitch -1 2 MSHARP-MM))
  (eisS   . ,(ly:make-pitch -1 2 MSHARP-S))
  (eisPS  . ,(ly:make-pitch -1 2 MSHARP-PS))
  (eisMS  . ,(ly:make-pitch -1 2 MSHARP-MS))
  (eisPPS . ,(ly:make-pitch -1 2 MSHARP-PPS))
  (eisMMS . ,(ly:make-pitch -1 2 MSHARP-MMS))

  (fes    . ,(ly:make-pitch -1 3 MFLAT))
  (fesP   . ,(ly:make-pitch -1 3 MFLAT-P))
  (fesM   . ,(ly:make-pitch -1 3 MFLAT-M))
  (fesPP  . ,(ly:make-pitch -1 3 MFLAT-PP))
  (fesMM  . ,(ly:make-pitch -1 3 MFLAT-MM))
  (fesS   . ,(ly:make-pitch -1 3 MFLAT-S))
  (fesPS  . ,(ly:make-pitch -1 3 MFLAT-PS))
  (fesMS  . ,(ly:make-pitch -1 3 MFLAT-MS))
  (fesPPS . ,(ly:make-pitch -1 3 MFLAT-PPS))
  (fesMMS . ,(ly:make-pitch -1 3 MFLAT-MMS))
  (f      . ,(ly:make-pitch -1 3 NATURAL))
  (fP     . ,(ly:make-pitch -1 3 NATURAL-P))
  (fM     . ,(ly:make-pitch -1 3 NATURAL-M))
  (fPP    . ,(ly:make-pitch -1 3 NATURAL-PP))
  (fMM    . ,(ly:make-pitch -1 3 NATURAL-MM))
  (fS     . ,(ly:make-pitch -1 3 NATURAL-S))
  (fPS    . ,(ly:make-pitch -1 3 NATURAL-PS))
  (fMS    . ,(ly:make-pitch -1 3 NATURAL-MS))
  (fPPS   . ,(ly:make-pitch -1 3 NATURAL-PPS))
  (fMMS   . ,(ly:make-pitch -1 3 NATURAL-MMS))
  (fis    . ,(ly:make-pitch -1 3 MSHARP))
  (fisP   . ,(ly:make-pitch -1 3 MSHARP-P))
  (fisM   . ,(ly:make-pitch -1 3 MSHARP-M))
  (fisPP  . ,(ly:make-pitch -1 3 MSHARP-PP))
  (fisMM  . ,(ly:make-pitch -1 3 MSHARP-MM))
  (fisS   . ,(ly:make-pitch -1 3 MSHARP-S))
  (fisPS  . ,(ly:make-pitch -1 3 MSHARP-PS))
  (fisMS  . ,(ly:make-pitch -1 3 MSHARP-MS))
  (fisPPS . ,(ly:make-pitch -1 3 MSHARP-PPS))
  (fisMMS . ,(ly:make-pitch -1 3 MSHARP-MMS))

  (ges    . ,(ly:make-pitch -1 4 MFLAT))
  (gesP   . ,(ly:make-pitch -1 4 MFLAT-P))
  (gesM   . ,(ly:make-pitch -1 4 MFLAT-M))
  (gesPP  . ,(ly:make-pitch -1 4 MFLAT-PP))
  (gesMM  . ,(ly:make-pitch -1 4 MFLAT-MM))
  (gesS   . ,(ly:make-pitch -1 4 MFLAT-S))
  (gesPS  . ,(ly:make-pitch -1 4 MFLAT-PS))
  (gesMS  . ,(ly:make-pitch -1 4 MFLAT-MS))
  (gesPPS . ,(ly:make-pitch -1 4 MFLAT-PPS))
  (gesMMS . ,(ly:make-pitch -1 4 MFLAT-MMS))
  (g      . ,(ly:make-pitch -1 4 NATURAL))
  (gP     . ,(ly:make-pitch -1 4 NATURAL-P))
  (gM     . ,(ly:make-pitch -1 4 NATURAL-M))
  (gPP    . ,(ly:make-pitch -1 4 NATURAL-PP))
  (gMM    . ,(ly:make-pitch -1 4 NATURAL-MM))
  (gS     . ,(ly:make-pitch -1 4 NATURAL-S))
  (gPS    . ,(ly:make-pitch -1 4 NATURAL-PS))
  (gMS    . ,(ly:make-pitch -1 4 NATURAL-MS))
  (gPPS   . ,(ly:make-pitch -1 4 NATURAL-PPS))
  (gMMS   . ,(ly:make-pitch -1 4 NATURAL-MMS))
  (gis    . ,(ly:make-pitch -1 4 MSHARP))
  (gisP   . ,(ly:make-pitch -1 4 MSHARP-P))
  (gisM   . ,(ly:make-pitch -1 4 MSHARP-M))
  (gisPP  . ,(ly:make-pitch -1 4 MSHARP-PP))
  (gisMM  . ,(ly:make-pitch -1 4 MSHARP-MM))
  (gisS   . ,(ly:make-pitch -1 4 MSHARP-S))
  (gisPS  . ,(ly:make-pitch -1 4 MSHARP-PS))
  (gisMS  . ,(ly:make-pitch -1 4 MSHARP-MS))
  (gisPPS . ,(ly:make-pitch -1 4 MSHARP-PPS))
  (gisMMS . ,(ly:make-pitch -1 4 MSHARP-MMS))

  (as     . ,(ly:make-pitch -1 5 MFLAT))
  (asP    . ,(ly:make-pitch -1 5 MFLAT-P))
  (asM    . ,(ly:make-pitch -1 5 MFLAT-M))
  (asPP   . ,(ly:make-pitch -1 5 MFLAT-PP))
  (asMM   . ,(ly:make-pitch -1 5 MFLAT-MM))
  (asS    . ,(ly:make-pitch -1 5 MFLAT-S))
  (asPS   . ,(ly:make-pitch -1 5 MFLAT-PS))
  (asMS   . ,(ly:make-pitch -1 5 MFLAT-MS))
  (asPPS  . ,(ly:make-pitch -1 5 MFLAT-PPS))
  (asMMS  . ,(ly:make-pitch -1 5 MFLAT-MMS))
  (a      . ,(ly:make-pitch -1 5 NATURAL))
  (aP     . ,(ly:make-pitch -1 5 NATURAL-P))
  (aM     . ,(ly:make-pitch -1 5 NATURAL-M))
  (aPP    . ,(ly:make-pitch -1 5 NATURAL-PP))
  (aMM    . ,(ly:make-pitch -1 5 NATURAL-MM))
  (aS     . ,(ly:make-pitch -1 5 NATURAL-S))
  (aPS    . ,(ly:make-pitch -1 5 NATURAL-PS))
  (aMS    . ,(ly:make-pitch -1 5 NATURAL-MS))
  (aPPS   . ,(ly:make-pitch -1 5 NATURAL-PPS))
  (aMMS   . ,(ly:make-pitch -1 5 NATURAL-MMS))
  (ais    . ,(ly:make-pitch -1 5 MSHARP))
  (aisP   . ,(ly:make-pitch -1 5 MSHARP-P))
  (aisM   . ,(ly:make-pitch -1 5 MSHARP-M))
  (aisPP  . ,(ly:make-pitch -1 5 MSHARP-PP))
  (aisMM  . ,(ly:make-pitch -1 5 MSHARP-MM))
  (aisS   . ,(ly:make-pitch -1 5 MSHARP-S))
  (aisPS  . ,(ly:make-pitch -1 5 MSHARP-PS))
  (aisMS  . ,(ly:make-pitch -1 5 MSHARP-MS))
  (aisPPS . ,(ly:make-pitch -1 5 MSHARP-PPS))
  (aisMMS . ,(ly:make-pitch -1 5 MSHARP-MMS))

  (bes    . ,(ly:make-pitch -1 6 MFLAT))
  (besP   . ,(ly:make-pitch -1 6 MFLAT-P))
  (besM   . ,(ly:make-pitch -1 6 MFLAT-M))
  (besPP  . ,(ly:make-pitch -1 6 MFLAT-PP))
  (besMM  . ,(ly:make-pitch -1 6 MFLAT-MM))
  (besS   . ,(ly:make-pitch -1 6 MFLAT-S))
  (besPS  . ,(ly:make-pitch -1 6 MFLAT-PS))
  (besMS  . ,(ly:make-pitch -1 6 MFLAT-MS))
  (besPPS . ,(ly:make-pitch -1 6 MFLAT-PPS))
  (besMMS . ,(ly:make-pitch -1 6 MFLAT-MMS))
  (b      . ,(ly:make-pitch -1 6 NATURAL))
  (bP     . ,(ly:make-pitch -1 6 NATURAL-P))
  (bM     . ,(ly:make-pitch -1 6 NATURAL-M))
  (bPP    . ,(ly:make-pitch -1 6 NATURAL-PP))
  (bMM    . ,(ly:make-pitch -1 6 NATURAL-MM))
  (bS     . ,(ly:make-pitch -1 6 NATURAL-S))
  (bPS    . ,(ly:make-pitch -1 6 NATURAL-PS))
  (bMS    . ,(ly:make-pitch -1 6 NATURAL-MS))
  (bPPS   . ,(ly:make-pitch -1 6 NATURAL-PPS))
  (bMMS   . ,(ly:make-pitch -1 6 NATURAL-MMS))
  (bis    . ,(ly:make-pitch -1 6 MSHARP))
  (bisP   . ,(ly:make-pitch -1 6 MSHARP-P))
  (bisM   . ,(ly:make-pitch -1 6 MSHARP-M))
  (bisPP  . ,(ly:make-pitch -1 6 MSHARP-PP))
  (bisMM  . ,(ly:make-pitch -1 6 MSHARP-MM))
  (bisS   . ,(ly:make-pitch -1 6 MSHARP-S))
  (bisPS  . ,(ly:make-pitch -1 6 MSHARP-PS))
  (bisMS  . ,(ly:make-pitch -1 6 MSHARP-MS))
  (bisPPS . ,(ly:make-pitch -1 6 MSHARP-PPS))
  (bisMMS . ,(ly:make-pitch -1 6 MSHARP-MMS))
)

%% Tell LilyPond to use our modified pitch names.
#(ly:parser-set-note-names pitchnames)

%% The symbols for each alteration, as in the font file
%% EkmelosReducedHEJI.otf
accGlyphs = #`(
  (,MSHARP-PP    . "x")
  (,MSHARP-P     . "n")
  (,MSHARP-MM    . "s")
  (,MSHARP-M     . "i")
  (,MSHARP-S     . "Zc")
  (,MSHARP-PPS   . "Zx")
  (,MSHARP-PS    . "Zn")
  (,MSHARP-MMS   . "Zs")
  (,MSHARP-MS    . "Zi")
  (,MSHARP       . "c")
  (,NATURAL-PP   . "w")
  (,NATURAL-P    . "m")
  (,NATURAL-PPS  . "Zw")
  (,NATURAL-PS   . "Zm")
  (,NATURAL-S    . "Zb")
  ( 0            . "b")
  (,NATURAL-MM   . "r")
  (,NATURAL-M    . "h")
  (,NATURAL-MMS  . "Zr")
  (,NATURAL-MS   . "Zh")
  (,MFLAT        . "a")
  (,MFLAT-PP     . "v")
  (,MFLAT-P      . "l")
  (,MFLAT-MM     . "g")
  (,MFLAT-M      . "q")
  (,MFLAT-S      . "Za")
  (,MFLAT-PPS    . "Zv")
  (,MFLAT-PS     . "Zl")
  (,MFLAT-MMS    . "Zg")
  (,MFLAT-MS     . "Zq")
  ( 1/2          . "c")
  (-1/2          . "a")
)

%% Extra function to replace Lnat by L, e.g. "\oS aS"
oS =
#(define-music-function (note) (ly:music?)
  #{ \once \override Voice.Accidental.stencil = #ly:text-interface::print
  \once \override Voice.Accidental.text       = "z"
  $note #})

%% The Pythagorean C is ~6ct below the equally-tempered C.
\midi {
  \context {
    \Score
    \transposition #(ly:make-pitch 0 0 -6/200)
  }
}

%% Symbols for the accidentals, taken from from the reduced Ekmelos font.
%% Here we assume the existence of EkelmosreducedHEJI.otf in the current directory.
#(ly:font-config-add-directory ".")
\layout {
  \context {
    \Score
    \override Accidental.stencil   = #ly:text-interface::print
    \override Accidental.font-name = #"EkmelosreducedHEJI"
    \override Accidental.text      = #(lambda (grob)
                                        (cdr (assoc (ly:grob-property grob 'alteration)
                                              accGlyphs)))
    \override Accidental.font-size = #5.5
    \override Accidental.alteration-glyph-name-alist = \accGlyphs
  }
}
