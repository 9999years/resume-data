\LoadClass{article}
\pagestyle{empty}
\setlength{\parindent}{0em}
\setlength{\parskip}{0em}

\RequirePackage{fontspec}
\setromanfont{Garamond Premier Pro}
\RequirePackage[
	paperwidth=8.5in,
	paperheight=11in,
	portrait,
	margin=1in,
	top=1in,
	bottom=1.5in,
]{geometry}

\RequirePackage{xparse}
\RequirePackage{longtable}
\RequirePackage{tabu}

\RequirePackage{xkeyval}

\define@cmdkey{info}{studentid}[]{}
\NewDocumentCommand{\information}{m}
	{\setkeys{info}{#1}
	\maketitle
	\begin{tabu}{@{}lX[3]@{}}
	Name & \@author \\
	Student \textsc{id} & \cmdKV@info@studentid \\
	\end{tabu}}

\NewDocumentEnvironment{programs}{}
	{\section{Academic Program History}%
	\NewDocumentCommand{\program}{m}{Program & ##1 \\}%
	\RenewDocumentCommand{\date}{m m}{##1 & ##2 \\}%
	\RenewDocumentCommand{\active}{m}{\date{##1}{Active in Program}}%
	\NewDocumentCommand{\major}{m m}{\date{##1}{##2 Major}}%
	\begin{longtabu}{@{}lX[3]@{}}}
	{\end{longtabu}}

\NewDocumentEnvironment{record}{}
	{\NewExpandableDocumentCommand{\semester}{m m}{%
		\multicolumn{7}{@{}p{\linewidth}@{}}{%
			\subsection{##1 Semester ##2}%
		}\\%
	}%
	\NewExpandableDocumentCommand{\@summary}{
		m % type; term or cum.
		m % gpa
		m % total grade points
		m % total grade points
		m % total grade points recieved
	}{\multicolumn{2}{@{}r}{\textbf{##1 \textsc{gpa}}} &
		\textbf{##2} \hfill ##1 totals & ##3 & ##4 & & ##5 \\
	}%
%
	\NewExpandableDocumentCommand{\termsummary}{
		m % gpa
		m % total grade points
		m % total grade points
		m % total grade points recieved
	}{\@summary{Term}{##1}{##2}{##3}{##4}}%
%
	\NewExpandableDocumentCommand{\cumsummary}{
		m % gpa
		m % total grade points
		m % total grade points
		m % total grade points recieved
	}{\@summary{Cumulative}{##1}{##2}{##3}{##4}}%
%
	\NewDocumentCommand{\standing}{ m }%
		{& & \textbf{##1} & & & \\}%
	\NewDocumentCommand{\goodstanding}{}{\standing{Good Standing}}%
	\NewDocumentCommand{\deanslist}{}{\standing{Dean's List}}%
%
	\vspace{-2\baselineskip}%
	\begin{longtabu}{@{}>{\scshape}l>{\scshape}rlrrlr@{}}}
	{\end{longtabu}}

\renewcommand{\maketitle}{%
	\begin{center}%
		\large\textbf{\@title}%
	\end{center}%
}

\RequirePackage[compact]{titlesec}
\titleformat{\section}{\normalfont\Large\bfseries}{}{0pt}{}
\titleformat{\subsection}{\normalfont\large\bfseries}{}{0pt}{}
\titlespacing*{\section}{0pt}{0.5em}{-\parskip}
\titlespacing*{\subsection}{0pt}{0.5em}{-\parskip}

\title{Unofficial Undergraduate Transcript --- Brandeis University}
\author{Rebecca Blackwood Turner}
