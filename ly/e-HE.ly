\version "2.24.1"
\include "tuning.ily"
\include "layout-e.ily"

%% Content 1
XS = \relative c'' { d4 cis d d d e d cis d1 }
XA = \relative c'  { f4 a a a g e f e fis1 }
XT = \relative c'  { a4 a a a bes b a a a1 }
XB = \relative c   { d4 e f fis g gis a a, d1 }

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
   \layout {
    \context {
      \Score
      \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/9)
    }
  }
}
