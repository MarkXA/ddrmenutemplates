<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="ControlID" />
	<xsl:param name="Options" />
	<xsl:param name="subMenuColumns">3</xsl:param>
	<xsl:param name="subpointer"><![CDATA[&raquo;&nbsp;]]></xsl:param>
	<xsl:param name="pointer"><![CDATA[&nbsp;&raquo;]]></xsl:param>
	<xsl:param name="startUl"><![CDATA[<ul>]]></xsl:param>
	<xsl:param name="endUl"><![CDATA[</ul>]]></xsl:param>
	<xsl:template match="/*">
		<xsl:apply-templates select="root" />
	</xsl:template>
	<xsl:template match="root">
		<script type="text/javascript">
			jQuery(document).ready(function() {
				splitSubMenu(<xsl:value-of select="$subMenuColumns"/>);
			});
		</script>
		<ul class="megamenu" id="megamenu">
			<xsl:apply-templates select="node">
				<xsl:with-param name="level" select="0"/>
			</xsl:apply-templates>
		</ul>
	</xsl:template>
	<xsl:template match="node">
		<xsl:param name="level" />
		<xsl:choose>
			<xsl:when test="$level=0">
				<li>
					<xsl:attribute name="class">
						level0 <xsl:if test="@breadcrumb = 1">current</xsl:if>
					</xsl:attribute>
					<a>
						<xsl:attribute name="class">
							level0 <xsl:if test="@breadcrumb = 1">current</xsl:if>
						</xsl:attribute>
						<xsl:choose>
							<xsl:when test="@enabled = 1">
								<xsl:attribute name="href">
									<xsl:value-of select="@url"/>
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="href">#</xsl:attribute>
								<xsl:attribute name="onclick">return false</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="@text" />
						<xsl:if test="node">
							<xsl:value-of select="$pointer" disable-output-escaping="yes"/>
						</xsl:if>
					</a>
					<xsl:if test="node">
						<div class="sub">
							<xsl:apply-templates select="node">
								<xsl:with-param name="level" select="$level + 1" />
							</xsl:apply-templates>

						</div>

					</xsl:if>
				</li>
			</xsl:when>
			<xsl:when test="$level=1">
				<ul class="megamenusubcontent">
					<li class="subheader">
						<h2>
							<a>
								<xsl:choose>
									<xsl:when test="@enabled = 1">
										<xsl:attribute name="href">
											<xsl:value-of select="@url"/>
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="href">#</xsl:attribute>
										<xsl:attribute name="onclick">return false</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:value-of select="@text" />
							</a>
						</h2>
					</li>
					<xsl:if test="node">
						<xsl:apply-templates select="node">
							<xsl:with-param name="level" select="$level + 1" />
						</xsl:apply-templates>
					</xsl:if>
				</ul>
			</xsl:when>
			<xsl:otherwise>
				<li class="sublink">
					<a>
						<xsl:choose>
							<xsl:when test="@enabled = 1">
								<xsl:attribute name="href">
									<xsl:value-of select="@url"/>
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="href">#</xsl:attribute>
								<xsl:attribute name="onclick">return false</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<span>
							<xsl:value-of select="$subpointer" disable-output-escaping="yes"/>
						</span>
						<xsl:value-of select="@text" />
					</a>
				</li>
				<xsl:if test="node">
					<xsl:apply-templates select="node">
						<xsl:with-param name="level" select="$level + 1" />
					</xsl:apply-templates>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
