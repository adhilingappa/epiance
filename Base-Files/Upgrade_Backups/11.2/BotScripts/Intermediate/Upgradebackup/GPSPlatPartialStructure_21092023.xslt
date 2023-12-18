<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils">
	<xsl:output method="xml" indent="yes"/>
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
			public string guid(){
				string gi = Guid.NewGuid().ToString();
				return gi;
				}
				
				
				bool isValidFormNodes =false;
				public void ValidateFormAtttibute(string RoleVale,string EventVal)
				{
				    try
					{
					  if(isValidFormNodes == false)
					  {
						  if(EventVal=="TYPETEXT")
						  {
								if(RoleVale=="editable text" || RoleVale=="SAPGuiTextField" || RoleVale=="text" )
								   isValidFormNodes= true;
						  }
					  }
					 	
					}
					catch(Exception er)
					{
							isValidFormNodes= false;
					}
				}
				
				public bool getData()
				{
				return isValidFormNodes;
				}
				
				public string getActionName(string controlName)
				{
					string actionName = "";
					actionName = controlName;
					actionName = actionName.Replace("\\t"," "); //replace tab with space
					return actionName;
				}
				
				
		]]>
	</msxsl:script>
	<!--Flat intermediate BluePrism 1 date:15/05/2020 DD/MM/YYYY-->
	<xsl:output method="xml" indent="yes"/>
	<xsl:param name="GPS_NAME"/>
	<xsl:param name="ImagePath"/>
	<xsl:param name="RepositoryPath"/>
	<xsl:param name="IsDvf"/>
	<xsl:param name="IsValidForm"/>
	<xsl:param name="DefaultData"/>
	<xsl:param name="wndWait"/>
	<xsl:variable name="nodes">PlayBack Sentence Standard MSAA ImageStore</xsl:variable>
	<!--only mention immediate child nodes of Step-->
	<xsl:variable name="StepNodeAttributes">Version ActiveChannelID AdaptorID AliasName Guid ParentID IsStrayStep SecDefHashCode</xsl:variable>
	<xsl:variable name="StepFormNodeAttributes">editable text </xsl:variable>
	<!--only specify step attributes-->
	<xsl:template match="/">
		<Document>
			<Process>
				<xsl:for-each select="WorkFlow/*">
					<xsl:choose>
						<xsl:when test="name()='GroupStep'">
							<xsl:element name="GStep">
								<xsl:attribute name="ID">
									<xsl:value-of select="@ID"/>
								</xsl:attribute>
								<xsl:attribute name="DialogName">
									<xsl:value-of select="@Caption"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:when test="name()='Step'">
							<xsl:choose>
								<xsl:when test="@IsStrayStep='1'"></xsl:when>
								  <xsl:when test="PlayBack/GeneralInfo/@Event='ExcludeEvent'  or
								  PlayBack/GeneralInfo/@Event='SystemLockEvent' or
								  PlayBack/GeneralInfo/@Event='CDTData' or
								  PlayBack/GeneralInfo/@Event='CDTDefiner'"></xsl:when>								 
								<xsl:otherwise>
									<xsl:value-of select="utils:ValidateFormAtttibute(PlayBack/ControlInfo/@Role,PlayBack/GeneralInfo/@Event)"/>
									<xsl:element name="Step">
										<xsl:attribute name="DialogName">
											<xsl:value-of select="PlayBack/AppInfo/@DialogName"/>
										</xsl:attribute>
										<xsl:for-each select="@*">
											<!--<xsl:if test="(name() = 'ID') or (name() = 'Version') or (name() = 'ActiveChannelID') or (name() = 'AdaptorID') or (name() = 'AliasName') or (name() = 'Guid')">  -->
											<xsl:if test="contains($StepNodeAttributes,name())">
												<xsl:element name="{concat('Step_',name())}">
													<!--Get all attributes of Step element-->
													<xsl:value-of select="."/>
												</xsl:element>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="node()">
											<!--forEach immediate child element of Step element-->
											<xsl:variable name="parentName">
												<xsl:value-of select="name()"/>
											</xsl:variable>
											<!--<xsl:if test="($parentName='PlayBack') or ($parentName='Sentence')">  -->
											<xsl:if test="contains($nodes,$parentName)">
												<xsl:for-each select="@*">
													<xsl:element name="{concat($parentName,'_',name())}">
														<xsl:value-of select="."/>
													</xsl:element>
												</xsl:for-each>
												<xsl:call-template name="buildElementTemplate">
													<xsl:with-param name="parentName">
														<xsl:value-of select="$parentName"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<!--Additional guids for blue prism -->
										<xsl:element name="Additional_guid1">
											<xsl:value-of select="utils:guid()"/>
										</xsl:element>
										<xsl:element name="Additional_guid2">
											<xsl:value-of select="utils:guid()"/>
										</xsl:element>
										<xsl:element name="Additional_guid3">
											<xsl:value-of select="utils:guid()"/>
										</xsl:element>
										<xsl:element name="actionNameForBp">
											<xsl:value-of select="utils:getActionName(PlayBack/ControlInfo/@ControlName)"/>
										</xsl:element>
										<xsl:element name="IsGlobalTemplateDefined">
											<xsl:value-of select="'false'"/>
										</xsl:element>
										<!--<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"><xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/></xsl:element><xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"><xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/></xsl:element><xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_NAME"><xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_NAME"/></xsl:element><xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID"><xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID"/></xsl:element><xsl:element name="BP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"><xsl:value-of select="PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/></xsl:element><xsl:element name="BP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"><xsl:value-of select="PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/></xsl:element><xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_CLASSNAME"><xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_CLASSNAME"/></xsl:element><xsl:element name="BP_PlayBack__AdditionalInfo_UIA_CLASSNAME"><xsl:value-of select="PlayBack__AdditionalInfo_UIA_CLASSNAME"/></xsl:element><xsl:element name="BP_PlayBack__AdditionalInfo_UIA_ACCESSKEY"><xsl:value-of select="PlayBack__AdditionalInfo_UIA_ACCESSKEY"/></xsl:element>-->
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</Process>
			<Meta>
				<GpsFile>
					<xsl:value-of select="$GPS_NAME"/>
				</GpsFile>
				<GpsId>
					<xsl:value-of select="WorkFlow/Header/Summary/@GPSID"/>
				</GpsId>
				<ExePath>
					<xsl:value-of select="concat(WorkFlow/Header/TAPS/TAP/@Path,'\',WorkFlow/Header/TAPS/TAP/@EXEName)"/>
				</ExePath>
				<ImagePath>
					<xsl:value-of select="$ImagePath"/>
				</ImagePath>
				<RepositoryPath>
					<xsl:value-of select="$RepositoryPath"/>
				</RepositoryPath>
				<IsDvf>
					<xsl:value-of select="$IsDvf"/>
				</IsDvf>
				<IsValidForm>
					<xsl:value-of select="utils:getData()"/>
				</IsValidForm>
				<DefaultData>
					<xsl:value-of select="$DefaultData"/>
				</DefaultData>
				<wndWait>
					<xsl:value-of select="$wndWait"/>
				</wndWait>
			</Meta>
		</Document>
	</xsl:template>
	<xsl:template name="buildElementTemplate">
		<!--Recursive template-->
		<xsl:param name="parentName"/>
		<xsl:if test="*">
			<xsl:for-each select="node()">
				<xsl:variable name="elementName">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="elementNameFinalWithoutAttribute">
					<xsl:value-of select="concat($parentName,'__',$elementName)"/>
				</xsl:variable>
				<xsl:for-each select="@*">
					<xsl:element name="{concat($elementNameFinalWithoutAttribute,'_',name())}">
						<xsl:value-of select="."/>
					</xsl:element>
				</xsl:for-each>
				<xsl:if test="*">
					<xsl:call-template name="buildElementTemplate">
						<xsl:with-param name="parentName">
							<xsl:value-of select="$elementNameFinalWithoutAttribute"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
