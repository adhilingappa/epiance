<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	<!-- AutoSecurityKeys.xml -->
	<xsl:template match="//Epiplex500">
		<xsl:element name="CaptureHomeSettings">
			<xsl:attribute name="maskDataUsingSensDataFormat">
                        <xsl:value-of
				select="Preferences/@ConsiderFieldDataRules">
				</xsl:value-of>
                  </xsl:attribute>

			<xsl:attribute name="createAndApplyRulesInstantly">
                  <xsl:value-of
				select="Preferences/@FieldNameRuleOptions">
                  </xsl:value-of>
                  </xsl:attribute>
		</xsl:element>
	</xsl:template>
	<!-- ExclusionFilterPreferences.xml -->
	<xsl:template match="//Epiplex">
		<xsl:element name="CaptureHomeSettings">

			<xsl:attribute name="IsApplyAllRulesDuringOpen_NoiseAndNavigation">
                        <xsl:value-of
				select="Preference/StraySteps/@IsApplyAllRulesDuringOpen">
			        	</xsl:value-of>
                  </xsl:attribute>

			<xsl:attribute name="NoiseNewRule">
                  <xsl:value-of
				select="Preference/StraySteps/Evt[@Id='174']">
                  </xsl:value-of>
                  </xsl:attribute>

			<xsl:attribute name="NavigationNewRule">
                  <xsl:value-of
				select="Preference/NavigationSteps/Evt[@Id='38']">
                  </xsl:value-of>
                  </xsl:attribute>

		</xsl:element>
	</xsl:template>
    
    
    <!-- STTSettings.xml -->
     <xsl:template match="//STTSettings">
		<xsl:element name="ProcessEditor">
			<xsl:attribute name="CredentialFiles">
                        <xsl:value-of
				select="EngineSetting/Engine/CredentialsFile">
				</xsl:value-of>
                  </xsl:attribute>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
