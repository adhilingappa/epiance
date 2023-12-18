<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="//Settings">
		<xsl:element name="CaptureSettings">
			<xsl:attribute name="GPSSaveMode">
                        <xsl:value-of
				select="Save/@GPSSaveMode">
			        	</xsl:value-of>
                  </xsl:attribute>

			<xsl:attribute name="CleanUpAterSave">
                  <xsl:value-of
				select="Save/@CleanUpAterSave">
                  </xsl:value-of>
                  </xsl:attribute>

			<xsl:attribute name="URLBasedCaptureEnable">
                  <xsl:value-of
				select="URLBasedCapture/@Enable">
                  </xsl:value-of>
                  </xsl:attribute>

			<xsl:attribute name="URLBasedCaptureURL">
            <xsl:value-of select="URLBasedCapture/@URL">
               </xsl:value-of>
            </xsl:attribute>

			<xsl:attribute name="MaskAllTypeTexts">
            <xsl:value-of
				select="GlobalPwds/@MaskAllTypeTexts">
                 </xsl:value-of></xsl:attribute>


			<xsl:attribute name="considertitleorheaderasdialogname">
             <xsl:value-of
				select="BrowserSettings/prf/general/considertitleorheaderasdialogname">
             </xsl:value-of></xsl:attribute>

			<xsl:attribute name="GlobalAliasNameControlName">
             <xsl:value-of
				select="GlobalAliasName/Rule/@ControlName">
             </xsl:value-of>
             </xsl:attribute>

			<xsl:attribute name="GlobalAliasName">
             <xsl:value-of
				select="GlobalAliasName/Rule/@AliasName">
             </xsl:value-of></xsl:attribute>

		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
