<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:safe="http://www.esa.int/safe/sentinel-1.0"
                xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib"
                exclude-result-prefixes="msxsl"
>
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

    <xsl:template match="/">
        
    </xsl:template>
	
	<xsl:template name="clickTemplateJava">

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
				<xsl:value-of select="Sentence-Plain"/>
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
			<xsl:when test="PlayBack--AdditionalInfo-UIA_LOCALIZED_CONTROL_TYPE = 'list item' ">
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
						<xsl:call-template name="selectorTemplateJava" />
					</xsl:attribute>


					<xsl:element name="ui:Target.TimeoutMS">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$intPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

					<xsl:element name="ui:Target.WaitForReady">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$waitForReadyPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

				</xsl:element>
			</xsl:element>
		</xsl:element>

	</xsl:template>

	<xsl:template name="selectTemplateJava">

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
				<xsl:value-of select="Sentence-Plain"/>
			</xsl:attribute>

			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="Item">
				<xsl:value-of select="Modified-Item"/>
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
						<xsl:call-template name="selectorTemplateJava" />
					</xsl:attribute>

					<xsl:element name="ui:Target.TimeoutMS">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$intPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

					<xsl:element name="ui:Target.WaitForReady">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$waitForReadyPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

				</xsl:element>
			</xsl:element>
		</xsl:element>

	</xsl:template>

	<xsl:template name="checkTemplateJava">

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
				<xsl:choose>
					<xsl:when test="PlayBack--AdditionalInfo-UIA_Default_Action='Check' or PlayBack--AdditionalInfo-UIA_Default_Action='Uncheck' or PlayBack--AdditionalInfo-UIA_Default_Action='Toggle'">
						<xsl:value-of select="PlayBack--AdditionalInfo-UIA_Default_Action"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$check"/>
					</xsl:otherwise>
				</xsl:choose>

			</xsl:attribute>

			<xsl:attribute name="DisplayName">
				<xsl:value-of select="Sentence-Plain"/>
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
						<xsl:call-template name="selectorTemplateJava"/>
					</xsl:attribute>

					<xsl:element name="ui:Target.TimeoutMS">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$intPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

					<xsl:element name="ui:Target.WaitForReady">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$waitForReadyPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

				</xsl:element>
			</xsl:element>
		</xsl:element>

	</xsl:template>

	<xsl:template name="typeIntoTemplateJava">

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
				<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
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
						<xsl:call-template name="selectorTemplateJava" />
					</xsl:attribute>

					<xsl:element name="ui:Target.TimeoutMS">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$intPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

					<xsl:element name="ui:Target.WaitForReady">
						<xsl:element name="InArgument">

							<xsl:attribute name="x:TypeArguments">
								<xsl:value-of select="$waitForReadyPlaceholder"/>
							</xsl:attribute>

						</xsl:element>
					</xsl:element>

				</xsl:element>
			</xsl:element>
		</xsl:element>

	</xsl:template>
	
	<xsl:template name="sendHotKeyTemplateJava">
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
				<xsl:choose>
					<xsl:when test="PlayBack--GeneralInfo-Event='KEYEVENT'">
						<xsl:value-of select="$true"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$null"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>

			<xsl:attribute name="Activate">
				<xsl:value-of select="$true"/>
			</xsl:attribute>

			<xsl:attribute name="DisplayName">
				<xsl:value-of select="Sentence-Plain"/>
			</xsl:attribute>

			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="Key">
				<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
			</xsl:attribute>

			<xsl:attribute name="KeyModifiers">
				<xsl:value-of select="$none"/>
			</xsl:attribute>

		</xsl:element>
	</xsl:template>
	
	<xsl:template name="selectorTemplateJava">
		<xsl:choose>
			<xsl:when test="PlayBack--ControlInfo-Role='title bar'">&lt;wnd app='<xsl:value-of select="PlayBack--AppInfo-ExeName"/>' title='<xsl:value-of select="PlayBack--AppInfo-DialogName"/>'/&gt;</xsl:when>
			<xsl:otherwise>&lt;wnd app='<xsl:value-of select="PlayBack--AppInfo-ExeName"/>' title='<xsl:value-of select="PlayBack--AppInfo-DialogName"/>'/&gt;&lt;java omit:name='<xsl:value-of select = "PlayBack--ParentInfo-ParentName"/>' omit:role='<xsl:value-of select="PlayBack--AdditionalInfo-ACTUAL_PARENT_CONTROL_TYPE"/>' /&gt; &lt;java name='<xsl:value-of select = "PlayBack--ControlInfo-ControlName"/>' role='<xsl:value-of select="PlayBack--AdditionalInfo-ACTUAL_CONTROL_TYPE"/>' /&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
