\version "2.24.0"

% ╔══════════════════════════════════════════╗
%  MUSIC VARIABLES
% ╚══════════════════════════════════════════╝

melody = \relative c' {
  c'4  d  c | a2  f4 | e2  c'4 | bes2. | e,2 c'4 | bes2 e4 | f2 d4| c2. |
  c4  d  c | a2  f4 | e2  c'4 | a2. | g4. a8 g4 | f e d | 
}

bass = \relative c {
  f4  a  c | f, a c | c, g' e'| c, g' e'| c, g' e'| c, g' e'| f,  a  c | f, a c |
  f,  a  c | f, a c | c, g' e'| c, g' e'| c, g' e'| g, b d| 
}

refrain_melodie = \relative c' {
  f4 r4 f4 | f r4 a | c r4 c | a2 . | c2. | c2. | bes4 g2 ~g4 r4 c,4 | 
  e4 r4 e4 | a4 r4 a4 | bes 4 r4 bes4 | g2. | c2. | c2. | a4 f2 ~f4 r4 c4 |
  f4 r4 f4 | a4 r4 a4 | c4 r4 c4 | a2. | c2. | c2. | bes4 g2 ~g4 r4 g4 |
  bes2 d4 | f4 e4 d4 | c2 a4| f2 d'4 | c2 bes4 | e,2 d'4 | c2 a4 | f2 f4 | 
  bes2 d4 | f e d | c2 a4 | f4 r4 f'4 | e4. d8 c4 | bes4 ( a4 ) g4 | g4 r4 r4 | r2.
}

refrain_bass = \relative c {
  f4 a c  | f, a c   | f, a c   | f, a c   | f, a c   | f, a c   | c, g' e' | c, g' e' |
  c, g' e'| c, g' e' | c, g' e' | c, g' e' | c, g' e' | c, g' e' | f, a c   | f, a c   |
  f,4 a c  | f, a c  | f, a c   | f, a c   | f, a c   | f, a c   | g, a' bes | g, a' bes |
  bes d f | bes, d f |  f, a c   | f, a c   | c, g' e' | c, g' e' |f, a c   | f, a c   |
  bes d f  | bes, d f | f, a c   | f, a c   | c, g' e' | c, g' e' |f, a c   | f, a c   |
}

verse_one = \lyricmode {
  \set stanza = "1."
  Da wo die grü -- ne I -- sar fließt, wo man mit Grüß Gott dich grüßt.
  liegt mei -- ne schö -- ne Münch -- ner Stadt, die ih -- res glei -- chen nicht hat.
}

verse_two = \lyricmode {
  Was -- ser ist bil -- lig, rein und gut, nur ver -- dünnt es un -- ser Blut. 
  schö -- ner sind Trop -- fen gold -- 'nen Weins. a --ber am schön --sten ist eins:  - 
  \set stanza = "Ref."
  In
  Mün -- chen steht ein Hof -- bräu -- haus, eins zwei g'suf -- fa
  Da läuft so man -- ches Fäß -- chen aus, eins, zwei, g'suf -- fa
  Da hat schon man -- cher bra -- ve Mann, eins, zwei, g'suf -- fa
  ge --zeigt was er so ver -- tra -- gen kann. Schon früh am Mor -- gen fing er an, 
  und spät am A -- bend kam er her -- aus! So schön ists im Hof -- bräu -- haus. 
}

strophe_zwei = \markup {
\column {
    \bold "2."
    \vspace #0.5
  "Da trinkt man Bier nicht aus dem Glas, da gibt's nur die große Maß!"
  "Und wenn der erste Maßkrug lerr, bringt dir das Resel bald mehr."
  "Oft kriegt zu Haus die Frau 'nen Schreck, bleibt der Mann mal länger weg,"
  "aber die braven Nachbarsleit, die wiossen besser Bescheid!"
  }
}

strophe_drei = \markup {
\column{
    \bold "3."
    \vspace #0.5
  "Wenn auch so manche deutsche Stadt Sehenswürdigkeiten hat,"
  "eins gibt es nirgendwo wie hier, das ist das Münchner Bier."
  "Der diese kleine Lied erdacht, hat so manche lange Nacht"
  "über dem Münchner Bier studiert und hat es gründlich probiert."
  }
}

