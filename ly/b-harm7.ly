\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1
XS = \relative c'' { <fisM, d>2 <e cisM> d1      }
XA = \relative c'' { a,1                 a       }
XT = \relative c'  { fisM,2     g        fisM1   }
XB = \relative c   { a1                  <d d,>1 }

%% Content 2
YS = \relative c'' { <fisM, d>2 <e cisM> d1      }
YA = \relative c'' { a,1                 a       }
YT = \relative c'  { fisM,2     \oS gS   fisM1   }
YB = \relative c   { a1                  <d d,>1 }

%% Content 3
ZS = \relative c'' { c2  d  c1  }
ZA = \relative c'  { eM2 f2 eM1 }
ZT = \relative c'  { g2  a  g1  }
ZB = \relative c   { c2  bM c1  }

%% Content 4
AS = \relative c'' { c2      d   c1  }
AA = \relative c'  { eM2 \oS fS2 eM1 }
AT = \relative c'  { g2      a   g1  }
AB = \relative c   { c2      bM  c1  }

%% MIDI 1
\book {
  \bookOutputSuffix "1"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \XS >>
      \new Staff \with {midiInstrument = #"oboe"} << \XA >>
      \new Staff \with {midiInstrument = #"oboe"} << \XT >>
      \new Staff \with {midiInstrument = #"oboe"} << \XB >>
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% MIDI 2
\book {
  \bookOutputSuffix "2"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \YS >>
      \new Staff \with {midiInstrument = #"oboe"} << \YA >>
      \new Staff \with {midiInstrument = #"oboe"} << \YT >>
      \new Staff \with {midiInstrument = #"oboe"} << \YB >>
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% MIDI 3
\book {
  \bookOutputSuffix "3"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \ZS >>
      \new Staff \with {midiInstrument = #"oboe"} << \ZA >>
      \new Staff \with {midiInstrument = #"oboe"} << \ZT >>
      \new Staff \with {midiInstrument = #"oboe"} << \ZB >>
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% MIDI 4
\book {
  \bookOutputSuffix "4"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \AS >>
      \new Staff \with {midiInstrument = #"oboe"} << \AA >>
      \new Staff \with {midiInstrument = #"oboe"} << \AT >>
      \new Staff \with {midiInstrument = #"oboe"} << \AB >>
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% Control the PDF output.
%% PDF (the just one, with HE accidentals)
\score {
  \new ChoirStaff
  <<
    \new Staff << {
      << \XS \\ \XA >> \bar "||"
      << \YS \\ \YA >> \bar "||"
      << \ZS \\ \ZA >> \bar "||"
      << \AS \\ \AA >> \bar "|." } >>
    \new Staff << \clef "bass" {
      << \XT \\ \XB >> \bar "||"
      << \YT \\ \YB >> \bar "||"
      << \ZT \\ \ZB >> \bar "||"
      << \AT \\ \AB >> \bar "|."} >>
  >>
  \layout{}
}
