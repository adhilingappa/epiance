<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/">
		<xsl:element name="ExclusionFilterPreference">
			<xsl:call-template name="ExclusionFilter">
			</xsl:call-template>
		</xsl:element>
	</xsl:template>

	<xsl:template name="ExclusionFilter">
		<xsl:element name="CaptureSettings">
			<xsl:attribute name="Name">
				<xsl:value-of
				select="nlog/variable[1]/@name" />
			</xsl:attribute>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
