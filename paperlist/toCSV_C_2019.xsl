<?xml version="1.0" encoding="ISO-2022-JP" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="utf-8"/>

  <xsl:template match="/paperlist" >
    <html>
      <head></head>
      <body>
        "管理番号", "ユーザID", "表示順", "主要研究発表順位", 
        "学内分類コード", "学内分類", "会議種別コード", "会議種別", 
        "記述言語コード", "記述言語", "会議区分コード", "会議区分", 
        "単独・共同区分コード", "単独・共同区分", 
        "タイトル（日本語）", "タイトル（英語）", "講演者（日本語）", 
        "講演者（英語）", "会議名（日本語）", "会議名（英語）", 
        "開催年月日（年）", "開催年月日（月）", "開催年月日（日）", 
        "招待の有無コード", "招待の有無", 
        "主催者（日本語）", "主催者（英語）", "開催地（日本語）", 
        "開催地（英語）", "URL", "CiNii", "OpenDepo WekoID", 
        "概要（日本語）", "概要（英語）", "備考（日本語）", "備考（英語）", 
        "本学HPからの公開選択, "本学ＨＰからの公開", "researchmapへの提供", 
        "reearchmapへの提供", "本人更新日", "削除フラグ", "削除"
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
    &quot;&quot;,                                   <!-- A:管理番号 -->
    &quot;kitahara.tetsurou&quot;,                  <!-- B:ユーザID -->
    &quot;&quot;,                                   <!-- C:表示順 -->
    &quot;&quot;,                                   <!-- D:主要研究発表順位 -->
    &quot;&quot;,                                   <!-- E:学内分類コード -->
    <xsl:choose>
      <xsl:when test="@type='iv'">
        &quot;ゲストスピーカ&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;学会発表&quot;,
      </xsl:otherwise>
    </xsl:choose>                                   <!-- F:学内分類 -->
    &quot;&quot;,                                   <!-- G:会議種別コード-->
    &quot;&quot;,                                   <!-- H:会議種別 -->
    &quot;&quot;,                                   <!-- I:記述言語コード -->
    <xsl:if test="@lang='jp' or @lang='ja'">
      &quot;日本語&quot;, 
    </xsl:if>
    <xsl:if test="@lang='en'">
      &quot;英語&quot;, 
    </xsl:if>                                       <!-- J:言語種別 -->
    &quot;&quot;,                                   <!-- K:会議区分コード -->
    <xsl:choose>
      <xsl:when test="type='dr' or @type='dt' or @type='dc'">
        &quot;国内会議&quot;,
      </xsl:when>
      <xsl:when test="type='ic'">
        &quot;国際会議&quot;
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                                  <!-- L:会議区分 -->
      &quot;&quot;,                                <!-- M:単独・共同区分コード -->
    <xsl:choose>
      <xsl:when test="count(authors/author)=1">
        &quot;単独&quot;,
      </xsl:when>
      <xsl:when test="count(authors/author)&gt;1">
        &quot;共同&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                       <!-- N:単独・共同区分 -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:value-of select="title" />&quot;,
      </xsl:when>                           <!-- O:タイトル（日本語）-->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="title" />&quot;, 
      </xsl:when>                           <!-- P:タイトル（英語） -->
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
    </xsl:choose>                           <!-- Q:講演者（日本語） -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- R:講演者（英語） -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:apply-templates select="booktitle" mode="simple"/>&quot;,
        <!--&quot;<xsl:value-of select="booktitle" />&quot;, -->
      </xsl:when>                           <!-- S:発表名（日本語）-->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="booktitle" mode="simple"/>&quot;,
        <!--&quot;<xsl:value-of select="booktitle" />&quot;, -->
      </xsl:when>                           <!-- T:会議名（英語） -->
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>
    &quot;<xsl:value-of select="year" />&quot;,       <!-- U:開催年月日（年） -->
    &quot;<xsl:value-of select="month" />&quot;,      <!-- V:開催年月日（月） -->
    &quot;&quot;,                                     <!-- W:開催年月日（日） -->
    &quot;&quot;,                                     <!-- X:開催年月日（年度） -->
    &quot;&quot;,                                     <!-- Y:招待の有無コード -->
    <xsl:choose>
      <xsl:when test="@type='iv'">
        &quot;有&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;無&quot;,
      </xsl:otherwise>
    </xsl:choose>                                     <!-- Z:招待の有無 -->
    &quot;&quot;,                                     <!-- AA:主催者（日本語） -->
    &quot;&quot;,                                     <!-- AB:主催者（英語） -->
    &quot;&quot;,                                     <!-- AC:開催地（日本語） -->
    &quot;&quot;,                                     <!-- AD:開催地（英語） -->
    &quot;&quot;,                                     <!-- AE:URL -->
    &quot;&quot;,                                     <!-- AF:CiNii -->
    &quot;&quot;,                                     <!-- AG:OpenDepo WekoID -->
    &quot;&quot;,                                     <!-- AH:概要（日本語） -->
    &quot;&quot;,                                     <!-- AI:概要（英語） -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AJ:備考（日本語） -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AK:備考（英語） -->
    &quot;&quot;,                         <!-- AL:本学HPから公開選択 -->
    &quot;公開&quot;,                     <!-- AM:本学HPから公開 -->
    &quot;&quot;,                         <!-- AN:researchmapへの提供 -->
    &quot;提供(公開)&quot;,               <!-- AO:researchmapへの提供 -->
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
