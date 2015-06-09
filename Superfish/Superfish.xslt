<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="ControlID" />
	<xsl:param name="Options" />
  <xsl:template match="/*">
    <xsl:apply-templates select="root" />
  </xsl:template>
  <xsl:template match="root">
		<script type="text/javascript">
			jQuery(function($) {
				$("#<xsl:value-of select="$ControlID" />").superfish(
					<xsl:value-of select="$Options" />
				);
			});
		</script>
		<ul class="sf-menu" id="{$ControlID}">
			<xsl:apply-templates select="node" />
		</ul>
	</xsl:template>
	<xsl:template match="node">
    <li>
      <xsl:if test="@breadcrumb = 1">
        <xsl:attribute name="class">current</xsl:attribute>
      </xsl:if>
      <a>
        <xsl:choose>
          <xsl:when test="@enabled = 1">
            <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="href">#</xsl:attribute>
            <xsl:attribute name="onclick">return false</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="@text" />
      </a>
      <xsl:if test="node">
        <ul>
          <xsl:apply-templates select="node" />
        </ul>
      </xsl:if>
    </li>
  </xsl:template>
</xsl:stylesheet>
