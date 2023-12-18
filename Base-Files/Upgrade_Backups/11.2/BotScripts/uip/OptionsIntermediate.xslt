<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
  <msxsl:script implements-prefix='utils' language='CSharp'>
    <msxsl:using namespace="System.Collections.Generic" />
    <![CDATA[
    
	      IDictionary<string, string> elemts = new Dictionary<string, string>(){
											{"PlayBack--AppInfo-ExeName","EXE"},
											{"PlayBack--AppInfo-Path","Path"}
										
											
      };      
		
		
		public string checkExeExists(string exeName)
		{
			if(elemts.ContainsKey(exeName)){
				  return elemts[exeName];
				}
			else{
				  return "false";
				}
		}
		]]>
  </msxsl:script>
  <xsl:output method="xml" indent="yes"/>
  <xsl:variable name="action">Action</xsl:variable>
  <xsl:template match="/">

    <xsl:element name="options">
      <!--  <xsl:element name="type">
          <xsl:value-of select="'object'"/>
        </xsl:element>
        <xsl:element name="required">
          <xsl:value-of select="'false'"/>
        </xsl:element>
        <xsl:element name="properties">-->
      <xsl:for-each select="Document/Process/Step">
        <xsl:if test="PlayBack--ControlInfo-Role='editable text' and  PlayBack--GeneralInfo-Event='TYPETEXT' and PlayBack--GeneralInfo-SPKeyStatus!='17'">

          <xsl:variable name="stpName">
            <xsl:value-of select="concat('field_',Step-ID)"/>
          </xsl:variable>
          <xsl:element name="{$stpName}">
            <type>
              <xsl:value-of select="'text'"/>
            </type>
            <label>
              <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
            </label>
            <id>
              <xsl:value-of select="concat('field_',Step-ID)"/>
            </id>
            <validate>
              <xsl:value-of select="'true'"/>
            </validate>
            <disabled>
              <xsl:value-of select="'false'"/>
            </disabled>
            <showMessages>
              <xsl:value-of select="'true'"/>
            </showMessages>
            <data>
              <xsl:value-of select="'{}'"/>
            </data>
            <attributes>
              <xsl:value-of select="'{}'"/>
            </attributes>
            <allowOptionalEmpty>
              <xsl:value-of select="'true'"/>
            </allowOptionalEmpty>
            <fields>
              <xsl:value-of select="'{}'"/>
            </fields>
          </xsl:element>
        </xsl:if>


      </xsl:for-each>
      <!--  </xsl:element>-->
    </xsl:element>


  </xsl:template>
</xsl:stylesheet>