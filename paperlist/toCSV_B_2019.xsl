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
    &quot;&quot;,                                   <!-- A:管理番号 -->
    &quot;kitahara.tetsurou&quot;,                  <!-- B:ユーザID -->
    &quot;&quot;,                                   <!-- C:表示順 -->
    &quot;&quot;,                                   <!-- D:主要論文順位 -->
    &quot;&quot;,                                   <!-- E:学内分類コード -->
    <xsl:choose>
      <xsl:when test="@type='ij' or @type='jj' or @type='lt' or @type='ln' or 
                      @type='ic' or @type='bc'">
        &quot;学術論文&quot;,
      </xsl:when>
      <xsl:when test="@type='rv' or @type='tr'">
        &quot;解説・総説&quot;, 
      </xsl:when>
      <xsl:otherwise>
        &quot;その他&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- F:学内分類 -->
    &quot;&quot;,                        <!-- G:掲載種別コード -->
    <xsl:choose>
      <xsl:when test="@type='ij' or @type='jj' or @type='lt' or @type='ln'">
        &quot;研究論文（学術雑誌）&quot;,
      </xsl:when>
      <xsl:when test="@type='ic'">
        &quot;研究論文（国際会議プロシーディングス）&quot;,
      </xsl:when>
      <xsl:when test="@type='dr' or @type='dt' or @type='dc'">
        &quot;研究論文（研究会，シンポジウム資料等）&quot;,
      </xsl:when>
      <xsl:when test="@type='rv' or @type='bc'">
        &quot;研究論文（学術雑誌）&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;その他&quot;,
      </xsl:otherwise>                    <!-- H:掲載種別 -->
    </xsl:choose>
    &quot;&quot;,                         <!-- I:掲載区分コード -->
    &quot;&quot;,                         <!-- J:掲載区分 -->
    &quot;&quot;,                          <!-- K:記述言語コード -->
    <xsl:if test="@lang='jp' or @lang='ja'">
      &quot;日本語&quot;, 
    </xsl:if>
    <xsl:if test="@lang='en'">
      &quot;英語&quot;, 
    </xsl:if>                           <!-- L:記述言語 -->
      &quot;&quot;,                         <!--- M:単著・共著区分コード -->
    <xsl:choose>
      <xsl:when test="count(authors/author)=1">
        &quot;単著&quot;,
      </xsl:when>
      <xsl:when test="authors/author[1] = /paperlist/@myname or
                      authors/author[1] = /paperlist/@myname-e">
      <!--<xsl:when test="starts-with(authors/author[1]/@idref, 'kitahara')">-->
        &quot;共著(第一著者)&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;共著(第一著者以外)&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- N:単著・共著区分 -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:value-of select="title" />&quot;,
      </xsl:when> 
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                          <!-- O:タイトル（日本語） -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="title" />&quot;, 
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- P:タイトル（英語） -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- Q:著者（日本語） -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="authors" mode="nameonly-comma" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- R:著者（英語） -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:apply-templates select="booktitle" mode="simple"/>&quot;,
        <!--&quot;<xsl:value-of select="booktitle" />&quot;, -->
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- S:誌名（日本語） -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:apply-templates select="booktitle" mode="simple"/>&quot;,
        <!--&quot;<xsl:value-of select="booktitle" />&quot;, -->
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                           <!-- T:誌名（英語） -->
    &quot;&quot;,                           <!-- U:出版者（日本語） -->
    &quot;&quot;,                           <!-- V:出版者（英語） -->
    &quot;<xsl:value-of select="vol" />&quot;,        <!-- W:巻号頁（巻） -->
    &quot;<xsl:value-of select="no" />&quot;,         <!-- X:巻号頁（号） -->
    &quot;<xsl:value-of select="pp" />&quot;,         <!-- Y:巻号頁（開始ページ） --> 
    &quot;&quot;,                                      <!-- Z:巻号頁（終了ページ） -->
    &quot;<xsl:value-of select="year" />&quot;,       <!-- AA:出版日（年） -->
    &quot;<xsl:value-of select="month" />&quot;,      <!-- AB:出版日（月） -->
    &quot;&quot;,                                     <!-- AC:出版日（日） -->
    &quot;&quot;,                                     <!-- AD:出版日（年度） -->
    &quot;&quot;,                                     <!-- AE:査読の有無コード -->
    <xsl:choose>
      <xsl:when test="@type='jj' or @type='ij' or @type='lt' or @type='ln' or
                      @type='ic' or @type='dr'">
        &quot;有&quot;,
      </xsl:when>
      <xsl:when test="@type='dt' or @type='dc'">
        &quot;無&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                                     <!-- AF:査読の有無 -->
    &quot;&quot;,                                     <!-- AG:依頼/招待の有無コード -->
    <xsl:choose>
      <xsl:when test="@type='iv'">
        &quot;有&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;無&quot;,
      </xsl:otherwise>
    </xsl:choose>                                     <!-- AH:依頼/招待の有無 -->
    &quot;&quot;,                                     <!-- AI:ISSN -->
    &quot;&quot;,                                     <!-- AJ:DOI --> 
    &quot;&quot;,                                     <!-- AK:機関リポジトリ --> 
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
    &quot;&quot;,                                     <!-- AV:概要（日本語） -->
    &quot;&quot;,                                     <!-- AW:概要（英語） -->
    <xsl:choose>
      <xsl:when test="@lang='jp' or @lang='ja'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AX:備考（日本語） -->
    <xsl:choose>
      <xsl:when test="@lang='en'">
        &quot;<xsl:value-of select="award" />  <xsl:value-of select="note" />&quot;,
      </xsl:when>
      <xsl:otherwise>
        &quot;&quot;,
      </xsl:otherwise>
    </xsl:choose>                         <!-- AY:備考（英語） -->
    &quot;&quot;,                         <!-- AZ:教員総覧への公開フラグ-->
    &quot;公開&quot;,                     <!-- BA:教員総覧への公開 -->
    &quot;&quot;,                         <!-- BB:本学HPからの公開選択 -->
    &quot;公開&quot;,                     <!-- BC:本学HPから公開 -->
    &quot;&quot;,                         <!-- BD -->
    &quot;提供(公開)&quot;,               <!-- BE:ReaD and ReseachMapへの提供 -->
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
