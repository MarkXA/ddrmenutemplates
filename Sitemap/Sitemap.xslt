<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="CSSClass">sitemap</xsl:param>
	<xsl:template match="/*">
		<xsl:apply-templates select="root" />
	</xsl:template>
	<xsl:template match="root">
		<div class="{$CSSClass}">
			<xsl:apply-templates select="node" mode="topLevel" />
		</div>
		<div style="clear:both"></div>
	</xsl:template>
	<xsl:template match="node" mode="topLevel">
		<ul>
			<li>
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
		</ul>
	</xsl:template>
	<xsl:template match="node">
		<li>
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