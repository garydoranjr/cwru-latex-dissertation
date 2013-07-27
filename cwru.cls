%
% Class for typesetting CWRU Dissertations
% by Gary Doran (gary.doran@case.edu)
% Uses guidelines from http://gradstudies.case.edu/current/etd/guidelines.html
%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cwru}[2013/08/01 v1.0 CWRU Dissertation Format]

\newif\if@notsinglespaced
\@notsinglespacedtrue
\DeclareOption{singlespaced}{\@notsinglespacedfalse}
\ProcessOptions

\LoadClass[12pt,a4paper,oneside]{book}

\RequirePackage[top=1in,bottom=1in,left=1.5in,right=1in]{geometry}
\RequirePackage{setspace}
\RequirePackage{array}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\if@notsinglespaced
  \doublespacing
\fi

\def\degree#1{\gdef\@degree{#1}}
\def\@degree{\@latex@warning@no@line{No \noexpand\degree given}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}
\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}

\def\defensedate#1{\gdef\@defensedate{#1}}
\def\@defensedate{\@latex@warning@no@line{No \noexpand\defensedate given}}
\def\committeechair#1{\gdef\@committeechair{#1}}
\def\@committeechair{\@advisor}

\newcounter{committeecounter}
\setcounter{committeecounter}{1}
\newcommand{\committee}[1]{
\expandafter\gdef\csname @committeemember\thecommitteecounter\endcsname{#1}
\stepcounter{committeecounter}}

\renewcommand\maketitle{\begin{titlepage}%
\begin{spacing}{2.0}
  %\newgeometry{left=1in,top=1in,bottom=1in,right=1in}
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip 3em%
      by \\
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par%
      \vskip 2em%
      Submitted in partial fulfillment of the requirements \\
      for the degree of \@degree \\
      \vskip 2em%
      Dissertation Advisor: \@advisor \\
      \vskip 2em%
      Department of \@department \\
      CASE WESTERN RESERVE UNIVERSITY \\
      \vskip 2em%
      \@date \par}
  \end{center}\par
  \@thanks
  \vfil\null
  \end{spacing}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  %\global\let\@author\@empty
  \global\let\@date\@empty
  %\global\let\@title\@empty
  %\global\let\title\relax
  %\global\let\author\relax
  %\global\let\degree\relax
  \global\let\advisor\relax
  \global\let\department\relax
  \global\let\date\relax
  \global\let\and\relax
  %\restoregeometry
}

\newcommand\makeapprovalsheet{\begin{titlepage}
\begin{spacing}{2.0}
\begin{center}
{\large\bfseries
CASE WESTERN RESERVE UNIVERSITY \\
SCHOOL OF GRADUATE STUDIES
}
\end{center}
\vskip 2em%
{\large %
\noindent We hereby approve the thesis/dissertation of
\vskip 1.0em%
\noindent\begin{tabular}{>{\centering\arraybackslash}p{\textwidth}}
{\Large \texttt{\@author}} \\
\hline
\end{tabular} \\

\newlength\degreewidth%
\settowidth{\degreewidth}{candidate for the degree*.}%
\addtolength{\degreewidth}{-\textwidth}%
\setlength{\degreewidth}{-\degreewidth}%
\noindent candidate for the
\raisebox{5pt}{\begin{tabular}[t]{>{\centering\arraybackslash}p{\degreewidth}} {\Large\texttt{\@degree}} \\ \hline \end{tabular}} degree*.
\vskip 2em%
\newlength\datewidth%
\settowidth{\datewidth}{(date)\quad}%
\newlength\committeewidth%
\setlength{\committeewidth}{\textwidth}%
\addtolength{\committeewidth}{-\datewidth}%
\begin{spacing}{1.25}%
\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
{\Large\texttt{\@committeechair}} \\ \hline \end{tabular} \\
\vskip 1em
\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
{\Large\texttt{\csname @committeemember1\endcsname}} \\ \hline \end{tabular} \\

\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
{\Large\texttt{\csname @committeemember2\endcsname}} \\ \hline \end{tabular} \\

\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
{\Large\texttt{\csname @committeemember3\endcsname}} \\ \hline \end{tabular} \\

\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
{\Large\texttt{\csname @committeemember4\endcsname}} \\ \hline \end{tabular} \\

\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
{\Large\texttt{\csname @committeemember5\endcsname}} \\ \hline \end{tabular} \\
\end{spacing}

\vskip 2em%
\noindent
(date)\quad\begin{tabular}[t]{>{\centering\arraybackslash}p{0.5\committeewidth}}
{\Large\texttt{\@defensedate}} \\ \hline \end{tabular}

\vskip 2em%
\noindent *We also certify that written approval has been obtained for
any proprietary material contained therein.
}
\end{spacing}
\end{titlepage}
}

\newenvironment{acknowledgements}%
{\cleardoublepage\chapter*{Acknowledgements}\markboth{ACKNOWLEDGEMENTS}{}}%
{\null}

\newenvironment{abstract}%
{\cleardoublepage\thispagestyle{plain}\null\vfill\begin{center}%
\begin{spacing}{2.0}
    {\large \@title \par}%
    \vskip 3em%
     \lineskip 3em%
      Abstract \\
      by \\
    {\large
     \lineskip 3em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
\end{spacing}
\end{center}}
{\vfill\null}

\endinput
