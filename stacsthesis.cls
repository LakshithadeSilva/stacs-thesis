%
% StACS PhD thesis document class
% Lakshitha de Silva
% v0.2
% 2014
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stacsthesis}[2014/04/04 v0.1 StACS PhD thesis class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[a4paper,twoside,12pt]{memoir}

%
% Dependent packages
%
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{graphicx}
\DisemulatePackage{setspace}
\RequirePackage[english]{babel}
\RequirePackage{setspace}
\RequirePackage{color}
\RequirePackage{xstring}
\RequirePackage{t1enc}
\RequirePackage{mathptmx}
\RequirePackage{changepage}
\RequirePackage[letterspace=32]{microtype}

%
% Macros
%
\def\school#1{\gdef\@school{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\submittextA#1{\gdef\@submittextA{#1}}
\def\submittextB#1{\gdef\@submittextB{#1}}
\def\logo{\includegraphics[width=32mm]{stacrest.pdf}}
\def\bibtitle#1{\gdef\@bibtitle{#1}}

%
% Paper settings-we support only A4
%
\ifpdf
	\pdfpageheight=297mm
	\pdfpagewidth=210mm
\else
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
\fi

%
% Text properties and margins
%
\setlength{\topmargin}{2mm}
\setlength{\oddsidemargin}{8mm}
\setlength{\evensidemargin}{0mm}
\setlength{\textwidth}{160mm}
\setlength{\textheight}{224mm}
\raggedbottom

%
% Title page
%
\renewcommand{\maketitle}{
	\begin{singlecolumn}
		\renewcommand{\footnotesize}{\small}
		\renewcommand{\footnoterule}{\relax}
		\thispagestyle{empty}
		\begin{center}
    			\Huge{\textls{\@title}}\par
			\Large\vspace*{24mm}{\textls{\@author}}\par
			%\large\vspace*{2.4mm}{\@school}\par
			\vspace*{44mm}{\logo}\par
			\normalsize\vspace*{36mm}{\@submittextA}\par
			\normalsize\vspace*{2mm}{\emph{\@degree}}\par
			\normalsize\vspace*{2mm}{\@submittextB}\par
			\normalsize\vspace*{8mm}{\@submitdate}
		\end{center}
	\end{singlecolumn}}

%
% Customise standard titles, section numbering, etc.
%
\addto\captionsenglish{\renewcommand{\bibname}{\@bibtitle}}
\renewcommand*{\cftappendixname}{Appendix\space}		% Prefix 'Appendix' to toc appendix names
\setsecnumdepth{subsubsection}						% Enable numbering up to sub-sub-section level

%
% Renewed environments
%
\renewenvironment{abstract}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Abstract}}\end{epititle}\begin{quote}}
	{\end{quote}\end{singlecolumn}}

%
% New environments
%
\newenvironment{dedication}
	{\begin{singlecolumn}\thispagestyle{empty}\vspace*{80mm}\Large\itshape\begin{flushright}}
	{\end{flushright}\end{singlecolumn}}

\newenvironment{acknowledgement}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Acknowledgements}}\end{epititle}\begin{quote}}
	{\end{quote}\end{singlecolumn}}

\newenvironment{acknowledgementlong}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Acknowledgements}}\end{epititle}}
	{\end{singlecolumn}}
		
\newenvironment{declaration}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Declaration}}\end{epititle}\begin{quote}}
	{\end{quote}\end{singlecolumn}}

\newenvironment{permission}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Permission for Electronic Publication}}\end{epititle}\begin{quote}}
	{\end{quote}\end{singlecolumn}}

\newenvironment{romanpages}
	{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
	{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

\newenvironment{singlecolumn}
	{\@restonecolfalse
		\if@twocolumn\@restonecoltrue\onecolumn
	 	\else\if@openright\cleardoublepage\else\clearpage\fi
	 	\fi}
	{\if@restonecol\twocolumn
		\else\newpage\thispagestyle{empty}
	 	\fi}

\newenvironment{epititle}
	{\begin{center}\vspace*{16mm}\LARGE\bfseries}
	{\end{center}\vspace{8mm}}

\newenvironment{indentpara}[1][32pt]
	{\begin{adjustwidth}{#1}{}}
	{\end{adjustwidth}}

%
% Chapter style
%
\definecolor{chaptercolor}{gray}{0.92}
\makechapterstyle{stacs-chap}{
	\renewcommand*{\printchaptername}{\flushright}
	\renewcommand*{\printchapternum}{
		\begingroup
		\leavevmode
		\chapnumfont\raisebox{-4.0cm}[0pt][0pt]{\smash{\thechapter}}\flushright
		\endgroup
		\vskip -78pt
		\IfInteger{\thechapter}
			{\chapnamefont{\chaptername$\thickspace$}\numtoName{\thechapter}\flushright}
			{\chapnamefont{\appendixname$\thickspace$}\thechapter\flushright}
		\linespread{0.92}\fontsize{40}{48}\selectfont\flushright
		\setlength{\midchapskip}{0pt}
		\setlength{\beforechapskip}{0pt}
		\setlength{\afterchapskip}{112pt}
 	}
	\renewcommand*{\printchapternonum}{
		\linespread{0.92}\fontsize{30}{36}\selectfont\flushright
		\setlength{\beforechapskip}{0pt}
		\setlength{\midchapskip}{0pt}
		\setlength{\afterchapskip}{24pt}
	}
	\renewcommand*{\printchaptertitle}[1]{\chaptitlefont{##1}}
	\renewcommand*{\chapnumfont}{\fontsize{11.2cm}{0}\bfseries\color{chaptercolor}}
	\renewcommand*{\chapnamefont}{\scshape\linespread{1.28}\Large\flushright}
	\renewcommand*{\chaptitlefont}{\scshape\flushright}
}

%
% Page style
%
\makepagestyle{stacs-pg}
\makeevenhead{stacs-pg}{\small\normalfont\scshape\thepage}{}{\scriptsize\slshape\leftmark}
\makeoddhead{stacs-pg}{\scriptsize\slshape\rightmark}{}{\small\normalfont\scshape\thepage}
\setlength{\topmargin}{0pt}
\setlength{\headsep}{24pt}
\setlength{\textheight}{656pt}
\setlength{\footskip}{36pt}

