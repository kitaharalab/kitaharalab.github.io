<?xml version="1.0" encoding="ISO-2022-JP" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="utf-8"/>

  <xsl:template match="/paperlist" >
    <html>
      <head></head>
      <body>
        <xsl:apply-templates 
            select="item[@type='bc']">
          <xsl:sort select="year" data-type="number" order="descending" />
          <xsl:sort select="month" data-type="number" order="descending" />
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="item">
    &quot;&quot;,                                   <!-- A:$B4IM}HV9f(B -->
    &quot;029119&quot;,                             <!-- B:$B65?&0wHV9f(B -->
    &quot;&quot;,                                   <!-- C:$B;aL>!&4A;z(B -->
    &quot;&quot;,                                   <!-- D:$B3XIt!&8&5f2JEy(B -->
    &quot;&quot;,                                   <!-- E:$B3X2J!&@l96Ey(B -->
    &quot;&quot;,                                   <!-- F:$BK\L3?&L>(B -->
    &quot;&quot;,                                   <!-- G:$B:_?&!&N%?&(B -->
    &quot;&quot;,                                   <!-- H:$BI=<(=g(B -->
    &quot;&quot;,                                   <!-- I:$B<gMWCx=q=g0L(B -->
    &quot;&quot;,                                   <!-- J -->
    &quot;&quot;,                                   <!-- K:$B3XFbJ,N`(B -->
    &quot;&quot;,                                   <!-- L -->
    <xsl:if test="@lang='jp'">
      &quot;$BF|K\8l(B&quot;, 
    </xsl:if>
    <xsl:if test="@lang='en'">
      &quot;$B1Q8l(B&quot;, 
    </xsl:if>                                       <!-- M:$B8@8l<oJL(B -->
    &quot;&quot;,                                   <!-- N -->
    <xsl:choose>
      <xsl:when test="count(authors/author)=1">
        &quot;$BC1Cx(B&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;$B6&Cx(B&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- O:$BC1Cx!&6&Cx6hJ,(B -->
    &quot;&quot;,                           <!-- P -->
    &quot;&quot;,                           <!-- Q:$B<9I.7ABV(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp'">
        &quot;<xsl:value-of select="booktitle" />&quot;,
      </xsl:when>                           <!-- R:$B=qL>!&F|K\8l(B -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="booktitle" />&quot;, 
      </xsl:when>                           <!-- S:$B=qL>!&1Q8l(B -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='jp'">
        &quot;<xsl:value-of select="pub" />&quot;,
      </xsl:when>                           <!-- T:$B=PHG<RL>!&F|K\8l(B -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="pub" />&quot;,
      </xsl:when>                           <!-- U:$B=PHG<R!&1Q8l(B -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    &quot;<xsl:value-of select="pp" />&quot;,         <!-- V:$BC4EvJG(B -->
    &quot;<xsl:value-of select="year" />&quot;,       <!-- W:$B=PHGF|!&G/(B -->
    &quot;<xsl:value-of select="month" />&quot;,      <!-- X:$B=PHGF|!&7n(B -->
    &quot;&quot;,                                     <!-- Y:$B=PHGF|!&F|(B -->
    &quot;&quot;,                                     <!-- Z:$B=PHGF|!&G/EY(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AA:$B6&Cx<T!&F|K\8l(B -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AB:$B6&Cx<T!&1Q8l(B -->
    &quot;&quot;,                                     <!-- AC:ISSN -->
    &quot;&quot;,                                     <!-- AD:$B35MW!&F|K\8l(B -->
    &quot;&quot;,                                     <!-- AE:$B35MW!&1Q8l(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AF:$BHw9M!&F|K\8l(B -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AG:$BHw9M!&1Q8l(B -->
    <br />
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
