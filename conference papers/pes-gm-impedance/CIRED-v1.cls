\newcommand\classname{CIRED}
\newcommand\lastmodifieddate{11/19/2020}
\newcommand\versionnumber{0.1}

% Are we printing crop marks?
\newif\if@cropmarkson \@cropmarksontrue

\NeedsTeXFormat{LaTeX2e}[11/14/2020]
\ProvidesClass{\classname}[\lastmodifieddate\space IET
                           Version \versionnumber^^J%
                           IET LaTeX Document Class^^J^^J]

\newif\ifqry\qryfalse
\newif\ifnoquery
\newif\ifrevises
\newif\iferratum\erratumfalse
\newif\ifaddendum\addendumfalse
\newif\ifweb
\newif\ifmathrsfs
\newif\ifprinter
\newif\iffproof
\newif\ifedtitle

\setlength{\paperheight}{297truemm}
\setlength{\paperwidth}{210truemm}

\DeclareOption{edtitle}{\edtitletrue}
\DeclareOption{draft}{\PassOptionsToPackage{draft}{graphicx}}
\DeclareOption{a4paper}{\PassOptionsToPackage{a4}{crop}}
\DeclareOption{centre}{\PassOptionsToPackage{center}{crop}}
\DeclareOption{crop}{\PassOptionsToPackage{cam}{crop}\global\@cropmarksontrue}
\DeclareOption{nocrop}{\PassOptionsToPackage{off}{crop}\global\@cropmarksonfalse}
\DeclareOption{info}{\PassOptionsToPackage{info}{crop}}
\DeclareOption{noinfo}{\PassOptionsToPackage{noinfo}{crop}}
\DeclareOption{courier}{\def\verbatim@font{\normalfont\ttfamily}}
\DeclareOption{times}{\def\verbatim@font{\normalfont\rmfamily}}

\DeclareOption{noquery}{\noquerytrue}
\DeclareOption{addendum}{\addendumtrue}
\DeclareOption{erratum}{\erratumtrue}
\DeclareOption{revises}{\revisestrue}
\DeclareOption{web}{\webtrue}
\DeclareOption{mathrsfs}{\mathrsfstrue}
\DeclareOption{printer}{\printertrue}
\DeclareOption{fproof}{\fprooftrue}

\ExecuteOptions{a4paper,nocrop,centre,info,proofbox}

\ProcessOptions

% Load all necessary packages
\RequirePackage[T1]{fontenc}
%\RequirePackage[T1,mtbold,mtplusscr]{mathtime}
\RequirePackage{crop,graphicx,array,amsthm,stfloats,upref,amsfonts,amssymb,cuted}
\RequirePackage{vruler}
\RequirePackage{amsmath}
\usepackage{endnotes,rotating}
\usepackage{times}

\usepackage{vruler}
\def\linenos{\setvruler[55pt][1][5][1][1][590pt][590pt][-14pt][\textheight]
\setvruler[55pt][1][5][1][1][10pt][10pt][-14pt][\textheight]}

\usepackage{color}

\newcommand\@ptsize{0}

% Set twoside printing
\@twosidetrue

% Marginal notes are on the outside edge
\@mparswitchtrue

% Default font sizes
\renewcommand\normalsize{%
  \@setfontsize\normalsize{10\p@}{12\p@}%
  \abovedisplayskip 12\p@ \@plus 3\p@ \@minus4\p@
  \abovedisplayshortskip 3\p@ \@plus 1\p@ \@minus1\p@
  \belowdisplayshortskip 6\p@ \@plus 1\p@ \@minus2\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}

\normalsize
\let\@bls\baselineskip

\newcommand\small{%
  \@setfontsize\small{9\p@}{11\p@}%
  \abovedisplayskip 12\p@ \@plus1\p@ \@minus1\p@
  \abovedisplayshortskip 3\p@ \@plus 1\p@ \@minus1\p@
  \belowdisplayshortskip 2\p@ \@plus 1\p@ \@minus1\p@
  \def\@listi{\leftmargin\leftmargini
              \listparindent \parindent
              \topsep 6\p@ \@plus2\p@ \@minus1\p@
              \parsep \z@ \itemsep \z@}%
  \belowdisplayskip \abovedisplayskip}

\newcommand\footnotesize{%
  \@setfontsize\footnotesize{8.25\p@}{12.5\p@}%
  \abovedisplayskip 12\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus \p@
  \belowdisplayshortskip 1\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \listparindent 1em
              \topsep 5\p@ \@plus 2\p@ \@minus 1\p@
              \parsep \z@ \itemsep \z@}%
  \belowdisplayskip \abovedisplayskip}

