\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Mark the adjustment
 adj =
 #(define-music-function (note) (ly:music?)
   #{ \override Glissando.style = #'zigzag
   \once \override Stem.X-extent = #'(1 . 3.5)
  $note \glissando #})

%% Content 1
XS = \relative c'' { c1  c  dM dM  eMM }
XA = \relative c'' { g1  aM aM bMM cM  } 
XT = \relative c'  { eM1 f  f  gM  gM  }

%% Content 2
YS = \relative c'' { c1  c  \adj dM d  eM }
YA = \relative c'' { g1  aM      aM bM c  } 
YT = \relative c'  { eM1 f       f  g  g  }

%% Content 3
ZS = \relative c'' { e1 f       f  fisM g  }
ZA = \relative c'' { g1 aM \adj aM a    bM } 
ZT = \relative c'  { c1 c  \adj dM d    d  }

%% MIDI 1
\book {
  \bookOutputSuffix "1"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \XS >>
      \new Staff \with {midiInstrument = #"oboe"} << \XA >>
      \new Staff \with {midiInstrument = #"oboe"} << \XT >>
    >>
    \midi { \tempo 4 = 200 }
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
    >>
    \midi { \tempo 4 = 200 }
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
    >>
    \midi { \tempo 4 = 200 }
  }
}

%% Control the PDF output.
\score {
  \new Voice <<
    \time 5/1
    \omit Staff.TimeSignature
    { << { \XS } \\ { \voiceTwo \XA } \\ { \voiceTwo \XT } >> \bar "||"
      << { \YS } \\ { \voiceTwo \YA } \\ { \voiceTwo \YT } >> \bar "||"
      << { \ZS } \\ { \voiceTwo \ZA } \\ { \voiceTwo \ZT } >> \bar "|." }
  >>
  \layout{}
}
