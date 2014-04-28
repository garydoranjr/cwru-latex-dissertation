%
% Class for typesetting CWRU Dissertations
% Copyright 2013, Gary Doran (gary.doran@case.edu)
% Distributed under the terms of the GNU Lesser General Public License
% Uses guidelines from http://gradstudies.case.edu/current/etd/guidelines.html
%
% Modified by Russell Jackson 2014 to improve flexibility and overall flow.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cwru}[2013/08/01 v1.0 CWRU Dissertation Format]

\newif\if@notsinglespaced
\@notsinglespacedtrue
\DeclareOption{singlespaced}{\@notsinglespacedfalse}
\ProcessOptions

\LoadClass[12pt,letter,oneside]{book}

\RequirePackage{hyperref}
\hypersetup{pdfborder=0 0 0,pdfview=FitH}
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
%\def\advisor#1{\gdef\@advisor{#1}}
%\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}
\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}

\def\defensedate#1{\gdef\@defensedate{#1}}
\def\@defensedate{\@latex@warning@no@line{No \noexpand\defensedate given}}
%\def\committeechair#1{\gdef\@committeechair{#1}}
%\def\@committeechair{\@advisor}

%\newcounter{committeecounter}
%\setcounter{committeecounter}{1}
%\newcommand{\committee}[1]{
%\expandafter\gdef\csname @committeemember\thecommitteecounter\endcsname{#1}
%\stepcounter{committeecounter}}

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
      %Dissertation Advisor: \@advisor \\
      %\vskip 2em%
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
  %\global\let\advisor\relax
  \global\let\department\relax
  \global\let\date\relax
  \global\let\and\relax
  %\restoregeometry
}


%This command allows for differing lengths of the list of commitee members.
%Alsways define the advisor first
\newbox\@committeeMembers \newbox\@committeeMembers

\def\advisor#1{\setbox\@committeeMembers\vbox 
	\onehalfspacing
	{\large \centering{Approved by}  \par 
	\singlespacing
	\centering{#1} \renewcommand\baselinestretch{1.0}
	\par \centering{Committee Chair}}
  	\setbox\@committeeMembers\vbox{\unvbox\@committeeMembers
    \vskip\baselineskip \def\baselinestretch{1}\@normalsize }}



\def\committee#1{\setbox\@committeeMembers\vbox
  {\unvbox\@committeeMembers \vskip 10pt% plus 1fil minus 1fil
  \centering \def\baselinestretch{1}\large 
  {\centering{Approved by} \par \centering{#1}}}
  \setbox\@committeeMembers\vbox{\unvbox\@committeeMembers
  \vskip\baselineskip \def\baselinestretch{1}\@normalsize }}


\newcommand\makeapprovalsheet{\begin{titlepage}
\begin{spacing}{2.0}
\begin{center}
{\large\bfseries
CASE WESTERN RESERVE UNIVERSITY \\
SCHOOL OF GRADUATE STUDIES
}
\vskip 2em%
{\large %
We hereby approve the thesis/dissertation of
\par
{\Large \texttt{\@author}}}

\newlength\degreewidth%
\settowidth{\degreewidth}{candidate for the degree*.}%
\addtolength{\degreewidth}{-\textwidth}%
\setlength{\degreewidth}{-\degreewidth}%
\noindent candidate for the
\par
\Large\texttt{\@degree} 

%\newlength\datewidth%
%\settowidth{\datewidth}{(date)\quad}%
%\newlength\committeewidth%
%\setlength{\committeewidth}{\textwidth}%
%\addtolength{\committeewidth}{-\datewidth}%
%\begin{spacing}{1.25}%
%\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
%{\Large\texttt{\@committeechair}} \\ \hline 
\unvcopy\@committeeMembers

%\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
%{\Large\texttt{\csname @committeemember1\endcsname}} \\ \hline \end{tabular} \\

%\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
%{\Large\texttt{\csname @committeemember2\endcsname}} \\ \hline \end{tabular} \\

%\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
%{\Large\texttt{\csname @committeemember3\endcsname}} \\ \hline \end{tabular} \\

%\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
%{\Large\texttt{\csname @committeemember4\endcsname}} \\ \hline \end{tabular} \\

%\noindent\hskip\datewidth\begin{tabular}[t]{>{\centering\arraybackslash}p{\committeewidth}}
%{\Large\texttt{\csname @committeemember5\endcsname}} \\ \hline \end{tabular} \\
%\end{spacing}

%\vskip 2em%
%\noindent
{\large\texttt{\@defensedate}}

\noindent *We also certify that written approval has been obtained for
any proprietary material contained therein.

\end{center}
\end{spacing}
\end{titlepage}
}

\newenvironment{acknowledgements}%
{\cleardoublepage\chapter*{Acknowledgements}\addcontentsline{toc}{chapter}{Acknowledgements}\markboth{ACKNOWLEDGEMENTS}{}}%
{\null}

\newenvironment{abstract}%
{\cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{Abstract}\thispagestyle{plain}\null\vfill\begin{center}%
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
