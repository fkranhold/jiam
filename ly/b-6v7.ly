\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1
XS = \relative c'' { c1  dM esP  e d  c  }
XA = \relative c'' { g1  aM a    g g  eM }
XT = \relative c'  { eM1 c  c    c bM g  }
XB = \relative c   { c1  f  fisM g g, c  }


%% MIDI 1
\score {
  <<
    \new Staff \with {midiInstrument = #"oboe"} << \XS >>
    \new Staff \with {midiInstrument = #"oboe"} << \XA >>
    \new Staff \with {midiInstrument = #"oboe"} << \XT >>
    \new Staff \with {midiInstrument = #"oboe"} << \XB >>
  >>
  \midi { \tempo 4 = 200 }
}

%% Control the PDF output.
%% PDF (the just one, with HE accidentals)
\score {
  \new ChoirStaff
  <<
    \new Staff << {
      \time 6/1
      \omit Staff.TimeSignature
      << \XS \\ \XA >> \bar "|." } >>
    \new Staff << \clef "bass" {
      \time 6/1
      \omit Staff.TimeSignature
      << \XT \\ \XB >> \bar "|."} >>
  >>
  \layout{}
}
