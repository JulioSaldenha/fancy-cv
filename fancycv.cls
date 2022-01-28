\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancycv}[2022/01/25 Fancy CV class]

\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

%% Layout

\RequirePackage[a4paper,margin=1.9cm,centering]{geometry}
\RequirePackage{pbox}
\RequirePackage{graphbox}

\AtBeginDocument{\raggedright}

\newlength{\sidebarwidth}
\setlength{\sidebarwidth}{5.2cm}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

%%--------------------- Title Section ------------------%%

\makeatletter
\DeclareRobustCommand\role[1]{\gdef\@role{#1}}
\DeclareRobustCommand\email[1]{\gdef\@email{#1}}
\DeclareRobustCommand\phone[1]{\gdef\@phone{#1}}
\DeclareRobustCommand\address[1]{\gdef\@address{#1}}
\DeclareRobustCommand\author[1]{\gdef\@author{#1}}
\DeclareRobustCommand\summary[1]{\gdef\@summary{#1}}
\makeatother



%%--------------------- Fonts ---------------------------%%

\usepackage{fontspec}

\setmainfont[
	Path = fonts/,
	UprightFont = *-regular,
	BoldFont = *-semibold]
{bitter}
\newfontface\slimjim{bitter-light.ttf}[Path = fonts/]
\newfontface\heads{Bebas Neue}

%% Now to define some stuff for experience.

\newcommand\experienceentry[4]{\textbf{#1}\hfill #3\\ {\slimjim #2.}\par%
#4}

\newcommand\educationentry[4]{\textbf{#1}\hfill #3 \\ {\slimjim #2.}\par%
#4}

\newcommand\skillentry[2]{\raggedright\textbf{#1}\hfill {\slimjim \pbox[t]{0.7\sidebarwidth}{\raggedleft #2}}}

\newcommand\langentry[2]{\raggedright\textbf{#1}\hfill {\slimjim \pbox[t]{0.7\sidebarwidth}{\raggedleft #2}}}

%% Styling the itemize environment

\newcommand\labelitemi{\textbullet}