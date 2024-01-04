\version "2.24.1"
\include "tuning.ily"

%% Content
S = \relative c'' { g1 g  }
A = \relative c'  { e1 eM } 
T = \relative c'  { c1 c }

%% MIDI
\score {
  <<
    \new Staff \with {midiInstrument = #"oboe"} << \S >>
    \new Staff \with {midiInstrument = #"oboe"} << \A >>
    \new Staff \with {midiInstrument = #"oboe"} << \T >>
  >>
  \midi { \tempo 4 = 100 }
}
