\version "2.24.1"
\include "tuning.ily"
\include "layout-e.ily"


%% Content 1
XS = \relative c'' { f1 f e d   d cis d c c c bes a a   a }
XA = \relative c'' { d  c c bes a a   a a a g g   f e   fis}
XT = \relative c'' { a  a g g   f e   f f e e d   d cis d}

%% MIDI 1
\score {
  <<
    \new Staff \with {midiInstrument = #"oboe"} << \XS >>
    \new Staff \with {midiInstrument = #"oboe"} << \XA >>
    \new Staff \with {midiInstrument = #"oboe"} << \XT >>
  >>
  \midi { \tempo 4 = 180 }
}

%% Control the PDF output.
%% PDF (the just one, with HE accidentals)
\score {
  \new ChoirStaff
  <<
    \new Staff << {
      \time 14/1
      \omit Staff.TimeSignature
      << { \XS } \\ { \voiceTwo \XA } \\ { \voiceTwo \XT } >> \bar "|." } >>
  >>
   \layout {
    \context {
      \Score
      \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4)
    }
  }
}
