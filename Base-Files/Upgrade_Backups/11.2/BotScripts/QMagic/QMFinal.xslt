<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

  <xsl:output indent="yes"/>
  <xsl:mode on-no-match="shallow-copy"/>
	<xsl:template match="*">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="*">
		<xsl:copy-of select="."/>
	</xsl:template>
</xsl:stylesheet>