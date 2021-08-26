\ProvidesClass{jote-article}[2019/05/22 Cambridge University Press, Political Analysis submission template v1.0]
\newif\if@suppmat\@suppmattrue
\DeclareOption{nosupp}{\@suppmatfalse}
\ProcessOptions\relax
\ExecuteOptions{}

\RequirePackage{etoolbox,xpatch}
\RequirePackage{ifxetex,ifluatex}
\RequirePackage{setspace}
\RequirePackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{rotating}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage[style]{abstract}
\RequirePackage[marginal]{footmisc}
\RequirePackage{caption,subcaption}
\RequirePackage{enumitem}
\RequirePackage{authblk}
\RequirePackage{textcomp}
\RequirePackage[absolute]{textpos}
\RequirePackage[right]{lineno}
\RequirePackage{amsmath}



%% Definitions for adding journal elements
\def\@jlogo{}
\def\@jname{}
\def\@jyear{}
\def\@jpages{}
\def\@jvolume{}
\def\@jissue{}
\def\@jwebsite{}

\def\@pubpub{}
\def\@companionurl{}
\def\@companiontitle{}
\def\@companionabstract{}
\def\@companionkey{}
\def\@abstracttext{}

\def\@runningauthor{}
\def\@corraddress{}
\def\@corremail{}
\def\@fundinginfo{}
\def\@presentaddress{}

\def\@rgainfo{}

\def\@papertype{}
\def\@paperfield{}
\def\@paperdoi{}
\def\@paperreceived{}
\def\@paperrevised{}
\def\@paperaccepted{}
\def\@paperpublished{}
\def\@paperpublisheddate{}
\def\@papereditor{}

\def\@rolling{}
\def\@subtitle{}

\def\@heightabstract{}
\def\@widthaffil{}

\def\@noabstract{}

\def\@funding{}
\def\@acknowledgments{}
\def\@contributions{}
\def\@interests{}
\def\@keywordsabstract{}

\def\@authorone{}
\def\@authortwo{}
\def\@authorthree{}
\def\@authorfour{}
\def\@authorfive{}
\def\@orcidicon{}

%for peer review
\def\@ogauthor{}
\def\@prround{}

\newif\if@numeric
\newif\if@authordate
\newif\if@amsrefs
\newif\if@blindreview
\newif\if@useserif
\newif\if@jote@lineno

\newif\if@seplic

\newif\if@reflection
\newif\if@rga
\newif\if@empirical
\newif\if@meta
\newif\if@editorial
\newif\if@review

\newif\if@issue
\newif\if@rolling
%% Add options for other journals here
\DeclareOption{jote}{%
  \def\@jlogo{jabr-logo}%
  \def\@jname{J Appl Behav Res}%
  \def\@jwebsite{joteonlinelibrary.com/journal/jabr}%
}

%% Options for bibliography style
\DeclareOption{numeric}{
  \@numerictrue
  \@authordatefalse
  \@amsrefsfalse
}
\DeclareOption{authordate}{
  \@numericfalse
  \@authordatetrue
  \@amsrefsfalse
}
\DeclareOption{ams-refs}{
  \@numericfalse
  \@authordatefalse
  \@amsrefstrue
}

\DeclareOption{seplic}{
    \@seplictrue
}

%% Options for papertype

\DeclareOption{reflection}{\@reflectiontrue \@reviewfalse}
\DeclareOption{rga}{\@rgatrue \@reviewfalse}
\DeclareOption{empirical}{\@empiricaltrue \@reviewfalse}
\DeclareOption{meta}{\@metatrue \@reviewfalse}
\DeclareOption{editorial}{\@editorialtrue \@reviewfalse}
\DeclareOption{review}{\@reviewtrue}

\DeclareOption{issue}{\@issuetrue \@rollingfalse}
%% Option for blind review
\DeclareOption{blind}{\@blindreviewtrue}

%% v1.3: Option for serif fonts
\DeclareOption{serif}{\@useseriftrue}

%% v1.4: Option for line numbers
\DeclareOption{lineno}{\@jote@linenotrue}

%%
\DeclareOption{twocolumn}{\PassOptionsToClass{\CurrentOption}{article}}

%% v1.2: don't set any defaults
% \ExecuteOptions{num-refs}
\ProcessOptions\relax


\LoadClass[twoside]{article}

