<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

	<xsl:strip-space elements="*"/>
	<xsl:output indent="yes"/>

	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:key name="dups" match="Step[normalize-space(PlayBack__AppInfo_ExeName)]" use="concat(generate-id(..), '|', PlayBack__AppInfo_ExeName)"/>

	<xsl:template match="Step[normalize-space(PlayBack__AppInfo_ExeName)][not(generate-id() = generate-id(key('dups', concat(generate-id(..), '|', PlayBack__AppInfo_ExeName))[1]))]"/>

</xsl:stylesheet>