\def\scriptsize{\@setfontsize\scriptsize{7\p@}{9\p@}}
\def\tiny{\@setfontsize\tiny{6\p@}{7\p@}}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}

% Line spacing
\setlength\lineskip{0\p@}
\setlength\normallineskip{0\p@}
\renewcommand\baselinestretch{}

% Paragraph dimensions and inter-para spacing
\setlength\parskip{0\p@}
\setlength\parindent{10pt}

% Set inter-para skips
\setlength\smallskipamount{6\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{9\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}

% Page break penalties
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

% Disallow widows and orphans
\clubpenalty 10000
\widowpenalty 10000

% Disable page breaks before equations, allow pagebreaks after
% equations and discourage widow lines before equations.
\displaywidowpenalty 100
\predisplaypenalty   10000
\postdisplaypenalty  2500

% Allow breaking the page in the middle of a paragraph
\interlinepenalty 0

% Disallow breaking the page after a hyphenated line
\brokenpenalty 10000

% Hyphenation; don't split words into less than three characters
\lefthyphenmin=3
\righthyphenmin=3


% Page layout dimensions
\setlength\headheight{3mm}%height of running head
\setlength\topmargin{23mm}% top margin 24.5mm
\addtolength\topmargin{-1in}% subtract out the 1 inch driver margin
\addtolength\topmargin{-\headheight}%  and the running head

\setlength\topskip{6.5\p@}% height of first line of text%% {10\p@}
\setlength\headsep{1.35pc}% space below running head
\addtolength\headsep{9pt}%   base to base with first line of text
\addtolength\headsep{-\topskip}%   base to base with first line of text

\setlength\footskip{24.5\p@}%
\setlength\maxdepth{.5\topskip}% pages can be short or deep by half a line?

\setlength\textwidth{180mm}% text measure excluding margins
\setlength\columnwidth{88mm}

\setlength\textheight{677pt}% text height is 72 baselines,
\addtolength\textheight{\topskip}%56+1-including first line of text

% Set the margins
\setlength\marginparsep{10\p@}
\setlength\marginparpush{15\p@}
\setlength\marginparwidth{1.5pc}

\newlength{\insidemargin}
\setlength{\insidemargin}{15mm}
\setlength\oddsidemargin{\insidemargin}
\addtolength\oddsidemargin{-1in}%subtract out the 1 inch driver margin
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-\textwidth}
\addtolength\@tempdima{-\insidemargin}
\setlength\evensidemargin{\@tempdima}
\addtolength\evensidemargin{-1in}

\setlength\columnsep{4mm}          % space between columns for double-column text
\setlength\columnseprule{0\p@}      % width of rule between two columns

% Footnotes
\setlength\footnotesep{0\p@}     % space between footnotes
% space between text and footnote
\setlength{\skip\footins}{23\p@ \@plus 3\p@ \@minus 3\p@}

% Float placement parameters

\setcounter{totalnumber}{10}
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}

% The maximum part of the top or bottom of a text page that can be
% occupied by floats. This is set so that at least four lines of text
% fit on the page.
\renewcommand\topfraction{.921}
\renewcommand\bottomfraction{.921}
\renewcommand\textfraction{.079}
\renewcommand\floatpagefraction{.887}

% The same parameters repeated for double column output
\renewcommand\dbltopfraction{.965}
\renewcommand\dblfloatpagefraction{.077}

% Space between floats
\setlength\floatsep{18\p@ \@plus 2\p@ \@minus 2\p@}
% Space between floats and text
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
% Space above and below an inline figure
\setlength\intextsep{18\p@ \@plus 2\p@ \@minus 2\p@}

% For double column floats
\setlength\dblfloatsep{18\p@ \@plus 3\p@ \@minus 1\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 3\p@ \@minus 1\p@}

% Space left at top, bottom and inbetween floats on a float page.
\setlength\@fptop{0\p@}% no space above float page figures
\setlength\@fpsep{12\p@ \@plus 2fil}
\setlength\@fpbot{0\p@}

% The same for double column
\setlength\@dblfptop{0\p@}
\setlength\@dblfpsep{12\p@}
\setlength\@dblfpbot{0\p@}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Article Identification %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@default@journal@title{Journal Title}
\let\@journal@title\@default@journal@title
\def\articlenum@info{000000}
\def\year@info{\the\year}
\def\cyear@info{2021}
\def\vol@info{222}
\def\issue@info{222}
\def\part@info{00}
\def\firstpage@info{00}

\gdef\doi@string{0000000000}

