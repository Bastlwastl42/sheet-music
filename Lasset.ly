\version "2.22.1"

\paper {
  #(set-paper-size "a4")
    top-margin = 15
      bottom-margin = 15
        left-margin = 15
          right-margin = 15
            indent = 0
              ragged-last-bottom = ##f
              }

              \header {
                title = "Lasset uns das Leben genießen"
                  subtitle = "Traditionelles Studentenlied"
                    tagline = ##f
                    }

                    global = {
                      \key c \major
                        \time 4/4
                          \tempo "Zügig" 4 = 120
                          }

                          melody = \relative c' {
                            \global
                              % Strophe 1
                                c4 c d e | e4. d8 c4 r4 |
                                  g'4 g a g | f4. e8 d4 r4 |
                                    c4 c d e | e4. d8 c4 a'4 |
                                      g2. r4 |
                                        
                                          % Refrain
                                            c,4 c d e | e4. d8 c4 a'4 |
                                              g2. r4 |
                                                \bar "|."
                                                }

                                                text = \lyricmode {
                                                  Las -- set uns das Le -- ben ge -- nie -- ßen,
                                                    las -- set uns recht fröh -- lich sein.
                                                      Schö -- ne Stun -- den, die ver -- flie -- ßen,
                                                        trink -- et aus, schen -- ket ein!
                                                          
                                                            Bald sind die Ta -- ge der Ju -- gend vor -- ü -- ber,
                                                              drum lasst uns froh und glück -- lich sein!
                                                                Denn die Zei -- ten sie keh -- ren nie wie -- der,
                                                                  trink -- et aus, schen -- ket ein!
                                                                  }

                                                                  chords = \chordmode {
                                                                    % Strophe
                                                                      c1 | g | c | g |
                                                                        c | g | c | c |
                                                                          % Refrain
                                                                            c1 | g | c | c |
                                                                            }

                                                                            \score {
                                                                              <<
                                                                                  \new ChordNames {
                                                                                        \set chordChanges = ##t
                                                                                              \chords
                                                                                                  }
                                                                                                      \new Staff {
                                                                                                            \new Voice = "melody" { \melody }
                                                                                                                }
                                                                                                                    \new Lyrics \lyricsto "melody" { \text }
                                                                                                                      >>
                                                                                                                        \layout { }
                                                                                                                        }
                                                                                                                    