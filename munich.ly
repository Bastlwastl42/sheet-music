\version "2.24.0"

% ╔══════════════════════════════════════════╗
%  HEADER
% ╚══════════════════════════════════════════╝
\header {
  title    = "My Song"
  subtitle = "for Solo Instrument"
  composer = "Composer Name"
  poet     = "Lyricist Name"
  tagline  = \markup { \italic "Engraved with LilyPond" }
}

% ╔══════════════════════════════════════════╗
%  MUSIC VARIABLES
% ╚══════════════════════════════════════════╝

melody = \relative c' {
  c'4  d  c | a2  f4 | e2  c'4 | bes2. | e,2 c'4 | bes2 e4 | f2 d4| c2. |
  c'4  d  c | a2  f4 | e2  c'4 | a,2. | g4. a8 g4 | f e d | c1 ~ c4 r4 r4
}

bass = \relative c {
  f4  a  c |
  f,4  a  c |
  c, g' e'  |
  c, g' e' |
}

verse_one = \lyricmode {
  Da wo die grü -- ne I -- sar fließt, wo man mit Grüß Gott dich grüßt.
  liegt mei -- ne schö -- ne Münch -- ner Stadt, die ih -- res glei -- chen nicht hat.
}

verse_two = \lyricmode {
  Was -- ser ist bil -- lig, rein und gut, nur ver -- dünnt es un -- ser Blut. 
  schö--ner sind Trop -- fen gold -- 'nen Weins. a --ber am schön --sten ist eins:
}

refrain = \lyricmode {
  In Mün -- chen steht ein Hof -- bräu -- haus, eins zwei g'suf -- fa
  Da läuft so man -- ches Fäß -- chen aus, eins, zwei, g'suf -- fa
  Da hat schon man -- cher bra -- ve Mann, eins, zwei, g'suf -- fa
  ge --zeigt was er so ver -- tra -- gen kann. Schon früh am Mor -- gen fing er an, 
  und spät am A -- bend kam er her --aus! So schön ists im Hof -- bräu -- haus. 
}

% ╔══════════════════════════════════════════╗
%  SCORE
% ╚══════════════════════════════════════════╝
\score {
  \new GrandStaff <<

    % ── Melody staff (top) ──────────────────
    \new Staff <<
      \clef treble
      \key f \major
      \numericTimeSignature
      \time 3/4
      \tempo "Moderato" 4 = 90

      \new Voice = "melody" { 
        \repeat volta 2 {
          \melody 
        }
      }
    >>

    % ── Lyrics between the two staves ───────
    \new Lyrics \lyricsto "melody" { \verse_one }
    \new Lyrics \lyricsto "melody" { \verse_two }


    % ── Bass staff (bottom) ─────────────────
    \new Staff {
      \clef bass
      \key f \major
      \numericTimeSignature
\time 3/4

      \bass
    }

  >>

  \layout { }
  \midi   { \tempo 4 = 90 }
}