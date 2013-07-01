
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{captiondiv}[2013/01/06]

%                       Figures
%                       -------


\@setflag \@caprule = \@true

\long\def \@makecaption #1#2{%
  \addvspace{4pt}
  \if \@caprule
    \hrule width \hsize height .33pt
    \vspace{4pt}
  \fi
  \setbox \@tempboxa = \hbox{\@setfigurenumber{#1.}\nut #2}%
  \if \@dimgtrp{\wd\@tempboxa}{\hsize}%
    \noindent \@setfigurenumber{#1.}\nut #2\par
  \else
    \centerline{\box\@tempboxa}%
  \fi}

\newcommand{\nocaptionrule}{%
  \@setflag \@caprule = \@false}

\def \@setfigurenumber #1{%
  {\rmfamily \bfseries \selectfont #1}}