%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Memo
% LaTeX Template
% Version 1.1 (03/15/18)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original author:
% Rob Oakes (http://www.oak-tree.us) with modifications by:
% Vel (vel@latextemplates.com),
% Hagen Lauer (hagen.lauer@gmail.com)
%
% Licencse: MIT
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{acmemo}[2018/03/15 - Customized Memo Class, Including Logo]
%\RequirePackage{palatino}
%\RequirePackage{libertine}

\usepackage{graphicx}

% Load the Base Class
\LoadClassWithOptions{article}

% Begin Requirements
\RequirePackage{ifthen}

% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)

\def\@memoto{\relax}
\newcommand{\memoto}[1]{\gdef\@memoto{#1}}

\def\@memofrom{\relax}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}

\def\@memosubject{\relax}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}

\def\@memodate{\relax}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}

\def\@memologo{\relax}
\newcommand{\logo}[1]{\gdef\@memologo{\protect #1}}

\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=.5in}

% Create the Letterhead and To/From Block

\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@memologo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			\vspace{.0in}  % distance to top
			\@memologo
                        \hspace{.5in}
			\vspace{-2in}  % distance to following text
		\par\end{flushright}%
	\end{minipage}
	}
	{\begin{center}
            \large
            \textbf{\sffamily
            Memorandum}
	\end{center}}
	% To, From, Subject Block
	\begin{description}
		\ifthenelse{\equal{\@memoto}{\relax}}{}{\item [{\sffamily To:}] \@memoto}
		\ifthenelse{\equal{\@memofrom}{\relax}}{}{\item [{\sffamily From:}] \@memofrom}
		\ifthenelse{\equal{\@memosubject}{\relax}}{}{\item [{\sffamily Subject:}] \@memosubject}
		\ifthenelse{\equal{\@memodate}{\relax}}{}{\item [{\sffamily Date:}] \@memodate}
	\end{description}
	\decorativeline\bigskip{}
}
