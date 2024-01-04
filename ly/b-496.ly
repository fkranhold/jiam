\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1
XS = \relative c'' { c4  c~ c bM c1  }
XA = \relative c'' { g4  aM g2   g1  } 
XT = \relative c'  { eM4 dM d2   eM1 }
XB = \relative c   { c4  f  g2   c,1 }

%% Content 2
YS = \relative c'' { c4   c~ c bM c1   }
YA = \relative c'' { g4   asP  g2 g1   }
YT = \relative c'  { esP4 d    d2 esP1 }
YB = \relative c   { c4   f    g2 c,1  }

%% Content 3
ZS = \relative c'' { c4^"not recommended" c~ c bM c1   }
ZA = \relative c'' { g4                   asP  g2 g1   }
ZT = \relative c'  { esP4                 dM   d2 esP1 }
ZB = \relative c   { c4                   f    g2 c,1  }

%% Content 4
AS = \relative c'' { besP2  a        g1    }
AA = \relative c'' { a4( g) g( fisM) d1    } 
AT = \relative c'  { d2     d        besP1 }
AB = \relative c'  { g2     d        g1    }

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