\newcommand{\artname}[1]{#1}%

\def\@journal@title{IET Research Journals}

\def\@doi@fixed@field{10.1049/iet-cta.}
\def\@doi@variable@field{00000000000000000000}

\def\vol@info{224}

\def\printerinfo{{\fontsize{7.5}{10}\selectfont\itshape Printed and bound by Latimer Trend \& Company Ltd, Plymouth\par}\parskip5pt}

%
  \newcommand\circledonesize{\fontsize{6}{7}\selectfont}%   6.5/7
  \newcommand\circledone{%
  \raisebox{.8pt}{\hbox{\kern 2pt\raisebox{-.5pt}{%
    \circledonesize 1}\kern -2pt\raisebox{1.8pt}{\circle{7}}\kern -3pt}}}
%
  \newcommand\circledtwosize{\fontsize{6}{7}\selectfont}%   6.5/7
  \newcommand\circledtwo{%
  \raisebox{.8pt}{\hbox{\kern 2pt\raisebox{-.5pt}{%
    \circledtwosize 2}\kern -2pt\raisebox{1.8pt}{\circle{7}}\kern -3pt}}}
%
\newcommand{\page@extent@info}{\iferratum\relax\firstpage@info\else\ifweb\relax\firstpage@info--\pageref*{LastPage}\else\firstpage@info--\pageref{LastPage}\fi\fi}

\newcommand{\jourinf}{\bgroup\parindent=0pt%
\vbox{\fontsize{7}{9}\selectfont\sf\raggedright%
\issn@info\par%
\if@date@provided\@date\par\fi%
doi:{\ }\doi@string\par%
www.ietdl.org}\par\egroup}%

% Article information user commands
\def\CYear#1{\gdef\cyear@info{#1}}
\def\Year#1{\gdef\year@info{#1}}
\def\artname#1{\gdef\articlenum@info{#1}}
\def\Vol#1{\gdef\vol@info{#1}}
\def\Issue#1{\gdef\issue@info{#1}}
\def\Part#1{\gdef\part@info{#1}}
\def\@print@issn{1751-8644}

\newcommand\DOI[2][\@doi@fixed@field]{%
  \gdef\@doi@variable@field{#1}%
  \setDOI{#1}{#2}}

\newcommand{\setDOI}[2]{%
  \gdef\doi@string{#1#2}}

\newcommand{\issn@info}{ISSN\ \@print@issn}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Firstpage %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\firstpage#1{\gdef\firstpage@info{#1}}
\firstpage{1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%% Page Styles %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\today{\number\day/\ifcase\month\or
 1\or 2\or 3\or 4\or 5\or 6\or 7\or 8\or 9\or 10\or 11\or 12\fi/\number\year}

\newcommand{\evenpagefooter}{
\vbox{\hbox to \textwidth{\hfill\fontsize{11}{11}\selectfont\sf\thepage\hfill}}
}

\newcommand{\oddpagefooter}{
\vbox{\hbox to \textwidth{\hfill\fontsize{11}{11}\selectfont\sf\thepage\hfill}}
}%

\newcommand{\oddpagefootline}{%
     \hbox to \textwidth{\fontsize{8}{10}\selectfont\oddpagefooter\hfill}
     }%

\newcommand{\evenpagefootline}{%
     \hbox to \textwidth{\fontsize{8}{10}\selectfont\evenpagefooter}
     }%

%\setcounter{footnote}{0}
\renewcommand\thefootnote{\@fnsymbol\c@footnote}

% No headers for float pages - requires the floatpag package
%% \floatpagestyle{headings}

\def\ps@titlepage{%
  \def\@evenhead{\vbox{\begin{picture}(0,0)(0,-9.5)\includegraphics{CIRED_logo}\end{picture}}
\vbox{\vspace*{-27.75pt} \hbox to 260pt{\hskip-125pt{\sf 27$^{\text{th}}$ International Conference on Electricity Distribution}\hfill {\sf Rome, 12--\,15 June 2023}}\vspace*{14pt}\par%
\hbox to 260pt{\hfill\sf Paper n$^{\circ}$ 10622}\vspace*{7pt}\par%
\hskip-252.5pt\rule{\textwidth}{.5pt}}}%
  \def\@oddhead{\vbox{\begin{picture}(0,0)(0,-9.5)\includegraphics{CIRED_logo}\end{picture}}
\vbox{\vspace*{-27.75pt} \hbox to 260pt{\hskip-125pt{\sf 27$^{\text{th}}$ International Conference on Electricity Distribution}\hfill {\sf Rome, 12--\,15 June 2023}}\vspace*{14pt}\par%
\hbox to 260pt{\hfill\sf Paper n$^{\circ}$ 10622}\vspace*{7pt}\par%
\hskip-252.5pt\rule{\textwidth}{.5pt}}}%
  \def\@evenfoot{\evenpagefootline}
  \def\@oddfoot{\oddpagefootline}%
  \def\authormark##1{\def\leftmark{##1}}%
  \def\titlemark##1{\markboth{##1}{##1}}}%

\def\ps@headings{%
\def\@evenhead{\vbox{\begin{picture}(0,0)(0,-9.5)\includegraphics{CIRED_logo}\end{picture}}
\vbox{\vspace*{-27.75pt} \hbox to 260pt{\hskip-125pt{\sf 27$^{\text{th}}$ International Conference on Electricity Distribution}\hfill {\sf Rome, 12--\,15 June 2023}}\vspace*{14pt}\par%
\hbox to 260pt{\hfill\sf Paper n$^{\circ}$ 10622}\vspace*{7pt}\par%
\hskip-252.5pt\rule{\textwidth}{.5pt}}}%
  \def\@oddhead{\vbox{\begin{picture}(0,0)(0,-9.5)\includegraphics{CIRED_logo}\end{picture}}
\vbox{\vspace*{-27.75pt} \hbox to 260pt{\hskip-125pt{\sf 27$^{\text{th}}$ International Conference on Electricity Distribution}\hfill {\sf Rome, 12--\,15 June 2023}}\vspace*{14pt}\par%
\hbox to 260pt{\hfill\sf Paper n$^{\circ}$ 10622}\vspace*{7pt}\par%
\hskip-252.5pt\rule{\textwidth}{.5pt}}}%
  \def\@oddfoot{\oddpagefootline}%
  \def\@evenfoot{\evenpagefootline}%
  \def\authormark##1{\def\leftmark{##1}}%
  \def\titlemark##1{\markboth{##1}{##1}}}%

\def\ps@myheadings{%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
  \def\@evenhead{\hfil}%
  \def\@oddhead{\hfil}%
  \def\authormark##1{\def\leftmark{##1}}%
  \def\titlemark##1{\markboth{##1}{##1}}}

\def\ps@queryheadings{%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
  \let\@evenhead\@empty%
  \let\@oddhead\@empty%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Sectional units
%
% Counters
\newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\newcounter{refsection}[section]
\newcounter{figure}
\newcounter{table}

% Form of the numbers
\newcommand\thepage{\arabic{page}}
\renewcommand\thesection{\arabic{section}}
\renewcommand\thesubsection{{\thesection.\arabic{subsection}}}
\renewcommand\thesubsubsection{{\thesubsection.\arabic{subsubsection}}}
\renewcommand\theparagraph{\thesubsubsection.\arabic{paragraph}}
\renewcommand\thesubparagraph{\theparagraph.\arabic{subparagraph}}
\renewcommand\theequation{\arabic{equation}}

% Form of the words
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\refname{References}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Fig}
\newcommand\tablename{Table}
\newcommand\keywordsname{Keywords}

% Clearemptydoublepage should really clear the running heads too
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Titling Macros %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reset default command signatures

\def\title{\@ifnextchar[{\@title@wst@}{\@title@nst@}}
\def\@title@wst@[#1]{\titlemark{#1}\@title@assign@}
\def\@title@nst@#1{\titlemark{#1}\@title@assign@{#1}}
\def\@title@assign@#1{\def\@title{#1}}

\def\author{\@ifnextchar[{\@author@wst@}{\@author@nst@}}
\def\@author@wst@[#1]{\authormark{#1}\@author@assign@}
\def\@author@nst@#1{\authormark{#1}\@author@assign@{#1}}
\def\@author@assign@#1{\gdef\@author{#1}\global\@author@providedtrue}

% It is for titling commands
\newif\if@supertitle@provided \@supertitle@providedfalse
\newif\if@author@provided \@author@providedfalse
\newif\if@date@provided \@date@providedfalse
\newif\if@rec@provided \@rec@providedfalse
\newif\if@rev@provided \@rev@providedfalse
\newif\if@acc@provided \@acc@providedfalse
\newif\if@abstract@provided \@abstract@providedfalse%
\newif\if@keywords@provided \@keywords@providedfalse

\def\supertitle#1{\def\@supertitle{#1}\global\@supertitle@providedtrue}
\def\addno#1{\@hangfrom{#1}}
\def\address#1{\gdef\@address{{#1\endgraf}}}

\def\date#1{\gdef\@date{#1}\global\@date@providedtrue}
\gdef\rec#1{Received on #1\par}
\gdef\rev#1{Revised on #1\par}
\gdef\acc#1{Accepted on #1\par}

\newbox\@abstractbox
\newenvironment{abstract}{\global\@abstract@providedtrue%
  \global\setbox\@abstractbox\vbox\bgroup\noindent{\fontsize{12}{12}\selectfont\textbf{\abstractname}}\par\vspace*{10pt}%
  \@afterindentfalse\@afterheading}{\par\egroup}%

\def\keywords#1{\gdef\@keywords{#1}\global\@keywords@providedtrue}

\def\@fnsymbol#1{\ifcase#1\or *\or \dagger\or \ddagger\or
    \S\or \P\or \|\or **\or \dagger\dagger
    \or \ddagger\ddagger \else\@ctrerr\fi}

%% Reimplement Titling Layout

\newcommand\maketitle{\par%
  \twocolumn[
  \begingroup
  \renewcommand\footnoterule{\begingroup\leftskip\z@\noindent
  \rule{84mm}{0.5\p@}\vspace{8\p@}\endgroup}
    \iferratum\relax\thispagestyle{erratumpage}\else\thispagestyle{titlepage}\fi%
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \global\@topnum\z@%Prevents figures from going at top of page.
    \@maketitle
    \twocolumn
  \endgroup]
  \@afterindentfalse
  \@afterheading
  \begingroup
  \def\thefootnote{}
  \endgroup
  \global\let\maketitle\relax
  \global\let\@maketitle\relax}

\def\aftdoispace{\vspace{89.2\p@}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@maketitle{%
  \begingroup
  \vspace*{4pt}
  {\centering\begin{minipage}[t]{160mm}\vspace*{0pt}%
   \centering{\fontsize{18}{22}\selectfont\bfseries\@title\vphantom{yqQl}\par}%
   \vspace{2pt}%
  \end{minipage}\par%
  }%
   {\centering\begingroup
     \begin{minipage}[t]{160mm}%
      \centering{\fontsize{12}{14}\bfseries\itshape\selectfont\@author\par}%
      \vspace{12\p@}%
      \centering{\fontsize{10}{12}\fontshape{it}\selectfont\@address}%
     \end{minipage}%
    \endgroup\par}%
    \vspace{26\p@}%
    \endgroup\par%
    \if@keywords@provided%
    \centering\begingroup
    \begin{minipage}[t]{160.3mm}%
    {\parindent=0pt\normalfont
    \textbf{\keywordsname:}\enskip\@keywords\par}%
    \end{minipage}%
    \endgroup
    \vspace{14\p@}%
  \else%
   \vspace{0\p@}%
  \fi%
  \if@abstract@provided%
  \begingroup
   {\noindent\unvbox\@abstractbox\par}%
  \endgroup
   \else
   \vspace{0\p@}%
  \fi
  \vspace{20\p@ plus 4\p@ minus 3\p@}%
  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lastpage %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{lastpage}

\AtBeginDocument{%
\usepackage{longtable}}

\AtEndDocument{%
   \message{Setting LastPage}%
   \clearpage\lastpage@putlabel}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%% Sectioning macros %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lowest level heading that takes a number by default
\setcounter{secnumdepth}{3}

% Reset the default section macros to help with title casing
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        {\hskip #3\relax\@svsec}%
          \interlinepenalty \@M
% Modified to uppercase H1's and titlecase the rest
          \ifnum #2=1\relax
             {#8}%
           \else
           \ifnum #2=2\relax
           {#8}%
            \else
            {#8}%
          \fi\fi
        \@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8:\ }%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

% H1
\def\section{%
\renewcommand{\@seccntformat}[1]{{{\csname the##1\endcsname\hskip15pt}}}
  \@startsection{section}{1}{\z@}
  {-10\p@}{9\p@}
  {\reset@font\fontsize{12}{14}\bfseries\raggedright}}

% H2
\def\subsection{%
\renewcommand{\@seccntformat}[1]{{{\it\csname the##1\endcsname\hskip5pt}}}
  \@startsection{subsection}{2}{\z@}
  {-12\p@}{9\p@}
  {\reset@font\normalsize\fontshape{it}\selectfont\raggedright}}

% H3
\def\subsubsection{%
  \@startsection{subsubsection}{3}{\z@}
  {-12\p@}{-0.0001\p@}
  {\reset@font\normalsize\fontshape{it}\selectfont\raggedright}}

\def\paragraph{%
  \@startsection{paragraph}{4}{\z@}
  {-13\p@ plus -1\p@}{-0.5em}
  {\reset@font\normalfont\normalsize\itshape}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Footnotes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@makefnmark{$^{\@thefnmark}$}%
\renewcommand\footnoterule{\begingroup\leftskip\z@\noindent
  \rule{84mm}{0.5\p@}\vspace{5\p@}\setcounter{footnote}{0}\endgroup}

\newcommand\@makefntext[1]{%
  \begingroup%
    \leftskip=\z@\rightskip=\z@%
    \footnotesize%
    \setlength\parindent{0pt}%
    \@makefnmark\ignorespaces \textit{#1}%
  \endgroup}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%% Figures and Tables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
  
\setlength\abovecaptionskip{7.5\p@}
\setlength\belowcaptionskip{0\p@}

\def\fnum@figure{Fig.~\thefigure}

\newcommand{\figfooter}[2]{\par\fontsize{7}{9}\selectfont\textit{#1\ }#2\par}%

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    {#1}\enskip {#2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
  
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\long\gdef\@ifnotmtarg#1{\@xifmtarg#1QQ\@firstofone\@gobble\@nil}
\endgroup

\newbox\tablecaptionbox
\long\def\@tablecaption#1#2{\par%
  \setbox\tablecaptionbox=\vbox{\hsize\textwidth%
    {{#1}\enskip {#2}}\strut}%
    \unvbox\tablecaptionbox\par%
  \vspace{\belowcaptionskip}
  }%

\def\tablesource#1{\@hangfrom{\textit{Source:\hskip6pt}}#1\par}
\def\tablenote#1{\@hangfrom{\textit{Note:\hskip6pt}}#1\par}
\def\tablefoot#1{%
\def\tfmark##1{\@hangfrom{\textsuperscript{##1}\hskip5pt}}%
#1\par}

\def\hrulefill{\leavevmode\leaders\hrule height 0.5pt\hfill\kern\z@}

\def\thetable{\@arabic\c@table}%
\def\fps@table{tbp}%
\def\ftype@table{3}%
\def\ext@table{lot}%
\def\fnum@table{\tablename\,\thetable}%
\def\table{\let\@makecaption\@tablecaption\@float{table}}%
\def\endtable{\end@float}%
\@namedef{table*}{\let\@makecaption\@tablecaption\@dblfloat{table}}%
\@namedef{endtable*}{\end@dblfloat}%

\newdimen\tempdime%
\newbox\temptbox%

\newlength{\abovefigskip}%
\newlength{\belowfigskip}%
\setlength{\abovefigskip}{\z@}%
\setlength{\belowfigskip}{\z@}%

\definecolor{gray}{cmyk}{0,0,0,0.5}

\def\midrule{%
  \noalign{\ifnum0=`}\fi\color{gray}\hrule \@height 1pt \futurelet
   \reserved@a\@xhline}
%
\def\botrule{%
  \noalign{\ifnum0=`}\fi\hrule \@height 1pt \futurelet
   \reserved@a\@xhline}
%
\def\toprule{%
  \noalign{\ifnum0=`}\fi\hrule \@height 1pt \futurelet
   \reserved@a\@xhline}


%\def\toprule{\noalign{\ifnum0=`}\fi%
%  \hrule \@height 1.2\p@ \@width \z@%
%  \hrule \@height 1\p@ \@width\hsize%
%  \hrule \@height 3.5\p@ \@width \z@%
%  \futurelet \@tempa\@xhline}%

% Table and array parameters%
\setlength\arraycolsep{.5em}%
\setlength\tabcolsep{.5em}%
\setlength\arrayrulewidth{.25pt}%
\setlength\doublerulesep{2.5pt}%
\renewcommand\arraystretch{1}%

\def\hrulefill{\leavevmode\leaders\hrule height .25pt\hfill\kern\z@}%

\newcolumntype{P}[1]{>{\raggedright\let\\\@arraycr\hangindent1em}p{#1}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lists %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\labelenumi{{\rm\arabic{enumi}.}}
\def\theenumi{\arabic{enumi}}
\def\labelenumii{{\rm(\alph{enumii})}}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}
\def\labelenumiii{{\rm(\arabic{enumiii})}}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{{\rm(\arabic{enumiv})}}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}
\def\labelitemi{$\bullet$}
\def\labelitemii{$\circ$}
\def\labelitemiii{$\bullet$}
\def\labelitemiv{$\bullet$}

\setlength{\leftmargini}{\z@}
\setlength{\leftmarginii}{\z@}
\setlength{\leftmarginiii}{\z@}
\setlength{\leftmarginiv}{\z@}

\def\enumargs{%
   \partopsep     \z@
   \itemsep       \z@
   \parsep        \z@
   \rightmargin   \z@
   \labelsep      6pt
   \listparindent 0pt
   \itemindent    0pt}

\def\enumerate{%
    \@ifnextchar[{\@numerate}{\@numerate[3.]}}

\def\@numerate[#1]{%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \enumargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@listdepth\endcsname}
       \usecounter{\@enumctr}
       \leftmargin13.5pt\def\makelabel##1{\llap{##1}}}%
     \fi
   }
\def\endenumerate{\endlist\advance \@listdepth -1}
%
\newdimen\itemleftmargin \itemleftmargin\z@ % won't be active in enumerate
\newdimen\itemlabelsep \itemlabelsep12\p@ % labelsep in itemize for all levels
%
\def\itemize{\par%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\renewcommand\labelitemi{\raise0.5pt\hbox{\footnotesize\textbullet\hspace*{9pt}}}%
      \topsep6pt plus2pt\leftmargin13pt\def\makelabel##1{\hss\llap{##1}}}%
  \fi}

\setlength{\topsep}{6\p@}%
\setlength{\itemsep}{\z@}

\def\@listI{\leftmargin\leftmargini\topsep10.5\p@ plus 1\p@}
\let\@listi\@listI
\@listi
\def\@listii{\leftmargin\leftmarginii\topsep\z@}
\def\@listiii{\leftmargin\leftmarginiii\topsep\z@}
\def\@listiv{\leftmargin\leftmarginiv\topsep\z@}
\def\@listv{\leftmargin\leftmarginv\topsep\z@}
\def\@listvi{\leftmargin\leftmarginvi\topsep\z@}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% unnumbered list %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{description}{%
  \begin{list}{}{%
      \usecounter{enumi}%
      \setlength{\itemsep}{\z@}%
      \setlength{\labelwidth}{\z@}%
      \setlength{\leftmargin}{1em}%
      \setlength{\itemindent}{-1em}}}%
{\end{list}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\endnomenclature{\endlist\advance \@listdepth -1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Extracts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\quotation{\par\begin{list}{}{\small%  Extracts in small type
      \setlength{\topsep}{6.5\p@}%
      \setlength{\itemsep}{\z@}%
      \setlength\labelwidth{\z@}%
      \setlength\labelsep{\z@}%
      \setlength\leftmargin{20\p@}%
      \listparindent \parindent}%
  \item[\vrule width\z@ height 9\p@]}
\def\endquotation{\end{list}}
\let\quote\quotation
\let\endquote\endquotation
\newcommand{\source}[1]{\newline\hbox{}\hfill{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\qedsymbol}{\ensuremath{\square}}%\ensuremath{\blacksquare}
\renewenvironment{proof}[1][\proofname]{
  \pushQED{\qed}%
  \normalfont \topsep12\p@\@plus3\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \itshape
    #1:]\ \ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\providecommand{\proofname}{Proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%% Acknowledgments %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{savesecnumdepth}

\providecommand{\ackname}{Acknowledgements}
\newcommand{\ack}[1][\ackname]{%
  \setcounter{savesecnumdepth}{\value{secnumdepth}}%
%  \setcounter{secnumdepth}{0}%
  \section{\bf #1}%
  \setcounter{secnumdepth}{\value{savesecnumdepth}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{thebibliography}[1]{}%

\usepackage[square,sort&compress]{natbib}
\bibpunct[, ]{[}{]}{;}{n}{,}{,}

\renewcommand\NAT@sep{,}

\def\NAT@space{\,}

%\newcommand{\citenumfont}[1]{{#1}}
%\renewcommand\bibnumfmt[1]{{#1}}

\renewcommand\NAT@bibsetnum[1]{%
      \settowidth\labelwidth{\@biblabel{#1}}%
      \setlength\leftmargin{\z@}%
      \setlength{\labelsep}{6pt}%
      \addtolength{\leftmargin}{\labelwidth}%
      \addtolength{\leftmargin}{\labelsep}
   \setlength{\itemsep}{\z@}
  \setlength{\parsep}{\z@}%
   \ifNAT@openbib
     \addtolength{\leftmargin}{\bibindent}%
     \setlength{\itemindent}{-\bibindent}%
     \setlength{\listparindent}{\itemindent}%
     \setlength{\parsep}{0pt}%
   \fi
}

\renewenvironment{thebibliography}[1]{%
 \list
   {\@biblabel{\arabic{NAT@ctr}}}{\@bibsetup{#1}%
    \setcounter{NAT@ctr}{0}}%
    \ifNAT@openbib
      \newcommand\newblock{\par}
    \else
      \newcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
    \fi
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax
    \let\citeN\cite \let\shortcite\cite
    \let\citeasnoun\cite
 }{\def\@noitemerr{%
  \PackageWarning{natbib}
     {Empty `thebibliography' environment}}%
  \endlist\vskip-\lastskip}

%%%%%%%%%%%%%%%%%%%%%%%%%% Appendix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifappend % Are we in the Appendix?
\def\appendix{\par
  \renewcommand{\@seccntformat}[1]{{\csname
  the##1\endcsname}\quad}
        \appendtrue}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Override settings in MathTime back to TeX defaults
\DeclareMathSizes{5}{5}{5}{5}
\DeclareMathSizes{6}{6}{5}{5}
\DeclareMathSizes{7}{7}{5}{5}
\DeclareMathSizes{8}{8}{5.33}{5}
\DeclareMathSizes{9}{9}{7}{5}
\DeclareMathSizes{9.25}{9.25}{6.1}{5}
\DeclareMathSizes{10}{10}{6.5}{5}
\DeclareMathSizes{11}{11}{7.7}{6}
\DeclareMathSizes{12}{12}{9}{7}

%Math parameters
\setlength{\jot}{5\p@}
\skip\@mpfootins = \skip\footins
\fboxsep=6\p@
\fboxrule=.25\p@
\@mathmargin1em
\medmuskip=4mu% plus 2mu minus 4mu
\thickmuskip=5mu% plus 5mu

\vbadness=9999
\tolerance=9999
\doublehyphendemerits=10000
\doublehyphendemerits 640000
\finalhyphendemerits  1000000

\flushbottom
\frenchspacing
\onecolumn
\pagestyle{headings}

% Author queries
\fboxsep=4\p@
\fboxrule=0.5\p@

\def\notmargs{%
   \partopsep     \z@
   \itemsep       3pt
   \parsep        \z@
   \rightmargin   \z@
   \labelsep      28pt
   \listparindent \parindent
   \itemindent    \z@}


\def\nomenclature{\section*{Nomenclature}\raggedright%
    \@ifnextchar[{\@notnumerate}{\@notnumerate[]}}


\def\@notnumerate[#1]{%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \notmargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@listdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{#1}
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\llap\hss{##1}}}%
     \fi
   }

\ifnoquery
\newcommand{\query}[2][0pt]{%
  \marginpar{%\vspace*{#1}%
    {\parbox{\marginparwidth}{%
     \raggedright\small{}}}}}
\else
\newcommand{\query}[2][0pt]{%
  \marginpar{%\vspace*{#1}%
    {\parbox{\marginparwidth}{%
     \raggedright\small{\bf #2}}}}}%
\fi

\newdimen\tabqueryskip\tabqueryskip\textwidth
\def\figquery#1{\ifnoquery\else\hbox to 0pt{\hskip-8pc\fontsize{9}{11}\selectfont\textbf{\hsize2pc #1}}\fi}
\def\tabquery#1{\ifnoquery\else\hbox to 0pt{\hskip-7.5pc\advance\tabqueryskip-\tempdime\hskip-.5\tabqueryskip\fontsize{9}{11}\selectfont\textbf{\hsize2pc #1}}\fi}


\newbox\querybox%

\newenvironment{queries}[1][Q1]{\clearpage\onecolumn%
  \global\setbox\querybox=\vbox\bgroup\global\qrytrue%
  \begingroup%
  \thispagestyle{queryheadings}
  \advance\@enumdepth \@ne
  \edef\@enumctr{enum\romannumeral\the\@enumdepth}
  \def\labelenumi{\arabic{enumi})}
  \def\labelenumii{\alph{enumii})}
  \begin{list}{\csname label\@enumctr\endcsname}{%\small%
      \setlength{\topsep}{12\p@}%
    \setlength{\itemsep}{6\p@}%
      \setlength{\leftmargin}{\z@}%
      \settowidth{\labelwidth}{\bfseries#1}%
      \setlength{\labelsep}{1.5em}%
      \addtolength{\leftmargin}{\labelwidth}%
      \addtolength{\leftmargin}{\labelsep}
      \def\makelabel##1{\hss\llap{{##1}}}
    }}{\end{list}\endgroup\egroup}

% Short-form coding
\newcommand\tetal{{{\rm et~al.}}}
\newcommand\etal{\textit{et~al.}}
\newcommand\eg{\textit{e.g.}\ }
\newcommand\ie{\textrm{i.e.}\ }
\let\endash\textendash
\def\dd{{\rm d}}
\def\ee{{\rm e}}
\def\cir#1{{\accent"17 #1}}

\chardef\permil="89%

%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareSymbolFont{EulerExtension}{U}{euex}{m}{n}
\DeclareMathSymbol{\intop}{\mathop}{EulerExtension}{"52}
\DeclareMathSymbol{\ointop}{\mathop}{EulerExtension}{"48}

%%%%%%%%%%%%%%%
\def\dbond{\raise0.18ex\hbox{$=$}}
\def\bond{\raise0.18ex\hbox{$-$}}

\def\sdot#1{{\buildrel{\scriptscriptstyle\bullet}\over{\hbox{#1}}}}


\def\au#1{#1\refstepcounter{qauth}\expandafter\gdef\csname qau\theqauth\endcsname{#1}}%
\def\add#1#2{$^{\textit{#1}}$#2\par}
\def\ad#1{$^{\scriptscriptstyle\textit{#1}}$}
\def\email#1{\corr{\kern-2pt} #1}

\CYear{2021}
\Year{2021}

\def\corr{*\ }

\raggedbottom

\endinput