\RequirePackage{fontspec}
\RequirePackage{booktabs} %Makes tables "prettier"
\RequirePackage[table]{xcolor}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{textcase}
\RequirePackage{dashrule}
\RequirePackage{ragged2e}
\RequirePackage{authblk}
\RequirePackage[hyphens]{url}
\RequirePackage{soul}
\RequirePackage{xpatch}
\RequirePackage{afterpage}
\RequirePackage{hyperref} %For bookmarks and links
\RequirePackage{paracol} % necessary to make reviewbox pagebreak work
%\RequirePackage{cooltooltips} % For hover and comments
%\RequirePackage[inactive]{fancytooltips} %  allows inclusion of tooltips which contain arbitrary TEX material
\RequirePackage{pdfcomment} % little bit less complex hover
\RequirePackage{tikz,lipsum,lmodern}
\RequirePackage[breakable,skins,most]{tcolorbox}
\tcbuselibrary{skins,xparse,breakable}
%\RequirePackage[backend = biber, style=apa]{biblatex}
\definecolor{jotelighter}{HTML}{ace5f9}
\definecolor{jotebase}{HTML}{60bfe1}
\colorlet{jote}{cyan!20}
\definecolor{jotedark}{HTML}{12799d}
\definecolor{jotelight}{HTML}{d6f6ff}
\if@twocolumn
  \RequirePackage[switch, right]{lineno}
\else
  \RequirePackage[right]{lineno}
\fi



%\RequirePackage
% [paperwidth=210mm,paperheight=280mm,
%  left=14.3mm, textwidth=180mm,
%  lines=55, headsep=2.5\baselineskip,headheight=20\p@,
%  footskip=23\p@,columnsep=2em, includeheadfoot]
%{geometry}

\RequirePackage{alphalph}
\newalphalph{\fnsymbolmult}[mult]{\@fnsymbol}{5}
\RequirePackage{lettrine}

