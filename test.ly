\version "2.18.2"

\include "articulate.ly"

% From http://lists.gnu.org/archive/html/lilypond-user/2012-02/msg00253.html
tweakWholeNoteTremolo =
  #(define-music-function (parser location y¹off-y²off) (pair?)
    "Change the whole note tremolo orientation (default is horizontal)"
    #{
      \once \override Beam.gap = #1.3
      \once \override Beam.extra-offset = #(cons 0 (car y¹off-y²off))
      \once \override Beam.stencil =
      #(lambda (grob)
          (let* ((pos (ly:grob-property grob 'positions)))
            (ly:grob-set-property! grob 'positions
              (cons (car pos)  (+ (cdr pos) (cdr y¹off-y²off))))
            (ly:beam::print grob)))
    #})

\header {
  title = "La Marseillaise"
  composer = "Claude-Joseph Rouget de l’Isle"
  tagline = ##f
}

tempoMark = {
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.break-align-symbols = #'(time-signature key-signature)
  \once \override Staff.TimeSignature.break-align-anchor-alignment = #LEFT
  \mark \markup \bold "Alla marcia"
}

global = {
  \tempoMark
  \key g \major
  \time 4/4
}

altoVoice = \relative c' {
  \global
  \dynamicUp

  r2 r8 r16 d16\f d8. d16
  g4 g a a
  d4.( b8) g r16 g b8. g16
  e4 c'2 a8. fis16
  g2 r4 g8. a16
  b4 b b c8. b16
  b4 a r4 a8. b16
  c4 c c d8. c16
  b2 r4 d8.\ff d16
  d4( b8.) g16 d'4 b8. g16
  d2 r8 r16 d16\p d8. fis16
  a2 c4 a8. fis16
  a4 g f!2
  e4 g8. g16 g4 fis8. g16
  a2. r8 \crescTextCresc a8\< \crescHairpin
  bes4.\! bes8\noBeam bes[ bes] c d
  a2. bes8 a
  g4. g8 g( bes) a g
  g4 fis8 r8 r4 r8 r16 d'\ff \bar "||"
  d2 ~ d8. d16 b8. g16
  a2. r8 r16 d16
  d2 ~ d8. d16 b8. g16
  a2 ~ a8 r8 d,4
  g2 r4 a4
  b2 r2
  c2 d4 e
  a,2 ~ a8 r8 e'4
  d2 ~ d8. [b16 c8. a16]
  g2.\fermata r4^"D.C." \bar "|."
}

verse = \lyricmode {
  Al -- lons en -- fants de la Pa -- tri -- e,
  Le jour de gloire est ar -- ri -- vé.
  Con -- tre nous, de la ty -- ran -- ni -- e,
  L'é -- ten -- dard sang -- lant est le -- vé,
  l'é -- ten -- dard __ sang -- lant est le -- vé
  En -- ten -- dez -- vous, dans les cam -- pag -- nes
  Mu -- gir ces fa -- rou -- ches sol -- dats.
  Ils vien -- nent jus -- que dans nos bras
  é -- gor -- ger vos fils, __ vos com -- pag -- nes.
  Aux ar -- mes ci -- toy -- ens!
  For -- mez __ vos ba -- tail -- lons, __
  Mar -- chons, mar -- chons!
  Qu'un sang im -- pur __
  A -- breu -- ve nos sil -- lons.
}

right = \relative c'' {
  \global

  <b, d g>4\f <b d g>8. <b d g>16 <b d g>4 d
  <b d g>4 <b d g> <d fis a> <d fis a>
  << { d'4.-5 b8-4 g r8 b8. g16 } \\ { <d g> 4 <d g> d8 d4 } >> \break
  <c e>4 <e a c>2 << { a8. fis16 } \\ { c4 } >>
  <b d g>4 << { g'8. g16 g4 } \\ { <b, d>4 <b d> } >> <d-1 g-3>8. <fis a>16
  <d g b>4 <d g b> <d g b> << { c'8. b16 } \\ { <d, g>4 } >> \break
  <d-1 g-2 b-4>4 <d-1 fis-2 a-3> r4 <e-1 a-3>8. <e gis b>16
  <e a c>4 <e a c> <d fis c'> << { d'8.-5 c16-4} \\ { <d, fis>4 } >>
  <d g b>2 r4 <d d'>8.\ff <d d'>16 \break
  <d d'>4 b'8. g16 <d d'>4 b'8. g16
  d2\> d4\! d\p
  <d fis a>2 <d fis c'>4 << { a'8. fis16 } \\ { d4 } >> \break
  <a d a'>4 <g b g'> << { c4-3 d } \\ { <f, f'>2 } >>
  <g c e>4 <c e g> <g-1 c-2 g'-5> << { fis'8. g16 } \\ { <g, c>4 } >>
  << { <fis' a>2. } \\ { d4 d8. d16 d4 } >> \crescTextCresc <d fis a>4\< \crescHairpin \break
  << { bes'4. bes8 bes bes c d } \\ { <d, g>4 <d g> <d g> d } >>
  << { <fis a>2. bes8 a } \\ { d,4 d8. d16 d4 <d fis> } >>
  << { g4. g8 g bes a g } \\ { <g, d'>4 <g d'> <d' g> d } >> \break
  << { g4 fis8 } \\ { <g, d'>4. } >> r8 r <d' d'>16\ff[<d d'> <d d'>8 <d d'>]
  <d g b d>2~<d g b d>8. <b' d>16 <g b>8. g16
  <d fis a>8[<d d'>16 <d d'> <d d'>8 <d d'>16 <d d'>] <d d'>8 <d d'> <d fis a d> r16 <d d'>16 \break
  <d-1 g-2 b-4 d-5>2~<d g b d>8. <b' d>16 <g b>8. g16
  <d fis a>4 \tuplet 3/2 { <d d'>8 <d d'> <d d'> } <d g d'>4 <fis a d>
  <g b d g>2 <g b d g>4 <a d fis a>
  <b d g b>2 <g b d>4 <g b d>4
  <c g c,>4 g8. g16 <g b d>4 <g a c e>
  <d fis a>2~<d fis a>8 r8 <fis a e'>4
  << { <d b' d>2~<d b' d>8.[<g b>16 c8. a16] } \\ { s2. <d, fis>4 } >>
  <b d g>4 <b d g>8. <b d g>16 <b d g>4\fermata r4
}

left = \relative c' {
  \global

  <g,, g'>4 <g g'> <g g'> <d' d'>
  <g, g'>4 <b b'> <d d'> <c c'>
  <b b'> <d' g b>8. <d g b>16 <d g b>8 r8 <b, b'>4
  <c c'>4 <a a'>2 <d d'>4
  <g g'>4 <d d'>8. <b b'>16 <g g'>4 <b b'>8. <a a'>16
  <b b'>4 <d' g b> <b, b'> <g' g'>
  <d d'>4 <d d'>8. <d d'>16 <d d'>4 <c c'>8. <b b'>16
  <a a'>4 <a a'> <d d'> <d d'>
  <g g'>4 <d' g b>8. <d g b>16 <d g b>4 d8. d16
  <d, d'>4 b'8. g16 <d d'>4 b'8. g16
  <d d'>8[d16 d' d, d' d, d'] d,8 r8 <d d'>4
  <c c'>2 <c c'>
  <b b'>4 <g g'> <a a'> <b b'>
  <c c'>4 <c c'> <ees ees'> <ees ees'>
  <d d'>4 <d d'> <d d'> <d d'>
  %\makeClusters { d1 d' }
  %d2\glissando d'
  %\makeClusters { d,1 d' }
  %d,2\glissando d'
  \repeat unfold 2 { \tweakWholeNoteTremolo #'(-4.4 . 3.3) \repeat tremolo 16 { d32 d' } }
  <bes bes,>4 <bes bes,> <g g,> <bes bes,>
  d4 d, <d d'>8 r8 <d d'>8 <d d'>
  <g g'>4 <d' g b>8. <d g b>16 <d g b>4 <d g b>
  <d, d'>4 <d' fis a> <d fis a> <d, d'>
  <g g'>4 <d' g b>8. <d g b>16 <d g b>4 <d g b>
  <d, d'>4 <c' c'> <b b'> <a a'>
  <g g'>4 <d d'>8. <d d'>16 <g g'>4 <fis fis'>
  <f f'>4 <f f'>8. <f f'>16 <f f'>4 <f f'>
  <e e'>2 <d d'>4 <c c'>
  <d d'>4 <d' g b>8. <d g b>16 <d, d'>8 r8 <c c'>4
  <b b'>4 d'8. g16 b4 <d,, d'>
  <g g'>4 <d d'>8. <b b'>16 <g g'>4\fermata r4
}

altoVoicePart = \new Staff \with {
  instrumentName = "Chant"
  midiInstrument = "choir aahs"
} { \altoVoice }
\addlyrics { \verse }

pianoPart = \new PianoStaff \with {
  instrumentName = "Piano"
  midiInstrument = "acoustic grand"
} <<
  \new Staff = "right" \right
  \new Staff = "left" { \clef bass \left }
>>

\book {
  \score {
    <<
      \altoVoicePart
      \pianoPart
    >>
    \layout {
      \context {
        \Voice
        \remove "New_fingering_engraver"
        \remove "Fingering_engraver"
      }
    }
  }

  \score {
    \unfoldRepeats \articulate \pianoPart
    \midi {
      \tempo 4 = 100
    }
  }
}

\book {
  \bookOutputSuffix "fingering"
  \score {
    <<
      \altoVoicePart
      \pianoPart
    >>
    \layout {}
  }
}
