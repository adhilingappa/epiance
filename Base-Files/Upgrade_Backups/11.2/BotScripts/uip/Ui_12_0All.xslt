<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:safe="http://www.esa.int/safe/sentinel-1.0" xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils">
	<!--All UiPath Final 3-->
	<!--Jun-12-2020-V2m-->
	<xsl:import href="Uibot_12_0Msaa.xslt"/>
	<xsl:import href="Uibot_12_0Ie.xslt"/>
	<xsl:import href="Uibot_12_0Chrome.xslt"/>
	<xsl:import href="Uibot_12_0SAP.xslt"/>
	<xsl:import href="Uibot_12_0Java.xslt"/>
	<xsl:import href="Uibot_12_0Image.xslt"/>
	<xsl:output method="xml" indent="yes"/>
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[		
	public string getWaitTime(string waitForIteration,string delay,string IsDelayincluded,string IsWaitforIterationincluded)
	{
		int waitForIterationNumber =1;
		int delayNumber =500;
		string tmpIsDelayincluded =IsDelayincluded.ToLower();
		string tmpIsWaitforIterationincluded =IsWaitforIterationincluded.ToLower();
		if((IsDelayincluded != "") && tmpIsDelayincluded == "true")
		{
			if(delay!="")
			{			
				int numericValue;
				bool isNumber = int.TryParse(delay, out numericValue);
				if(isNumber)
				delayNumber = Int32.Parse(delay);		                  
			}
		}
    
		if((IsWaitforIterationincluded != "") && tmpIsWaitforIterationincluded == "true")
		{
			if(waitForIteration!="")
			{
				int numericValue;
				bool isNumber = int.TryParse(waitForIteration, out numericValue);
				if(isNumber)
				waitForIterationNumber = Int32.Parse(waitForIteration);	
			}
		}	
		else{
		  return (waitForIterationNumber*delayNumber).ToString();	
		}		
		return (waitForIterationNumber*delayNumber).ToString();		
	}
	

    ]]></msxsl:script>
	<xsl:template match="/">
		<Activity mc:Ignorable="sap sap2010" this:BtmClick.textToBeTyped="sample text" x:Class="BtmClick" mva:VisualBasic.Settings="{x:Null}" sap:VirtualizedContainerService.HintSize="438,390" sap2010:WorkflowViewState.IdRef="BtmClick_1" xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:d="clr-namespace:DvfForms;assembly=DvfForms" xmlns:njl="clr-namespace:Newtonsoft.Json.Linq;assembly=Newtonsoft.Json" xmlns:this="clr-namespace:">
			<x:Members>
				<x:Property Name="textToBeTyped" Type="InArgument(x:String)"/>
			</x:Members>
			<xsl:call-template name="startTemplateMsaa"/>
			<xsl:element name="Sequence">
				<Sequence.Variables>
					<Variable x:TypeArguments="x:Boolean" Name="RunningBoolean"/>
					<Variable x:TypeArguments="x:String" Name="txtValue"/>
					<Variable x:TypeArguments="njl:JObject" Name="data1"/>
					<Variable x:TypeArguments="x:Boolean" Name="elemtExist">
						<Variable.Default>
							<Literal x:TypeArguments="x:Boolean" Value="True"/>
						</Variable.Default>
					</Variable>
				</Sequence.Variables>
				<!--<xsl:choose>
					<xsl:when test="Document/Meta/IsDvf='true' and Document/Meta/IsValidForm='true'">
						<Sequence.Variables>
							<Variable x:TypeArguments="njl:JObject" Name="data1" />
							<Variable x:TypeArguments="x:Boolean" Name="elemtExist11">
								<Variable.Default>
									<Literal x:TypeArguments="x:Boolean" />
								</Variable.Default>
							</Variable>
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
								<xsl:value-of select="concat(Document/Meta/RepositoryPath,'\BotScripts\UI Path\V20.4\',Document/Meta/GpsFile,'Forms.efm')"/>
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
									<xsl:call-template name="mainTemplate" />
								</xsl:element>
							</If.Then>
						</If>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="mainTemplate" />
					</xsl:otherwise>
				</xsl:choose>-->
				<xsl:call-template name="mainTemplate"/>
			</xsl:element>
		</Activity>
	</xsl:template>
	<xsl:template name="mainTemplate">
		<xsl:for-each select="Document/Process/Step">
			<xsl:if test="utils:ToLower(Include_Pre_Condition_Control_visible)='true' and utils:ToLower(Pre_Condition_Control_visible)='yes'">
				<xsl:call-template name="ValidateElementExits">
					<xsl:with-param name="adtID" select="Step_AdaptorID"/>
					<xsl:with-param name="IncludeDelay" select="Include_Delay"/>
					<xsl:with-param name="IncludeWaitforIteration" select="Include_WaitforIteration"/>
				</xsl:call-template>
			</xsl:if>
			<If Condition="[elemtExist]" sap:VirtualizedContainerService.HintSize="484,244" sap2010:WorkflowViewState.IdRef="If_1">
				<If.Then>
					<xsl:choose>
						<xsl:when test="PlayBack__GeneralInfo_IsCitrix='1'">
							<xsl:call-template name="clickTemplateImage"/>
						</xsl:when>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID='1' or PlayBack__GeneralInfo_AdaptorID='9'">
							<xsl:choose>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'Click' or PlayBack__GeneralInfo_Event = 'Select'">
									<xsl:choose>
										<xsl:when test="(PlayBack__ControlInfo_Role='push button') or (PlayBack__ControlInfo_Role='menu item') or (PlayBack__ControlInfo_Role='list item') or (PlayBack__ControlInfo_Role='page tab') or (PlayBack__ControlInfo_Role='title bar')">
											<xsl:call-template name="clickTemplateMsaa"/>
										</xsl:when>
										<xsl:when test="(PlayBack__ControlInfo_Role='check box') or (PlayBack__ControlInfo_Role='radio button')">
											<xsl:call-template name="checkTemplateMsaa"/>
										</xsl:when>
										<xsl:when test="(UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='combo box')">
											<xsl:variable name="prevStepAdpID">
												<xsl:value-of select="preceding-sibling::Step[1]/PlayBack__GeneralInfo_AdaptorID"/>
											</xsl:variable>
											<xsl:if test="$prevStepAdpID!='6'">
												<xsl:call-template name="selectTemplateMsaa"/>
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											<xsl:variable name="prevStepAdpID">
												<xsl:value-of select="preceding-sibling::Step[1]/PlayBack__GeneralInfo_AdaptorID"/>
											</xsl:variable>
											<xsl:if test="$prevStepAdpID!='6'">
												<xsl:call-template name="clickTemplateMsaa"/>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'KEYEVENT' or ( PlayBack__GeneralInfo_Event = 'TYPETEXT' and Standard__Control_TypedKey_En='V' and PlayBack__GeneralInfo_SPKeyStatus='17')">
									<xsl:call-template name="sendHotKeyTemplateMsaa"/>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'TYPETEXT'">
									<xsl:call-template name="typeIntoTemplateMsaa"/>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID='3'">
							<xsl:choose>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'Click' or PlayBack__GeneralInfo_Event = 'Select'">
									<xsl:choose>
										<xsl:when test="(PlayBack__ControlInfo_Role='combo box') or (PlayBack__ControlInfo_Role = 'list item' and PlayBack__ControlInfo_IEControlAttributeTagName='SELECT')">
											<xsl:call-template name="selectTemplateIe"/>
										</xsl:when>
										<xsl:when test="(PlayBack__ControlInfo_Role='push button') or (PlayBack__ControlInfo_Role='menu item') or (PlayBack__ControlInfo_Role='list item') or (PlayBack__ControlInfo_Role='page tab') or (PlayBack__ControlInfo_Role='title bar')">
											<xsl:call-template name="clickTemplateIe"/>
										</xsl:when>
										<xsl:when test="(PlayBack__ControlInfo_Role='check box') or (PlayBack__ControlInfo_Role='radio button')">
											<xsl:call-template name="clickTemplateIe"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="clickTemplateIe"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'KEYEVENT' or ( PlayBack__GeneralInfo_Event = 'TYPETEXT' and Standard__Control_TypedKey_En='V' and PlayBack__GeneralInfo_SPKeyStatus='17')">
									<xsl:call-template name="sendHotKeyTemplateMsaa"/>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'TYPETEXT'">
									<xsl:call-template name="sendHotKeyTemplateIe"/>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID='12'">
							<xsl:choose>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'Click' or PlayBack__GeneralInfo_Event = 'Select'">
									<xsl:choose>
										<xsl:when test="(PlayBack__ControlInfo_Role='push button') or (PlayBack__ControlInfo_Role='menu item') or (PlayBack__ControlInfo_Role='list item') or (PlayBack__ControlInfo_Role='page tab') or (PlayBack__ControlInfo_Role='title bar')">
											<xsl:call-template name="clickTemplateChrome"/>
										</xsl:when>
										<xsl:when test="(PlayBack__ControlInfo_Role='check box') or (PlayBack__ControlInfo_Role='radio button')">
											<xsl:call-template name="clickTemplateChrome"/>
										</xsl:when>
										<xsl:when test="(PlayBack__ControlInfo_Role='combo box')">
											<xsl:call-template name="selectTemplateChrome"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="clickTemplateChrome"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'KEYEVENT' or ( PlayBack__GeneralInfo_Event = 'TYPETEXT' and Standard__Control_TypedKey_En='V' and PlayBack__GeneralInfo_SPKeyStatus='17')">
									<xsl:call-template name="sendHotKeyTemplateMsaa"/>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'TYPETEXT'">
									<xsl:call-template name="sendHotKeyTemplateChrome"/>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID='6'">
							<xsl:choose>
								<xsl:when test="PlayBack__GeneralInfo_Event='TYPETEXT'">
									<xsl:call-template name="TypeTemplateSAP"/>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='Click'">
									<xsl:if test="PlayBack__ControlInfo_Role!='list'">
										<xsl:if test="PlayBack__ControlInfo_Role='SAPGuiComboBox'">
											<xsl:call-template name="selectTemplateSAP"/>
										</xsl:if>
										<xsl:if test="PlayBack__ControlInfo_Role!='SAPGuiComboBox'">
											<xsl:call-template name="clickTemplateSAP"/>
										</xsl:if>
									</xsl:if>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event='DoubleClick'">
									<xsl:call-template name="DoubleclickTemplateSAP"/>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event='KEYEVENT'">
									<xsl:call-template name="sendHotKeyTemplateSAP"/>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID='2'">
							<xsl:choose>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'Click' or PlayBack__GeneralInfo_Event = 'Select'">
									<xsl:choose>
										<xsl:when test="(PlayBack__ControlInfo_Role='push button') or (PlayBack__ControlInfo_Role='menu item') or (PlayBack__ControlInfo_Role='list item') or (PlayBack__ControlInfo_Role='page tab') or (PlayBack__ControlInfo_Role='title bar')">
											<xsl:call-template name="clickTemplateJava"/>
										</xsl:when>
										<xsl:when test="(PlayBack__ControlInfo_Role='check box') or (PlayBack__ControlInfo_Role='radio button')">
											<xsl:call-template name="clickTemplateJava"/>
										</xsl:when>
										<xsl:when test="PlayBack__ControlInfo_Role='combo box' or PlayBack__ControlInfo_Role='list'">
											<xsl:call-template name="selectTemplateJava"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="clickTemplateJava"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'KEYEVENT' or ( PlayBack__GeneralInfo_Event = 'TYPETEXT' and Standard__Control_TypedKey_En='V' and PlayBack__GeneralInfo_SPKeyStatus='17')">
									<xsl:call-template name="sendHotKeyTemplateMsaa"/>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_Event = 'TYPETEXT'">
									<xsl:call-template name="sendHotKeyTemplateJava"/>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
				</If.Then>
				<If.Else>
					<xsl:call-template name="TerminateWorkflow">
						<xsl:with-param name="Reason" select="concat('Control is not loaded',PlayBack__ControlInfo_ControlName)"/>
					</xsl:call-template>
				</If.Else>
			</If>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="ValidateElementExits">
		<xsl:param name="adtID"/>
		<xsl:param name="IncludeDelay"/>
		<xsl:param name="IncludeWaitforIteration"/>
		<xsl:element name="ui:UiElementExists">
			<xsl:attribute name="DisplayName">
				<xsl:value-of select="'Element Exists'"/>
			</xsl:attribute>
			<xsl:attribute name="Exists">
				<xsl:value-of select="'[elemtExist]'"/>
			</xsl:attribute>
			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="'724,106'"/>
			</xsl:attribute>
			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="'UiElementExists_1'"/>
			</xsl:attribute>
			<ui:UiElementExists.Target>
				<xsl:element name="ui:Target">
					<xsl:attribute name="ClippingRegion">
						<xsl:value-of select="$null"/>
					</xsl:attribute>
					<xsl:attribute name="Element">
						<xsl:value-of select="$null"/>
					</xsl:attribute>
					<xsl:if test="$adtID='1'">
						<xsl:attribute name="Selector">
							<xsl:call-template name="selectorTemplateMsaa"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$adtID='2'">
						<xsl:attribute name="Selector">
							<xsl:call-template name="selectorTemplateJava"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$adtID='3'">
						<xsl:attribute name="Selector">
							<xsl:call-template name="selectorTemplateIe"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$adtID='6'">
						<xsl:attribute name="Selector">
							<xsl:call-template name="selectorTemplateSAP"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$adtID='12'">
						<xsl:attribute name="Selector">
							<xsl:call-template name="selectorTemplateChrome"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="TimeoutMS">
						<xsl:value-of select="utils:getWaitTime(WaitforIteration,Delay,$IncludeDelay,$IncludeWaitforIteration)"/>
					</xsl:attribute>
					<ui:Target.WaitForReady>
						<InArgument x:TypeArguments="ui:WaitForReady"/>
					</ui:Target.WaitForReady>
				</xsl:element>
			</ui:UiElementExists.Target>
			<sap:WorkflowViewStateService.ViewState>
				<scg:Dictionary x:TypeArguments="x:String, x:Object">
					<x:Boolean x:Key="IsExpanded">False</x:Boolean>
					<x:Boolean x:Key="IsPinned">False</x:Boolean>
				</scg:Dictionary>
			</sap:WorkflowViewStateService.ViewState>
		</xsl:element>
	</xsl:template>
	<xsl:template name="TerminateWorkflow">
		<xsl:param name="Reason"/>
		<xsl:element name="TerminateWorkflow">
			<xsl:attribute name="DisplayName">
				<xsl:value-of select="'Terminate Workflow'"/>
			</xsl:attribute>
			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="'200,22'"/>
			</xsl:attribute>
			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="'TerminateWorkflow_1'"/>
			</xsl:attribute>
			<xsl:attribute name="Reason">
				<xsl:value-of select="Reason"/>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
