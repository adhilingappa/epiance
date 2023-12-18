<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<xsl:variable name="launch">Launch</xsl:variable>
	<xsl:variable name="attach">Attach</xsl:variable>
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<msxsl:using namespace="System.Collections.Generic" />
		<![CDATA[
		List<string> exeList = new List<string>();
		
		List<string> excludeClickList = new List<string>() {"SAPGuiMainWindow","SAPGuiPasswordField","SAPGuiOkCodeField"};
		
		public string shouldExcludeClick(string sapRole)
		{
			if(excludeClickList.Contains(sapRole))
			{
				return "true";
			}
			else
			{
				return "false";
			}
		}
		
		public void addExeToList(string exeName)
		{		
			if(!exeList.Contains(exeName)){
				exeList.Add(exeName);
				}
		}
		
		public string checkExeExists(string exeName)
		{
			if(exeList.Contains(exeName)){
				return "true";
				}
			else{
				return "false";
				}
		}
		
		public string guid(){
		string gi = Guid.NewGuid().ToString();
		return gi;
		}
		

		]]>
	</msxsl:script>
    <xsl:output method="xml" indent="yes"/>
	<xsl:variable name="action">Action</xsl:variable>
	 <xsl:template match="/">
		 <Document>
			 <xsl:copy-of select="Document/Meta"/>
			 <Process>

				 <xsl:for-each select="Document/Process/Step">

					 <xsl:choose>
						 <xsl:when test="PlayBack__GeneralInfo_AdaptorID='1' and PlayBack__AppInfo_ExeName!='chrome.exe' and PlayBack__AppInfo_ExeName!='iexplore.exe'">
						 <xsl:choose>
						 <xsl:when test="PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/Step_AdaptorID ='6'"> 
						 </xsl:when>
						 <xsl:when test="PlayBack__ControlInfo_Role!='title bar'">
								 <xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT'  or PlayBack__GeneralInfo_Event='KEYEVENT'">
									 <xsl:variable name="doesExeExists">
										 <xsl:value-of select="utils:checkExeExists(PlayBack__AppInfo_ExeName)"/>
									 </xsl:variable>

									 <xsl:if test="$doesExeExists='false'">
										 <xsl:element name="Step">
											 <Step_ID>
												 <xsl:value-of select="$attach"/>
											 </Step_ID>
											 <PlayBack__AppInfo_ExeName>
												 <xsl:value-of select="PlayBack__AppInfo_ExeName"/>
											 </PlayBack__AppInfo_ExeName>
											 <Step_Guid>
												 <xsl:value-of select="utils:guid()"/>
											 </Step_Guid>
										 </xsl:element>
									 </xsl:if>

									 <xsl:value-of select="utils:addExeToList(PlayBack__AppInfo_ExeName)"/>

									 <xsl:copy-of select="."/>
								 </xsl:if>
							 </xsl:when>
						 </xsl:choose> 
						 </xsl:when>
						 <xsl:when test="PlayBack__GeneralInfo_AdaptorID='3'">
							 <xsl:if test="PlayBack__ControlInfo_Role!='title bar'">
								 <xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT'  or PlayBack__GeneralInfo_Event='KEYEVENT'">
									 <xsl:choose>
										 <xsl:when test="PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/PlayBack__ControlInfo_Role = 'combo box'">

										 </xsl:when>
										 <xsl:otherwise>
											 <xsl:variable name="doesExeExists">
												 <xsl:value-of select="utils:checkExeExists(PlayBack__AppInfo_ExeName)"/>
											 </xsl:variable>

											 <xsl:if test="$doesExeExists='false'">
												 <xsl:element name="Step">
													 <Step_ID>
														 <xsl:value-of select="$attach"/>
													 </Step_ID>
													 <PlayBack__AppInfo_ExeName>
														 <xsl:value-of select="PlayBack__AppInfo_ExeName"/>
													 </PlayBack__AppInfo_ExeName>
													 <Step_Guid>
														 <xsl:value-of select="utils:guid()"/>
													 </Step_Guid>
												 </xsl:element>
											 </xsl:if>

											 <xsl:value-of select="utils:addExeToList(PlayBack__AppInfo_ExeName)"/>

											 <xsl:copy-of select="."/>
										 </xsl:otherwise>
									 </xsl:choose>
								 </xsl:if>
							 </xsl:if>
						 </xsl:when>

						 <xsl:when test="PlayBack__GeneralInfo_AdaptorID='12'">
							 <xsl:if test="PlayBack__ControlInfo_Role!='title bar'">
								 <xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT'  or PlayBack__GeneralInfo_Event='KEYEVENT'">
									 <xsl:choose>
										 <xsl:when test="PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/PlayBack__ControlInfo_Role = 'combo box'">

										 </xsl:when>

										 <xsl:otherwise>
											 <xsl:variable name="doesExeExists">
												 <xsl:value-of select="utils:checkExeExists(PlayBack__AppInfo_ExeName)"/>
											 </xsl:variable>

											 <xsl:if test="$doesExeExists='false'">
												 <xsl:element name="Step">
													 <Step_ID>
														 <xsl:value-of select="$attach"/>
													 </Step_ID>
													 <PlayBack__AppInfo_ExeName>
														 <xsl:value-of select="PlayBack__AppInfo_ExeName"/>
													 </PlayBack__AppInfo_ExeName>
													 <Step_Guid>
														 <xsl:value-of select="utils:guid()"/>
													 </Step_Guid>
												 </xsl:element>
											 </xsl:if>

											 <xsl:value-of select="utils:addExeToList(PlayBack__AppInfo_ExeName)"/>

											 <xsl:copy-of select="."/>
										 </xsl:otherwise>
									 </xsl:choose>
								 </xsl:if>
							 </xsl:if>
						 </xsl:when>

						 <xsl:when test="PlayBack__GeneralInfo_AdaptorID='6'">
							 <xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='DoubleClick' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT'">
								 <xsl:variable name="sapRole">
									 <xsl:value-of select="PlayBack__ControlInfo_Role"/>
								 </xsl:variable>
								 <xsl:variable name="shouldExclude">
									 <xsl:value-of select="utils:shouldExcludeClick($sapRole)"/>
								 </xsl:variable>
								 <xsl:choose>
									 <xsl:when test="PlayBack__GeneralInfo_Event='Click' and $shouldExclude='true'">

									 </xsl:when>
									 <xsl:otherwise>
										 <xsl:variable name="doesExeExists">
											 <xsl:value-of select="utils:checkExeExists(PlayBack__AppInfo_ExeName)"/>
										 </xsl:variable>

										 <xsl:if test="$doesExeExists='false'">
											 <xsl:element name="Step">
												 <Step_ID>
													 <xsl:value-of select="$attach"/>
												 </Step_ID>
												 <PlayBack__AppInfo_ExeName>
													 <xsl:value-of select="PlayBack__AppInfo_ExeName"/>
												 </PlayBack__AppInfo_ExeName>
												 <Step_Guid>
													 <xsl:value-of select="utils:guid()"/>
												 </Step_Guid>
											 </xsl:element>
										 </xsl:if>

										 <xsl:value-of select="utils:addExeToList(PlayBack__AppInfo_ExeName)"/>

										 <xsl:copy-of select="."/>
									 </xsl:otherwise>
								 </xsl:choose>
							 </xsl:if>
						 </xsl:when>

						 <xsl:when test="PlayBack__GeneralInfo_AdaptorID='2' and PlayBack__AppInfo_ExeName!='chrome.exe' and PlayBack__AppInfo_ExeName!='iexplore.exe'">
							 <xsl:if test="PlayBack__ControlInfo_Role!='title bar'">
								 <xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT'">
									 <xsl:variable name="doesExeExists">
										 <xsl:value-of select="utils:checkExeExists(PlayBack__AppInfo_ExeName)"/>
									 </xsl:variable>

									 <xsl:if test="$doesExeExists='false'">
										 <xsl:element name="Step">
											 <Step_ID>
												 <xsl:value-of select="$launch"/>
											 </Step_ID>
											 <PlayBack__AppInfo_ExeName>
												 <xsl:value-of select="PlayBack__AppInfo_ExeName"/>
											 </PlayBack__AppInfo_ExeName>
											 <Step_Guid>
												 <xsl:value-of select="utils:guid()"/>
											 </Step_Guid>
										 </xsl:element>
									 </xsl:if>

									 <xsl:value-of select="utils:addExeToList(PlayBack__AppInfo_ExeName)"/>

									 <xsl:copy-of select="."/>
								 </xsl:if>
							 </xsl:if>
						 </xsl:when>

						 <xsl:when test="PlayBack__GeneralInfo_AdaptorID='4'">
							 <xsl:if test="PlayBack__GeneralInfo_Event='TYPETEXT' or  PlayBack__GeneralInfo_Event = 'KEYEVENT'">
								 <xsl:variable name="doesExeExists">
									 <xsl:value-of select="utils:checkExeExists(PlayBack__AppInfo_ExeName)"/>
								 </xsl:variable>

								 <xsl:if test="$doesExeExists='false'">
									 <xsl:element name="Step">
										 <Step_ID>
											 <xsl:value-of select="$launch"/>
										 </Step_ID>
										 <PlayBack__AppInfo_ExeName>
											 <xsl:value-of select="PlayBack__AppInfo_ExeName"/>
										 </PlayBack__AppInfo_ExeName>
										 <Step_Guid>
											 <xsl:value-of select="utils:guid()"/>
										 </Step_Guid>
									 </xsl:element>
							 </xsl:if>
								 <xsl:value-of select="utils:addExeToList(PlayBack__AppInfo_ExeName)"/>

								 <xsl:copy-of select="."/>
							 </xsl:if>
						 </xsl:when>
					 </xsl:choose>


				 </xsl:for-each>
				 </Process>
	 </Document>
	</xsl:template>
</xsl:stylesheet>