<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:safe="http://www.esa.int/safe/sentinel-1.0" xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils">
	<xsl:import href="Uibot_12_0Msaa.xslt"/>
	<msxsl:script implements-prefix="utils" language="C#">
		<msxsl:using namespace="System.Text.RegularExpressions"/>
    <![CDATA[ 
	string RepoPath=@"C:\Users\Public\Documents\Epiplex500\Repository\BotScripts\UI Path\V20.4\";
	 public string RemoveSpecialCharacters(string FilenName,string OutputFilePath)
      {
        string result = String.Empty;

        if(!String.IsNullOrEmpty(FilenName))
        {
          result = Regex.Replace(FilenName, "[^a-zA-Z0-9_]+", string.Empty);
        }

        return OutputFilePath+'\\'+result+".xaml";
      }
	]]></msxsl:script>
	<xsl:output method="xml" indent="yes"/>
	<xsl:param name="OutputFilePath"/>
	<xsl:template match="/">
		<Activity mc:Ignorable="sap sap2010" x:Class="BtmClick" mva:VisualBasic.Settings="{x:Null}" sap:VirtualizedContainerService.HintSize="438,390" sap2010:WorkflowViewState.IdRef="BtmClick_1" xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:d="clr-namespace:DvfForms;assembly=DvfForms" xmlns:njl="clr-namespace:Newtonsoft.Json.Linq;assembly=Newtonsoft.Json">
			<xsl:call-template name="startTemplateMsaa"/>
			<xsl:element name="Sequence">
				<xsl:choose>
					<xsl:when test="Document/Meta/IsDvf='true' and Document/Meta/IsValidForm='true'">
						<Sequence.Variables>
							<Variable x:TypeArguments="njl:JObject" Name="data1"/>
						</Sequence.Variables>
						<sap:WorkflowViewStateService.ViewState>
							<scg:Dictionary x:TypeArguments="x:String, x:Object">
								<x:Boolean x:Key="IsExpanded">True</x:Boolean>
							</scg:Dictionary>
						</sap:WorkflowViewStateService.ViewState>
						<xsl:element name="d:DvfForm">
							<xsl:attribute name="DisplayName">Dvf form</xsl:attribute>
							<xsl:attribute name="FormData">[data1]</xsl:attribute>
							<xsl:attribute name="FormPath">
								<xsl:value-of select="concat(Document/Meta/RepositoryPath,'\BotScripts\UI Path\V20.4\',Document/Meta/GpsFile,'\',Document/Meta/ExternalBotFileName,'Forms.efm')"/>
							</xsl:attribute>
							<xsl:attribute name="Height">
								<xsl:value-of select="'1000'"/>
							</xsl:attribute>
							<xsl:attribute name="Width">
								<xsl:value-of select="'1000'"/>
							</xsl:attribute>
						</xsl:element>
						<If Condition="[data1(&quot;isDvfNull&quot;).ToString()=&quot;False&quot;]">
							<If.Then>
								<xsl:element name="Sequence">
									<xsl:call-template name="mainTemplate"/>
								</xsl:element>
							</If.Then>
						</If>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="mainTemplate"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</Activity>
	</xsl:template>
	<xsl:template name="mainTemplate">
		<xsl:for-each select="/Document/Process/Step">
			<xsl:choose>
				<xsl:when test="PlayBack__GeneralInfo_Event !='WindowActivate'">
					<xsl:choose>
						<xsl:when test="Step_ID">
							<xsl:choose>
								<!--<xsl:when test="PlayBack__ControlInfo_Role ='list item' and preceding-sibling::Step/PlayBack__ControlInfo_Role = 'combo box'">
								</xsl:when>-->
								<xsl:when test="PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/PlayBack__ControlInfo_Role = 'combo box'">

								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="PlayBack__GeneralInfo_Event !='START TRANSACTION'">
											<xsl:if test="PlayBack__GeneralInfo_Event !='END TRANSACTION' ">
												<xsl:choose>
													<xsl:when test="PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/Step_AdaptorID ='6'">
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="InvokeWorkflowFileTemplate">
															<xsl:with-param name="PlainSentence" select="Sentence_Plain"/>
															<xsl:with-param name="DialogName" select="PlayBack__AppInfo_DialogName"/>
															<xsl:with-param name="Eventname" select="PlayBack__GeneralInfo_Event"/>
															<xsl:with-param name="ControlName" select="PlayBack__ControlInfo_ControlName"/>
															<xsl:with-param name="Step_ID" select="Step_ID"/>
															<xsl:with-param name="PlayBack__GeneralInfo_AdaptorID" select="PlayBack__GeneralInfo_AdaptorID"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="InvokeWorkflowFileTemplate">
		<xsl:param name="PlainSentence" select="'Untitled'"/>
		<xsl:param name="DialogName" select="'Untitled'"/>
		<xsl:param name="Eventname" select="'Untitled'"/>
		<xsl:param name="ControlName" select="'Untitled'"/>
		<xsl:param name="Step_ID" select="'Untitled'"/>
		<xsl:param name="PlayBack__GeneralInfo_AdaptorID" select="'Untitled'"/>
		<xsl:element name="ui:InvokeWorkflowFile">
			<xsl:attribute name="ContinueOnError">
				<xsl:value-of select="$null"/>
			</xsl:attribute>
			<xsl:attribute name="DisplayName">
				<xsl:value-of select="$PlainSentence"/>
			</xsl:attribute>
			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>
			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>
			<xsl:attribute name="UnSafe">
				<xsl:value-of select="'False'"/>
			</xsl:attribute>
			<xsl:attribute name="WorkflowFileName">
				<xsl:value-of select="utils:RemoveSpecialCharacters(concat($Eventname,$ControlName,'-',$DialogName,$Step_ID),$OutputFilePath)"/>
			</xsl:attribute>
			<xsl:element name="ui:InvokeWorkflowFile.Arguments">
				<xsl:choose>
					<xsl:when test="PlayBack__GeneralInfo_Event ='TYPETEXT' and /Document/Meta/IsDvf='true' and /Document/Meta/IsValidForm='true'">
						<xsl:element name="InArgument">
							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="'x:String'"/>
							</xsl:attribute>
							<xsl:attribute name="x:Key">
								<xsl:value-of select="'textToBeTyped'"/>
							</xsl:attribute>
							<xsl:element name="mva:VisualBasicValue">
								<xsl:attribute name="x:TypeArguments">
									<xsl:value-of select="'x:String'"/>
								</xsl:attribute>
								<xsl:attribute name="ExpressionText">
									<xsl:value-of select="concat('data1(&quot;field_',Step_ID,'&quot;).ToString()')"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="scg:Dictionary">
							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="'x:String, Argument'"/>
							</xsl:attribute>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
