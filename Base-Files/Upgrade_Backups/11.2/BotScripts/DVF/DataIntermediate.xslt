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
		public string removeQuotes(string controldata)
		{
		string tmpData=controldata;
			if(tmpData!="")
			{
			 // tmpData=tmpData.Replace('\'','\'');
              tmpData = tmpData.Replace("'", "\\'").Replace("\"", "\\\"");
			}
			return tmpData;
		}
		]]>
  </msxsl:script>
  <xsl:output method="xml" indent="yes"/>
  <xsl:variable name="action">Action</xsl:variable>
  <xsl:template match="/">

    <xsl:element name="dataObj">     
      <xsl:for-each select="Document/Process/Step">
        <xsl:if test="(PlayBack__ControlInfo_Role='editable text' or PlayBack__ControlInfo_Role='SAPGuiTextField' or PlayBack__ControlInfo_Role='text') and  PlayBack__GeneralInfo_Event='TYPETEXT' and PlayBack__GeneralInfo_SPKeyStatus!='17'">

          <xsl:variable name="stpName">
            <xsl:value-of select="concat('field_',Step_ID)"/>
          </xsl:variable>
          <xsl:element name="{$stpName}">
				<xsl:variable name="GpsId">
						<xsl:value-of select="/Document/Meta/GpsId"/>
				</xsl:variable>

			<xsl:if test="/Document/Meta/DefaultData ='true'">
				<xsl:value-of select="utils:removeQuotes(PlayBack__ControlInfo_ControlData)"/> 
			 </xsl:if>
			 <xsl:if test="Document/Meta/DefaultData !='true'">
				<xsl:value-of select="''"/> 
			 </xsl:if>
                       
          </xsl:element>
        </xsl:if>


      </xsl:for-each>
      <!--  </xsl:element>-->
    </xsl:element>


  </xsl:template>
</xsl:stylesheet>