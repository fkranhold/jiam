\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Just leading tone
JL = \relative c'' { r1  r  bM r  } % Leading tone twice as loud
JS = \relative c'' { c1  c  bM c  }
JA = \relative c'' { g1  aM g  g  } 
JT = \relative c'  { eM1 f  d  eM }

%% Pythagorean leading tone
PL = \relative c'' { r1  r  b r  } % Leading tone twice as loud
PS = \relative c'' { c1  c  b c  }
PA = \relative c'' { g1  aM g g  } 
PT = \relative c'  { eM1 f  d eM }

%% MIDI Just
\book {
  \bookOutputSuffix "just"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \JL >>
      \new Staff \with {midiInstrument = #"oboe"} << \JS >>
      \new Staff \with {midiInstrument = #"oboe"} << \JA >>
      \new Staff \with {midiInstrument = #"oboe"} << \JT >>
    >>
    \midi { \tempo 4 = 160 }
  }
}

%% MIDI Pythagorean
\book {
  \bookOutputSuffix "pyth"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \PL >>
      \new Staff \with {midiInstrument = #"oboe"} << \PS >>
      \new Staff \with {midiInstrument = #"oboe"} << \PA >>
      \new Staff \with {midiInstrument = #"oboe"} << \PT >>
    >>
    \midi { \tempo 4 = 160 }
  }
}

%% PDF output
\score {
  \new Voice <<
    \omit Staff.TimeSignature
    \time 4/1
    { << \JS \JA \JT >> \bar "||"
      << \PS \PA \PT >> \bar "|." }
  >>
  \layout{}
}
