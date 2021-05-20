<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:template match="/paperlist" >
    <xsl:apply-templates 
        select="item[@type='th']" 
        mode="phdthesis"/>
    <xsl:apply-templates 
        select="item[@type='jj' or @type='ij' or @type='lt' or @type='ln'
                or @type='rv' or @type='tr']" 
        mode="article"/>
    <xsl:apply-templates
        select="item[@type='ic' or @type='dv' or @item='dt' or @type='dc']"
        mode="inproceedings"/>
    <xsl:apply-templates
        select="item[@type='bc']" 
        mode="incollection" />
  </xsl:template>

  <xsl:template match="item" mode="phdthesis">
    @phdthesis{<xsl:value-of select="@id" />,
      author = {<xsl:apply-templates select="authors" mode="bibtex" />},
      title = {<xsl:value-of select="translate(title, '&amp;', '\&amp;')" />},
      school = {<xsl:value-of select="series" />},
      month　= {<xsl:apply-templates select="month" mode="en" />},
      year = {<xsl:value-of select="year" />}
    }
  </xsl:template>

  <xsl:template match="item" mode="article">
    @article{<xsl:value-of select="@id" />,
      author = {<xsl:apply-templates select="authors" mode="bibtex" />},
      title = {<xsl:value-of select="translate(title, '&amp;' , '\&amp;')" />},
      journal = {<xsl:apply-templates select="booktitle" mode="simple"/>},
      series = {<xsl:value-of select="series" />},
      volume = {<xsl:value-of select="vol" />},
      number = {<xsl:value-of select="no" />},
      pages = {<xsl:value-of select="pp" />},
      month = {<xsl:apply-templates select="month" mode="en" />},
      year = {<xsl:value-of select="year" />}
    }
  </xsl:template>

  <xsl:template match="item" mode="inproceedings">
    @inproceedings{<xsl:value-of select="@id" />,
      author = {<xsl:apply-templates select="authors" mode="bibtex" />},
      title = {<xsl:value-of select="translate(title, '&amp;' , '\&amp;')" />},
      booktitle = {<xsl:apply-templates select="booktitle" mode="simple"/>},
      series = {<xsl:value-of select="series" />},
      volume = {<xsl:value-of select="vol" />},
      number = {<xsl:value-of select="no" />},
      pages = {<xsl:value-of select="pp" />},
      month = {<xsl:apply-templates select="month" mode="en" />},
      year = {<xsl:value-of select="year" />}
    }
  </xsl:template>

  <xsl:template match="item" mode="incollection">
    @incollection{<xsl:value-of select="@id" />,
      author = {<xsl:apply-templates select="authors" mode="bibtex" />},
      title = {<xsl:value-of select="translate(title, '&amp;' , '\&amp;')" />},
      booktitle = {<xsl:apply-templates select="booktitle" mode="simple"/>},
      series = {<xsl:value-of select="series" />},
      volume = {<xsl:value-of select="vol" />},
      number = {<xsl:value-of select="no" />},
      pages = {<xsl:value-of select="pp" />},
      publisher = {<xsl:value-of select="pub" />},
      month = {<xsl:apply-templates select="month" mode="en" />},
      year = {<xsl:value-of select="year" />}
    }
  </xsl:template>

  <xsl:include href="paperlistcommon.xsl" />

</xsl:stylesheet>

