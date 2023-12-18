<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <xsl:element name="Document">
      <xsl:for-each select="Document/node()">
        <xsl:choose>
          <xsl:when test="starts-with(name(),'Process')">
            <xsl:call-template name="Process.creategroups"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="self::*"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  <xsl:template name="Process.creategroups">
    <xsl:element name="Process">
      <xsl:for-each select="child::node()">
        <xsl:choose>
          <xsl:when test="starts-with(name(),'Step') and ./PlayBack--GeneralInfo-Event='WindowActivate'">
            <xsl:element name="GStep">
              <xsl:attribute name="DialogName">
                <xsl:value-of select="@DialogName"/>
              </xsl:attribute>             
                <xsl:copy-of select="child::*"/>
              <xsl:variable name="childCount">
                <xsl:value-of select="(following-sibling::Step[PlayBack--GeneralInfo-Event='WindowActivate'])[1]/Step-ID"/>
              </xsl:variable>
              <xsl:for-each select="following-sibling::Step[number(Step-ID) &lt; $childCount]">
                <xsl:copy-of select="self::*"/>              
              </xsl:for-each>
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
