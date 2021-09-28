<?xml version="1.0" encoding="UTF-8" ?>
<!--<?xml version="1.0" encoding="ISO-2022-JP" ?>-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="UTF-8"/>

<xsl:template match="/paperlist" >
  <html>
    <head>
      <title>
        <xsl:value-of select="@myname" /> 
        研究業績
        <xsl:if test="@note">
          （<xsl:value-of select="@note" />）
        </xsl:if>
      </title>
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
      <!-- HEADER -->
      <h1>
        研究業績 (Publication List)
        <xsl:if test="@note">
          （<xsl:value-of select="@note" />）
        </xsl:if>
      </h1>
      <h3>
        <xsl:value-of select="@myname" /> 
         / 
        <xsl:value-of select="@myname-e" />
      </h3>
      <hr/>
      <!-- THESIS -->
      <xsl:if test="item[@type='th']">
          <h3>学位論文 (Thesis)</h3>
          <ul>
            <xsl:apply-templates select="item[@type='th']">
              <xsl:sort select="year" data-type="number" order="descending"/>
              <xsl:sort select="month" data-type="number" order="descending"/>
            </xsl:apply-templates>
          </ul>
      </xsl:if>
      <!-- BOOK CHAPTERS -->
      <xsl:if test="item[@type='bc']">
        <h3>章分担 (Book Chapters) </h3>
        <ul>
          <xsl:apply-templates select="item[@type='bc']">
            <xsl:sort select="year" data-type="number" order="descending" />
            <xsl:sort select="month" data-type="number" order="descending" />
          </xsl:apply-templates>
        </ul>
      </xsl:if>     
      <!-- JOURNAL PAPERS (lang=jp) -->
      <xsl:if test="item[@type='jj' or @type='ij']">
          <h3>学術論文 (Journal Papers)</h3>
          <ul>
            <xsl:apply-templates select="item[@type='jj' or @type='ij' or @type='lt']">
              <xsl:sort select="year" data-type="number" order="descending"/>
              <xsl:sort select="month" data-type="number" order="descending"/>
            </xsl:apply-templates>
          </ul>
      </xsl:if>
      <!-- INTERNATIONAL CONFERENCE PAPERS -->
      <xsl:if test="item[@type='ic' or @type='ln']">
        <h3>国際会議 (International Conference Proceedings)</h3>
        <ul>
          <xsl:apply-templates select="item[@type='ic' or @type='ln']">
            <xsl:sort select="year" data-type="number" order="descending"/>
            <xsl:sort select="month" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </ul>
      </xsl:if>
      <!-- DOMESTIC PAPERS -->
      <xsl:if test="item[@type='dr']">
          <h3>国内学会 (Domestic Proceedings)</h3>
          <ul>
            <xsl:apply-templates select="item[@type='dr' or @type='dt' or @type='dc']">
              <xsl:sort select="year" data-type="number" order="descending" />
              <xsl:sort select="month" data-type="number" order="descending" />
            </xsl:apply-templates>
          </ul>
      </xsl:if>
      <xsl:if test="item[@type='rv']">
         <h3>解説記事</h3>
        <ul>
          <xsl:apply-templates select="item[@type='rv']">
            <xsl:sort select="year" data-type="number" order="descending" />
            <xsl:sort select="month" data-type="number" order="descending" />
          </xsl:apply-templates>
        </ul>
      </xsl:if>

<xsl:if test="item[@type='tr']">
<h3>翻訳</h3>
<ul>
  <xsl:apply-templates select="item[@type='tr']">
    <xsl:sort select="year" data-type="number" order="descending" />
    <xsl:sort select="month" data-type="number" order="descending" />
  </xsl:apply-templates>
</ul>
</xsl:if>
 <xsl:if test="item[@type='iv']">
   <h3>招待講演・パネルディスカッションなど</h3>
   <ul>
   <xsl:apply-templates select="item[@type='iv']">
     <xsl:sort select="year" data-type="number" order="descending" />
     <xsl:sort select="month" data-type="number" order="descending" />
   </xsl:apply-templates>
   </ul>
 </xsl:if>
      <xsl:if test="item[@type='pt']">
        <h3>特許</h3>
        <ul>
          <xsl:apply-templates select="item[@type='pt']" mode="pre" />
        </ul>
      </xsl:if>
      <xsl:if test="item[@type='gr']">
        <h3>助成金</h3>
        <ul>
          <xsl:apply-templates select="item[@type='gr']" mode="pre" />
        </ul>
      </xsl:if>
      <xsl:if test="item[@type='sc']">
        <h3><a name="society">学会活動</a></h3>
        <ul>
          <xsl:apply-templates select="item[@type='sc']" mode="pre" />
        </ul>
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
<!--    <xsl:apply-templates select="." mode="links"/>-->
    <xsl:if test="award">
      <em class="red-bold">(<xsl:value-of select="award"/>)</em>
    </xsl:if>
    <xsl:if test="note">(<xsl:value-of select="note"/>)</xsl:if>
  </li>
</xsl:template>

<xsl:template match="item" mode="pre">
  <li>
    <xsl:if test="text">
      <xsl:copy-of select="text" />
    </xsl:if>
  </li>
</xsl:template>

<xsl:include href="paperlistcommon4A.xsl"/>

</xsl:stylesheet>
