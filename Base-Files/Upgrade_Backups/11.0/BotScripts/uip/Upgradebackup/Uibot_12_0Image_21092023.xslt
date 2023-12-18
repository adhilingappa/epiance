<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:safe="http://www.esa.int/safe/sentinel-1.0" xmlns:incr="urn:my-scripts"
                xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib"
                exclude-result-prefixes="msxsl"
>
<msxsl:script implements-prefix='incr' language='CSharp'>
 <![CDATA[
    public string ImageToBase64(string imgPath ,string imgName)
    {
    
    string imgPath1 = imgPath+ '\\'+ imgName;		
      
      if(imgPath1!="")
      {
		System.IO.FileAttributes attr = System.IO.File.GetAttributes(imgPath1);
		if (!attr.HasFlag(System.IO.FileAttributes.Directory))
		{
			byte[] imageArray = System.IO.File.ReadAllBytes(imgPath1);
			return Convert.ToBase64String(imageArray);
		}
		return "";
      } 
      return "";
    }
	
	public string RemoveString(string DialogName,string removeString )
    {
      if(DialogName!="")
      {
         return DialogName.Replace(removeString,"");
      } 
      return "";
		
    }
  ]]>
  </msxsl:script>
  <!--Image UiPath Final 3-->

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
  <xsl:variable name="Accuracy">0.8</xsl:variable>
  <xsl:variable name="Basic">Basic</xsl:variable>

  <xsl:variable name="complete">COMPLETE</xsl:variable>
 <xsl:variable name="ImagPath">
   <xsl:value-of select="/Document/Meta/ImagePath"/>
  </xsl:variable>
  
    
  <xsl:template match="/">
    <Activity mc:Ignorable="sap sap2010" x:Class="Image" mva:VisualBasic.Settings="{x:Null}" sap:VirtualizedContainerService.HintSize="550,1737" sap2010:WorkflowViewState.IdRef="Image_1" xmlns="http://schemas.microsoft.com/netfx/2009/xaml/activities" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:mva="clr-namespace:Microsoft.VisualBasic.Activities;assembly=System.Activities" xmlns:sap="http://schemas.microsoft.com/netfx/2009/xaml/activities/presentation" xmlns:sap2010="http://schemas.microsoft.com/netfx/2010/xaml/activities/presentation" xmlns:scg="clr-namespace:System.Collections.Generic;assembly=mscorlib" xmlns:sco="clr-namespace:System.Collections.ObjectModel;assembly=mscorlib" xmlns:ui="http://schemas.uipath.com/workflow/activities" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">
      <xsl:call-template name="startTemplateImage"></xsl:call-template>
      <Sequence>
        <xsl:for-each select="Document/Process/Step">         
            <xsl:choose>
            <xsl:when test="PlayBack__GeneralInfo_IsCitrix='1'">
               <xsl:call-template name="clickTemplateImage"></xsl:call-template>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </Sequence>
    </Activity>
  </xsl:template>

  <xsl:template name="clickTemplateImage">

    <xsl:element name="ui:ClickImage">

      <xsl:attribute name="ContinueOnError">
        <xsl:value-of select="$null"/>
      </xsl:attribute>
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

      <xsl:element name="ui:ClickImage.CursorPosition">
        <xsl:element name="ui:CursorPosition">

          <xsl:attribute name="OffsetX">2</xsl:attribute>

          <xsl:attribute name="OffsetY">2</xsl:attribute>

          <xsl:attribute name="Position">
            <xsl:value-of select="$center"/>
          </xsl:attribute>

        </xsl:element>
      </xsl:element>

      <xsl:element name="ui:ClickImage.Image">
        <xsl:element name="ui:ImageTarget">
          <xsl:attribute name="Image">
            <xsl:value-of select="$null"/>
          </xsl:attribute>
          <xsl:attribute name="Accuracy">
            <xsl:value-of select="$Accuracy"/>
          </xsl:attribute>
          <xsl:attribute name="Profile">
            <xsl:value-of select="$Basic"/>
          </xsl:attribute>
          <xsl:attribute name="TargetImageBase64">
            <xsl:value-of select="incr:ImageToBase64($ImagPath,ImageStore__ControlImage__ImageData_FileName)"/>
            <!--Image base64 string attribute-->
          </xsl:attribute>
        </xsl:element>
      </xsl:element>


      <xsl:element name="ui:ClickImage.Target">
        <xsl:element name="ui:Target">

          <xsl:attribute name="ClippingRegion">
            <xsl:value-of select="$null"/>
          </xsl:attribute>

          <xsl:attribute name="Element">
            <xsl:value-of select="$null"/>
          </xsl:attribute>

          <xsl:attribute name="Selector">
            <xsl:call-template name="selectorTemplateImage" />
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
 
  <xsl:template name="startTemplateImage">
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
        <AssemblyReference>UiPath.System.Activities.Design</AssemblyReference>
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
        <xsl:value-of select="Sentence-Plain"/>
      </xsl:attribute>

      <xsl:attribute name="sap:VirtualizedContainerService.HintSize">
        <xsl:value-of select="$empty"/>
      </xsl:attribute>

      <xsl:attribute name="sap2010:WorkflowViewState.IdRef">
        <xsl:value-of select="$empty"/>
      </xsl:attribute>

      <xsl:attribute name="Key">
        <xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
      </xsl:attribute>

      <xsl:attribute name="KeyModifiers">
        <xsl:value-of select="$none"/>
      </xsl:attribute>

    </xsl:element>
  </xsl:template>

  <xsl:template name="selectorTemplateImageOLD">
    &lt; ctrl automationid='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' idx='1' name='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' role='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>'/&gt; &lt;
  </xsl:template> 
  
  <xsl:template name="selectorTemplateImage">
	  <xsl:if test="PlayBack__AppInfo_ExeName = 'iexplore.exe'">	
			  &lt;html title='<xsl:value-of select="incr:RemoveString(PlayBack__AppInfo_DialogName,' - Internet Explorer')"/>'/&gt; 
	  </xsl:if>
      <xsl:if test="PlayBack__AppInfo_ExeName = 'chrome.exe'">	
			  &lt;html app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' title='<xsl:value-of select="incr:RemoveString(PlayBack__AppInfo_DialogName,' - Google Chrome')"/>'/&gt; 
	  </xsl:if>
	  <xsl:if test="PlayBack__AppInfo_ExeName != 'chrome.exe' and PlayBack__AppInfo_ExeName != 'iexplore.exe'">	
			  &lt;wnd app='<xsl:value-of select="PlayBack__AppInfo_ExeName"/>' title='<xsl:value-of select="PlayBack__AppInfo_DialogName"/>'/&gt; 
	  </xsl:if>
  
  </xsl:template>

</xsl:stylesheet>


