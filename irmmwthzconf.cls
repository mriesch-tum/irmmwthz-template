%%
%% This is file `irmmwthzconf.cls',
%%
%% Copyright (C) 2019 by M. Riesch <michael.riesch@tum.de>
%%
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%%
%%    http://www.latex-project.org/lppl.txt
%%
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{irmmwthzconf}[2019/03/11 v1.0 IRMMW-THz conference abstract]

% load article base class
\LoadClass{IEEEtran}

% font encoding and input encoding
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

% proper citations
\RequirePackage{cite}

% avoid widows and orphans
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

% Load base packages
\RequirePackage[english]{babel}
\RequirePackage{graphicx}
% avoid bookmarks in PDF (otherwise IEEE PDF eXpress returns an error)
\RequirePackage[bookmarks=false,colorlinks,urlcolor=blue,hidelinks,
  breaklinks]{hyperref}

% affiliations
\newcommand{\authormark}[1]{\textsuperscript{\normalfont#1}}
\newcounter{affil}
\let\theaffil\empty
\newcommand{\printaffil}[2]{%
  \ifnum\value{affil}>1{%
    \authormark{#1}#2%
  }\else{%
    #2%
  }\fi
}
\newcommand{\affil}[2][]{%
  \ifnum\value{affil}>0{%
    \makeatletter
    \g@addto@macro{\theaffil}{\par\printaffil{#1}{#2}}
    \makeatother
  }\else{%
    \makeatletter
    \g@addto@macro{\theaffil}{\printaffil{#1}{#2}}
    \makeatother
  }\fi
  \addtocounter{affil}{1}
}

% prevent floats in title
\RequirePackage{placeins}

% custom title
\makeatletter
\renewcommand{\@maketitle}{%
  \newpage
  \begin{center}
    \fontsize{16pt}{19pt}\selectfont\@title\par
    \vskip 14pt
    \fontsize{11pt}{13pt}\selectfont\@author\par
    \normalsize\theaffil\par
  \end{center}
  \vspace{-19pt}
  \FloatBarrier
  \@afterindentfalse
  \@afterheading
}
\makeatother

% no page numbers
\pagenumbering{gobble}

% custom captions
\RequirePackage{caption}
\DeclareCaptionLabelFormat{figureabbr}{Fig.~#2.}
\DeclareCaptionLabelFormat{tableabbr}{Tab.~#2.}
\captionsetup[figure]{labelformat=figureabbr,labelfont=bf,font=footnotesize,
  labelsep=space}
\captionsetup[table]{labelformat=tableabbr,labelfont=bf,font=footnotesize,
  labelsep=space}

% custom page bottom
\AtEndDocument{%
  \clearpage
}
%%
%% End of file `irmmwthzconf.cls'.
