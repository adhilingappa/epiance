<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:safe="http://www.esa.int/safe/sentinel-1.0"
                xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib"               
                xmlns:my="my:my" xmlns:uit="http://schemas.uipath.com/workflow/activities/terminal" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl"
>
  

  <!--GreenScreen UiPath -->
<msxsl:script implements-prefix='utils' language='CSharp'>
    <![CDATA[
      string tmpCaptionName=""; int cap=0;
      public void postCaptionName(string CaptionName)
      {
        if(cap==0)
        {
          if(CaptionName!="")
          {
              if(tmpCaptionName=="")
                  tmpCaptionName=CaptionName;     
                  cap++;
          }
        }    
      }
      
      public string getCaptionName()
      {
        string tmpCaptionName1=tmpCaptionName;
        
          return tmpCaptionName1;
      }
      
        public void Reset()
        {
            cap=0; tmpCaptionName="";
        }
     ]]>
       
  </msxsl:script>
    
  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
  <!--Variables-->
  <xsl:variable name="none">None</xsl:variable>
  <xsl:variable name="false">False</xsl:variable>
  <xsl:variable name="true">True</xsl:variable>
  <xsl:variable name="null">{x:Null}</xsl:variable>
  <xsl:variable name="DelayMS">1000</xsl:variable>
  <xsl:variable name="TimeoutMS">50000</xsl:variable>
  <xsl:variable name="TimeoutMSetField">5000</xsl:variable>
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
    <Activity mc:Ignorable="sap sap2010" x:Class="BtmClick" mva:VisualBasic.Settings="{x:Null}" sap:VirtualizedContainerService.HintSize="438,390" sap2010:WorkflowViewState.IdRef="BtmClick_1" xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">
      <xsl:call-template name="startTemplate"/>
      <xsl:element name="Sequence">
			<xsl:element name="uit:TerminalSession">				
			<xsl:attribute name="ContinueOnError">
				<xsl:value-of select="$null"/>
			</xsl:attribute>

			<xsl:attribute name="ExistingConnection">
				<xsl:value-of select="$null"/>
			</xsl:attribute>
			
			<xsl:attribute name="OutputConnection">
				<xsl:value-of select="$null"/>
			</xsl:attribute>
			
			<!--<xsl:attribute name="SSHPassword">
				<xsl:value-of select="$null"/>
			</xsl:attribute>
			
			<xsl:attribute name="SSHUserName">
				<xsl:value-of select="$null"/>
			</xsl:attribute>-->

			<xsl:attribute name="CloseConnection">
				<xsl:value-of select="$true"/>
			</xsl:attribute>

			<xsl:attribute name="ConnectionString">
				<!--<xsl:value-of select="{}{'AttachExisting':false,'ConnectionProtocol':0,'ConnectionType':1,'EhllBasicMode':false,'EhllDll':null,'EhllEnhanced':true,'EhllFunction':'hllapi','EhllSession':'A','EnableSSL':false,'Host':'pub400.com','InProcessMode':false,'InternalEncoding':'IBM037','Mode':1,'Port':23,'Profile':null,'ProviderType':9,'ShowTerminal':true,'TerminalType':0}"/>-->
			</xsl:attribute>
				
			<xsl:attribute name="DelayMS">
				<xsl:value-of select="$DelayMS"/>
			</xsl:attribute>
			
			<xsl:attribute name="DisplayName">
				<xsl:value-of select="'Terminal Session'"/>
			</xsl:attribute>
			
			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>

			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>
			
			<xsl:attribute name="TimeoutMS">
				<xsl:value-of select="$TimeoutMS"/>
			</xsl:attribute>
			
			
			<xsl:element name="uit:TerminalSession.Body">
				 <ActivityAction x:TypeArguments="uit:TerminalConnection">
					<ActivityAction.Argument>
						<DelegateInArgument x:TypeArguments="uit:TerminalConnection" Name="terminalSession" />
					</ActivityAction.Argument>
					  <Sequence DisplayName="Do" sap:VirtualizedContainerService.HintSize="376,362" sap2010:WorkflowViewState.IdRef="Sequence_2">
						<sap:WorkflowViewStateService.ViewState>
							  <scg:Dictionary x:TypeArguments="x:String, x:Object">
								<x:Boolean x:Key="IsExpanded">True</x:Boolean>
							  </scg:Dictionary>
						</sap:WorkflowViewStateService.ViewState>
						<xsl:for-each select="Document/Process/Step">
							<xsl:choose>
								<xsl:when test="PlayBack--GeneralInfo-Event = 'TYPETEXT'">
									<xsl:call-template name="SetFieldPositionTemplateGS" />
								</xsl:when>
								<xsl:when test="PlayBack--GeneralInfo-Event = 'KEYEVENT'">
									<xsl:call-template name="SendControlKeyTemplateGS" />
								</xsl:when>
							</xsl:choose>		  
						</xsl:for-each>
					  </Sequence>
				</ActivityAction>
			</xsl:element>			
			</xsl:element>
		</xsl:element>
    </Activity>
  </xsl:template>
 
  <xsl:template name="startTemplate">

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
  
  <xsl:template name="typeIntoTemplateGS">
		<xsl:element name="uit:TerminalSetField">
			  <xsl:attribute name="DelayMS">
				<xsl:value-of select="$DelayMS"/>
			  </xsl:attribute>
			  <xsl:attribute name="DisplayName">
				<xsl:value-of select="'Set Field'"/>
			  </xsl:attribute>
			  <xsl:attribute name="FollowedBy">
				<xsl:value-of select="PlayBack--AdditionalInfo-WHLL_NEXT_CONTROL_NAME"/> <!--FollowedBy-->
			  </xsl:attribute>
			  <xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$null"/>
			  </xsl:attribute>
			  <xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>			
			  <xsl:attribute name="Index">
				<xsl:value-of select="'1'"/>
			  </xsl:attribute>
			  <xsl:attribute name="LabeledBy">
				<xsl:value-of select="PlayBack--AdditionalInfo-WHLL_CURRENT_LABLE"/> <!--LabeledBy-->
			  </xsl:attribute>
			  <xsl:attribute name="Text">
				<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
			  </xsl:attribute>
			  <xsl:attribute name="TimeoutMS">
				<xsl:value-of select="$TimeoutMSetField"/>
			  </xsl:attribute>
			  <xsl:attribute name="WaitType">
				<xsl:value-of select="'Ready'"/>
			  </xsl:attribute> 
		</xsl:element>	
  </xsl:template>
	
	<xsl:template name="SetFieldPositionTemplateGS">
		<xsl:element name="uit:TerminalSetFieldAtPosition">
			  <xsl:attribute name="Column">
				  <xsl:value-of select="PlayBack--AdditionalInfo-WHLL_STARTY"/>
			  </xsl:attribute>
			  <xsl:attribute name="DelayMS">
				<xsl:value-of select="$DelayMS"/>
			  </xsl:attribute>
			  <xsl:attribute name="DisplayName">
				<xsl:value-of select="'Set Field at Positon'"/>
			  </xsl:attribute>
			  <xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$null"/>
			  </xsl:attribute>
			  <xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>
			<xsl:attribute name="Row">
				<xsl:value-of select="PlayBack--AdditionalInfo-WHLL_STARTX"/>
			</xsl:attribute>
			  <xsl:attribute name="Text">
				<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
			  </xsl:attribute>
			  <xsl:attribute name="TimeoutMS">
				<xsl:value-of select="$TimeoutMSetField"/>
			  </xsl:attribute>
			  <xsl:attribute name="WaitType">
				<xsl:value-of select="'Ready'"/>
			  </xsl:attribute> 
		</xsl:element>	
  </xsl:template>

	<xsl:template name="SendControlKeyTemplateGS">
		<xsl:element name="uit:TerminalSendControlKey">
			<xsl:attribute name="DelayMS">
				<xsl:value-of select="$DelayMS"/>
			</xsl:attribute>
			<xsl:attribute name="DisplayName">
				<xsl:value-of select="'Send Control Key'"/>
			</xsl:attribute>
			<xsl:attribute name="sap:VirtualizedContainerService.HintSize">
				<xsl:value-of select="$null"/>
			</xsl:attribute>
			<xsl:attribute name="sap2010:WorkflowViewState.IdRef">
				<xsl:value-of select="$empty"/>
			</xsl:attribute>
			<xsl:attribute name="Key">
				<xsl:call-template name="keyToControlKeyMapTemplateGs" />
			</xsl:attribute>
			<xsl:attribute name="TimeoutMS">
				<xsl:value-of select="$TimeoutMSetField"/>
			</xsl:attribute>
			<xsl:attribute name="WaitType">
				<xsl:value-of select="'Ready'"/>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>

	<xsl:template name="keyToControlKeyMapTemplateGs">
		<xsl:choose>
			<xsl:when test="PlayBack--ControlInfo-ControlData='Enter'">Transmit</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-ControlData='Tab'">Tab</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-ControlData='Backspace'">BackSpace</xsl:when>
			<xsl:otherwise><xsl:value-of select="PlayBack--ControlInfo-ControlData"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
  
</xsl:stylesheet>


