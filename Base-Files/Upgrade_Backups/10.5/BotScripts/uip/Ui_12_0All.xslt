<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:safe="http://www.esa.int/safe/sentinel-1.0"
                xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib"
                exclude-result-prefixes="msxsl"
>
	<!--All UiPath Final 3-->
	<!--Jun-12-2020-V2m-->
	
	<xsl:import href="Uibot_12_0Msaa.xslt"/>
	<xsl:import href="Uibot_12_0Ie.xslt"/>
	<xsl:import href="Uibot_12_0Chrome.xslt"/>
	<xsl:import href="Uibot_12_0SAP.xslt"/>
	<xsl:import href="Uibot_12_0Java.xslt"/>
<xsl:import href="Uibot_12_0Image.xslt"/>	
    <xsl:output method="xml" indent="yes"/>
	
    <xsl:template match="/">
		<Activity mc:Ignorable="sap sap2010" x:Class="BtmClick" mva:VisualBasic.Settings="{x:Null}" sap:VirtualizedContainerService.HintSize="438,390" sap2010:WorkflowViewState.IdRef="BtmClick_1" xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">
			<xsl:call-template name="startTemplateMsaa"/>
			<xsl:element name="Sequence">
			<xsl:for-each select="Document/Process/Step">
				<xsl:choose>
						<xsl:when test="PlayBack--GeneralInfo-IsCitrix='1'">							
								<xsl:call-template name="clickTemplateImage"></xsl:call-template>
						</xsl:when>
					<xsl:when test="PlayBack--GeneralInfo-AdaptorID='1' or PlayBack--GeneralInfo-AdaptorID='9'">
						

							<xsl:choose>
								<xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event = 'Select'">

									<xsl:choose>

										<xsl:when test="(PlayBack--ControlInfo-Role='push button') or (PlayBack--ControlInfo-Role='menu item') or (PlayBack--ControlInfo-Role='list item') or (PlayBack--ControlInfo-Role='page tab') or (PlayBack--ControlInfo-Role='title bar')">
											<xsl:call-template name="clickTemplateMsaa"/>
										</xsl:when>

										<xsl:when test="(PlayBack--ControlInfo-Role='check box') or (PlayBack--ControlInfo-Role='radio button')">
											<xsl:call-template name="checkTemplateMsaa" />
										</xsl:when>

										<xsl:when test="(PlayBack--AdditionalInfo-UIA_LOCALIZED_CONTROL_TYPE='combo box')">
											<xsl:variable name="prevStepAdpID">
													<xsl:value-of select="preceding-sibling::Step[1]/PlayBack--GeneralInfo-AdaptorID"/>
											</xsl:variable>	
											<xsl:if test="$prevStepAdpID!='6'">
													<xsl:call-template name="selectTemplateMsaa" />
											</xsl:if>	
																						
										</xsl:when>

										<xsl:otherwise>
										  <xsl:variable name="prevStepAdpID">
											<xsl:value-of select="preceding-sibling::Step[1]/PlayBack--GeneralInfo-AdaptorID"/>
										  </xsl:variable>
											<xsl:if test="$prevStepAdpID!='6'">
												<xsl:call-template name="clickTemplateMsaa"></xsl:call-template>
											</xsl:if>
									   </xsl:otherwise>
									</xsl:choose>

								</xsl:when>

							    <xsl:when test="PlayBack--GeneralInfo-Event = 'KEYEVENT' or ( PlayBack--GeneralInfo-Event = 'TYPETEXT' and Standard--Control-TypedKey_En='V' and PlayBack--GeneralInfo-SPKeyStatus='17')">
									<xsl:call-template name="sendHotKeyTemplateMsaa"/>
								</xsl:when>
								
							    <xsl:when test="PlayBack--GeneralInfo-Event = 'TYPETEXT'">
									<xsl:call-template name="typeIntoTemplateMsaa" />
								</xsl:when>


							</xsl:choose>

						
					</xsl:when>
					<xsl:when test="PlayBack--GeneralInfo-AdaptorID='3'">

							<xsl:choose>
								<xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event = 'Select'">

									<xsl:choose>
										
										<xsl:when test="(PlayBack--ControlInfo-Role='combo box') or (PlayBack--ControlInfo-Role = 'list item' and PlayBack--ControlInfo-IEControlAttributeTagName='SELECT')">
											<xsl:call-template name="selectTemplateIe" />
										</xsl:when>

										<xsl:when test="(PlayBack--ControlInfo-Role='push button') or (PlayBack--ControlInfo-Role='menu item') or (PlayBack--ControlInfo-Role='list item') or (PlayBack--ControlInfo-Role='page tab') or (PlayBack--ControlInfo-Role='title bar')">
											<xsl:call-template name="clickTemplateIe"/>
										</xsl:when>

										<xsl:when test="(PlayBack--ControlInfo-Role='check box') or (PlayBack--ControlInfo-Role='radio button')">
											<xsl:call-template name="clickTemplateIe" />
										</xsl:when>

										<xsl:otherwise>
											<xsl:call-template name="clickTemplateIe" />
										</xsl:otherwise>

									</xsl:choose>

								</xsl:when>

								<xsl:when test="PlayBack--GeneralInfo-Event = 'KEYEVENT' or ( PlayBack--GeneralInfo-Event = 'TYPETEXT' and Standard--Control-TypedKey_En='V' and PlayBack--GeneralInfo-SPKeyStatus='17')">
									<xsl:call-template name="sendHotKeyTemplateMsaa"/>
								</xsl:when>

								<xsl:when test="PlayBack--GeneralInfo-Event = 'TYPETEXT'">
									<xsl:call-template name="sendHotKeyTemplateIe" />
								</xsl:when>

							</xsl:choose>
					</xsl:when>
					<xsl:when test="PlayBack--GeneralInfo-AdaptorID='12'">
						
								<xsl:choose>
									<xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event = 'Select'">

										<xsl:choose>

											<xsl:when test="(PlayBack--ControlInfo-Role='push button') or (PlayBack--ControlInfo-Role='menu item') or (PlayBack--ControlInfo-Role='list item') or (PlayBack--ControlInfo-Role='page tab') or (PlayBack--ControlInfo-Role='title bar')">
												<xsl:call-template name="clickTemplateChrome"/>
											</xsl:when>

											<xsl:when test="(PlayBack--ControlInfo-Role='check box') or (PlayBack--ControlInfo-Role='radio button')">
												<xsl:call-template name="clickTemplateChrome" />
											</xsl:when>

											<xsl:when test="(PlayBack--ControlInfo-Role='combo box')">
												<xsl:call-template name="selectTemplateChrome" />
											</xsl:when>

											<xsl:otherwise>
												<xsl:call-template name="clickTemplateChrome" />
											</xsl:otherwise>

										</xsl:choose>

									</xsl:when>

									<xsl:when test="PlayBack--GeneralInfo-Event = 'KEYEVENT' or ( PlayBack--GeneralInfo-Event = 'TYPETEXT' and Standard--Control-TypedKey_En='V' and PlayBack--GeneralInfo-SPKeyStatus='17')">
									<xsl:call-template name="sendHotKeyTemplateMsaa"/>
								</xsl:when>

									<xsl:when test="PlayBack--GeneralInfo-Event = 'TYPETEXT'">
										<xsl:call-template name="sendHotKeyTemplateChrome" />
									</xsl:when>

								</xsl:choose>

						
					</xsl:when>
					<xsl:when test="PlayBack--GeneralInfo-AdaptorID='6'">
						<xsl:choose>
							<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">
								  <xsl:call-template name="TypeTemplateSAP"></xsl:call-template>
							</xsl:when>
							<xsl:when test="PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='Click'">               
								  <xsl:if test="PlayBack--ControlInfo-Role!='list'">
									  <xsl:if test="PlayBack--ControlInfo-Role='SAPGuiComboBox'">
											<xsl:call-template name="selectTemplateSAP"></xsl:call-template>  
									  </xsl:if>									 
									  <xsl:if test="PlayBack--ControlInfo-Role!='SAPGuiComboBox'">
										 <xsl:call-template name="clickTemplateSAP"></xsl:call-template>  
									  </xsl:if>	
								  </xsl:if>								  			              
							</xsl:when>
							<xsl:when test="PlayBack--GeneralInfo-Event='DoubleClick'">
								<xsl:call-template name="DoubleclickTemplateSAP"></xsl:call-template> 
							</xsl:when>
							<xsl:when test="PlayBack--GeneralInfo-Event='KEYEVENT'">               
								  <xsl:call-template name="sendHotKeyTemplateSAP"></xsl:call-template>               
							</xsl:when> 
						</xsl:choose>
					</xsl:when>
					<xsl:when test="PlayBack--GeneralInfo-AdaptorID='2'">
						<xsl:choose>
							<xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event = 'Select'">

								<xsl:choose>

									<xsl:when test="(PlayBack--ControlInfo-Role='push button') or (PlayBack--ControlInfo-Role='menu item') or (PlayBack--ControlInfo-Role='list item') or (PlayBack--ControlInfo-Role='page tab') or (PlayBack--ControlInfo-Role='title bar')">
										<xsl:call-template name="clickTemplateJava"/>
									</xsl:when>

									<xsl:when test="(PlayBack--ControlInfo-Role='check box') or (PlayBack--ControlInfo-Role='radio button')">
										<xsl:call-template name="clickTemplateJava" />
									</xsl:when>

									<xsl:when test="PlayBack--ControlInfo-Role='combo box' or PlayBack--ControlInfo-Role='list'">
										<xsl:call-template name="selectTemplateJava" />
									</xsl:when>

									<xsl:otherwise>
										<xsl:call-template name="clickTemplateJava" />
									</xsl:otherwise>

								</xsl:choose>

							</xsl:when>

							<xsl:when test="PlayBack--GeneralInfo-Event = 'KEYEVENT' or ( PlayBack--GeneralInfo-Event = 'TYPETEXT' and Standard--Control-TypedKey_En='V' and PlayBack--GeneralInfo-SPKeyStatus='17')">
									<xsl:call-template name="sendHotKeyTemplateMsaa"/>
								</xsl:when>

							<xsl:when test="PlayBack--GeneralInfo-Event = 'TYPETEXT'">
								<xsl:call-template name="sendHotKeyTemplateJava" />
							</xsl:when>

						</xsl:choose>
					</xsl:when>
				</xsl:choose>
				
			</xsl:for-each>
			</xsl:element>
		</Activity>
    </xsl:template>
</xsl:stylesheet>
