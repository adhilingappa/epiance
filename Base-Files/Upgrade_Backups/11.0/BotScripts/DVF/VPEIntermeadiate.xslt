<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:safe="http://www.esa.int/safe/sentinel-1.0"
                xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
                >
  <msxsl:script implements-prefix='utils' language='CSharp'>
    <msxsl:using namespace="System.Collections.Generic" />
    <![CDATA[
    
    public string removeSpecialCharacters(string data)
    {
      //  string eonFileName = Regex.Replace(data, "[*@&'-.:(\\s)<>#|/~`]", "");
        string eonFileName = Regex.Replace(data, @"\W+", "");
        return eonFileName;
    }
    
    
    ]]>
    
  </msxsl:script>
  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
  <xsl:template match="/">
    <xsl:element name="Step">
    <xsl:for-each select="Document/Process/Step">
      <xsl:if test="(PlayBack__ControlInfo_Role='editable text' or PlayBack__ControlInfo_Role='SAPGuiTextField' or PlayBack__ControlInfo_Role='text') and  PlayBack__GeneralInfo_Event='TYPETEXT' and PlayBack__GeneralInfo_SPKeyStatus!='17'">
       
         <xsl:element name="MapInfo">
          <xsl:variable name="stpName">
            <xsl:value-of select="concat('field_',Step_ID)" />
          </xsl:variable>
          <xsl:element name="sourceID">
            <xsl:value-of select="''" />
          </xsl:element>
          <xsl:element name="eon">
            <xsl:value-of select="concat(utils:removeSpecialCharacters(concat(PlayBack__ControlInfo_ControlName,PlayBack__GeneralInfo_Event,Step_ID)),'.eon')" />
          </xsl:element>
          <xsl:element name="className">
            <xsl:value-of select="concat('Class',utils:removeSpecialCharacters(concat(PlayBack__ControlInfo_ControlName,PlayBack__GeneralInfo_Event,Step_ID)))"/>
          </xsl:element>
          <xsl:element name="ModelName">
            <xsl:value-of select="''" />
          </xsl:element>
          <xsl:element name="data">
            <xsl:element name="ModelField">
              <xsl:value-of select="PlayBack__GeneralInfo__Model__Properties_Name" />
            </xsl:element>
            <xsl:element name="ModelRowID">
              <xsl:value-of select="'1'" />
            </xsl:element>
            <xsl:element name="dataSource">
              <xsl:value-of select="concat('formObj.','field_',Step_ID)"/>
            </xsl:element>
            <xsl:element name="TransformRequired">
              <xsl:value-of select="'false'" />
            </xsl:element>
            <xsl:element name="TransformVariable">
              <xsl:value-of select="''" />
            </xsl:element>
            <xsl:element name="TransformData">
              <xsl:value-of select="''" />
            </xsl:element>
          </xsl:element>
        </xsl:element>
     
    </xsl:if>
    </xsl:for-each>
  </xsl:element>
  </xsl:template>
</xsl:stylesheet>