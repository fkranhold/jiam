\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% small chromatic semitone
VS = \relative c'' { c1  cisMM dM }
VA = \relative c'' { g1  aM    aM } 
VT = \relative c'  { eM1 eM    f  }

%% large chromatic semitone
WS = \relative c'' { f1  fisM g  }
WA = \relative c'' { c1  d    d  } 
WT = \relative c'' { aM1 a    bM }

%% diatonic semitone
XS = \relative c'' { bM1 c  }
XA = \relative c'' { g1  g  }
XT = \relative c'  { d1  eM }

%% small whole step
YS = \relative c'' { g1  aM }
YA = \relative c'  { eM1 f  } 
YT = \relative c'  { c1  c  }

%% large whole step
ZS = \relative c'' { aM1 bM }
ZA = \relative c'  { f1  g  }
ZT = \relative c'  { c   d  }

%% MIDI 1
\book {
  \bookOutputSuffix "1"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \VS >>
      \new Staff \with {midiInstrument = #"oboe"} << \VA >>
      \new Staff \with {midiInstrument = #"oboe"} << \VT >>
    >>
    \midi { \tempo 4 = 200 }
  }
}

%% MIDI 2
\book {
  \bookOutputSuffix "2"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \WS >>
      \new Staff \with {midiInstrument = #"oboe"} << \WA >>
      \new Staff \with {midiInstrument = #"oboe"} << \WT >>
    >>
    \midi { \tempo 4 = 200 }
  }
}


%% MIDI 3
\book {
  \bookOutputSuffix "3"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \XS >>
      \new Staff \with {midiInstrument = #"oboe"} << \XA >>
      \new Staff \with {midiInstrument = #"oboe"} << \XT >>
    >>
    \midi { \tempo 4 = 200 }
  }
}

%% MIDI 4
\book {
  \bookOutputSuffix "4"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \YS >>
      \new Staff \with {midiInstrument = #"oboe"} << \YA >>
      \new Staff \with {midiInstrument = #"oboe"} << \YT >>
    >>
    \midi { \tempo 4 = 200 }
  }
}

%% MIDI 5
\book {
  \bookOutputSuffix "5"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \ZS >>
      \new Staff \with {midiInstrument = #"oboe"} << \ZA >>
      \new Staff \with {midiInstrument = #"oboe"} << \ZT >>
    >>
    \midi { \tempo 4 = 200 }
  }
}

%% Control the PDF output.
\score {
  \new Voice <<
    \omit Staff.TimeSignature
    { \time 3/1
      << { \VS } \\ { \voiceTwo \VA } \\ { \voiceTwo \VT } >> \bar "||"
      << { \WS } \\ { \voiceTwo \WA } \\ { \voiceTwo \WT } >> \bar "||"
      \time 2/1
      << { \XS } \\ { \voiceTwo \XA } \\ { \voiceTwo \XT } >> \bar "||"
      << { \YS } \\ { \voiceTwo \YA } \\ { \voiceTwo \YT } >> \bar "||"
      << { \ZS } \\ { \voiceTwo \ZA } \\ { \voiceTwo \ZT } >> \bar "|." }
  >>
  \layout{}
}
