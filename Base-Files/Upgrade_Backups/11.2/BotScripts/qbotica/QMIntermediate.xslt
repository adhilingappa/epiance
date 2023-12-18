<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<msxsl:using namespace="System.Collections.Generic" />
		<![CDATA[
    
	      IDictionary<string, string> elemts = new Dictionary<string, string>(){
											{"PlayBack--AppInfo-ExeName","EXE"},
											{"PlayBack--AppInfo-Path","Path"},
											{"PlayBack--GeneralInfo-AdaptorID","browserType"},
											{"PlayBack--AppInfo-IEDocURL","url"},
											{"PlayBack--GeneralInfo-Event","actiontype"},
											{"PlayBack--AdditionalInfo-Web_ID","attrID"},
											{"PlayBack--ControlInfo-XPath","attrXpath"},
											{"PlayBack--ControlInfo-CSSPath","attrCSSPath"},
											{"PlayBack--ControlInfo-Role","Role"},
											{"PlayBack--ControlInfo-ControlName","locatorValueControlName"},
											{"PlayBack--ControlInfo-ControlData","value"},
											{"PlayBack--AppInfo-DialogName","windowTitle"},
											{"Standard--Control-Caption","windowLabel"},										{"PlayBack--ControlInfo-ClassName","locatorValueClassName"},
											{"PlayBack--GeneralInfo-MouseButton","button"},
											{"MSAA--Control--Location-Left","x"},
											{"MSAA--Control--Location-Top","y"},
											{"PlayBack--ControlInfo-IEControlAttributeTagName","tagName"},
											{"PlayBack--ControlInfo-IEControlClassName","className"}
											
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
		 <Document>
			 <xsl:copy-of select="Document/Meta"/>
			 <Process>
				 <xsl:for-each select="Document/Process/*">
           <xsl:choose>
               <xsl:when test="name()='GStep'">                
                     <xsl:copy-of select="."/>             
              </xsl:when>
               <xsl:otherwise>
                <Step>
					         <xsl:for-each select="*">												
									         <xsl:variable name="doesExeExists">
										         <xsl:value-of select="utils:checkExeExists(name())"/>
									         </xsl:variable>
                          <xsl:if test="$doesExeExists !='false'">
                              <xsl:element name="{$doesExeExists}">
                                    <xsl:value-of select="."/>
                              </xsl:element>
                          </xsl:if>
                    </xsl:for-each>
				        </Step>              
           </xsl:otherwise>
           </xsl:choose>        
         </xsl:for-each>
			 </Process>
	   </Document>
	</xsl:template>
</xsl:stylesheet>