<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />

	<!-- CaptureSettings.xml -->
	<xsl:template match="//Settingss">
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
	<!-- KeyClubbing.xml -->
	<xsl:template match="//KeyClubbing">
		<xsl:element name="CaptureSettings">
			<xsl:attribute name="EnableClipboard">
                  <xsl:value-of
				select="General/@EnableClipboard">
                  </xsl:value-of>
                  </xsl:attribute>
		</xsl:element>
	</xsl:template>
	<!-- AdaptorInfo.xml -->
	<xsl:template match="//Settings">
		<xsl:element name="CaptureSettings">
			<xsl:attribute name="IncludeEXE">
                  <xsl:value-of
				select="ProcessedEventAdaptor/Adaptor1/Type1/@IncludedExe">
                  </xsl:value-of>
                  </xsl:attribute>
		</xsl:element>
	</xsl:template>
	<!-- ImageSettings.xml -->
	<xsl:template match="//ImagePreferences">
		<xsl:element name="CaptureSettings">
			<xsl:attribute name="GreyScaleImg">
                  <xsl:value-of
				select="GeneralPreferences/@GreyScaleImg">
                  </xsl:value-of>
                  </xsl:attribute>
		</xsl:element>
	</xsl:template>

    <!-- UserSettings.xml -->
	<xsl:template match="//Epiplex">
		<xsl:element name="ProcessEditor">
			<xsl:attribute name="RTLMode">
    <xsl:value-of
				select="HKEY_LOCAL_MACHINE/SOFTWARE/GuruInc/GPS/key[@name ='RTLMode']/@value"></xsl:value-of>
    </xsl:attribute>
		</xsl:element>
	</xsl:template>
	
	<!-- ClawAdaptpr.xml -->
	<xsl:template match="//Claw_Level_Adaptor">
		<xsl:element name="CaptureSettings">
			<xsl:attribute name="AppName">
                  <xsl:value-of
				select="AppBased/Info[@AppName='TESTING.EXE']/@AppName">
                  </xsl:value-of>
                  </xsl:attribute>
		</xsl:element>
	</xsl:template>
	<!-- DialogRules.xml -->
	<xsl:template match="//Rules">
		<xsl:element name="CaptureSettings">
			<xsl:attribute name="AmoutRuleEnable">
                  <xsl:value-of
				select="Application/Rule[@Name='Amount']/@Enable">
                  </xsl:value-of>
                  </xsl:attribute>

			<xsl:attribute name="RulesEncryptionEnable">
                  <xsl:value-of
				select="Encryption/@Enable">
                  </xsl:value-of>
                  </xsl:attribute>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>
