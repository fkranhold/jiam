\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Just leading tone
JS = \relative c'' { c1  c  bM c  }
JA = \relative c'' { g1  aM g  g  } 
JT = \relative c'  { eM1 f  d  eM }

%% Pythagorean leading tone
PS = \relative c'' { c2  c4 d c b c2  }
PA = \relative c'' { g2  aM   g   g  } 
PT = \relative c'  { eM2 f    d   eM }

%% MIDI Just
\book {
  \bookOutputSuffix "just"
  \score {
    <<
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
      << {\voiceOne \PS } \new Voice {\voiceTwo << \PA \PT >> } >> \bar "|." }
  >>
  \layout{}
}
