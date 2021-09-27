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
    &quot;&quot;,                                   <!-- A:管理番号 -->
    &quot;029119&quot;,                             <!-- B:教職員番号 -->
    &quot;&quot;,                                   <!-- C:氏名・漢字 -->
    &quot;&quot;,                                   <!-- D:学部・研究科等 -->
    &quot;&quot;,                                   <!-- E:学科・専攻等 -->
    &quot;&quot;,                                   <!-- F:本務職名 -->
    &quot;&quot;,                                   <!-- G:在職・離職 -->
    &quot;&quot;,                                   <!-- H:表示順 -->
    &quot;&quot;,                                   <!-- I:主要著書順位 -->
    &quot;&quot;,                                   <!-- J -->
    &quot;&quot;,                                   <!-- K:学内分類 -->
    &quot;&quot;,                                   <!-- L -->
    <xsl:if test="@lang='jp'">
      &quot;日本語&quot;, 
    </xsl:if>
    <xsl:if test="@lang='en'">
      &quot;英語&quot;, 
    </xsl:if>                                       <!-- M:言語種別 -->
    &quot;&quot;,                                   <!-- N -->
    <xsl:choose>
      <xsl:when test="count(authors/author)=1">
        &quot;単著&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;共著&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- O:単著・共著区分 -->
    &quot;&quot;,                           <!-- P -->
    &quot;&quot;,                           <!-- Q:執筆形態 -->
    <xsl:choose>
      <xsl:when test="@lang='jp'">
        &quot;<xsl:value-of select="booktitle" />&quot;,
      </xsl:when>                           <!-- R:書名・日本語 -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="booktitle" />&quot;, 
      </xsl:when>                           <!-- S:書名・英語 -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='jp'">
        &quot;<xsl:value-of select="pub" />&quot;,
      </xsl:when>                           <!-- T:出版社名・日本語 -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="pub" />&quot;,
      </xsl:when>                           <!-- U:出版社・英語 -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    &quot;<xsl:value-of select="pp" />&quot;,         <!-- V:担当頁 -->
    &quot;<xsl:value-of select="year" />&quot;,       <!-- W:出版日・年 -->
    &quot;<xsl:value-of select="month" />&quot;,      <!-- X:出版日・月 -->
    &quot;&quot;,                                     <!-- Y:出版日・日 -->
    &quot;&quot;,                                     <!-- Z:出版日・年度 -->
    <xsl:choose>
      <xsl:when test="@lang='jp'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AA:共著者・日本語 -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AB:共著者・英語 -->
    &quot;&quot;,                                     <!-- AC:ISSN -->
    &quot;&quot;,                                     <!-- AD:概要・日本語 -->
    &quot;&quot;,                                     <!-- AE:概要・英語 -->
    <xsl:choose>
      <xsl:when test="@lang='jp'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AF:備考・日本語 -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AG:備考・英語 -->
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
