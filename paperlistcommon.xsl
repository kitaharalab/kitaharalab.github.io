<?xml version="1.0" encoding="ISO-2022-JP" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="item" mode="booktitle-etc">
    <i><xsl:apply-templates select="booktitle" /></i>
<!--    </xsl:if>
    <xsl:if test="@lang != 'en'">
      <xsl:apply-templates select="booktitle" />
    </xsl:if>-->
    <xsl:if test="series"><xsl:value-of select="series"/>, </xsl:if>
    <xsl:if test="eds">(<xsl:value-of select="eds"/> (Eds.)), </xsl:if>
    <xsl:if test="vol">Vol.<xsl:value-of select="vol"/>, </xsl:if>
    <xsl:if test="no">No.<xsl:value-of select="no"/>, </xsl:if>
    <xsl:if test="pp">pp.<xsl:value-of select="pp"/>, </xsl:if>
    <xsl:if test="pub"><xsl:value-of select="pub"/>, </xsl:if>
    <xsl:if test="doi"><xsl:variable name="doi" select="doi"/>
      doi: <a href="https://doi.org/{$doi}"><xsl:value-of select="doi"/></a>, 
    </xsl:if>
    <xsl:if test="month">
      <xsl:apply-templates select="month" mode="en"/> 
    </xsl:if>
    <xsl:value-of select="year"/>.
</xsl:template>

<xsl:template match="booktitle">
  <xsl:choose>
    <xsl:when test="@idref">
      <xsl:variable name="idref" select="@idref" />
      <xsl:variable name="booktitle" select="//*[@id=$idref]" />
      <!--<xsl:variable name="booktitle" select="id(@idref)" />-->
      <xsl:choose>
        <xsl:when test="$booktitle/@abbr and $booktitle/@href">
          <xsl:variable name="url" select="$booktitle/@href" />
          <xsl:value-of select="$booktitle" />
          (<a href="{$url}"><xsl:value-of select="$booktitle/@abbr" /></a>),
        </xsl:when>
        <xsl:when test="$booktitle/@abbr">
          <xsl:value-of select="$booktitle" />
          (<xsl:value-of select="$booktitle/@abbr" />),
        </xsl:when>
        <xsl:when test="$booktitle/@href">
          <xsl:variable name="url" select="$booktitle/@href" />
          <a href="{$url}"><xsl:value-of select="$booktitle" /></a>
        </xsl:when>
        <xsl:otherwise><xsl:value-of select="$booktitle" />,</xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="." />,
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="booktitle" mode="simple">
  <xsl:choose>
    <xsl:when test="@idref">
      <xsl:variable name="idref" select="@idref" />
      <xsl:value-of select="//*[@id=$idref]" />
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="." />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="item" mode="booktitle-etc-latex">
  <xsl:if test="booktitle">{\it <xsl:apply-templates select="booktitle" />} </xsl:if>
    <xsl:if test="series"><xsl:value-of select="series"/>, </xsl:if>
    <xsl:if test="eds">(<xsl:value-of select="eds"/> (Eds.)), </xsl:if>
    <xsl:if test="vol">Vol.<xsl:value-of select="vol"/>, </xsl:if>
    <xsl:if test="no">No.<xsl:value-of select="no"/>, </xsl:if>
    <xsl:if test="pp">pp.<xsl:value-of select="pp"/>, </xsl:if>
    <xsl:if test="pub"><xsl:value-of select="pub"/>, </xsl:if>
    <xsl:if test="month">
      <xsl:apply-templates select="month" mode="en"/> 
    </xsl:if>
    <xsl:value-of select="year"/>. 
</xsl:template>


<xsl:template match="item" mode="links">
  <xsl:for-each select="paperurl">
    <xsl:variable name="baseurl" select="/paperlist/@paper-baseurl"/>
    <xsl:variable name="url" select="."/>
    <xsl:variable name="fullurl" select="concat($baseurl, '/', $url)"/>
    [Paper in <a href="{$fullurl}"><xsl:value-of select="@type"/></a>]
  </xsl:for-each>
  <xsl:for-each select="slideurl">
    <xsl:variable name="baseurl" select="/paperlist/@slide-baseurl"/>
    <xsl:variable name="url" select="."/>
    <xsl:variable name="fullurl" select="concat($baseurl, '/', $url)"/>
    [Slide in <a href="{$fullurl}"><xsl:value-of select="@type"/></a>]
  </xsl:for-each>
  <xsl:for-each select="posterurl">
    <xsl:variable name="baseurl" select="/paperlist/@poster-baseurl"/>
    <xsl:variable name="url" select="."/>
    <xsl:variable name="fullurl" select="concat($baseurl, '/', $url)"/>
    [Poster in <a href="{$fullurl}"><xsl:value-of select="@type"/></a>]
  </xsl:for-each>
