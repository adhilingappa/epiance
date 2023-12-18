<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
  <xsl:output method="xml" indent="no" omit-xml-declaration="yes"/>

  <xsl:variable name="num0">0</xsl:variable>
  <xsl:variable name="num1">1</xsl:variable>
  <xsl:variable name="num2">2</xsl:variable>
  <xsl:variable name="num3">3</xsl:variable>
  <xsl:variable name="num12">12</xsl:variable>
  <xsl:variable name="num15">15</xsl:variable>

  <xsl:variable name="PRT">0.0.0.0.0</xsl:variable>
  <xsl:variable name="true">True</xsl:variable>
  <xsl:variable name="false">False</xsl:variable>
  <xsl:variable name="SW_NORMAL">SW_NORMAL</xsl:variable>
  <xsl:variable name="SW_SHOWMAXIMIZED">SW_SHOWMAXIMIZED</xsl:variable>

  <xsl:variable name="IEFrame">IEFrame</xsl:variable>

  <xsl:variable name="ieExe">C:\Program Files\Internet Explorer\iexplore.exe</xsl:variable>

  <msxsl:script implements-prefix='utils' language='CSharp'>
    <![CDATA[
		int index = 1;
		
		public int getIndex(){
			return ++index;
		}
		]]>
  </msxsl:script>

  <xsl:template match="/">
    <WIN ID="1" PRT="0.0.0.0.0">
      <HDL>0</HDL>
      <TLE>Login | Salesforce - Internet Explorer</TLE>
      <WCL>IEFrame</WCL>
      <APAT>C:\Program Files\Internet Explorer\iexplore.exe</APAT>
      <ICHD>False</ICHD>
      <LOC ID="1" X="0" Y="0" />
      <SIZ ID="1" WDT="0" HGT="0" />
      <STA ID="1" NAM="SW_SHOWMAXIMIZED" />
      <RES ID="1" WDT="0" HGT="0" />
    </WIN>
    <xsl:for-each select="Document/Process/Step">
      <xsl:element name="WIN">
        <xsl:attribute name="ID">
          <xsl:value-of select="utils:getIndex()"/>
        </xsl:attribute>
        <xsl:attribute name="PRT">
          <xsl:value-of select="$PRT"/>
        </xsl:attribute>
        <HDL>0</HDL>
        <xsl:element name="TLE">
          <xsl:value-of select="PlayBack--AppInfo-DialogName"/>
        </xsl:element>
        <xsl:element name="WCL">
          <!--<xsl:value-of select="$IEFrame"/>-->
        </xsl:element>
        <xsl:element name="APAT">
          <xsl:value-of select="concat(PlayBack--AppInfo-Path,'\',PlayBack--AppInfo-ExeName)"/>
        </xsl:element>
        <xsl:element name="ICHD">
          <xsl:value-of select="$false"/>
        </xsl:element>
        <xsl:element name="LOC">
          <xsl:attribute name="ID">
            <xsl:value-of select="$num1"/>
          </xsl:attribute>
          <xsl:attribute name="X">
            <xsl:value-of select="$num0"/>
          </xsl:attribute>
          <xsl:attribute name="Y">
            <xsl:value-of select="$num0"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="SIZ">
          <xsl:attribute name="ID">
            <xsl:value-of select="$num1"/>
          </xsl:attribute>
          <xsl:attribute name="WDT">
            <xsl:value-of select="$num0"/>
          </xsl:attribute>
          <xsl:attribute name="HGT">
            <xsl:value-of select="$num0"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="STA">
          <xsl:attribute name="ID">
            <xsl:value-of select="$num1"/>
          </xsl:attribute>
          <xsl:attribute name="NAM">
            <xsl:value-of select="$SW_SHOWMAXIMIZED"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="RES">
          <xsl:attribute name="ID">
            <xsl:value-of select="$num1"/>
          </xsl:attribute>
          <xsl:attribute name="WDT">
            <xsl:value-of select="$num0"/>
          </xsl:attribute>
          <xsl:attribute name="HGT">
            <xsl:value-of select="$num0"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