\newcounter{authorfn}
\setcounter{authorfn}{1}
\newcommand{\authfn}[1]{%
  \fnsymbolmult{#1}%
}

\newcommand{\presentadd}[2][]{
  \ifx\empty\@presentaddress\else\appto{\@presentaddress}{\\}{}{}\fi
  \appto{\@presentaddress}{%
  \ifx\empty#1\else\textsuperscript{#1}\fi
  #2%
  }{}{}
}


%% These will be set by the \journal{} command
\newcommand{\jlogo}[1]{\def\@jlogo{#1}}
\newcommand{\jname}[1]{\def\@jname{#1}}
\newcommand{\jyear}[1]{\def\@jyear{#1}}
\newcommand{\jvolume}[1]{\def\@jvolume{#1}}
\newcommand{\jissue}[1]{\def\@jissue{#1}}
\newcommand{\jpages}[1]{\def\@jpages{#1}}
\newcommand{\jwebsite}[1]{\def\@jwebsite{#1}}

%JOTE specific commands: pubpub link, link to article on PubPub, Title of the companion piece and Abstract of the companion Piece
\newcommand{\pubpub}[1]{\def\@pubpub{#1}}
\newcommand{\companionurl}[1]{\def\@companionurl{#1}}
\newcommand{\companiontitle}[1]{\def\@companiontitle{#1}}
\newcommand{\companionabstract}[1]{\def\@companionabstract{#1}}
\newcommand{\companionkey}[1]{\def\@companionkey{#1}}
\newcommand{\abstracttext}[1]{\def\@abstracttext{#1}}

\newcommand{\heightabstract}[1]{\def\@heightabstract{#1}}
\newcommand{\widthaffil}[1]{\def\@widthaffil{#1}}

%Command that appends rolling to the Title if non-empty.
\newcommand{\rolling}[1]{\def\@rolling{#1}}
%Command for the subtitle, if any
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}


\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}
\newcommand{\corraddress}[1]{\def\@corraddress{#1}}
\newcommand{\corremail}[1]{\def\@corremail{#1}}

\newcommand{\rgainfo}[1]{\def\@rgainfo{#1}}

\newcommand{\fundinginfo}[1]{\def\@fundinginfo{#1}}

\newcommand{\paperdoi}[1]{\def\@paperdoi{#1}}
\newcommand{\paperreceived}[1]{\def\@paperreceived{#1}}
\newcommand{\paperrevised}[1]{\def\@paperrevised{#1}}
\newcommand{\paperaccepted}[1]{\def\@paperaccepted{#1}}

\newcommand{\paperpublished}[1]{\def\@paperpublished{#1}}
\newcommand{\paperpublisheddate}[1]{\def\@paperpublisheddate{#1}}
\newcommand{\papereditor}[1]{\def\@papereditor{#1}}
\newcommand{\papertype}[1]{\def\@papertype{#1}}
\newcommand{\paperfield}[1]{\def\@paperfield{#1}}

\newcommand{\funding}[1]{\def\@funding{#1}}
\newcommand{\acknowledgments}[1]{\def\@acknowledgments{#1}}
\newcommand{\contributions}[1]{\def\@contributions{#1}}
\newcommand{\interests}[1]{\def\@interests{#1}}

\newcommand{\keywordsabstract}[1]{\def\@keywordsabstract{#1}}
\newcommand{\noabstract}[1]{\def\@noabstract{#1}}
%Author metadata
\newcommand{\authorone}[1]{\def\@authorone{#1}}
\newcommand{\authortwo}[1]{\def\@authortwo{#1}}
\newcommand{\authorthree}[1]{\def\@authorthree{#1}}
\newcommand{\authorfour}[1]{\def\@authorfour{#1}}
\newcommand{\authorfive}[1]{\def\@authorfive{#1}}
%for peer review
\newcommand{\ogauthor}[1]{\def\@ogauthor{#1}}
\newcommand{\prround}[1]{\def\@prround{#1}}




%%%%%%%%%%%%%%%%%%
%% Fonts
%%%%%%%%%%%%%%%%%%
\setmainfont{Gill Sans Pro}
% \RequirePackage[default]{opensans}
%\renewcommand*\familydefault{\sfdefault}


\def\@journalname{Foundations of Statistical Mechanics}
\def\@keywordsname{Keywords}
\def\@authornotename{Author's notes}
\def\@corrauthorname{Corresponding author}
\def\@editorname{Edited by}
\def\@runningauthor{}
\def\@corrauthor{}
\def\@authornote{}
\definecolor{PANLightBlue}{RGB}{105,178,218}
\definecolor{PANDarkBlue}{RGB}{19,126,194}
\definecolor{PANMaroon}{RGB}{105,27,46}
\definecolor{PANDarkGray}{RGB}{153,153,153}

\RequirePackage{microtype}
\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

\ifxetexorluatex
  \RequirePackage[no-math]{fontspec}
  \let\boldsymbol\symbf
% Patch microtype for older versions; from https://tex.stackexchange.com/a/373607/226
  \@ifpackagelater{microtype}{2017/07/05}{}{%
    \patchcmd{\MT@is@composite}
      {\expandafter\expandafter\expandafter}
      {\ifx\UnicodeEncodingName\@undefined\else
      \expandafter\expandafter\expandafter\MT@is@uni@comp\MT@char\iffontchar\else\fi\relax
    \fi\expandafter\expandafter\expandafter}
      {}{}
    \def\MT@is@uni@comp#1\iffontchar#2\else#3\fi\relax{%
      \ifx\\#2\\\else\edef\MT@char{\iffontchar#2\fi}\fi
    }
  }
\else
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
\fi
\RequirePackage{charter}
\RequirePackage{lmodern}

\setstretch{1.15}

\RequirePackage{geometry}
\geometry{paperwidth=8.25in,paperheight=11in,
  left=4.75cm,top=1.75cm,bottom=2.4cm,right=2.1cm,
  footskip=1.5\baselineskip,footnotesep=\baselineskip,headheight=21\p@,headsep=\baselineskip}

\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}
\newcommand{\authornote}[1]{\def\@authornote{#1}}
\newcommand{\corrauthor}[1]{\def\@corrauthor{#1}}


\renewcommand{\Authfont}{\Large\bfseries}
\renewcommand{\Affilfont}{\small\itshape\mdseries}
\renewcommand\AB@authnote[1]{\textsuperscript{#1}}
\renewcommand\AB@affilnote[1]{\textsuperscript{#1}}
\setlength{\affilsep}{\baselineskip}

\newcommand{\more@metadata}{%
  \emph{\bfseries \@journalname\ (\the\year)}\par
  \textcolor{PANDarkBlue}{\bfseries Wordcount: }3826\par
  \textcolor{PANDarkBlue}{\bfseries\@corrauthorname}\\\@corrauthor\par

  \textcopyright\space The Author(s) \the\year.
.%
}
%\newcommand{\@cover@logo}{%
%  \begin{textblock*}{4cm}[1,0](\dimexpr\Gm@lmargin-1cm,\Gm@tmargin)
%  \fontsize{60\p@}{60\p@}\selectfont\raggedleft%
%  \textcolor{PANMaroon}{PA}
%  \end{textblock*}
%}
\newcommand{\@insert@metadata}{%
  \begin{textblock*}{3.3cm}[0,1](1cm,\dimexpr\paperheight)%-\Gm@bmargin\relax)
  \scriptsize\raggedright%
  \setlength{\parskip}{\baselineskip}%
  \setlength{\parindent}{\z@}%
  \more@metadata\par
  \end{textblock*}
}
\renewcommand{\@maketitle}{%
  %\@cover@logo%
  \@insert@metadata%
  \noindent\begin{minipage}{0.9\linewidth}
  \raggedright\setstretch{1.0}
  {\LARGE\bfseries\@title\par}
  \vskip\baselineskip
  \@author\par
  \end{minipage}\bigskip\normalfont\normalsize%
}
\appto{\maketitle}{%
  \ifdefvoid{\@authornote}{}{\begingroup
    \renewcommand{\thefootnote}{}
    \footnotetext{\emph{\@authornotename:} \@authornote}%
  \endgroup}%
}

\renewcommand{\abstitlestyle}[1]{{\large\bfseries #1\par}}
\setlength{\absleftindent}{\z@}
\setlength{\absrightindent}{\absleftindent}
\preto{\abstract}{%
  \setlength{\parindent}{\z@}%
  \newcommand{\keywords}[1]{%
  \emph{\@keywordsname : }#1\par
  }
  {\textcolor{PANDarkBlue}{\rule{\textwidth}{1.5\p@}}}\\%
}
\appto{\abstract}{%
  \setlength{\parindent}{\z@}%
  \setlength{\parskip}{1em}%
  \vskip-\parskip%
  \noindent\ignorespaces%
}
\appto{\endabstract}{%
  {\raisebox{\baselineskip}{\textcolor{PANDarkBlue}{\rule{\textwidth}{1\p@}}}}%
}

\titleformat{\section}{\large\bfseries}{\hspace*{-1em}\makebox[\z@][r]{\thesection}}{1em}{}
\titleformat{\subsection}{\large}{\hspace*{-1em}\makebox[\z@][r]{\thesubsection}}{1em}{}
\titlespacing*{\section}{\z@}{\baselineskip}{\z@}
\titlespacing*{\subsection}{\z@}{\baselineskip}{\z@}
\titlespacing*{\subsubsection}{\z@}{\baselineskip}{\z@}
\setcounter{secnumdepth}{2}

\setlist{leftmargin=*,nosep}

\setlength{\footnotemargin}{-1em}
\pretocmd{\@makefntext}{%
  \renewcommand{\@makefnmark}{\thefootnote}
}{}{}

\fancyhf{}
\renewcommand{\footrulewidth}{1.5\p@}
\renewcommand{\headrule}{}
\preto{\footrule}{\begingroup\color{PANLightBlue}}
\appto{\footrule}{\endgroup}
%\fancyhead[L]{\hspace*{-4cm}\Huge\color{PANMaroon}PA}
\fancyfoot[R]{\small\thepage}
\fancyfoot[L]{\small\emph{\@runningauthor}\enskip|\enskip\@journalname}
\pagestyle{fancy}
\fancypagestyle{plain}{%
  \fancyhf{}
  \renewcommand{\footrule}{}
  \fancyfoot[R]{\small\thepage}
}

\captionsetup*{singlelinecheck=false,font={small},labelfont={bf,color=PANDarkBlue},labelsep=period}
\captionsetup*[table]{position=top}
\captionsetup*[sub]{labelfont=small,justification=centering}
\newcommand{\headrow}{\rowcolor{PANDarkGray}}
\newcommand{\thead}[1]{\bfseries #1\rule[-1.2ex]{0pt}{2em}}
\renewcommand{\arraystretch}{1.2}

%\RequirePackage[backend=biber,authordate,giveninits=true,uniquename=mininit,natbib]{biblatex-chicago}
%\xpatchbibmacro{name:andothers}{%
%  \bibstring{andothers}%
%}{%
%  \bibstring[\emph]{andothers}%
%}{}{}



\PassOptionsToPackage{hyphens}{url}
\RequirePackage{hyperref}
\hypersetup{colorlinks,allcolors=PANDarkBlue}
\urlstyle{same}
