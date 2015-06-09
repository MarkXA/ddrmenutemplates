<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:param name="ControlID" />
  <xsl:param name="CSSClass" />
  <xsl:template match="/*">
    <xsl:apply-templates select="root" />
  </xsl:template>
  <xsl:template match="root">
    <xsl:if test="node">
      <select id="{$ControlID}" class="{$CSSClass}" onchange="if (this.value) location.href=this.value">
        <xsl:apply-templates select="node">
          <xsl:with-param name="level" select="0"/>
        </xsl:apply-templates>
      </select>
    </xsl:if>
  </xsl:template>
  <xsl:template match="node">
    <xsl:param name="level"/>
    <option title="{description}">
      <xsl:attribute name="value">
        <xsl:if test="@enabled = 1">
          <xsl:value-of select="@url"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:if test="@selected = 1">
        <xsl:attribute name="selected">selected</xsl:attribute>
      </xsl:if>
      <xsl:call-template name="indent">
        <xsl:with-param name="level" select="$level" />
      </xsl:call-template>
      <xsl:value-of select="@text"/>
    </option>
    <xsl:apply-templates select="node">
      <xsl:with-param name="level" select="$level + 1"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template name="indent">
    <xsl:param name="level" />
    <xsl:if test="$level &gt; 0">
      &#160;&#160;<xsl:call-template name="indent">
        <xsl:with-param name="level" select="$level - 1" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>