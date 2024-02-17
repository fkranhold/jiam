\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1
XS = \relative c'' { \partial 4 {cP4} d  b  cP  a  a  gisM a2  }
XA = \relative c'  { \partial 4 {e4}  fP dP e   cP d  b    cP2 }
XT = \relative c'  { \partial 4 {a4}  a  gP gP  fP fP e    e2  }
XB = \relative c'  { \partial 4 {a4}  d, gP cP, fP b,  e    a,2 }

%% MIDI 1
\score {
  <<
    \new Staff \with {midiInstrument = #"oboe"} << \XS >>
    \new Staff \with {midiInstrument = #"oboe"} << \XA >>
    \new Staff \with {midiInstrument = #"oboe"} << \XT >>
    \new Staff \with {midiInstrument = #"oboe"} << \XB >>
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
      << \XT \\ \XB >>  \bar "|."} >>
  >>
  \layout{}
}
