<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
  <msxsl:script implements-prefix='utils' language='CSharp'>
    <msxsl:using namespace="System.Collections.Generic" />
    <![CDATA[
    
	      IDictionary<string, string> elemts = new Dictionary<string, string>(){
											{"PlayBack__AppInfo-ExeName","EXE"},
											{"PlayBack__AppInfo-Path","Path"}
										
											
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
  <xsl:template match="/">  
         <xsl:element name="Variables">    
      <xsl:for-each select="Document/Process/Step">
        <xsl:if test="(PlayBack__ControlInfo_Role='editable text' or PlayBack__ControlInfo_Role='SAPGuiTextField' or PlayBack__ControlInfo_Role='text') and  PlayBack__GeneralInfo_Event='TYPETEXT' and PlayBack__GeneralInfo_SPKeyStatus!='17'"><xsl:element name="Variables">
				<xsl:element name="VarName">
							<xsl:value-of select="concat('field_',Step_ID)"/>         
				</xsl:element>
				<xsl:element name="Type">
					<xsl:value-of select="'text'"/>         
				</xsl:element> 
          </xsl:element>
        </xsl:if>
      </xsl:for-each>
    </xsl:element> 
  </xsl:template>
</xsl:stylesheet>