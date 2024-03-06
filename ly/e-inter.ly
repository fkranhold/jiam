\version "2.24.1"
\include "tuning.ily"
\include "layout-e.ily"

%% Content 1
XS = \relative c'' { c2    c   bM  aM    aM   g   g1  }
XA = \relative c'  { eM4 f g a g f eM2   f4 e d f eM1 }
XT = \relative c'  { c2    c   d   c     c    bM  c1  }
XB = \relative c   { c4 d  eM2 g   aM4 g f2   g   c,1 }

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
