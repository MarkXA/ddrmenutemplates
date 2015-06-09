<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/*">
		<xsl:apply-templates select="root" />
	</xsl:template>
	<xsl:template match="root">
		<ul>
			<xsl:apply-templates select="node" />
		</ul>
	</xsl:template>
	<xsl:template match="node">
		<li>
			<xsl:attribute name="class">
				<xsl:if test="@first = 1">first</xsl:if>
				<xsl:if test="@last = 1"><xsl:text>&#32;</xsl:text>last</xsl:if>
				<xsl:if test="@selected = 1"><xsl:text>&#32;</xsl:text>selected</xsl:if>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="@enabled = 1">
					<a href="{@url}">
						<xsl:value-of select="@text" />
					</a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@text" />
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="node">
				<ul>
					<xsl:apply-templates select="node" />
				</ul>
			</xsl:if>
		</li>
	</xsl:template>
</xsl:stylesheet>
