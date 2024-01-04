\version "2.24.1"
\include "layout.ily"

%% Bars 1+2 (leading to a aug5)
XS = \relative c'' { g2 a b1  }
XA = \relative c'' { g2 f es1 }

%% Bars 3+4 (leading to a min6)
YS = \relative c'' { gis2 ais    b1   }
YA = \relative c'' { gis2 fis4 e dis1 }

%% MIDI for aug5
\book {
  \bookOutputSuffix "aug5"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} \XS
      \new Staff \with {midiInstrument = #"oboe"} \XA
    >>
    \midi { \tempo 4 = 80 }
  }
}

%% MIDI for min6
\book {
  \bookOutputSuffix "min6"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} \YS
      \new Staff \with {midiInstrument = #"oboe"} \YA
    >>
    \midi { \tempo 4 = 80 }
  }
}

%% PDF
\score {
  { << \XS \\ \XA >> \bar "||"
    << \YS \\ \YA >> \bar "|." }
}
