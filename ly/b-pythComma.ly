\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Example 1
XS = \relative c'' { gis2 as }

%% Example 2
YS = \relative c'' { es2 dis }
YA = \relative c'' { gis gis }

%% MIDIs
\book {
  \bookOutputSuffix "1"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} \XS
    >>
    \midi { \tempo 4 = 60 }
  }
}

\book {
  \bookOutputSuffix "2"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} \YS
      \new Staff \with {midiInstrument = #"oboe"} \YA
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% PDF
\score {
  { \XS \bar "||" << \YS \\ \YA >> }
  \layout{}
}
