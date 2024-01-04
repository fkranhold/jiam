\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Example 1
XL = \relative c'' { as2  s   }      % Hervorhebung
XS = \relative c'' { as2  g   }
XA = \relative c'  { f2   es  }
XT = \relative c'  { d2   s   }
XB = \relative c'  { bes2 bes }

%% Example 2
YL = \relative c'' { gis2 s   }      % Hervorhebung
YS = \relative c'' { gis2 a   }
YA = \relative c'  { f2   e   }
YT = \relative c'  { d2   cis }
YB = \relative c'  { bes2 bes }
                     
%% Example 3
ZL = \relative c'' { s2 gis as2 s  } % Hervorhebung
ZS = \relative c'' { c2 b~  b   c  }
ZA = \relative c'' { a2 gis as  g  }
ZT = \relative c'  { e2 f~  f   es }
ZB = \relative c'  { c2 d~  d   c  }

%% MIDI 1
\book {
  \bookOutputSuffix "1"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} \XL
      \new Staff \with {midiInstrument = #"oboe"} \XS
      \new Staff \with {midiInstrument = #"oboe"} \XA
      \new Staff \with {midiInstrument = #"oboe"} \XT
      \new Staff \with {midiInstrument = #"oboe"} \XB
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% MIDI 2
\book {
  \bookOutputSuffix "2"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} \YL
      \new Staff \with {midiInstrument = #"oboe"} \YS
      \new Staff \with {midiInstrument = #"oboe"} \YA
      \new Staff \with {midiInstrument = #"oboe"} \YT
      \new Staff \with {midiInstrument = #"oboe"} \YB
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% MIDI 3
\book {
  \bookOutputSuffix "3"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} \ZL
      \new Staff \with {midiInstrument = #"oboe"} \ZS
      \new Staff \with {midiInstrument = #"oboe"} \ZA
      \new Staff \with {midiInstrument = #"oboe"} \ZT
      \new Staff \with {midiInstrument = #"oboe"} \ZB
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% PDF output
\score {
  \new Voice <<
    { << \XS \XA \XT \XB >> \bar "||"
      << \YS \YA \YT \YB >> \bar "||"
      << \ZS \ZA \ZT \ZB >> \bar "|." }
  >>
  \layout{}
}
