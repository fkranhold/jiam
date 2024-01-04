\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Pythagorean
PS = \relative c' { e4 dis e fis g gis a  fis g  e fis fis e1   }
PA = \relative c' { b4 b   b d   d e   e  d   d  c cis dis b1   } 
PT = \relative c' { g4 fis g a   b b   c  a   b  g fis b   gis1 }
PB = \relative c  { e4 b   e d   g e   a, d   g, c ais b   e1   }

%% Just intonation
JS = \relative c' { e4  disM e  fis gP gisM a  fis gP  e  fis  fis    e1    }
JA = \relative c' { b4  b    b  dP  dP e    e  dP  dP  cP cis  disM   b1    } 
JT = \relative c' { gP4 fis  gP aP  b  b    cP aP  b   gP fis  b      gisM1 }
JB = \relative c  { e4  b    e  dP  gP e    a, dP  gP, cP aisM b      e1    }

%% MIDI Pythageorean
\book {
  \bookOutputSuffix "pyth"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} \PS
      \new Staff \with {midiInstrument = #"oboe"} \PA
      \new Staff \with {midiInstrument = #"oboe"} \PT
      \new Staff \with {midiInstrument = #"oboe"} \PB
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% MIDI Just
\book {
  \bookOutputSuffix "just"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} \JS
      \new Staff \with {midiInstrument = #"oboe"} \JA
      \new Staff \with {midiInstrument = #"oboe"} \JT
      \new Staff \with {midiInstrument = #"oboe"} \JB
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% PDF (the just one, with HE accidentals)
\score {
  \new ChoirStaff
  <<
    \new Staff <<              { \JS } \\ { \JA \bar "|." } >>
    \new Staff << \clef "bass" { \JT } \\ { \JB }           >>
  >>
  \layout{}
}
