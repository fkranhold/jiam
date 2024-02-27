\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1: Dominantseptakkord
WS = \relative c'' { c2  bM2 c1  }
WA = \relative c'' { g2  f2  eM1 } 
WT = \relative c'  { eM2 d2  c1  }
WB = \relative c   { c2  g'2 c,1 }

%% Content 2: Verminderter Septakkord
XS = \relative c'' { a2   b    cP1  }
XA = \relative c'' { cP,2 d    cP1 }
XT = \relative c'  { e,2  fP   e1  }
XB = \relative c   { a2   gisM a1  }

%% Content 3: Dominantseptnon
YS = \relative c'' { aM2 aM2 bes2 a2 g1  }
YA = \relative c'  { c2  dM  dM2  d  eM1 } 
YT = \relative c'  { f,2 f   f    f2 eM1 }
YB = \relative c   { f2 dM   bes2 bM c1  }

%% Content 4: Verminderter Septakkord mit b5
ZS = \relative c'' { besP2 besP besP a    g1   }
ZA = \relative c'' { g2    g    g    fisM d1   }
ZT = \relative c'  { d2    cisM d1        besP }
ZB = \relative c   { g'2   esP2 d1        g    }


%% MIDI 1
\book {
  \bookOutputSuffix "1"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \WS >>
      \new Staff \with {midiInstrument = #"oboe"} << \WA >>
      \new Staff \with {midiInstrument = #"oboe"} << \WT >>
      \new Staff \with {midiInstrument = #"oboe"} << \WB >>
    >>
    \midi { \tempo 4 = 60 }
  }
}

%% MIDI 2
\book {
  \bookOutputSuffix "2"
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

%% MIDI 3
\book {
  \bookOutputSuffix "3"
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

%% MIDI 4
\book {
  \bookOutputSuffix "4"
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

%% Control the PDF output.
%% PDF (the just one, with HE accidentals)
\score {
  \new ChoirStaff
  <<
    \new Staff << {
      << \WS \\ \WA >> \bar "||"
      << \XS \\ \XA >> \bar "||"
      << \YS \\ \YA >> \bar "||"
      << \ZS \\ \ZA >> \bar "|." } >>
    \new Staff << \clef "bass" {
      << \WT \\ \WB >> \bar "||"
      << \XT \\ \XB >> \bar "||"
      << \YT \\ \YB >> \bar "||"
      << \ZT \\ \ZB >> \bar "|."} >>
  >>
  \layout{}
}
