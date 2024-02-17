\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1
XS = \relative c'' { c4^"nicht empfohlen"   aM    g    c    c     bM   c2 }
XA = \relative c'  { c4                     c8 d  eM f g aM g4    g8 f eM2 }
XT = \relative c'  { aM8                    bM c4 c    c    g8 aM g4   g2 }
XB = \relative c,  { f8 g                   aM bM c d  eM f g4    g,   c2 }

%% Content 1
YS = \relative c'' { c4^"empfohlen"   a     g   c    c    bM   c2 }
YA = \relative c'  { c4               c8 d  e f g a  g4   g8 f eM2 }
YT = \relative c'  { a8 b             c4    c   c    g8 a g4   g2 }
YB = \relative c,  { f8 g             a b c d e f    g4   g,   c2 }


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
    \midi { \tempo 4 = 100 }
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
    \midi { \tempo 4 = 100 }
  }
}

%% Control the PDF output.
%% PDF (the just one, with HE accidentals)
\score {
  \new ChoirStaff
  <<
    \new Staff << {
      << \XS \\ \XA >> \bar "||"
      << \YS \\ \YA >> \bar "|." } >>
    \new Staff << \clef "bass" {
      << \XT \\ \XB >> \bar "||"
      << \YT \\ \YB >> \bar "|."} >>
  >>
  \layout{}
}
