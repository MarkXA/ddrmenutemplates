<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="ControlID" />
	<xsl:param name="Options" />
	<xsl:param name="CSSClass" />
  	<xsl:template match="/*">
    	<xsl:apply-templates select="root" />
	</xsl:template>

	<xsl:template match="root">
		<script type="text/javascript">
			jQuery(function($) {
			var options = { initialIndex: -1 };
			$.extend(options, { <xsl:apply-templates select="node" mode="breadcrumb" /> }, <xsl:value-of select="$Options" />);
				  $("#<xsl:value-of select="$ControlID" />").tabs(".toolsaccordion div.pane", options);
			});
		</script>
		<div id="{$ControlID}" class="L3NavHolder">
			<ul>
				<xsl:apply-templates select="node" />
			</ul>
		</div>
	</xsl:template>

	<xsl:template match="node" mode="breadcrumb">
		<xsl:if test="@breadcrumb = 1">initialIndex: <xsl:value-of select="position() - 1" /></xsl:if>
	</xsl:template>

	<xsl:template match="node">
		<li>
			<!-- class opening -->
			<xsl:attribute name="class">
                <xsl:if test="@breadcrumb = 1">
                    <xsl:text>active</xsl:text>
	            </xsl:if>
	        </xsl:attribute>
	        <xsl:choose>
                <xsl:when test="@enabled = 1">
        	<!-- class /opening -->
					<a href="{@url}">
						<xsl:if test="@target">
							<xsl:attribute name="target"><xsl:value-of select="@target" /></xsl:attribute>
						</xsl:if>
						<!-- class opening -->
						<xsl:attribute name="class">
			                <xsl:if test="@breadcrumb = 1">
			                    <xsl:text>active</xsl:text>
				            </xsl:if>
				        </xsl:attribute>
				        <xsl:choose>
			                <xsl:when test="@enabled = 1">
	                	<!-- class /opening -->
								<xsl:value-of select="@text" />
						<!-- class ending -->
							</xsl:when>
			                <xsl:otherwise>
			                    <xsl:value-of select="@text"></xsl:value-of>
		            		</xsl:otherwise>
		            	</xsl:choose>
		            	<!-- class /ending -->
					</a>
			<!-- class ending -->
				</xsl:when>
           		<xsl:otherwise>
                	<xsl:value-of select="@text"></xsl:value-of>
                </xsl:otherwise>
        	</xsl:choose>
        	<!-- class /ending -->

        	<!-- Secondary Child links -->
			<ul class="pane">
				<!-- class opening -->
				<xsl:attribute name="class">
	                <xsl:if test="@breadcrumb = 0">
	                    <xsl:text>pane inactive</xsl:text>
		            </xsl:if>
		        </xsl:attribute>
	        	<xsl:choose>
	                <xsl:when test="@enabled = 1">
        		<!-- class /opening -->
						<li>
							<xsl:apply-templates select="node" mode="sub">
								<xsl:with-param name="level" select="1" />
							</xsl:apply-templates>
							<!-- Tertiary Child links -->
							<ul class="pane">
								<!-- class opening -->
								<xsl:attribute name="class">
					                <xsl:if test="@breadcrumb = 0">
					                    <xsl:text>pane inactive</xsl:text>
						            </xsl:if>
						        </xsl:attribute>
					        	<xsl:choose>
					                <xsl:when test="@enabled = 1">
				        		<!-- class /opening -->
										<li>
											<xsl:apply-templates select="node" mode="sub">
												<xsl:with-param name="level" select="2" />
											</xsl:apply-templates>
										</li>
								<!-- class ending -->
									</xsl:when>
					           		<xsl:otherwise>
					                	<xsl:value-of select="@text"></xsl:value-of>
					                </xsl:otherwise>
				        		</xsl:choose>
				        		<!-- class /ending -->
							</ul>
							<!-- /Tertiary Child links -->
						</li>
				<!-- class ending -->
					</xsl:when>
	           		<xsl:otherwise>
	                	<xsl:value-of select="@text"></xsl:value-of>
	                </xsl:otherwise>
        		</xsl:choose>
        		<!-- class /ending -->
			</ul>
			<!-- /SecondarChild links -->
		</li>
	</xsl:template>

	<xsl:template match="node" mode="sub">
		<xsl:param name="level" />
		<xsl:choose>
			<xsl:when test="@enabled = 0">
				<div>
					<xsl:call-template name="indent">
						<xsl:with-param name="level" select="$level" />
					</xsl:call-template>
					<xsl:value-of select="@text" />
				</div>
			</xsl:when>
			<xsl:otherwise>
				<a class="" href="{@url}">
					<xsl:if test="@target">
						<xsl:attribute name="target"><xsl:value-of select="@target" /></xsl:attribute>
					</xsl:if>
					<!-- class opening -->
					<xsl:attribute name="class">
		                <xsl:if test="@breadcrumb = 1">
		                    <xsl:text>active</xsl:text>
			            </xsl:if>
			        </xsl:attribute>
			        <xsl:choose>
		                <xsl:when test="@enabled = 1">
                	<!-- class /opening -->
						<xsl:call-template name="indent">
							<xsl:with-param name="level" select="$level" />
						</xsl:call-template>
						<xsl:value-of select="@text" />
					<!-- class ending -->
				</xsl:when>
           		<xsl:otherwise>
                	<xsl:value-of select="@text"></xsl:value-of>
                </xsl:otherwise>
        	</xsl:choose>
        	<!-- class /ending -->
				</a>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node" mode="sub">
			<xsl:with-param name="level" select="$level + 1" />
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
