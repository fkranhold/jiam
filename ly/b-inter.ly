\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1
XS = \relative c'' { c2    cisMM  dM4 c bM2   c1 }
XA = \relative c'  { eM2   eM4 gM f2    g?4 f eM1 }
XT = \relative c'  { g2    aM     aM    g     g1 }
XB = \relative c   { c4 bM aM2    dM    g,    c1}


%% MIDI 1
\score {
  <<
    \new Staff \with {midiInstrument = #"oboe"} << \XS >>
    \new Staff \with {midiInstrument = #"oboe"} << \XA >>
    \new Staff \with {midiInstrument = #"oboe"} << \XT >>
    \new Staff \with {midiInstrument = #"oboe"} << \XB >>
  >>
  \midi { \tempo 4 = 100 }
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
  \layout{}
}
