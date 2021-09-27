<?xml version="1.0" encoding="ISO-2022-JP" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="ISO-2022-JP"/>

<xsl:template match="/" >
  <html>
    <head>
      <title></title>
      <style>
        body {
          text-align:	justify;
          line-height:	125%;
        }
        li {
          margin-bottom: 1mm;
        }
        em.red-bold {
          font-style:	normal;
          font-weight:	bold;
          color:	red;
        }
        a {
          text-decoration: none;
        }
      </style>
    </head>
    <body>
      <h1><xsl:value-of select="/paperlist/@myname-e"/>'s Publication List</h1>
      (English papers only except journal papers)
      <hr/>
      <xsl:if test="paperlist/item[@type='jj' or @type='ij'][@lang='en']">
        <h3>Journal Papers</h3>
        <ol>
          <xsl:apply-templates select="paperlist/item[@type='jj' or @type='ij'][@lang='en']">
            <xsl:sort select="year" data-type="number" order="descending"/>
            <xsl:sort select="month" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </ol>
      </xsl:if>
      <xsl:if test="paperlist/item[@type='jj'][@lang='jp']">
        <h3>Journal Papers (in Japanese)</h3>
        <ol>
          <xsl:apply-templates select="paperlist/item[@type='jj'][@lang='jp']">
            <xsl:sort select="year" data-type="number" order="descending"/>
            <xsl:sort select="month" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </ol>
      </xsl:if>
      <xsl:if test="paperlist/item[@type='ln'][@lang='en']">
        <h3>Lecture Notes etc.</h3>
        <ol>
          <xsl:apply-templates select="paperlist/item[@type='ln'][@lang='en']">
            <xsl:sort select="year" data-type="number" order="descending"/>
            <xsl:sort select="month" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </ol>
      </xsl:if>
      <xsl:if test="paperlist/item[@type='ic']">
        <h3>International Papers</h3>
        <ol>
          <xsl:apply-templates select="paperlist/item[@type='ic']">
            <xsl:sort select="year" data-type="number" order="descending"/>
            <xsl:sort select="month" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </ol>
      </xsl:if>
      <hr/>
    </body>
  </html>
</xsl:template>

<xsl:template match="item">
  <li>
    <xsl:if test="author-pattern-ref">
      <xsl:apply-templates select="author-pattern-ref" mode="nameonly-comma"/>:
    </xsl:if>
    <xsl:if test="authors">
      <xsl:apply-templates select="authors" mode="nameonly-comma"/>: 
    </xsl:if>
    "<xsl:value-of select="title"/>", 
    <xsl:apply-templates select="." mode="booktitle-etc"/>
    <xsl:apply-templates select="." mode="links"/>
    <xsl:if test="award">
      <em class="red-bold">（<xsl:value-of select="award"/>）</em>
    </xsl:if>
    <xsl:if test="note">（<xsl:value-of select="note"/>）</xsl:if>
  </li>
</xsl:template>

<xsl:include href="paperlistcommon.xsl"/>

</xsl:stylesheet>