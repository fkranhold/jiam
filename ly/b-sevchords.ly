\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1
XS = \relative c'' { c2     bM2   c1  }
XA = \relative c'' { g4  aM g4  f eM1 } 
XT = \relative c'  { eM4 f  d2    c1  }
XB = \relative c   { c4  f  g2    c,1 }

%% Content 2
YS = \relative c'' { a2   b    cP1  }
YA = \relative c'' { cP,2 d    cP1 }
YT = \relative c'  { e,2  fP   e1  }
YB = \relative c   { a2   gisM a1  }

%% Content 3
ZS = \relative c'' { besP2       besP a    g    }
ZA = \relative c'' { g2          g    fisM d    }
ZT = \relative c'  { d2          cisM d    besP }
ZB = \relative c   { r8 g besP d esP2 d    g    }

%% Content 4
AS = \relative c'' { c4    bes a2 g1  }
AA = \relative c'' { dM,2(     d) eM1 } 
AT = \relative c'  { f,1          eM  }
AB = \relative c   { bes2      bM c1  }

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
