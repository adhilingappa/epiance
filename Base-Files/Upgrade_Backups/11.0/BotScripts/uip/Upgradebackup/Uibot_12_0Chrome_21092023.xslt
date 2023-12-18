<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:safe="http://www.esa.int/safe/sentinel-1.0"
                xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib"
                 xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<!--Chrome UiPath Final 3-->
	<!--Jun-12-2020-V2m-->
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<!--Variables-->
	<xsl:variable name="none">None</xsl:variable>
	<xsl:variable name="false">False</xsl:variable>
	<xsl:variable name="true">True</xsl:variable>
	<xsl:variable name="null">{x:Null}</xsl:variable>
	<xsl:variable name="empty"></xsl:variable>
	<xsl:variable name="intPlaceholder">x:Int32</xsl:variable>
	<xsl:variable name="waitForReadyPlaceholder">ui:WaitForReady</xsl:variable>
	<xsl:variable name="sampleText">sample</xsl:variable>
	<xsl:variable name="lt">&lt;</xsl:variable>
	<xsl:variable name="gt">&gt;</xsl:variable>
	<xsl:variable name="clickType">CLICK_SINGLE</xsl:variable>
	<xsl:variable name="mouseButton">BTN_LEFT</xsl:variable>
	<xsl:variable name="center">Center</xsl:variable>
	<xsl:variable name="check">Check</xsl:variable>

	<xsl:variable name="complete">COMPLETE</xsl:variable>

	<xsl:template match="/">
		
	</xsl:template>

	<xsl:template name="clickTemplateChrome">

		<xsl:element name="ui:Click">

			<xsl:attribute name="DelayBefore">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayMS">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="ClickType">
				<xsl:value-of select="$clickType"/>
			</xsl:attribute>

			<xsl:attribute name="DisplayName">
				<xsl:value-of select="Sentence_Plain"/>
			</xsl:attribute>

			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="KeyModifiers">
				<xsl:value-of select="$none"/>
			</xsl:attribute>

			<xsl:attribute name="MouseButton">
				<xsl:value-of select="$mouseButton"/>
			</xsl:attribute>

			<xsl:attribute name="SendWindowMessages">
				<xsl:value-of select="$false"/>
			</xsl:attribute>

			<xsl:attribute name="SimulateClick">
				<xsl:choose>
					<xsl:when test="PlayBack__AdditionalInfo_Web_TagName='OPTION'">
						<xsl:value-of select="$false"/>
					</xsl:when>
					<xsl:when test="PlayBack__ControlInfo_Role = 'menu item' or PlayBack__ControlInfo_Role = 'list item' ">
						<xsl:value-of select="$true"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$false"/>

					</xsl:otherwise>
				</xsl:choose>

			</xsl:attribute>


			<xsl:element name="ui:Click.CursorPosition">
				<xsl:element name="ui:CursorPosition">

					<xsl:attribute name="OffsetX">2</xsl:attribute>

					<xsl:attribute name="OffsetY">2</xsl:attribute>

					<xsl:attribute name="Position">
						<xsl:value-of select="$center"/>
					</xsl:attribute>

				</xsl:element>
			</xsl:element>

			<xsl:element name="ui:Click.Target">
				<xsl:element name="ui:Target">

					<xsl:attribute name="ClippingRegion">
						<xsl:value-of select="$null"/>
					</xsl:attribute>

					<xsl:attribute name="Element">
						<xsl:value-of select="$null"/>
					</xsl:attribute>

					<xsl:attribute name="InformativeScreenshot">

					</xsl:attribute>


					<xsl:attribute name="Selector">
						<xsl:call-template name="selectorTemplateChrome" />
					</xsl:attribute>

					<xsl:attribute name="WaitForReady">
						<xsl:value-of select="$complete" />
					</xsl:attribute>

					<xsl:element name="ui:Target.TimeoutMS">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$intPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

				</xsl:element>
			</xsl:element>
		</xsl:element>

	</xsl:template>

	<xsl:template name="checkTemplateChrome">

		<xsl:element name="ui:Check">

			<xsl:attribute name="ContinueOnError">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayAfter">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayBefore">
				<xsl:value-of select="$null"/>
			</xsl:attribute>


			<xsl:attribute name="Action">
				<xsl:value-of select="$check"/>
			</xsl:attribute>

			<xsl:attribute name="DisplayName">
				<xsl:value-of select="Sentence_Plain"/>
			</xsl:attribute>

			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>


			<xsl:element name="ui:Check.Target">
				<xsl:element name="ui:Target">

					<xsl:attribute name="ClippingRegion">
						<xsl:value-of select="$null"/>
					</xsl:attribute>

					<xsl:attribute name="Element">
						<xsl:value-of select="$null"/>
					</xsl:attribute>

					<xsl:attribute name="InformativeScreenshot">

					</xsl:attribute>

					<xsl:attribute name="Selector">
						<xsl:call-template name="selectorTemplateChrome"/>
					</xsl:attribute>

					<xsl:attribute name="WaitForReady">
						<xsl:value-of select="$complete" />
					</xsl:attribute>

					<xsl:element name="ui:Target.TimeoutMS">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$intPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

				</xsl:element>
			</xsl:element>
		</xsl:element>

	</xsl:template>

	<xsl:template name="selectTemplateChrome">

		<xsl:element name="ui:SelectItem">

			<xsl:attribute name="ContinueOnError">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayAfter">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayBefore">
				<xsl:value-of select="$null"/>
			</xsl:attribute>


			<xsl:attribute name="DisplayName">
				<xsl:value-of select="Sentence_Plain"/>
			</xsl:attribute>

			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="Item">
				<xsl:value-of select="Modified_Item"/>
			</xsl:attribute>


			<xsl:element name="ui:SelectItem.Target">
				<xsl:element name="ui:Target">

					<xsl:attribute name="ClippingRegion">
						<xsl:value-of select="$null"/>
					</xsl:attribute>

					<xsl:attribute name="Element">
						<xsl:value-of select="$null"/>
					</xsl:attribute>

					<xsl:attribute name="InformativeScreenshot">

					</xsl:attribute>

					<xsl:attribute name="Selector">
						<xsl:call-template name="selectorTemplateChrome" />
					</xsl:attribute>

					<xsl:attribute name="WaitForReady">
						<xsl:value-of select="$complete" />
					</xsl:attribute>

					<xsl:element name="ui:Target.TimeoutMS">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$intPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

				</xsl:element>
			</xsl:element>
		</xsl:element>

	</xsl:template>

	<xsl:template name="typeIntoTemplateChrome">

		<xsl:element name="ui:TypeInto">

			<xsl:attribute name="ClickBeforeTyping">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayBefore">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayBetweenKeys">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayMS">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="Activate">
				<xsl:value-of select="$true"/>
			</xsl:attribute>

			<xsl:attribute name="DisplayName">
				<xsl:value-of select="Event"/>
			</xsl:attribute>

			<xsl:attribute name="EmptyField">
				<xsl:value-of select="$false"/>
			</xsl:attribute>

			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="SendWindowMessages">
				<xsl:value-of select="$false"/>
			</xsl:attribute>

			<xsl:attribute name="SimulateType">
				<xsl:value-of select="$false"/>
			</xsl:attribute>

			<xsl:attribute name="Text">
				<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
			</xsl:attribute>



			<xsl:element name="ui:TypeInto.Target">
				<xsl:element name="ui:Target">

					<xsl:attribute name="ClippingRegion">
						<xsl:value-of select="$null"/>
					</xsl:attribute>

					<xsl:attribute name="Element">
						<xsl:value-of select="$null"/>
					</xsl:attribute>

					<xsl:attribute name="InformativeScreenshot">

					</xsl:attribute>

					<xsl:attribute name="Selector">
						<xsl:call-template name="selectorTemplateChrome" />
					</xsl:attribute>


					<xsl:attribute name="WaitForReady">
						<xsl:value-of select="$complete" />
					</xsl:attribute>

					<xsl:element name="ui:Target.TimeoutMS">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$intPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

				</xsl:element>
			</xsl:element>
		</xsl:element>

	</xsl:template>

	<xsl:template name="startTemplateChrome">

		<TextExpression.NamespacesForImplementation>
			<sco:Collection x:TypeArguments="x:String">
				<x:String>System.Activities</x:String>
				<x:String>System.Activities.Statements</x:String>
				<x:String>System.Activities.Expressions</x:String>
				<x:String>System.Activities.Validation</x:String>
				<x:String>System.Activities.XamlIntegration</x:String>
				<x:String>Microsoft.VisualBasic</x:String>
				<x:String>Microsoft.VisualBasic.Activities</x:String>
				<x:String>System</x:String>
				<x:String>System.Collections</x:String>
				<x:String>System.Collections.Generic</x:String>
				<x:String>System.Data</x:String>
				<x:String>System.Diagnostics</x:String>
				<x:String>System.Drawing</x:String>
				<x:String>System.IO</x:String>
				<x:String>System.Linq</x:String>
				<x:String>System.Net.Mail</x:String>
				<x:String>System.Xml</x:String>
				<x:String>System.Xml.Linq</x:String>
				<x:String>UiPath.Core</x:String>
				<x:String>UiPath.Core.Activities</x:String>
				<x:String>System.Windows.Markup</x:String>
			</sco:Collection>
		</TextExpression.NamespacesForImplementation>
		<TextExpression.ReferencesForImplementation>
			<sco:Collection x:TypeArguments="AssemblyReference">
				<AssemblyReference>System.Activities</AssemblyReference>
				<AssemblyReference>Microsoft.VisualBasic</AssemblyReference>
				<AssemblyReference>mscorlib</AssemblyReference>
				<AssemblyReference>System.Data</AssemblyReference>
				<AssemblyReference>System.Data.DataSetExtensions</AssemblyReference>
				<AssemblyReference>System</AssemblyReference>
				<AssemblyReference>System.Drawing</AssemblyReference>
				<AssemblyReference>System.Core</AssemblyReference>
				<AssemblyReference>System.Xml</AssemblyReference>
				<AssemblyReference>System.Xml.Linq</AssemblyReference>
				<AssemblyReference>PresentationFramework</AssemblyReference>
				<AssemblyReference>WindowsBase</AssemblyReference>
				<AssemblyReference>PresentationCore</AssemblyReference>
				<AssemblyReference>System.Xaml</AssemblyReference>
				<AssemblyReference>UiPath.System.Activities</AssemblyReference>
				<AssemblyReference>UiPath.UiAutomation.Activities</AssemblyReference>
			</sco:Collection>
		</TextExpression.ReferencesForImplementation>

	</xsl:template>

	<xsl:template name="sendHotKeyTemplateChrome">
		<xsl:element name="ui:SendHotkey">

			<xsl:attribute name="ClickBeforeTyping">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayBefore">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayBetweenKeys">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="DelayMS">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="EmptyField">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="SendWindowMessages">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="SpecialKey">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="Activate">
				<xsl:value-of select="$true"/>
			</xsl:attribute>

			<xsl:attribute name="DisplayName">
				<xsl:value-of select="Sentence_Plain"/>
			</xsl:attribute>

			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="Key">
			<xsl:choose>
				<xsl:when test="/Document/Meta/IsDvf='true' and /Document/Meta/IsValidForm='true'">
					<xsl:value-of select="'[textToBeTyped.ToString()]'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
				</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>

			<xsl:attribute name="KeyModifiers">
				<xsl:value-of select="$none"/>
			</xsl:attribute>

		</xsl:element>
	</xsl:template>

	<xsl:template name="selectorTemplateChrome">
		<xsl:choose>
			<xsl:when test="UIP_PlayBack__ControlInfo_XPath=''">&lt;html app='chrome.exe' <xsl:if test="utils:ToLower(Include_UIP_PlayBack__AppInfo_DialogName)='false'">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;webctrl <xsl:if test="PlayBack__AdditionalInfo_Web_Name='' or utils:ToLower(Include_PlayBack__AdditionalInfo_Web_Name)='false'">omit:</xsl:if>name='<xsl:value-of select="PlayBack__AdditionalInfo_Web_Name"/>' <xsl:if test="UIP_PlayBack__AdditionalInfo_Web_ID='' or utils:ToLower(Include_UIP_PlayBack__AdditionalInfo_Web_ID) ='false'">omit:</xsl:if>id='<xsl:value-of select = "UIP_PlayBack__AdditionalInfo_Web_ID"/>' <xsl:if test="PlayBack__AdditionalInfo_Web_TagName='' or utils:ToLower(Include_PlayBack__AdditionalInfo_Web_TagName)='false'">omit:</xsl:if>tag='<xsl:value-of select="PlayBack__AdditionalInfo_Web_TagName"/>' <xsl:if test="PlayBack__AdditionalInfo_Web_ClassName='' or utils:ToLower(Include_PlayBack__AdditionalInfo_Web_ClassName)='false'">omit:</xsl:if>class='<xsl:value-of select="PlayBack__AdditionalInfo_Web_ClassName"/>' omit:css-selector='<xsl:value-of select="UIP_PlayBack__ControlInfo_XPath"/> <xsl:if test="utils:ToLower(Include_PlayBack__AdditionalInfo_Web_AncestorID)='false'  or PlayBack__AdditionalInfo_Web_AncestorID=''">omit:</xsl:if>parentid='<xsl:value-of select="PlayBack__AdditionalInfo_Web_AncestorID"/>' /&gt;</xsl:when>
			<xsl:otherwise>&lt;html app='chrome.exe' <xsl:if test="utils:ToLower(Include_UIP_PlayBack__AppInfo_DialogName)='false'">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;webctrl <xsl:if test="PlayBack__AdditionalInfo_Web_Name='' or utils:ToLower(Include_PlayBack__AdditionalInfo_Web_Name)='false'">omit:</xsl:if>name='<xsl:value-of select="PlayBack__AdditionalInfo_Web_Name"/>' <xsl:if test="UIP_PlayBack__AdditionalInfo_Web_ID='' or utils:ToLower(Include_UIP_PlayBack__AdditionalInfo_Web_ID) ='false'">omit:</xsl:if>id='<xsl:value-of select = "UIP_PlayBack__AdditionalInfo_Web_ID"/>' <xsl:if test="PlayBack__AdditionalInfo_Web_TagName='' or utils:ToLower(Include_PlayBack__AdditionalInfo_Web_TagName)='false'">omit:</xsl:if>tag='<xsl:value-of select="PlayBack__AdditionalInfo_Web_TagName"/>' <xsl:if test="PlayBack__AdditionalInfo_Web_ClassName='' or utils:ToLower(Include_PlayBack__AdditionalInfo_Web_ClassName)='false'">omit:</xsl:if>class='<xsl:value-of select="PlayBack__AdditionalInfo_Web_ClassName"/>' <xsl:if test="utils:ToLower(Include_PlayBack__ControlInfo_CSSPath)='false'">omit:</xsl:if>css-selector='<xsl:value-of select="PlayBack__ControlInfo_CSSPath"/>' <xsl:if test="utils:ToLower(Include_UIP_PlayBack__ControlInfo_ControlName)='false' or Include_UIP_PlayBack__ControlInfo_ControlName='' or Include_UIP_Chrome_PlayBack__ControlInfo_ControlName=''">omit:</xsl:if>aaname='<xsl:value-of select="UIP_PlayBack__ControlInfo_ControlName"/>'  <xsl:if test="utils:ToLower(Include_PlayBack__AdditionalInfo_Web_AncestorID)='false'  or PlayBack__AdditionalInfo_Web_AncestorID=''">omit:</xsl:if>parentid='<xsl:value-of select="PlayBack__AdditionalInfo_Web_AncestorID"/>' /&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:template>	



</xsl:stylesheet>


