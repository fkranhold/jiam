\version "2.24.1"

%% Adding the 5/4 E, the 3/2 G, and the 7/4 bB.
newPitches = #`(
  (eM   . ,(ly:make-pitch -1 2  -14/200))
  (gPy  . ,(ly:make-pitch -1 4    2/200))
  (besS . ,(ly:make-pitch -1 6 -131/200))
)
#(ly:parser-set-note-names (append pitchnames newPitches))

%% Content
S = \relative c'' { bes2 besS }
A = \relative c'' { g2   gPy  }
T = \relative c'  { e2   eM   }
B = \relative c'  { c2   c    }

%% MIDI
\score {
  <<
    \new Staff \with {midiInstrument = #"oboe"} \S
    \new Staff \with {midiInstrument = #"oboe"} \A
    \new Staff \with {midiInstrument = #"oboe"} \T
    \new Staff \with {midiInstrument = #"oboe"} \B
  >>
  \midi { \tempo 4 = 40 }
}
