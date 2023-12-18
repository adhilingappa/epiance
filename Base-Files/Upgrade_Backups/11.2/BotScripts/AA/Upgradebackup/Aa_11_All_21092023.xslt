<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<xsl:import href="Aa_11_Msaa.xslt"/>
	<xsl:import href="Aa_11_Ie.xslt"/>
	<xsl:import href="Aa_11_Chrome.xslt"/>
	<xsl:import href="Aa_11_Java.xslt"/>
	<xsl:import href="Aa_11_SAP.xslt"/>
	
    <xsl:output method="xml" indent="no"/>
	
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
		int index1 = 1;
		
		public int getIndex1(){
			return ++index1;
		}
		]]>
  </msxsl:script>


    <xsl:template match="/">
		<xsl:for-each select="Document/Process/Step">
		<xsl:choose>
			<xsl:when test="PlayBack--GeneralInfo-AdaptorID='1'">			  
				<xsl:call-template name="mainMsaaTemplate" >
				<xsl:with-param name="index" select="utils:getIndex1()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="PlayBack--GeneralInfo-AdaptorID='3'">			  
				<xsl:call-template name="mainIeTemplate" >
				<xsl:with-param name="index" select="utils:getIndex1()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="PlayBack--GeneralInfo-AdaptorID='12'">			  
				<xsl:call-template name="mainChromeTemplate" >
				<xsl:with-param name="index" select="utils:getIndex1()"/>
				</xsl:call-template>
			</xsl:when>
		<xsl:when test="PlayBack--GeneralInfo-AdaptorID='2'">			  
				<xsl:call-template name="mainJavaTemplate" >
				<xsl:with-param name="index" select="utils:getIndex1()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="PlayBack--GeneralInfo-AdaptorID='6'">			  
				<xsl:call-template name="mainSAPTemplate" >
				<xsl:with-param name="index" select="utils:getIndex1()"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
		</xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
