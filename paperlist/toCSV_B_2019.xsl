<?xml version="1.0" encoding="ISO-2022-JP" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="utf-8"/>

  <xsl:template match="/paperlist" >
    <html>
      <head></head>
      <body>
        <xsl:apply-templates 
            select="item[@type='bc' or @type='jj' or @type = 'ij' or @type='lt' or @type='ln' or @type='rv' or @type='ic' or @type='dr']">
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
    &quot;&quot;,                                   <!-- D:$B<gMWO@J8=g0L(B -->
    &quot;&quot;,                                   <!-- E:$B3XFbJ,N`%3!<%I(B -->
    <xsl:choose>
      <xsl:when test="@type='ij' or @type='jj' or @type='lt' or @type='ln' or 
                      @type='ic' or @type='bc'">
        &quot;$B3X=QO@J8(B&quot;,
      </xsl:when>
      <xsl:when test="@type='rv' or @type='tr'">
        &quot;$B2r@b!&Am@b(B&quot;, 
      </xsl:when>
      <xsl:otherwise>
        &quot;$B$=$NB>(B&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- F:$B3XFbJ,N`(B -->
    &quot;&quot;,                        <!-- G:$B7G:\<oJL%3!<%I(B -->
    <xsl:choose>
      <xsl:when test="@type='ij' or @type='jj' or @type='lt' or @type='ln'">
        &quot;$B8&5fO@J8!J3X=Q;(;o!K(B&quot;,
      </xsl:when>
      <xsl:when test="@type='ic'">
        &quot;$B8&5fO@J8!J9q:]2q5D%W%m%7!<%G%#%s%0%9!K(B&quot;,
      </xsl:when>
      <xsl:when test="@type='dr' or @type='dt' or @type='dc'">
        &quot;$B8&5fO@J8!J8&5f2q!$%7%s%]%8%&%`;qNAEy!K(B&quot;,
      </xsl:when>
      <xsl:when test="@type='rv' or @type='bc'">
        &quot;$B8&5fO@J8!J3X=Q;(;o!K(B&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;$B$=$NB>(B&quot;,
      </xsl:otherwise>                    <!-- H:$B7G:\<oJL(B -->
    </xsl:choose>
    &quot;&quot;,                         <!-- I:$B7G:\6hJ,%3!<%I(B -->
    &quot;&quot;,                         <!-- J:$B7G:\6hJ,(B -->
    &quot;&quot;,                          <!-- K:$B5-=R8@8l%3!<%I(B -->
    <xsl:if test="@lang='jp' or @lang='ja'">
      &quot;$BF|K\8l(B&quot;, 
    </xsl:if>
    <xsl:if test="@lang='en'">
      &quot;$B1Q8l(B&quot;, 
    </xsl:if>                           <!-- L:$B5-=R8@8l(B -->
      &quot;&quot;,                         <!--- M:$BC1Cx!&6&Cx6hJ,%3!<%I(B -->
    <xsl:choose>
      <xsl:when test="count(authors/author)=1">
        &quot;$BC1Cx(B&quot;,
      </xsl:when>
      <xsl:when test="authors/author[1] = /paperlist/@myname or
                      authors/author[1] = /paperlist/@myname-e">
      <!--<xsl:when test="starts-with(authors/author[1]/@idref, 'kitahara')">-->
        &quot;$B6&Cx(B($BBh0lCx<T(B)&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;$B6&Cx(B($BBh0lCx<T0J30(B)&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- N:$BC1Cx!&6&Cx6hJ,(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:value-of select="title" />&quot;,
      </xsl:when> 
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                          <!-- O:$B%?%$%H%k!JF|K\8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="title" />&quot;, 
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- P:$B%?%$%H%k!J1Q8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- Q:$BCx<T!JF|K\8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- R:$BCx<T!J1Q8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:apply-templates select="booktitle" mode="simple"/>&quot;,
        <!--&quot;<xsl:value-of select="booktitle" />&quot;, -->
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- S:$B;oL>!JF|K\8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="booktitle" mode="simple"/>&quot;,
        <!--&quot;<xsl:value-of select="booktitle" />&quot;, -->
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- T:$B;oL>!J1Q8l!K(B -->
    &quot;&quot;,                           <!-- U:$B=PHG<T!JF|K\8l!K(B -->
    &quot;&quot;,                           <!-- V:$B=PHG<T!J1Q8l!K(B -->
    &quot;<xsl:value-of select="vol" />&quot;,        <!-- W:$B4,9fJG!J4,!K(B -->
    &quot;<xsl:value-of select="no" />&quot;,         <!-- X:$B4,9fJG!J9f!K(B -->
    &quot;<xsl:value-of select="pp" />&quot;,         <!-- Y:$B4,9fJG!J3+;O%Z!<%8!K(B --> 
    &quot;&quot;,                                      <!-- Z:$B4,9fJG!J=*N;%Z!<%8!K(B -->
    &quot;<xsl:value-of select="year" />&quot;,       <!-- AA:$B=PHGF|!JG/!K(B -->
    &quot;<xsl:value-of select="month" />&quot;,      <!-- AB:$B=PHGF|!J7n!K(B -->
    &quot;&quot;,                                     <!-- AC:$B=PHGF|!JF|!K(B -->
    &quot;&quot;,                                     <!-- AD:$B=PHGF|!JG/EY!K(B -->
    &quot;&quot;,                                     <!-- AE:$B::FI$NM-L5%3!<%I(B -->
    <xsl:choose>
      <xsl:when test="@type='jj' or @type='ij' or @type='lt' or @type='ln' or
                      @type='ic' or @type='dr'">
        &quot;$BM-(B&quot;,
      </xsl:when>
      <xsl:when test="@type='dt' or @type='dc'">
        &quot;$BL5(B&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                                     <!-- AF:$B::FI$NM-L5(B -->
    &quot;&quot;,                                     <!-- AG:$B0MMj(B/$B>7BT$NM-L5%3!<%I(B -->
    <xsl:choose>
      <xsl:when test="@type='iv'">
        &quot;$BM-(B&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;$BL5(B&quot;,
      </xsl:otherwise>
    </xsl:choose>                                     <!-- AH:$B0MMj(B/$B>7BT$NM-L5(B -->
    &quot;&quot;,                                     <!-- AI:ISSN -->
    &quot;&quot;,                                     <!-- AJ:DOI --> 
    &quot;&quot;,                                     <!-- AK:$B5!4X%j%]%8%H%j(B --> 
    &quot;&quot;,                                     <!-- AL:OPAC --> 
    &quot;&quot;,                                     <!-- AM:CiNii --> 
    &quot;&quot;,                                     <!-- AN:PMID --> 
    &quot;&quot;,                                     <!-- AO:Permalink --> 
    &quot;&quot;,                                     <!-- AP:URL --> 
    &quot;&quot;,                                     <!-- AQ:JGlobalID --> 
    &quot;&quot;,                                     <!-- AR:arXiv ID -->
    &quot;&quot;,                                     <!-- AS ORCID Put Code-->
    &quot;&quot;,                                     <!-- AT DBLP ID -->
    &quot;&quot;,                                     <!-- AU OpenDepo -->
    &quot;&quot;,                                     <!-- AV:$B35MW!JF|K\8l!K(B -->
    &quot;&quot;,                                     <!-- AW:$B35MW!J1Q8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AX:$BHw9M!JF|K\8l!K(B -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AY:$BHw9M!J1Q8l!K(B -->
    &quot;&quot;,                         <!-- AZ:$B650wAmMw$X$N8x3+%U%i%0(B-->
    &quot;$B8x3+(B&quot;,                     <!-- BA:$B650wAmMw$X$N8x3+(B -->
    &quot;&quot;,                         <!-- BB:$BK\3X(BHP$B$+$i$N8x3+A*Br(B -->
    &quot;$B8x3+(B&quot;,                     <!-- BC:$BK\3X(BHP$B$+$i8x3+(B -->
    &quot;&quot;,                         <!-- BD -->
    &quot;$BDs6!(B($B8x3+(B)&quot;,               <!-- BE:ReaD and ReseachMap$B$X$NDs6!(B -->
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
