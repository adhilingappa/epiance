<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:safe="http://www.esa.int/safe/sentinel-1.0"
                xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib"
                xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<!--MSAA UiPath Final 3-->
	<!--Jun-12-2020-V2m-->
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

	<msxsl:script implements-prefix="utils" language="C#">
		<![CDATA[
      public string ToLower(string stringValue)
      {
        string result = String.Empty;

        if(!String.IsNullOrEmpty(stringValue))
        {
          result = stringValue.ToLower(); 
        }

        return result;
      }
	  
	  public string isSpecialCharecter(string cd)
	  {
		if(!String.IsNullOrEmpty(cd))
        {
          if(cd.Length == 1)
			return "false";
		else
			return "true";
        }
		else
			return "false";
		
	  }
	  
	   public const int Ctrl = 1;
        public const int Shift = 2;
        public const int Alt = 4;
        public const int CtrlShift = 3;
        public const int CtrlAlt = 5;
        public const int ShiftAlt = 6;
        public const int AltCtrlShift = 7;
        public  string GetShortCut(string VKey)
        {
            try
            {
                if (VKey == string.Empty) return string.Empty;
                long SpKeyStatus = Convert.ToInt32(VKey);
                string ShortCutKey = string.Empty;
                if ((SpKeyStatus & Shift) == Shift)
                {
                    ShortCutKey = "Shift";
                }
                if ((SpKeyStatus & Alt) == Alt)
                {
                    ShortCutKey = "Alt";
                }
                if ((SpKeyStatus & Ctrl) == Ctrl)
                {
                    ShortCutKey = "Ctrl";
                }
                if ((SpKeyStatus & CtrlAlt) == CtrlAlt)
                {
                    ShortCutKey = "Ctrl,Alt";
                }
                if ((SpKeyStatus & CtrlShift) == CtrlShift)
                {
                    ShortCutKey = "Ctrl,Shift";
                }
                if ((SpKeyStatus & ShiftAlt) == ShiftAlt)
                {
                    ShortCutKey = "Shift,Alt";
                }
                if ((SpKeyStatus & AltCtrlShift) == AltCtrlShift)
                {
                    ShortCutKey = "Alt,Shift,Ctrl";
                }
                return ShortCutKey;
            }
            catch (Exception)
            {

                return string.Empty;
            }
        }
	  
	  
    ]]>
	</msxsl:script>

	<!--Variables-->
	<xsl:variable name="none">None</xsl:variable>
	<xsl:variable name="false">False</xsl:variable>
	<xsl:variable name="true">True</xsl:variable>
	<xsl:variable name="null">{x:Null}</xsl:variable>
	<xsl:variable name="empty"/>
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

	<xsl:template name="clickTemplateMsaa">

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
					<xsl:when test="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE = 'list item' ">
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
						<xsl:call-template name="selectorTemplateMsaa" />
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

	<xsl:template name="checkTemplateMsaa">

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
					<xsl:when test="PlayBack__AdditionalInfo_UIA_Default_Action='Check' or PlayBack__AdditionalInfo_UIA_Default_Action='Uncheck' or PlayBack__AdditionalInfo_UIA_Default_Action='Toggle'">
						<xsl:value-of select="PlayBack__AdditionalInfo_UIA_Default_Action"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$check"/>
					</xsl:otherwise>
				</xsl:choose>

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
						<xsl:call-template name="selectorTemplateMsaa"/>	
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

	<xsl:template name="selectTemplateMsaa">

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
						<xsl:call-template name="selectorTemplateMsaa" />
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

	<xsl:template name="typeIntoTemplateMsaa">

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
				<xsl:choose>
					<xsl:when test="/Document/Meta/IsDvf='true' and /Document/Meta/IsValidForm='true'">
						<xsl:value-of select="'[textToBeTyped.ToString()]'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
					</xsl:otherwise>
				</xsl:choose>
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
						<xsl:call-template name="selectorTemplateMsaa" />
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

	<xsl:template name="startTemplateMsaa">

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

	<xsl:template name="sendHotKeyTemplateMsaa">
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
				<xsl:variable name="isSpecial">
					<xsl:value-of select="utils:isSpecialCharecter(Standard__Control_TypedKey_En)"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="PlayBack__GeneralInfo_Event='KEYEVENT' and $isSpecial='true'">
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
					<xsl:when test="PlayBack__GeneralInfo_Event='KEYEVENT' or( PlayBack__GeneralInfo_Event = 'TYPETEXT' and Standard__Control_TypedKey_En='V')">
						<xsl:call-template name="keyEventMappingTemplateMsaa"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>

			<xsl:attribute name="KeyModifiers">
				<xsl:choose>
					<xsl:when test="PlayBack__GeneralInfo_Event='KEYEVENT' or (PlayBack__GeneralInfo_Event='TYPETEXT' and Standard__Control_TypedKey_En='V') ">
						<xsl:value-of select="utils:GetShortCut(PlayBack__GeneralInfo_SPKeyStatus)"/>
					</xsl:when>		
					<xsl:otherwise>
						<xsl:value-of select="$none"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>

		</xsl:element>
	</xsl:template>

	<xsl:template name="selectorTemplateMsaa">
		<xsl:choose>

			<xsl:when test="PlayBack__ControlInfo_Role='title bar'">&lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>'<xsl:if test="Include_UIP_PlayBack__AppInfo_DialogName='False' or UIP_PlayBack__AppInfo_DialogName=''">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>'/&gt;</xsl:when>	

			<xsl:when test="PlayBack__ControlInfo_Role='combo box' and (UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='button' or UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE ='Button')">&lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>'<xsl:if test="Include_UIP_PlayBack__AppInfo_DialogName='False' or UIP_PlayBack__AppInfo_DialogName=''">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;uia <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_PARENT_NAME='False' or UIP_PlayBack__AdditionalInfo_UIA_PARENT_NAME=''">omit:</xsl:if>name='<xsl:value-of select = "UIP_PlayBack__AdditionalInfo_UIA_PARENT_NAME"/>' <xsl:if test="Include_PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID!='True' or PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID=''">omit:</xsl:if>automationid='<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE='False' or UIP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE=''">omit:</xsl:if>role='<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>' /&gt;  &lt;uia <xsl:if test="Include_UIP_PlayBack__ControlInfo_ControlName='False'">omit:</xsl:if>name='<xsl:value-of select = "UIP_PlayBack__ControlInfo_ControlName"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID!='True' or UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID=''">omit:</xsl:if>automationid='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='False'">omit:</xsl:if>role='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>' /&gt;</xsl:when>

			<xsl:when test="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='combo box'">&lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' <xsl:if test="Include_UIP_PlayBack__AppInfo_DialogName='False' or UIP_PlayBack__AppInfo_DialogName=''">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;ctrl <xsl:if test="Include_UIP_PlayBack__ControlInfo_ControlName='False'">omit:</xsl:if>name='<xsl:value-of select = "UIP_PlayBack__ControlInfo_ControlName"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID!='True' or UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID=''">omit:</xsl:if>automationid='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>' role='<xsl:value-of select="PlayBack__ControlInfo_Role"/>' /&gt;</xsl:when>

			<xsl:when test="PlayBack__ControlInfo_Role='list item'">&lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' <xsl:if test="Include_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE='False' or PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE=''">omit:</xsl:if>cls='<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>' <xsl:if test="Include_UIP_PlayBack__AppInfo_DialogName='False' or UIP_PlayBack__AppInfo_DialogName=''">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;uia <xsl:if test="Include_UIP_PlayBack__ControlInfo_ControlName='False'">omit:</xsl:if>name='<xsl:value-of select = "UIP_PlayBack__ControlInfo_ControlName"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID!='True' or UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID=''">omit:</xsl:if>automationid='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='False'">omit:</xsl:if>role='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>' /&gt;</xsl:when>

			<xsl:when test="PlayBack__ControlInfo_Role='radio button'">&lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>'   
				<xsl:if test="Include_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE='False' or PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE=''">omit:</xsl:if>cls='<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>' <xsl:if test="Include_UIP_PlayBack__AppInfo_DialogName='False' or UIP_PlayBack__AppInfo_DialogName=''">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;ctrl <xsl:if test="Include_UIP_PlayBack__ControlInfo_ControlName='False'">omit:</xsl:if>name='<xsl:value-of select = "UIP_PlayBack__ControlInfo_ControlName"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID!='True' or UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID=''">omit:</xsl:if>automationid='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>' role='<xsl:value-of select="PlayBack__ControlInfo_Role"/>' /&gt;</xsl:when>

			<xsl:when test="PlayBack__ControlInfo_Role='page tab'">&lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' <xsl:if test="Include_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE='False' or PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE=''">omit:</xsl:if>cls='<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>' <xsl:if test="Include_UIP_PlayBack__AppInfo_DialogName='False' or UIP_PlayBack__AppInfo_DialogName=''">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;ctrl <xsl:if test="Include_UIP_PlayBack__ControlInfo_ControlName='False'">omit:</xsl:if>name='<xsl:value-of select = "UIP_PlayBack__ControlInfo_ControlName"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID!='True' or UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID=''">omit:</xsl:if>automationid='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>' role='<xsl:value-of select="PlayBack__ControlInfo_Role"/>' /&gt;</xsl:when>

			<xsl:when test="PlayBack__ControlInfo_Role='cell'">&lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' <xsl:if test="Include_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE='False' or PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE=''">omit:</xsl:if>cls='<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>'<xsl:if test="Include_UIP_PlayBack__AppInfo_DialogName='False' or UIP_PlayBack__AppInfo_DialogName=''">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;uia <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_NAME='False' or UIP_PlayBack__AdditionalInfo_UIA_NAME=''">omit:</xsl:if>name='<xsl:value-of select = "UIP_PlayBack__AdditionalInfo_UIA_NAME"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID!='True' or UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID=''">omit:</xsl:if>automationid='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='False'">omit:</xsl:if>role='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>' /&gt;</xsl:when>

			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID != ''">&lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' <xsl:if test="Include_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE='False' or PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE=''">omit:</xsl:if>cls='<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>' <xsl:if test="Include_UIP_PlayBack__AppInfo_DialogName='False' or UIP_PlayBack__AppInfo_DialogName=''">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;uia <xsl:if test="Include_UIP_PlayBack__ControlInfo_ControlName='False'">omit:</xsl:if>name='<xsl:value-of select = "UIP_PlayBack__ControlInfo_ControlName"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID='False' or UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID=''">omit:</xsl:if>automationid='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE!='True' or UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE=''">omit:</xsl:if>role='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>' /&gt;</xsl:when>
					<xsl:otherwise>&lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' <xsl:if test="Include_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE='False' or PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE=''">omit:</xsl:if>cls='<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>' <xsl:if test="Include_UIP_PlayBack__AppInfo_DialogName='False' or UIP_PlayBack__AppInfo_DialogName=''">omit:</xsl:if>title='<xsl:value-of select="UIP_PlayBack__AppInfo_DialogName"/>' /&gt; &lt;uia <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_NAME='False'">omit:</xsl:if>name='<xsl:value-of select = "UIP_PlayBack__ControlInfo_ControlName"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID!='True' or UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID=''">omit:</xsl:if>automationid='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>' <xsl:if test="Include_UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='False' or UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE=''">omit:</xsl:if>role='<xsl:value-of select="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>' /&gt;</xsl:otherwise>
				</xsl:choose>

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="keyEventMappingTemplateMsaa">
		<xsl:choose>
			<xsl:when test="Standard__Control_TypedKey_En='Enter'">enter</xsl:when>
			<xsl:when test="Standard__Control_TypedKey_En='Tab'">tab</xsl:when>
			<xsl:when test="Standard__Control_TypedKey_En='Backspace'">back</xsl:when>
			<xsl:when test="Standard__Control_TypedKey_En='Delete'">del</xsl:when>
			<xsl:when test="Standard__Control_TypedKey_En='Insert'">ins</xsl:when>
			<xsl:when test="Standard__Control_TypedKey_En='Page Up'">pgup</xsl:when>
			<xsl:when test="Standard__Control_TypedKey_En='Page Down'">pgdn</xsl:when>
			<xsl:when test="Standard__Control_TypedKey_En='Num Lock'">num</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="utils:ToLower(Standard__Control_TypedKey_En)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>


