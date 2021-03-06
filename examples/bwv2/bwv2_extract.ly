%=============================================
%   created by MuseScore Version: 1.3
%          quinta-feira, 9 de julho de 2015
%=============================================

\version "2.12.0"



#(set-default-paper-size "a5")

\paper {
  line-width    = 120\mm
  right-margin  = 15\mm
  left-margin   = 15\mm
  top-margin    = 15\mm
  bottom-margin = 5\mm
  %%indent = 0 \mm 
  %%set to ##t if your score is less than one page: 
  ragged-last-bottom = ##t 
  ragged-bottom = ##f  
  %% in orchestral scores you probably want the two bold slashes 
  %% separating the systems: so uncomment the following line: 
  %% system-separator-markup = \slashSeparator 
  }


\header {
    title = "Music21 Fragment"
    composer = "Music21"
    }

AvoiceAA = \relative c{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef bass
    %staffkeysig
    \key c \major 
    %bartimesig: 
    \time 4/4 
    <d' e a>4 <f g> <g a bes> <g,,, g' g'>      | % 1
    <c, bes'' d> <cis''' d g> d <d,,, d' e'>      | % 2
    <c''' d e> <c d bes'> <d ees> <d ees f>      | % 3
    <a,, cis a''> <f'' g a> <c g' a bes> <g, g' a'>     | % 4
    <e'' f g>4 <a,, g' g' a'> <fis d' c'> \bar "|." 
}% end of last bar in partorvoice


\score { 
    << 
        \context Staff = ApartA << 
            \context Voice = AvoiceAA \AvoiceAA
        >>
  >>
}%% end of score-block 

#(set-global-staff-size 20)