% ╔══════════════════════════════════════════╗
%  PAGE 1 — A3 Landscape (Instrumentalist)
% ╚══════════════════════════════════════════╝

\bookpart {

\paper {
    %#(set-paper-size "a3" 'landscape)
    #(layout-set-staff-size 18.5)    % default is 20, increase to scale up
  }
% ╔══════════════════════════════════════════╗
%  HEADER
% ╚══════════════════════════════════════════╝
\header {
  title    = "In München steht ein Hofbräuhaus"
  instrument = "Solo Zither"
  composer = "Musik: Wiga Gabriel"
  poet     = "Text: Klaus S. Richter u. F. Reiter"
  tagline  = \markup { \italic "Engraved with LilyPond. Persönliche Übungskopie. Bitte nicht verklagen." }
  copyright = "Copyright by Wilhelm Gebauer, Leipzig  Eigentum und Verlag Wilhelm Gebauer, Musikverlag, Wiesbaden"
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
      \tempo "Presto" 4 = 180

      \new Voice = "melody" { 
        \repeat volta 2 {
          \melody 
        }
        \alternative {
          { c'2. ~c'4 r2 }    % 1st ending
          { c'2. ~c'4 r4 c'4 }   % 2nd ending
        }
        \refrain_melodie
      }

      
    >>

    % ── Lyrics between the two staves ───────
    \new Lyrics \lyricsto "melody" { \verse_one }
    \new Lyrics \lyricsto "melody" { \verse_two }
    %\new Lyrics \lyricsto "melody" { \refrain }


    % ── Bass staff (bottom) ─────────────────
    \new Staff {
      \clef bass
      \key f \major
      \numericTimeSignature
      \time 3/4

      \new Voice = "bass" { 
        \repeat volta 2 {
          \bass 
        }
        \alternative {
          { c g e' | c g e' }    % 1st ending
          { c g e' | c g e' }    % 2nd ending
        }
      }
      \refrain_bass
    }

  >>

  \layout { }
  \midi   { \tempo 4 = 180 }

}
}

% ╔══════════════════════════════════════════╗
%  PAGE 2 — A4 Portrait (Singer's Sheet)
% ╚══════════════════════════════════════════╝

\bookpart {
  \paper {
    #(set-paper-size "a4")
    #(layout-set-staff-size 20)    % default is 20, increase to scale up
  }

  \header {
  title    = "In München steht ein Hofbräuhaus"
  instrument = "Gesang"
  composer = "Musik: Wiga Gabriel"
  poet     = "Text: Klaus S. Richter u. F. Reiter"
  tagline  = \markup { \italic "Engraved with LilyPond. Persönliche Übungskopie. Bitte nicht verklagen." }
  copyright = "Copyright by Wilhelm Gebauer, Leipzig  Eigentum und Verlag Wilhelm Gebauer, Musikverlag, Wiesbaden"
  }

  % ── Melody only, no bass ──────────────────
  \score {
  <<

    % ── Melody staff (top) ──────────────────
    \new Staff {
      \clef treble
      \key f \major
      \numericTimeSignature
      \time 3/4
      \tempo "Presto" 4 = 180

      \new Voice = "melody" { 
        \repeat volta 2 {
          \melody 
        }
        \alternative {
          { c'2. ~c'4 r2 }    % 1st ending
          { c'2. ~c'4 r4 c'4 }   % 2nd ending
        }
        \refrain_melodie
      }
  }
    % ── Lyrics between the two staves ───────
    \new Lyrics \lyricsto "melody" { \verse_one }
    \new Lyrics \lyricsto "melody" { \verse_two }

    >> 
    \layout {
      #(layout-set-staff-size 20)   % standard for A4
    }
  }

  % ── Verse 3 & Refrain as plain text ───────
  \markup { \vspace #2 }

  \markup {\strophe_zwei}
  \markup { \vspace #1 }
  \markup {\strophe_drei}
        

}
  
