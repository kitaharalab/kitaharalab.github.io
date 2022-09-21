<?xml version="1.0" encoding="ISO-2022-JP" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="utf-8"/>

  <xsl:template match="/paperlist" >
    <html>
      <head></head>
      <body>
        "$B4IM}HV9f(B", "$B%f!<%6(BID", "$BI=<(=g(B", "$B<gMW8&5fH/I==g0L(B", 
        "$B3XFbJ,N`%3!<%I(B", "$B3XFbJ,N`(B", "$B2q5D<oJL%3!<%I(B", "$B2q5D<oJL(B", 
        "$B5-=R8@8l%3!<%I(B", "$B5-=R8@8l(B", "$B2q5D6hJ,%3!<%I(B", "$B2q5D6hJ,(B", 
        "$BC1FH!&6&F16hJ,%3!<%I(B", "$BC1FH!&6&F16hJ,(B", 
        "$B%?%$%H%k!JF|K\8l!K(B", "$B%?%$%H%k!J1Q8l!K(B", "$B9V1i<T!JF|K\8l!K(B", 
        "$B9V1i<T!J1Q8l!K(B", "$B2q5DL>!JF|K\8l!K(B", "$B2q5DL>!J1Q8l!K(B", 
        "$B3+:EG/7nF|!JG/!K(B", "$B3+:EG/7nF|!J7n!K(B", "$B3+:EG/7nF|!JF|!K(B", 
        "$B>7BT$NM-L5%3!<%I(B", "$B>7BT$NM-L5(B", 
        "$B<g:E<T!JF|K\8l!K(B", "$B<g:E<T!J1Q8l!K(B", "$B3+:ECO!JF|K\8l!K(B", 
        "$B3+:ECO!J1Q8l!K(B", "URL", "CiNii", "OpenDepo WekoID", 
        "$B35MW!JF|K\8l!K(B", "$B35MW!J1Q8l!K(B", "$BHw9M!JF|K\8l!K(B", "$BHw9M!J1Q8l!K(B", 
        "$BK\3X(BHP$B$+$i$N8x3+A*Br(B, "$BK\3X#H#P$+$i$N8x3+(B", "researchmap$B$X$NDs6!(B", 
        "reearchmap$B$X$NDs6!(B", "$BK\?M99?7F|(B", "$B:o=|%U%i%0(B", "$B:o=|(B"
        <br />
        <xsl:apply-templates 
           select="item[@type='iv' or @type='dt' or @type='dc']">
          <xsl:sort select="year" data-type="number" order="descending" />
          <xsl:sort select="month" data-type="number" order="descending" />
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="item">
    &quot;&quot;,                                   <!-- A:$B4IM}HV9f(B -->
    &quot;kitahara.tetsurou&quot;,                  <!-- B:$B%f!<%6(BID -->
    &quot;&quot;,                                   <!-- C:$BI=<(=g(B -->
    &quot;&quot;,                                   <!-- D:$B<gMW8&5fH/I==g0L(B -->
    &quot;&quot;,                                   <!-- E:$B3XFbJ,N`%3!<%I(B -->
    <xsl:choose>
      <xsl:when test="@type='iv'">
        &quot;$B%2%9%H%9%T!<%+(B&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;$B3X2qH/I=(B&quot;,
      </xsl:otherwise>
    </xsl:choose>                                   <!-- F:$B3XFbJ,N`(B -->
    &quot;&quot;,                                   <!-- G:$B2q5D<oJL%3!<%I(B-->
    &quot;&quot;,                                   <!-- H:$B2q5D<oJL(B -->
    &quot;&quot;,                                   <!-- I:$B5-=R8@8l%3!<%I(B -->
    <xsl:if test="@lang='jp' or @lang='ja'">
      &quot;$BF|K\8l(B&quot;, 
    </xsl:if>
    <xsl:if test="@lang='en'">
      &quot;$B1Q8l(B&quot;, 
    </xsl:if>                                       <!-- J:$B8@8l<oJL(B -->
    &quot;&quot;,                                   <!-- K:$B2q5D6hJ,%3!<%I(B -->
    <xsl:choose>
      <xsl:when test="type='dr' or @type='dt' or @type='dc'">
        &quot;$B9qFb2q5D(B&quot;,
      </xsl:when>
      <xsl:when test="type='ic'">
        &quot;$B9q:]2q5D(B&quot;
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                                  <!-- L:$B2q5D6hJ,(B -->
      &quot;&quot;,                                <!-- M:$BC1FH!&6&F16hJ,%3!<%I(B -->
    <xsl:choose>
      <xsl:when test="count(authors/author)=1">
        &quot;$BC1FH(B&quot;,
      </xsl:when>
      <xsl:when test="count(authors/author)&gt;1">
        &quot;$B6&F1(B&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                       <!-- N:$BC1FH!&6&F16hJ,(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:value-of select="title" />&quot;,
      </xsl:when>                           <!-- O:$B%?%$%H%k!JF|K\8l!K(B-->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="title" />&quot;, 
      </xsl:when>                           <!-- P:$B%?%$%H%k!J1Q8l!K(B -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- Q:$B9V1i<T!JF|K\8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- R:$B9V1i<T!J1Q8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:apply-templates select="booktitle" mode="simple"/>&quot;,
        <!--&quot;<xsl:value-of select="booktitle" />&quot;, -->
      </xsl:when>                           <!-- S:$BH/I=L>!JF|K\8l!K(B-->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="booktitle" mode="simple"/>&quot;,
        <!--&quot;<xsl:value-of select="booktitle" />&quot;, -->
      </xsl:when>                           <!-- T:$B2q5DL>!J1Q8l!K(B -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    &quot;<xsl:value-of select="year" />&quot;,       <!-- U:$B3+:EG/7nF|!JG/!K(B -->
    &quot;<xsl:value-of select="month" />&quot;,      <!-- V:$B3+:EG/7nF|!J7n!K(B -->
    &quot;&quot;,                                     <!-- W:$B3+:EG/7nF|!JF|!K(B -->
    &quot;&quot;,                                     <!-- X:$B3+:EG/7nF|!JG/EY!K(B -->
    &quot;&quot;,                                     <!-- Y:$B>7BT$NM-L5%3!<%I(B -->
    <xsl:choose>
      <xsl:when test="@type='iv'">
        &quot;$BM-(B&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;$BL5(B&quot;,
      </xsl:otherwise>
    </xsl:choose>                                     <!-- Z:$B>7BT$NM-L5(B -->
    &quot;&quot;,                                     <!-- AA:$B<g:E<T!JF|K\8l!K(B -->
    &quot;&quot;,                                     <!-- AB:$B<g:E<T!J1Q8l!K(B -->
    &quot;&quot;,                                     <!-- AC:$B3+:ECO!JF|K\8l!K(B -->
    &quot;&quot;,                                     <!-- AD:$B3+:ECO!J1Q8l!K(B -->
    &quot;&quot;,                                     <!-- AE:URL -->
    &quot;&quot;,                                     <!-- AF:CiNii -->
    &quot;&quot;,                                     <!-- AG:OpenDepo WekoID -->
    &quot;&quot;,                                     <!-- AH:$B35MW!JF|K\8l!K(B -->
    &quot;&quot;,                                     <!-- AI:$B35MW!J1Q8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AJ:$BHw9M!JF|K\8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AK:$BHw9M!J1Q8l!K(B -->
    &quot;&quot;,                         <!-- AL:$BK\3X(BHP$B$+$i8x3+A*Br(B -->
    &quot;$B8x3+(B&quot;,                     <!-- AM:$BK\3X(BHP$B$+$i8x3+(B -->
    &quot;&quot;,                         <!-- AN:researchmap$B$X$NDs6!(B -->
    &quot;$BDs6!(B($B8x3+(B)&quot;,               <!-- AO:researchmap$B$X$NDs6!(B -->
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
