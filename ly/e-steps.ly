\version "2.24.1"
\include "tuning.ily"
\include "layout-e.ily"


%% Mark the adjustment
 adj =
 #(define-music-function (note) (ly:music?)
   #{ \override Glissando.style = #'zigzag
   \once \override Stem.X-extent = #'(1 . 3.5)
      $note \glissando #})

%% Content 1
XS = \relative c'' { g1 gis a b c cis d dis \adj e e fis g }
XA = \relative c'  { d1 e e g g a a b b cis! d d }
XT = \relative c'  { b1 b c d \adj e e fis fis g a a b }

%% MIDI 1
\score {
  <<
    \new Staff \with {midiInstrument = #"oboe"} << \XS >>
    \new Staff \with {midiInstrument = #"oboe"} << \XA >>
    \new Staff \with {midiInstrument = #"oboe"} << \XT >>
  >>
  \midi { \tempo 4 = 60 }
}

%% Control the PDF output.
%% PDF (the just one, with HE accidentals)
\score {
  \new ChoirStaff
  <<
    \new Staff << {
      \time 12/1
      \omit Staff.TimeSignature
      << { \XS } \\ { \voiceTwo \XA } \\ { \voiceTwo \XT } >> \bar "|." } >>
  >>
   \layout {
    \context {
      \Score
      \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4)
    }
  }
}
