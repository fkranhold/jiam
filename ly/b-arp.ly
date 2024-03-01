\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1
XS = \relative c'' { r8 g16 c eM g, c eM r8 g,16 c eM g, c eM
                     r8 aM,16 dM f aM, dM f r8 aM,16 dM f aM, dM f}
XT = \relative c'  { r16 eM8.~ eM4 r16 eM8.~ eM4
                     r16 dM8.~ dM4 r16 dM8.~ dM4}
XB = \relative c'  { c2 c c c  }

%% MIDI 1
\score {
  <<
    \new Staff \with {midiInstrument = #"oboe"} << \XS >>
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
    \new Staff << { \XS } >>
    \new Staff << \clef "bass" {
      << \XT \\ \XB >>} >>
  >>
  \layout{}
}
