<?xml version="1.0" encoding="ISO-2022-JP" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" encoding="ISO-2022-JP"/>

<xsl:template match="/paperlist" >
\documentstyle[a4j,11pt]{jarticle}

\newcounter{savedenumi}
\newenvironment{Enumerate}
{\begin{enumerate} \setcounter{enumi}{\thesavedenumi} 
\setlength{\itemsep}{7pt} }
{\setcounter{savedenumi}{\theenumi} \end{enumerate}}

\title{$B8&5f6H@S(B
  <xsl:if test="@note">$B!J(B<xsl:value-of select="@note" />$B!K(B</xsl:if>
}
\author{<xsl:value-of select="@myname" />}
\date{}

\begin{document}
\maketitle

<xsl:if test="item[@type='th']">
\section*{$B3X0LO@J8(B}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='th']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='jj' or @type = 'ij']">
\section*{$B3X=QO@J8(B}
\begin{Enumerate}
  <xsl:apply-templates 
       select="item[@type='jj' or @type='ij']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='lt']">
\section*{$B%7%g!<%H%Z!<%Q!<(B}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='lt']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='ic']">
\section*{$B9q:]2q5D(B}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='ic' or @type='ln']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='dr']">
\section*{$B9qFb::FIIU$-2q5D(B}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='dr']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='dt']">
\section*{$B9qFb8&5f2q(B}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='dt']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='dc']">
\section*{$B9qFbA49qBg2q(B}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='dc']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='op']">
\section*{$B8}F,H/I=(B}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='op']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
<xsl:if test="item[@type='rv']">
\section*{$B2r@b5-;v(B}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='rv']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
  <xsl:if test="item[@type='bc']">
    \section*{$B>OJ,C4(B}
    \begin{Enumerate}
    <xsl:apply-templates select="item[@type='bc']">
      <xsl:sort select="year" data-type="number" order="ascending" />
      <xsl:sort select="month" data-type="number" order="ascending" />
    </xsl:apply-templates>
    \end{Enumerate}
  </xsl:if>
  <xsl:if test="item[@type='tr']">
\section*{$BK]Lu(B}
\begin{Enumerate}
  <xsl:apply-templates select="item[@type='tr']">
    <xsl:sort select="year" data-type="number" order="ascending" />
    <xsl:sort select="month" data-type="number" order="ascending" />
  </xsl:apply-templates>
\end{Enumerate}
</xsl:if>
 <xsl:if test="item[@type='iv']">
   \section*{$B>7BT9V1i!&%Q%M%k%G%#%9%+%C%7%g%s$J$I(B}
   \begin{itemize}
   <xsl:apply-templates select="item[@type='iv']">
     <xsl:sort select="year" data-type="number" order="ascending" />
     <xsl:sort select="month" data-type="number" order="ascending" />
   </xsl:apply-templates>
   \end{itemize}
 </xsl:if>
<xsl:if test="item[@type='pt']">
\section*{$BFC5v(B}
\begin{itemize}
  <xsl:apply-templates select="item[@type='pt']" />
\end{itemize}
</xsl:if>
<xsl:if test="item[@type='gr']">
\section*{$B=u@.6b(B}
\begin{itemize}
  <xsl:apply-templates select="item[@type='gr']" />
\end{itemize}
</xsl:if>
<xsl:if test="item/award">
\section*{$B<u>^(B}
\begin{itemize}
  <xsl:apply-templates select="item/award" />
\end{itemize}
</xsl:if>
<xsl:if test="item[@type='sc']">
\section*{$B3X2q3hF0(B}
\begin{itemize}
  <xsl:apply-templates select="item[@type='sc']" />
\end{itemize}
</xsl:if>
 <xsl:if test="item[@type='etc']">
   \section*{$B$=$NB>(B}
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
