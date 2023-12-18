<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<xsl:variable name="launch">Launch</xsl:variable>
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
						 <xsl:when test="PlayBack--GeneralInfo-AdaptorID='1' and PlayBack--AppInfo-ExeName!='chrome.exe' and PlayBack--AppInfo-ExeName!='iexplore.exe'">
							 <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
								 <xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
									 <xsl:variable name="doesExeExists">
										 <xsl:value-of select="utils:checkExeExists(PlayBack--AppInfo-ExeName)"/>
									 </xsl:variable>

									 <xsl:if test="$doesExeExists='false'">
										 <xsl:element name="Step">
											 <Step-ID>
												 <xsl:value-of select="$launch"/>
											 </Step-ID>
											 <PlayBack--AppInfo-ExeName>
												 <xsl:value-of select="PlayBack--AppInfo-ExeName"/>
											 </PlayBack--AppInfo-ExeName>
											 <Step-Guid>
												 <xsl:value-of select="utils:guid()"/>
											 </Step-Guid>
										 </xsl:element>
									 </xsl:if>

									 <xsl:value-of select="utils:addExeToList(PlayBack--AppInfo-ExeName)"/>

									 <xsl:copy-of select="."/>
								 </xsl:if>
							 </xsl:if>
						 </xsl:when>
						 <xsl:when test="PlayBack--GeneralInfo-AdaptorID='3'">
							 <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
								 <xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
									 <xsl:choose>
										 <xsl:when test="PlayBack--ControlInfo-Role='list item' and preceding-sibling::Step[1]/PlayBack--ControlInfo-Role = 'combo box'">

										 </xsl:when>
										 <xsl:otherwise>
											 <xsl:variable name="doesExeExists">
												 <xsl:value-of select="utils:checkExeExists(PlayBack--AppInfo-ExeName)"/>
											 </xsl:variable>

											 <xsl:if test="$doesExeExists='false'">
												 <xsl:element name="Step">
													 <Step-ID>
														 <xsl:value-of select="$launch"/>
													 </Step-ID>
													 <PlayBack--AppInfo-ExeName>
														 <xsl:value-of select="PlayBack--AppInfo-ExeName"/>
													 </PlayBack--AppInfo-ExeName>
													 <Step-Guid>
														 <xsl:value-of select="utils:guid()"/>
													 </Step-Guid>
												 </xsl:element>
											 </xsl:if>

											 <xsl:value-of select="utils:addExeToList(PlayBack--AppInfo-ExeName)"/>

											 <xsl:copy-of select="."/>
										 </xsl:otherwise>
									 </xsl:choose>
								 </xsl:if>
							 </xsl:if>
						 </xsl:when>

						 <xsl:when test="PlayBack--GeneralInfo-AdaptorID='12'">
							 <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
								 <xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
									 <xsl:choose>
										 <xsl:when test="PlayBack--ControlInfo-Role='list item' and preceding-sibling::Step[1]/PlayBack--ControlInfo-Role = 'combo box'">

										 </xsl:when>

										 <xsl:otherwise>
											 <xsl:variable name="doesExeExists">
												 <xsl:value-of select="utils:checkExeExists(PlayBack--AppInfo-ExeName)"/>
											 </xsl:variable>

											 <xsl:if test="$doesExeExists='false'">
												 <xsl:element name="Step">
													 <Step-ID>
														 <xsl:value-of select="$launch"/>
													 </Step-ID>
													 <PlayBack--AppInfo-ExeName>
														 <xsl:value-of select="PlayBack--AppInfo-ExeName"/>
													 </PlayBack--AppInfo-ExeName>
													 <Step-Guid>
														 <xsl:value-of select="utils:guid()"/>
													 </Step-Guid>
												 </xsl:element>
											 </xsl:if>

											 <xsl:value-of select="utils:addExeToList(PlayBack--AppInfo-ExeName)"/>

											 <xsl:copy-of select="."/>
										 </xsl:otherwise>
									 </xsl:choose>
								 </xsl:if>
							 </xsl:if>
						 </xsl:when>

						 <xsl:when test="PlayBack--GeneralInfo-AdaptorID='6'">
							 <xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='DoubleClick' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
								 <xsl:variable name="sapRole">
									 <xsl:value-of select="PlayBack--ControlInfo-Role"/>
								 </xsl:variable>
								 <xsl:variable name="shouldExclude">
									 <xsl:value-of select="utils:shouldExcludeClick($sapRole)"/>
								 </xsl:variable>
								 <xsl:choose>
									 <xsl:when test="PlayBack--GeneralInfo-Event='Click' and $shouldExclude='true'">

									 </xsl:when>
									 <xsl:otherwise>
										 <xsl:variable name="doesExeExists">
											 <xsl:value-of select="utils:checkExeExists(PlayBack--AppInfo-ExeName)"/>
										 </xsl:variable>

										 <xsl:if test="$doesExeExists='false'">
											 <xsl:element name="Step">
												 <Step-ID>
													 <xsl:value-of select="$launch"/>
												 </Step-ID>
												 <PlayBack--AppInfo-ExeName>
													 <xsl:value-of select="PlayBack--AppInfo-ExeName"/>
												 </PlayBack--AppInfo-ExeName>
												 <Step-Guid>
													 <xsl:value-of select="utils:guid()"/>
												 </Step-Guid>
											 </xsl:element>
										 </xsl:if>

										 <xsl:value-of select="utils:addExeToList(PlayBack--AppInfo-ExeName)"/>

										 <xsl:copy-of select="."/>
									 </xsl:otherwise>
								 </xsl:choose>
							 </xsl:if>
						 </xsl:when>

						 <xsl:when test="PlayBack--GeneralInfo-AdaptorID='2' and PlayBack--AppInfo-ExeName!='chrome.exe' and PlayBack--AppInfo-ExeName!='iexplore.exe'">
							 <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
								 <xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
									 <xsl:variable name="doesExeExists">
										 <xsl:value-of select="utils:checkExeExists(PlayBack--AppInfo-ExeName)"/>
									 </xsl:variable>

									 <xsl:if test="$doesExeExists='false'">
										 <xsl:element name="Step">
											 <Step-ID>
												 <xsl:value-of select="$launch"/>
											 </Step-ID>
											 <PlayBack--AppInfo-ExeName>
												 <xsl:value-of select="PlayBack--AppInfo-ExeName"/>
											 </PlayBack--AppInfo-ExeName>
											 <Step-Guid>
												 <xsl:value-of select="utils:guid()"/>
											 </Step-Guid>
										 </xsl:element>
									 </xsl:if>

									 <xsl:value-of select="utils:addExeToList(PlayBack--AppInfo-ExeName)"/>

									 <xsl:copy-of select="."/>
								 </xsl:if>
							 </xsl:if>
						 </xsl:when>

						 <xsl:when test="PlayBack--GeneralInfo-AdaptorID='4'">
							 <xsl:if test="PlayBack--GeneralInfo-Event='TYPETEXT' or  PlayBack--GeneralInfo-Event = 'KEYEVENT'">
								 <xsl:variable name="doesExeExists">
									 <xsl:value-of select="utils:checkExeExists(PlayBack--AppInfo-ExeName)"/>
								 </xsl:variable>

								 <xsl:if test="$doesExeExists='false'">
									 <xsl:element name="Step">
										 <Step-ID>
											 <xsl:value-of select="$launch"/>
										 </Step-ID>
										 <PlayBack--AppInfo-ExeName>
											 <xsl:value-of select="PlayBack--AppInfo-ExeName"/>
										 </PlayBack--AppInfo-ExeName>
										 <Step-Guid>
											 <xsl:value-of select="utils:guid()"/>
										 </Step-Guid>
									 </xsl:element>
							 </xsl:if>
								 <xsl:value-of select="utils:addExeToList(PlayBack--AppInfo-ExeName)"/>

								 <xsl:copy-of select="."/>
							 </xsl:if>
						 </xsl:when>
					 </xsl:choose>


				 </xsl:for-each>
				 </Process>
	 </Document>
	</xsl:template>
</xsl:stylesheet>