<?xml version="1.0" encoding="UTF-8" ?>
<!--<?xml version="1.0" encoding="ISO-2022-JP" ?>-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" encoding="ISO-2022-JP"/>

<xsl:template match="/paperlist" >
\documentstyle[a4j,11pt]{jarticle}

\newcounter{savedenumi}
\newenvironment{Enumerate}
{\begin{enumerate} \setcounter{enumi}{\thesavedenumi} 
\setlength{\itemsep}{7pt} }
{\setcounter{savedenumi}{\theenumi} \end{enumerate}}

\title{研究業績
  <xsl:if test="@note">（<xsl:value-of select="@note" />）</xsl:if>
}
\author{<xsl:value-of select="@myname" />}
\date{}

\begin{document}
\maketitle

<xsl:if test="item[@type='th']">
\section*{学位論文}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='th']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='jj' or @type = 'ij']">
\section*{学術論文}
\begin{Enumerate}
  <xsl:apply-templates 
       select="item[@type='jj' or @type='ij']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='lt']">
\section*{ショートペーパー}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='lt']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='ic']">
\section*{国際会議}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='ic' or @type='ln']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='dr']">
\section*{国内査読付き会議}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='dr']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='dt']">
\section*{国内研究会}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='dt']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='dc']">
\section*{国内全国大会}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='dc']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='op']">
\section*{口頭発表}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='op']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='rv']">
\section*{解説記事}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='rv']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
  <xsl:if test="item[@type='bc']">
    \section*{章分担}
    \begin{Enumerate}
    <xsl:apply-templates select="item[@type='bc']">
      <xsl:sort select="year" data-type="number" order="ascending" />
      <xsl:sort select="month" data-type="number" order="ascending" />
    </xsl:apply-templates>
    \end{Enumerate}
  </xsl:if>
  <xsl:if test="item[@type='tr']">
\section*{翻訳}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='tr']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
 <xsl:if test="item[@type='iv']">
   \section*{招待講演・パネルディスカッションなど}
   \begin{itemize}
   <xsl:apply-templates select="item[@type='iv']">
     <xsl:sort select="year" data-type="number" order="ascending" />
     <xsl:sort select="month" data-type="number" order="ascending" />
   </xsl:apply-templates>
   \end{itemize}
 </xsl:if>
<xsl:if test="item[@type='pt']">
\section*{特許}
\begin{itemize}
  <xsl:apply-templates select="item[@type='pt']" />
\end{itemize}
</xsl:if>
<xsl:if test="item[@type='gr']">
\section*{助成金}
\begin{itemize}
  <xsl:apply-templates select="item[@type='gr']" />
\end{itemize}
</xsl:if>
<xsl:if test="item/award">
\section*{受賞}
\begin{itemize}
  <xsl:apply-templates select="item/award" />
\end{itemize}
</xsl:if>
<xsl:if test="item[@type='sc']">
\section*{学会活動}
\begin{itemize}
  <xsl:apply-templates select="item[@type='sc']" />
\end{itemize}
</xsl:if>
 <xsl:if test="item[@type='etc']">
   \section*{その他}
   \begin{itemize}
   <xsl:apply-templates select="item[@type='etc']" />
   \end{itemize}
 </xsl:if>
\end{document}
</xsl:template>

<xsl:template match="item">
\item 
<xsl:choose>
  <xsl:when test="text">
    <xsl:apply-templates select="text" />
  </xsl:when>
  <xsl:otherwise>
    <xsl:if test="authors"><xsl:apply-templates select="authors" mode="tex"/>: </xsl:if>
    <!--<xsl:if test="authors"><xsl:apply-templates select="authors" mode="nameonly-comma"/>: </xsl:if>-->
    ``<xsl:value-of select="translate(title, '&amp;', '\&amp;')"/>'', 
    <xsl:apply-templates select="." mode="booktitle-etc-latex"/>
    <xsl:if test="award">{\bf (<xsl:value-of select="award"/>)}</xsl:if>
    <xsl:if test="note">(<xsl:value-of select="note"/>)</xsl:if>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="award">
  \item 
  <xsl:if test="@shortened='yes'">
    <xsl:apply-templates select="../booktitle" mode="simple" />
  </xsl:if>
  <xsl:value-of select="." />
</xsl:template>
  
<xsl:template match="text">
  <xsl:value-of select="." />\par
</xsl:template>

<xsl:include href="paperlistcommon.xsl"/>

</xsl:stylesheet>