</xsl:template>

<xsl:template match="authors" mode="nameonly-comma">
  <xsl:variable name="lang" select="@lang|../@lang"/>
  <xsl:variable name="n" select="count(author)"/>
  <xsl:for-each select="author">
     <xsl:choose>
      <xsl:when test="@idref">
        <xsl:variable name="idref" select="@idref" />
        <xsl:variable name="author" select="//*[@id=$idref]" />
        <!--<xsl:variable name="author" select="id(@idref)" />-->
        <xsl:choose>
          <xsl:when test="$author/@href">
            <xsl:variable name="url" select="$author/@href" />
            <a href="{$url}"><xsl:value-of select="$author" /></a>
          </xsl:when>
          <xsl:when test="$author/@me='yes'">
            <u><xsl:value-of select="$author" /></u>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$author" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="@me='yes'">
            <u><xsl:value-of select="." /></u>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="." />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
      </xsl:choose>
    <!--
    <xsl:variable name="author" select=".|id(@id)"/>
    <xsl:if test="$author/@me='yes'">
      <u><xsl:copy-of select="$author/node()"/></u></xsl:if>
    <xsl:if test="$author/@me='no'">
      <xsl:copy-of select="$author/node()"/></xsl:if>-->
    <xsl:if test="$n - position() > 0">
      <xsl:choose>
        <xsl:when test="$n = 2 and $lang = 'en'">&#160;</xsl:when>
        <xsl:otherwise>, &#10;</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
<!--    <xsl:if test="$n - position() > 0">, &#10;</xsl:if>-->
<!--    <xsl:if test="$n - position() = 0">: &#10;</xsl:if>-->
    <xsl:if test="$n - position() = 1 and $lang = 'en'">and &#10;</xsl:if>
  </xsl:for-each>
</xsl:template>

<!-- temporary -->
<xsl:template match="authors" mode="tex">
  <xsl:variable name="lang" select="@lang|../@lang"/>
  <xsl:variable name="n" select="count(author)"/>
  <xsl:for-each select="author">
     <xsl:choose>
      <xsl:when test="@idref">
        <xsl:variable name="idref" select="@idref" />
        <xsl:variable name="author" select="//*[@id=$idref]" />
        <!--<xsl:variable name="author" select="id(@idref)" />-->
        <xsl:choose>
          <xsl:when test="$author/@href">
            <xsl:variable name="url" select="$author/@href" />
            <a href="{$url}"><xsl:value-of select="$author" /></a>
          </xsl:when>
          <xsl:when test="$author/@me='yes'">\underline{<xsl:value-of select="$author" />}</xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$author" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
         <!-- edited on 2016.09.26 -->
         <xsl:choose>
        <xsl:when test=".=/paperlist/@myname or .=/paperlist/@myname-e">\underline{<xsl:value-of select="." />}</xsl:when>
        <xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
         </xsl:choose>
      </xsl:otherwise>
      </xsl:choose>
    <!--
    <xsl:variable name="author" select=".|id(@id)"/>
    <xsl:if test="$author/@me='yes'">
      <u><xsl:copy-of select="$author/node()"/></u></xsl:if>
    <xsl:if test="$author/@me='no'">
      <xsl:copy-of select="$author/node()"/></xsl:if>-->
    <xsl:if test="$n - position() > 0">, &#10;</xsl:if>
<!--    <xsl:if test="$n - position() = 0">: &#10;</xsl:if>-->
    <xsl:if test="$n - position() = 1 and $lang = 'en'">and &#10;</xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template match="authors" mode="bibtex">
  <xsl:variable name="n" select="count(author)" />
  <xsl:for-each select="author">
     <xsl:choose>
      <xsl:when test="@idref">
        <xsl:variable name="idref" select="@idref" />
        <xsl:variable name="author" select="//*[@id=$idref]" />
        <xsl:value-of select="$author" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="." />
      </xsl:otherwise>
     </xsl:choose>
    <xsl:if test="$n - position() > 0"> and </xsl:if>
  </xsl:for-each>
</xsl:template>
    


<xsl:template match="month" mode="en">
  <xsl:if test=".='1'">January </xsl:if>
  <xsl:if test=".='2'">February </xsl:if>
  <xsl:if test=".='3'">March </xsl:if>
  <xsl:if test=".='4'">April </xsl:if>
  <xsl:if test=".='5'">May </xsl:if>
  <xsl:if test=".='6'">June </xsl:if>
  <xsl:if test=".='7'">July </xsl:if>
  <xsl:if test=".='8'">August </xsl:if>
  <xsl:if test=".='9'">September </xsl:if>
  <xsl:if test=".='10'">October </xsl:if>
  <xsl:if test=".='11'">November </xsl:if>
  <xsl:if test=".='12'">December </xsl:if>
</xsl:template>

</xsl:stylesheet>
