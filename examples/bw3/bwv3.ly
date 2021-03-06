%=============================================
%   created by MuseScore Version: 1.3
%          quinta-feira, 9 de julho de 2015
%=============================================

\version "2.12.0"



#(set-default-paper-size "a5")

\paper {
  
  %%indent = 0 \mm 
  %%set to ##t if your score is less than one page: 
  ragged-last-bottom = ##t 
  ragged-bottom = ##f  
  %% in orchestral scores you probably want the two bold slashes 
  %% separating the systems: so uncomment the following line: 
  %% system-separator-markup = \slashSeparator 
  }

\header {
title = "Coral #3"
composer = "Bach / music21"
arranger = "Guilherme Lunhani"
dedication = "para Ivan Eiji"
subtitle = "após extração de notas do BWV3 em 10/07/15"
}

AvoiceAA = \relative c'{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef treble
    %staffkeysig
    \key c \major 
    %barkeysig: 
    \key c \major 
    %bartimesig: 
    \time 3/4 
    <gis a'>4\mf <fis' gis a b>8 r <fis gis a b> r      | % 1
    b2.~      | % 2
    b4\fermata  r <cis, d a'>8 r      | % 3
    a4 <dis e fis>8 r <e fis gis b> r      | % 4
    <e cis'>2 \f <b gis'>4~      | % 5
    <b gis'>2.\fermata  \clef bass
         | % 6
    <gis a b>2.\mf~      | % 7
    <gis a b>2\fermata r4 \clef treble
         | % 8
    <b' a'>2. \p      | % 9
    <cis, d e fis gis>8\< r <cis e gis a>\!\mf r r4      | % 10
    r2.      | % 11
    <cis' d e fis gis a>2.\longfermata\p      | % 12
    \bar "|."     | % 31
}% end of last bar in partorvoice

 

AvoiceBA = \relative c{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef bass
    %staffkeysig
    \key c \major 
    %barkeysig: 
    \key c \major 
    %bartimesig: 
    \time 3/4 
    \mark \markup {\italic{Moderato}}
    <b, fis'>2.\p      | % 1
    <cis cis'>2.~      | % 2
    <cis cis'>2.\fermata       | % 3
    <cis b'>2. \clef "bass_8"
         | % 4
    a4\f \clef bass
    <gis' a'>2      | % 5
    <fis a>2._\fermata       | % 6
    <cis' dis>2.\mf~      | % 7
    <cis dis>2\fermata r4      | % 8
    <b, e>2.\mf~      | % 9
    <b e>4 r <e' fis gis a>8\> r      | % 10
    <e, b'>2.\!\p~      | % 11
    <e b'>2.\longfermata      | % 12
    \bar "|." 
}% end of last bar in partorvoice


\score { 
    << 
        \context PianoStaff <<
        \set PianoStaff.instrumentName="Piano" 
            \context Staff = ApartA << 
                \context Voice = AvoiceAA \AvoiceAA
                \set Staff.instrumentName = #""
                \set Staff.shortInstrumentName = #""
            >>


            \context Staff = ApartB << 
                \context Voice = AvoiceBA \AvoiceBA
                \set Staff.instrumentName = #""
                \set Staff.shortInstrumentName = #""
            >>


        >> %end of PianoStaffA


      \set Score.skipBars = ##t
      %%\set Score.melismaBusyProperties = #'()
      \override Score.BarNumber #'break-visibility = #end-of-line-invisible %%every bar is numbered.!!!
      %% remove previous line to get barnumbers only at beginning of system.
       #(set-accidental-style 'modern-cautionary)
      \set Score.markFormatter = #format-mark-box-letters %%boxed rehearsal-marks
       \override Score.TimeSignature #'style = #'() %%makes timesigs always numerical
      %% remove previous line to get cut-time/alla breve or common time 
      \set Score.pedalSustainStyle = #'mixed 
       %% make spanners comprise the note it end on, so that there is no doubt that this note is included.
       \override Score.TrillSpanner #'(bound-details right padding) = #-2
      \override Score.TextSpanner #'(bound-details right padding) = #-1
      %% Lilypond's normal textspanners are too weak:  
      \override Score.TextSpanner #'dash-period = #1
      \override Score.TextSpanner #'dash-fraction = #0.5
      %% lilypond chordname font, like mscore jazzfont, is both far too big and extremely ugly (olagunde@start.no):
      \override Score.ChordName #'font-family = #'roman 
      \override Score.ChordName #'font-size =#0 
      %% In my experience the normal thing in printed scores is maj7 and not the triangle. (olagunde):
      \set Score.majorSevenSymbol = \markup {maj7}
  >>

  %% Boosey and Hawkes, and Peters, have barlines spanning all staff-groups in a score,
  %% Eulenburg and Philharmonia, like Lilypond, have no barlines between staffgroups.
  %% If you want the Eulenburg/Lilypond style, comment out the following line:
  \layout {\context {\Score \consists Span_bar_engraver}}
}%% end of score-block 

#(set-global-staff-size 20)
