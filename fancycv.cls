\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancycv}[2022/01/25 Fancy CV class]

\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

%% Layout

\RequirePackage[a4paper,margin=1.9cm,centering]{geometry}
\RequirePackage{pbox}
\RequirePackage{graphbox}
\RequirePackage{calc}

\AtBeginDocument{\raggedright}

\newlength{\sidebarwidth}
\setlength{\sidebarwidth}{5.2cm}


\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

\newlength{\hspacing}
\setlength{\hspacing}{1.5cm}

\newlength{\mainwidth}
\setlength{\mainwidth}{\textwidth - \sidebarwidth - \hspacing}

\newlength{\headspacing}
\setlength{\headspacing}{0.7cm}

\newlength{\entryspacing}
\setlength{\entryspacing}{0.5cm}

\newlength{\sectspacing}
\setlength{\sectspacing}{1cm} % Should sectspacing = hspacing ?

\newcommand\headspace{\vspace{\headspacing}}
\newcommand\entryspace{\vspace{\entryspacing}}
\newcommand\sectspace{\vspace{\sectspacing}}


%%--------------------- Fonts ---------------------------%%

\usepackage{fontspec}

\setmainfont[
	Path = fonts/,
	UprightFont = *-regular,
	BoldFont = *-semibold]
{bitter}
\newfontface\light{bitter-light.ttf}[Path = fonts/]
\newfontface\heads{Bebas Neue}

% Setting up variable names for the section and name font sizes. I am
% unsure if I should be setting up names with @ in them, and then crea-
% ting commands which change them indirectly, rather than letting the
% people at them directly. It might be better practice.

\newlength\sectionfontsize
\setlength{\sectionfontsize}{32pt}
\newlength\sectionfontleading
\setlength{\sectionfontleading}{34pt}

\newlength\rolefontsize
\setlength{\rolefontsize}{32pt}
\newlength\rolefontleading
\setlength{\rolefontleading}{34pt}

\newlength\namefontsize
\setlength{\namefontsize}{60pt}
\newlength\namefontleading
\setlength{\namefontleading}{75pt}

% Setting up the font styles for the title and sections etc

\newcommand\headtext[1]{
{\fontsize{\sectionfontsize}{\sectionfontleading} \heads #1}}

\newcommand\nametext[1]{
{\fontsize{\namefontsize}{\namefontleading} \heads #1}}

\newcommand\roletext[1]{
{\fontsize{\rolefontsize}{\rolefontleading} \heads #1}}


%%--------------------- Title Section ------------------%%

% These are the input commands for the user to generate the title matter
% Note that we can reuse the LaTeX primitive \author. One could make the
% claim for using \title for \role, but I think it's not clearer like
% this.
\makeatletter
\DeclareRobustCommand\role[1]{\gdef\@role{#1}}
\DeclareRobustCommand\email[1]{\gdef\@email{#1}}
\DeclareRobustCommand\phone[1]{\gdef\@phone{#1}}
\DeclareRobustCommand\address[1]{\gdef\@address{#1}}
\DeclareRobustCommand\summary[1]{\gdef\@summary{#1}}
\makeatother

% Defining the \maketitle command.
%
% At the moment, everything is very hard-coded, and will break when, for
% instance, the name is too long, or the role, or the address, or, well
% anything.
%
% I need to work out how to calculate the layout of stuff better. That
% will take some time and imagination. For now I am happy enough to un-
% derstand how to make some macros.
%
% The first steps I should take towards edit-proofing this stuff is de-
% fine some variables that store the name fontsize, and the header font
% size. I don't really want to give people the flexibility to have diff-
% erent font sizes for the section headers, and the role/name. I think 
% there should be some consistency. So, maybe if the name gets long the
% name font should change size, and the role font, reducing with the
% section fonts until a threshold, where the section font size snaps to
% the name font size. And there should be a minimum for these fonts.
\makeatletter
\newcommand{\maketitle}{
\pbox{0.7\textwidth}{
\nametext{\@author}\\
\roletext{\@role}}\hfill\pbox{0.3\textwidth}{
\includegraphics[align=c,margin=0.3em]{icons/location.pdf}\light \@address\\
\includegraphics[align=c,margin=0.3em]{icons/phone.pdf} \@phone\\
\includegraphics[align=c,margin=0.3em]{icons/email.pdf}\@email%
}%
\headspace

\@summary
}
\makeatother
%% Now to define some stuff for experience.

\newcommand\experienceentry[4]{\textbf{#1}\hfill #3\\ {\light #2.}\par%
#4}

\newcommand\educationentry[4]{\textbf{#1}\hfill #3 \\ {\light #2.}\par%
#4}

\newcommand\skillentry[2]{\raggedright\textbf{#1}\hfill {\light \pbox[t]{0.7\sidebarwidth}{\raggedleft #2}}}

\newcommand\langentry[2]{\raggedright\textbf{#1}\hfill {\light \pbox[t]{0.7\sidebarwidth}{\raggedleft #2}}}

%% Styling the itemize environment

\newcommand\labelitemi{\textbullet}