\version "2.24.1"
\include "tuning.ily"
\include "layout-e.ily"

%% Content 1
XS = \relative c'' { \partial 4 {g} g g fis d g a bes bes c( bes) a a
                     bes c d8 c bes4 es4 es d des8 c c2 bes4 bes a g
                     f d8 es f4 f g f es2 d4 d' c bes8 a a2 g2. \bar "|."  }
XA = \relative c'  { \partial 4 {d4} es8 d c4 d a d8 e! fis4 g g a( g)
                     fis fis g a bes f g8 a bes4 bes bes bes a f g8
                     f es8 d e4 d a d8 es! f4 f8[ es] es[ d] d( c16
                     bes c4) bes bes' a g g4( fis) d2. }
XT = \relative c'  { \partial 4 {bes4} bes a8 g a4 fis g c d d es( d) d d d
                     es f8[ es] d8[ c] bes4 bes8[ c] d[ bes] g'4 f4. es8
                     d4 d c bes a f bes bes bes a bes( f) f f'4 es d e4( d8[ c]) b!2. }
XB = \relative c   { \partial 4 {g'4} c,8 d es4 d c bes a g g' fis( g)
                     d4 d g c bes as g ges f e f2 bes,4 g c cis d d8[ c] bes[ c] d[ bes]
                     es4 f g( a) bes bes fis g cis, d g2.}

%% MIDI 1
\score {
  <<
    \new Staff \with {midiInstrument = #"oboe"} << \XS >>
    \new Staff \with {midiInstrument = #"oboe"} << \XA >>
    \new Staff \with {midiInstrument = #"oboe"} << \XT >>
    \new Staff \with {midiInstrument = #"oboe"} << \XB >>
  >>
  \midi { \tempo 4 = 60 }
}

%% Control the PDF output.
%% PDF (the just one, with HE accidentals)
\score {
  \new ChoirStaff
  <<
    \new Staff << {
      << \XS \\ \XA >> \bar "|." } >>
    \new Staff << \clef "bass" {
      << \XT \\ \XB >> \bar "|."} >>
  >>
}
