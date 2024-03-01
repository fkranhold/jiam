\version "2.24.1"
\include "tuning.ily"
\include "layout.ily"

%% Content 1
XS = \relative c'' { d2  c    bM aM    g  g    g  fisM g1 }
XA = \relative c'' { bM2 fisM g  disMM eM e    d1      d1 }
XT = \relative c'  { g2  a    eM fisM  eM a    a1      bM }
XB = \relative c   { g'2 d    eM bM    c  cisM d1      g1 }

%% Content 2
YS = \relative c'' { d2^"nicht empfohlen"  \oS cS bM aMS   g  \oS gS g? fisM g1 }
YA = \relative c'' { bM2                   fisM   g  disMM eM e      d1      d1 }
YT = \relative c'  { g2                    a      eM fisM  eM a      a1      bM }
YB = \relative c   { g'2                   d      eM bM    c  cisM   d1      g1 }

%% MIDI 1
\book {
  \bookOutputSuffix "1"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \XS >>
      \new Staff \with {midiInstrument = #"oboe"} << \XS >>
      \new Staff \with {midiInstrument = #"oboe"} << \XA >>
      \new Staff \with {midiInstrument = #"oboe"} << \XT >>
      \new Staff \with {midiInstrument = #"oboe"} << \XB >>
    >>
    \midi { \tempo 4 = 120 }
  }
}

%% MIDI 2
\book {
  \bookOutputSuffix "2"
  \score {
    <<
      \new Staff \with {midiInstrument = #"oboe"} << \YS >>
      \new Staff \with {midiInstrument = #"oboe"} << \YS >>
      \new Staff \with {midiInstrument = #"oboe"} << \YA >>
      \new Staff \with {midiInstrument = #"oboe"} << \YT >>
      \new Staff \with {midiInstrument = #"oboe"} << \YB >>
    >>
    \midi { \tempo 4 = 120 }
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
      << \YT \\ \YB >> \bar "|." } >>
  >>
  \layout{}
}
