\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{article-custom}[custom article]

\ProcessOptions\relax
\LoadClass[a4paper,12pt]{article}

\usepackage[a4paper]{geometry}
\usepackage{fancyhdr}
\usepackage{ifthen}

\usepackage{fontspec}
\setmainfont{CMU Serif}
\setsansfont{CMU Sans Serif}
\setmonofont{CMU Typewriter Text}

\usepackage{polyglossia}
\setdefaultlanguage{russian}
\setotherlanguage{english}

\usepackage[table]{xcolor}
\usepackage{graphicx}

\usepackage{wrapfig2}
\usepackage{caption}
\usepackage{subcaption}

\usepackage{amsmath, amsfonts, amssymb, amsthm, mathtools}
\usepackage{thmtools}
\usepackage{thm-restate}

\usepackage{tabularx}
\usepackage{makecell}

\usepackage{listings}
\renewcommand\lstlistingname{Листинг}
\renewcommand\lstlistlistingname{Листинги}
\DeclareCaptionFormat{listing}{
    \hspace{15pt}#1#2#3
}
\captionsetup[lstlisting]{
    format=listing,
    margin=0pt,
    font={bf}
}
\lstset{
    mathescape=true,
    identifierstyle=\ttfamily,
    keywordstyle=\bfseries,
    commentstyle=\scriptsize\rmfamily,
    basewidth={0.5em,0.5em},
    fontadjust=true,
}

\usepackage[kpsewhich,newfloat]{minted}

\AtBeginEnvironment{minted}{\dontdofcolorbox}
\def\dontdofcolorbox{\renewcommand\fcolorbox[4][]{##4}}

\SetupFloatingEnvironment{listing}{name=Листинг}
\SetupFloatingEnvironment{listing}{listname=Листинги}
\captionsetup[listing]{
    format=listing,
    margin=0pt,
    font={bf}
}

\usepackage[inline]{enumitem}
\usepackage[useregional]{datetime2}
\usepackage[normalem]{ulem}
\usepackage{microtype}
\usepackage[autostyle]{csquotes}

\usepackage{afterpage}
\usepackage{pdflscape}

\newcommand\blfootnote[1]{
    \begingroup
    \renewcommand\thefootnote{}\footnote{#1}
    \addtocounter{footnote}{-1}
    \endgroup
}

\fancypagestyle{withCompileDate}{
    \fancyhf{}
    \fancyfoot[C]{\thepage}
    \fancyfoot[R]{\small Дата сборки: \today}
    \renewcommand{\headrulewidth}{0pt}
}

\usepackage[colorlinks=true,urlcolor=blue,linkcolor=black,filecolor=black,citecolor=black]{hyperref}
\usepackage[titletoc]{appendix}

\let\old@section\section
\def\section{\@ifstar\@section\@@section}
\def\@section#1{\newpage\old@section*{#1}
    \ifthenelse{\equal{#1}{\contentsname}}
    {}
    {\addcontentsline{toc}{section}{#1}}
}
\def\@@section#1{\newpage\old@section{#1}}

\usepackage[nodisplayskipstretch]{setspace}
\onehalfspacing

\let\savenumberline\numberline
\def\numberline#1{\savenumberline{#1.}}

\sloppy
