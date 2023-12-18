<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
  <xsl:output method="xml" indent="no" omit-xml-declaration="yes"/>

  <msxsl:script implements-prefix='utils' language='CSharp'>
    <![CDATA[
		public string guid()
    {
		  string gi = Guid.NewGuid().ToString();
		  return gi;
		}
		
    public string replaceSAP(string str)
    {
      if(str!="")
         str= str.Replace("SAP","");
          
          return str;
    }
    
		string SessionID = "";
		public string getSessionID()
		{
		  return SessionID;
		}
		
    public string splitstring(string str)
    {
        string[] StrArr;
        string ID = string.Empty;          
        string[] parts = new string[10];
        StrArr = str.Split(new string[] { "ses" }, StringSplitOptions.None);
        if (StrArr.Length > 0)
        {
           SessionID  = StrArr[0];
            ID = StrArr[1];
            parts = StrArr[1].Split('/');
        }
        SessionID = SessionID + "ses" + parts[0];
        ID = ID.Remove(ID.IndexOf(parts[0]), parts[0].Length + 1);
	    return ID;
    }
		
		
		]]>
  </msxsl:script>

  <xsl:variable name="num1">1</xsl:variable>
  <xsl:variable name="num2">2</xsl:variable>
  <xsl:variable name="num3">3</xsl:variable>
  <xsl:variable name="num12">12</xsl:variable>
  <xsl:variable name="wait">15</xsl:variable>
  <xsl:variable name="wndInd">1.1.1.1.1</xsl:variable>
  <xsl:variable name="chrome">Chrome</xsl:variable>
  <xsl:variable name="Click">Click</xsl:variable>
  <xsl:variable name="true">True</xsl:variable>
  <xsl:variable name="false">False</xsl:variable>
  <xsl:variable name="default">Default</xsl:variable>
  <xsl:variable name="SAP">SAP</xsl:variable>
  <xsl:variable name="GuiAutomation">GuiAutomation</xsl:variable>
  <xsl:variable name="TextBox">TextBox</xsl:variable>
  
  
  <xsl:template name="mainSAPTemplate">
		<xsl:element name="CMD">
          <xsl:attribute name="GRP">
            <xsl:value-of select="$SAP"/>
          </xsl:attribute>
          <xsl:attribute name="NAM">
            <xsl:value-of select="$GuiAutomation"/>
          </xsl:attribute>
          <xsl:attribute name="API">
            <xsl:value-of select="$GuiAutomation"/>
          </xsl:attribute>
          <xsl:element name="PARS">
            <xsl:element name="PAR">
              <xsl:attribute name="Name">Session</xsl:attribute>
              <xsl:attribute name="Type">String</xsl:attribute>
              <xsl:value-of select="'Default'"/>
            </xsl:element>
			 <xsl:choose>
			  <xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">
				  <xsl:call-template name="ObjectPropertiesTextBox"/>
			 </xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role='SAPGuiTextField' or PlayBack--ControlInfo-Role='SAPGuiPasswordField' or PlayBack--ControlInfo-Role='SAPGuiOkCodeField'">
				  <xsl:call-template name="ObjectPropertiesTextBox"/>
			 </xsl:when>
			 <xsl:when test="PlayBack--ControlInfo-Role='SAPGuiComboBox'">
				  <xsl:call-template name="ObjectPropertiesComboBox"/>
			 </xsl:when>
			 <xsl:when test="PlayBack--ControlInfo-Role='SAPTree'">
              <xsl:call-template name="ObjectPropertiesTREE"/>
            </xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role='SAPHTMLViewer'">
              <xsl:call-template name="ObjectPropertiesHtmlViewer"/>
            </xsl:when>
			 <xsl:otherwise>
			    <xsl:call-template name="ObjectPropertiesRadioButton"/>
			  </xsl:otherwise>
			 </xsl:choose>
			  
			 <xsl:element name="PAR">
                <xsl:attribute name="Name">ActionName</xsl:attribute>
                <xsl:attribute name="Type">String</xsl:attribute>
				 <xsl:choose>
			        <xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">
						<xsl:value-of select="'Set Text'"/>
			        </xsl:when>
				    <xsl:when test="PlayBack--ControlInfo-Role='SAPGuiComboBox'">
						<xsl:value-of select="'Select Item By Text'"/>
			        </xsl:when>
				    <xsl:when test="PlayBack--ControlInfo-Role='SAPTree'">
						<xsl:value-of select="'Select Node By Text'"/>
			        </xsl:when>
				    <xsl:otherwise>
						<xsl:value-of select="'Left Click'"/>
				    </xsl:otherwise>
			  </xsl:choose>
              </xsl:element>
            
			  <xsl:element name="PAR">
                <xsl:attribute name="Name">ActionParameters</xsl:attribute>
                <xsl:attribute name="Type">String</xsl:attribute>
                <xsl:choose>
			         <xsl:when test="PlayBack--ControlInfo-Role='SAPGuiComboBox' or PlayBack--GeneralInfo-Event='TYPETEXT' or PlayBack--ControlInfo-Role='SAPTree'">
			             <xsl:value-of select="concat('[{&quot;Name&quot;:&quot;Text&quot;,&quot;Value&quot;:&quot;',PlayBack--ControlInfo-ControlData,'&quot;}]')"/>
			        </xsl:when>
				    <xsl:otherwise>
				        <xsl:value-of select="'[]'"></xsl:value-of>
				    </xsl:otherwise>
			    </xsl:choose>
			 </xsl:element>
			  
            <xsl:element name="PAR">
              <xsl:attribute name="Name">Wait</xsl:attribute>
              <xsl:attribute name="Type">Integer</xsl:attribute>
              <xsl:value-of select="$wait"/>
            </xsl:element>
            <xsl:element name="PAR">
              <xsl:attribute name="Name">ControlType</xsl:attribute>
              <xsl:attribute name="Type">String</xsl:attribute>
              <xsl:value-of select="utils:replaceSAP(PlayBack--ControlInfo-Role)"/>
            </xsl:element>
            <xsl:element name="PAR">
              <xsl:attribute name="Name">AssignVar</xsl:attribute>
              <xsl:attribute name="Type">String</xsl:attribute>
            </xsl:element>
            <xsl:element name="PAR">
              <xsl:attribute name="Name">SessionId</xsl:attribute>
              <xsl:attribute name="Type">String</xsl:attribute>
              <xsl:value-of select="utils:getSessionID()"/>
            </xsl:element>
            <xsl:element name="PAR">
              <xsl:attribute name="Name">ControlName</xsl:attribute>
              <xsl:attribute name="Type">String</xsl:attribute>
              <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
            </xsl:element>
            <xsl:element name="PAR">
              <xsl:attribute name="Name">WindowTitle</xsl:attribute>
              <xsl:attribute name="Type">String</xsl:attribute>
              <xsl:value-of select="PlayBack--AppInfo-DialogName"/>
            </xsl:element>
          </xsl:element>

        </xsl:element>
   </xsl:template>

  <xsl:template name="ObjectPropertiesOLD">
    <PAR Name="ObjectProperties" Type="String">
      [{"ExecutionCriteria":false,"Name":"AccLabelCollection","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"AccText","Value":""},{"ExecutionCriteria":false,"Name":"AccTextOnRequest","Value":""},{"ExecutionCriteria":false,"Name":"AccTooltip","Value":""},{"ExecutionCriteria":false,"Name":"CaretPosition","Value":"0"},{"ExecutionCriteria":false,"Name":"Changeable","Value":"True"},{"ExecutionCriteria":false,"Name":"CharHeight","Value":"1"},{"ExecutionCriteria":false,"Name":"CharLeft","Value":"26"},{"ExecutionCriteria":false,"Name":"CharTop","Value":"7"},{"ExecutionCriteria":false,"Name":"CharWidth","Value":"28"},{"ExecutionCriteria":false,"Name":"ContainerType","Value":"False"},{"ExecutionCriteria":false,"Name":"DefaultTooltip","Value":"Incoterms (Part 2)"},{"ExecutionCriteria":false,"Name":"DisplayedText","Value":""},{"ExecutionCriteria":false,"Name":"Height","Value":"20"},{"ExecutionCriteria":false,"Name":"Highlighted","Value":"False"},{"ExecutionCriteria":false,"Name":"HistoryCurEntry","Value":""},{"ExecutionCriteria":false,"Name":"HistoryCurIndex","Value":"-1"},{"ExecutionCriteria":false,"Name":"HistoryIsActive","Value":"False"},{"ExecutionCriteria":false,"Name":"HistoryList","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"IconName","Value":""},{"ExecutionCriteria":true,"Name":"Id","Value":"<xsl:value-of select="utils:splitstring(PlayBack--AdditionalInfo-CONTROL_ABSOLUTE_UNIQUE_ID_FOR_BOT_SCRIPT)"/>},{"ExecutionCriteria":false,"Name":"IsHotspot","Value":"False"},{"ExecutionCriteria":false,"Name":"IsLeftLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsListElement","Value":"False"},{"ExecutionCriteria":false,"Name":"IsOField","Value":"False"},{"ExecutionCriteria":false,"Name":"IsRightLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsSymbolFont","Value":"False"},{"ExecutionCriteria":false,"Name":"Left","Value":"154"},{"ExecutionCriteria":false,"Name":"LeftLabel","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"MaxLength","Value":"28"},{"ExecutionCriteria":false,"Name":"Modified","Value":"False"},{"ExecutionCriteria":false,"Name":"Name","Value":"MEPO1226-INCO2"},{"ExecutionCriteria":false,"Name":"Numerical","Value":"False"},{"ExecutionCriteria":false,"Name":"Parent","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ParentFrame","Value":""},{"ExecutionCriteria":false,"Name":"Required","Value":"False"},{"ExecutionCriteria":false,"Name":"RightLabel","Value":""},{"ExecutionCriteria":false,"Name":"ScreenLeft","Value":"189"},{"ExecutionCriteria":false,"Name":"ScreenTop","Value":"296"},{"ExecutionCriteria":false,"Name":"Text","Value":""},{"ExecutionCriteria":false,"Name":"Tooltip","Value":""},{"ExecutionCriteria":false,"Name":"Top","Value":"88"},{"ExecutionCriteria":false,"Name":"Type","Value":<xsl:value-of select="utils:replaceSAP(PlayBack--ControlInfo-Role)"/>},{"ExecutionCriteria":false,"Name":"TypeAsNumber","Value":"31"},{"ExecutionCriteria":false,"Name":"Width","Value":"202"},{"ExecutionCriteria":true,"Name":"SessionId","Value":"<xsl:value-of select="utils:getSessionID()"/>},{"ExecutionCriteria":false,"Name":"ClickX","Value":"32"},{"ExecutionCriteria":false,"Name":"ClickY","Value":"15"}]
    </PAR>
  </xsl:template>

  <xsl:template name="ObjectPropertiesRadioButton">
    <PAR Name="ObjectProperties" Type="String">
      [{"ExecutionCriteria":false,"Name":"AccLabelCollection","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"AccText","Value":""},{"ExecutionCriteria":false,"Name":"AccTextOnRequest","Value":""},{"ExecutionCriteria":false,"Name":"AccTooltip","Value":""},{"ExecutionCriteria":false,"Name":"Changeable","Value":"True"},{"ExecutionCriteria":false,"Name":"CharHeight","Value":"1"},{"ExecutionCriteria":false,"Name":"CharLeft","Value":""},{"ExecutionCriteria":false,"Name":"CharTop","Value":""},{"ExecutionCriteria":false,"Name":"CharWidth","Value":""},{"ExecutionCriteria":false,"Name":"ContainerType","Value":"False"},{"ExecutionCriteria":false,"Name":"DefaultTooltip","Value":""},{"ExecutionCriteria":false,"Name":"Flushing","Value":"True"},{"ExecutionCriteria":false,"Name":"GroupCount","Value":""},{"ExecutionCriteria":false,"Name":"GroupMembers","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"GroupPos","Value":"4"},{"ExecutionCriteria":false,"Name":"Height","Value":""},{"ExecutionCriteria":false,"Name":"IconName","Value":""},{"ExecutionCriteria":true,"Name":"Id","Value":"<xsl:value-of select="utils:splitstring(PlayBack--AdditionalInfo-CONTROL_ABSOLUTE_UNIQUE_ID_FOR_BOT_SCRIPT)"/>"},{"ExecutionCriteria":false,"Name":"IsLeftLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsRightLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsSymbolFont","Value":"False"},{"ExecutionCriteria":false,"Name":"Left","Value":""},{"ExecutionCriteria":false,"Name":"LeftLabel","Value":""},{"ExecutionCriteria":false,"Name":"Modified","Value":"False"},{"ExecutionCriteria":false,"Name":"Name","Value":"<xsl:value-of select="PlayBack--ControlInfo-ControlName"/>"},{"ExecutionCriteria":false,"Name":"Parent","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ParentFrame","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"RightLabel","Value":""},{"ExecutionCriteria":false,"Name":"ScreenLeft","Value":"203"},{"ExecutionCriteria":false,"Name":"ScreenTop","Value":"230"},{"ExecutionCriteria":false,"Name":"Selected","Value":"False"},{"ExecutionCriteria":false,"Name":"Text","Value":"Anything Will Do"},{"ExecutionCriteria":false,"Name":"Tooltip","Value":""},{"ExecutionCriteria":false,"Name":"Top","Value":"88"},{"ExecutionCriteria":false,"Name":"Type","Value":"GuiRadioButton"},{"ExecutionCriteria":false,"Name":"TypeAsNumber","Value":"41"},{"ExecutionCriteria":false,"Name":"Width","Value":""},{"ExecutionCriteria":true,"Name":"SessionId","Value":"<xsl:value-of select="utils:getSessionID()"/>"},{"ExecutionCriteria":false,"Name":"ClickX","Value":""},{"ExecutionCriteria":false,"Name":"ClickY","Value":""}]
    </PAR>
  </xsl:template>
  
  <xsl:template name="ObjectPropertiesHtmlViewer">
    <PAR Name="ObjectProperties" Type="String">
      [{"ExecutionCriteria":false,"Name":"AccLabelCollection","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"AccText","Value":""},{"ExecutionCriteria":false,"Name":"AccTextOnRequest","Value":""},{"ExecutionCriteria":false,"Name":"AccTooltip","Value":""},{"ExecutionCriteria":false,"Name":"Changeable","Value":"True"},{"ExecutionCriteria":false,"Name":"CharHeight","Value":"1"},{"ExecutionCriteria":false,"Name":"CharLeft","Value":""},{"ExecutionCriteria":false,"Name":"CharTop","Value":""},{"ExecutionCriteria":false,"Name":"CharWidth","Value":""},{"ExecutionCriteria":false,"Name":"ContainerType","Value":"False"},{"ExecutionCriteria":false,"Name":"DefaultTooltip","Value":""},{"ExecutionCriteria":false,"Name":"Flushing","Value":"True"},{"ExecutionCriteria":false,"Name":"GroupCount","Value":""},{"ExecutionCriteria":false,"Name":"GroupMembers","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"GroupPos","Value":"4"},{"ExecutionCriteria":false,"Name":"Height","Value":""},{"ExecutionCriteria":false,"Name":"IconName","Value":""},{"ExecutionCriteria":true,"Name":"Id","Value":"<xsl:value-of select="utils:splitstring(PlayBack--AdditionalInfo-CONTROL_ABSOLUTE_UNIQUE_ID_FOR_BOT_SCRIPT)"/>"},{"ExecutionCriteria":false,"Name":"IsLeftLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsRightLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsSymbolFont","Value":"False"},{"ExecutionCriteria":false,"Name":"Left","Value":""},{"ExecutionCriteria":false,"Name":"LeftLabel","Value":""},{"ExecutionCriteria":false,"Name":"Modified","Value":"False"},{"ExecutionCriteria":false,"Name":"Name","Value":"<xsl:value-of select="PlayBack--ControlInfo-ControlName"/>"},{"ExecutionCriteria":false,"Name":"Parent","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ParentFrame","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"RightLabel","Value":""},{"ExecutionCriteria":false,"Name":"ScreenLeft","Value":"203"},{"ExecutionCriteria":false,"Name":"ScreenTop","Value":"230"},{"ExecutionCriteria":false,"Name":"Selected","Value":"False"},{"ExecutionCriteria":false,"Name":"Text","Value":"Anything Will Do"},{"ExecutionCriteria":false,"Name":"Tooltip","Value":""},{"ExecutionCriteria":false,"Name":"Top","Value":"88"},{"ExecutionCriteria":false,"Name":"Type","Value":"GuiRadioButton"},{"ExecutionCriteria":false,"Name":"TypeAsNumber","Value":"41"},{"ExecutionCriteria":false,"Name":"Width","Value":""},{"ExecutionCriteria":true,"Name":"SessionId","Value":"<xsl:value-of select="utils:getSessionID()"/>"},{"ExecutionCriteria":false,"Name":"ClickX","Value":"<xsl:value-of select="SAPHTMLViewerLocation-X" />"},{"ExecutionCriteria":false,"Name":"ClickY","Value":"<xsl:value-of select="SAPHTMLViewerLocation-Y" />"}]
    </PAR>
  </xsl:template>

  <xsl:template name="ObjectPropertiesTextBox">
    <PAR Name="ObjectProperties" Type="String">[{"ExecutionCriteria":false,"Name":"AccLabelCollection","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"AccText","Value":""},{"ExecutionCriteria":false,"Name":"AccTextOnRequest","Value":""},{"ExecutionCriteria":false,"Name":"AccTooltip","Value":""},{"ExecutionCriteria":false,"Name":"CaretPosition","Value":"0"},{"ExecutionCriteria":false,"Name":"Changeable","Value":"True"},{"ExecutionCriteria":false,"Name":"CharHeight","Value":"1"},{"ExecutionCriteria":false,"Name":"CharLeft","Value":"22"},{"ExecutionCriteria":false,"Name":"CharTop","Value":"4"},{"ExecutionCriteria":false,"Name":"CharWidth","Value":"3"},{"ExecutionCriteria":false,"Name":"ContainerType","Value":"False"},{"ExecutionCriteria":false,"Name":"DefaultTooltip","Value":""},{"ExecutionCriteria":false,"Name":"DisplayedText","Value":""},{"ExecutionCriteria":false,"Name":"Height","Value":"20"},{"ExecutionCriteria":false,"Name":"Highlighted","Value":"False"},{"ExecutionCriteria":false,"Name":"HistoryCurEntry","Value":""},{"ExecutionCriteria":false,"Name":"HistoryCurIndex","Value":"-1"},{"ExecutionCriteria":false,"Name":"HistoryIsActive","Value":"False"},{"ExecutionCriteria":false,"Name":"HistoryList","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"IconName","Value":""},{"ExecutionCriteria":true,"Name":"Id","Value":"<xsl:value-of select="utils:splitstring(PlayBack--AdditionalInfo-CONTROL_ABSOLUTE_UNIQUE_ID_FOR_BOT_SCRIPT)"/>"},{"ExecutionCriteria":false,"Name":"IsHotspot","Value":"False"},{"ExecutionCriteria":false,"Name":"IsLeftLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsListElement","Value":"False"},{"ExecutionCriteria":false,"Name":"IsOField","Value":"False"},{"ExecutionCriteria":false,"Name":"IsRightLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsSymbolFont","Value":"False"},{"ExecutionCriteria":false,"Name":"Left","Value":"126"},{"ExecutionCriteria":false,"Name":"LeftLabel","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"MaxLength","Value":"3"},{"ExecutionCriteria":false,"Name":"Modified","Value":"False"},{"ExecutionCriteria":false,"Name":"Name","Value":"<xsl:value-of select="PlayBack--ControlInfo-ControlName"/>"},{"ExecutionCriteria":false,"Name":"Numerical","Value":"True"},{"ExecutionCriteria":false,"Name":"Parent","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ParentFrame","Value":""},{"ExecutionCriteria":false,"Name":"Required","Value":"False"},{"ExecutionCriteria":false,"Name":"RightLabel","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ScreenLeft","Value":"170"},{"ExecutionCriteria":false,"Name":"ScreenTop","Value":"239"},{"ExecutionCriteria":false,"Name":"Text","Value":""},{"ExecutionCriteria":false,"Name":"Tooltip","Value":""},{"ExecutionCriteria":false,"Name":"Top","Value":"22"},{"ExecutionCriteria":false,"Name":"Type","Value":"<xsl:value-of select="PlayBack--ControlInfo-Role"/>"},{"ExecutionCriteria":false,"Name":"TypeAsNumber","Value":"31"},{"ExecutionCriteria":false,"Name":"Width","Value":"27"},{"ExecutionCriteria":true,"Name":"SessionId","Value":"<xsl:value-of select="utils:getSessionID()"/>"},{"ExecutionCriteria":false,"Name":"ClickX","Value":"5"},{"ExecutionCriteria":false,"Name":"ClickY","Value":"5"}]</PAR>
  </xsl:template>

  <xsl:template name="ObjectPropertiesComboBox">
    <PAR Name="ObjectProperties" Type="String">[{"ExecutionCriteria":false,"Name":"AccLabelCollection","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"AccText","Value":""},{"ExecutionCriteria":false,"Name":"AccTextOnRequest","Value":""},{"ExecutionCriteria":false,"Name":"AccTooltip","Value":""},{"ExecutionCriteria":false,"Name":"Changeable","Value":"True"},{"ExecutionCriteria":false,"Name":"CharHeight","Value":"1"},{"ExecutionCriteria":false,"Name":"CharLeft","Value":"43"},{"ExecutionCriteria":false,"Name":"CharTop","Value":"1"},{"ExecutionCriteria":false,"Name":"CharWidth","Value":"15"},{"ExecutionCriteria":false,"Name":"ContainerType","Value":"False"},{"ExecutionCriteria":false,"Name":"CurListBoxEntry","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"DefaultTooltip","Value":"Airline Code"},{"ExecutionCriteria":false,"Name":"Entries","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"Flushing","Value":"False"},{"ExecutionCriteria":false,"Name":"Height","Value":"20"},{"ExecutionCriteria":false,"Name":"Highlighted","Value":"False"},{"ExecutionCriteria":false,"Name":"IconName","Value":""},{"ExecutionCriteria":true,"Name":"Id","Value":"wnd[0]/usr/subSA_0100_1:SAPLEXAMPLE_ENTRY_SCREEN:0200/subSA_200_2:SAPLEXAMPLE_ENTRY_SCREEN:1600/cmbSCARR-CARRID"},{"ExecutionCriteria":false,"Name":"IsLeftLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsListBoxActive","Value":"False"},{"ExecutionCriteria":false,"Name":"IsRightLabel","Value":"False"},{"ExecutionCriteria":false,"Name":"IsSymbolFont","Value":"False"},{"ExecutionCriteria":false,"Name":"Key","Value":" "},{"ExecutionCriteria":false,"Name":"Left","Value":"133"},{"ExecutionCriteria":false,"Name":"LeftLabel","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"Modified","Value":"False"},{"ExecutionCriteria":false,"Name":"Name","Value":"SCARR-CARRID"},{"ExecutionCriteria":false,"Name":"Parent","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ParentFrame","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"Required","Value":"False"},{"ExecutionCriteria":false,"Name":"RightLabel","Value":""},{"ExecutionCriteria":false,"Name":"ScreenLeft","Value":"308"},{"ExecutionCriteria":false,"Name":"ScreenTop","Value":"164"},{"ExecutionCriteria":false,"Name":"ShowKey","Value":"False"},{"ExecutionCriteria":false,"Name":"Text","Value":"                                                                                                                                                                                                                                                               "},{"ExecutionCriteria":false,"Name":"Tooltip","Value":""},{"ExecutionCriteria":false,"Name":"Top","Value":"22"},{"ExecutionCriteria":false,"Name":"Type","Value":"GuiComboBox"},{"ExecutionCriteria":false,"Name":"TypeAsNumber","Value":"34"},{"ExecutionCriteria":false,"Name":"Value","Value":" "},{"ExecutionCriteria":false,"Name":"Width","Value":"111"},{"ExecutionCriteria":true,"Name":"SessionId","Value":"/app/con[0]/ses[0]"},{"ExecutionCriteria":false,"Name":"ClickX","Value":"104"},{"ExecutionCriteria":false,"Name":"ClickY","Value":"5"}]</PAR>
  </xsl:template>

  <xsl:template name="ObjectProperties1">
    <PAR Name="ObjectProperties" Type="String">[{"ExecutionCriteria":false,"Name":"AccDescription","Value":""},{"ExecutionCriteria":false,"Name":"AccText","Value":""},{"ExecutionCriteria":false,"Name":"AccTextOnRequest","Value":""},{"ExecutionCriteria":false,"Name":"BrowserHandle","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"Changeable","Value":"True"},{"ExecutionCriteria":false,"Name":"Children","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ContainerType","Value":"True"},{"ExecutionCriteria":false,"Name":"CurrentContextMenu","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"DefaultTooltip","Value":""},{"ExecutionCriteria":false,"Name":"DocumentComplete","Value":"True"},{"ExecutionCriteria":false,"Name":"DragDropSupported","Value":"False"},{"ExecutionCriteria":false,"Name":"Handle","Value":"7738350"},{"ExecutionCriteria":false,"Name":"Height","Value":"601"},{"ExecutionCriteria":false,"Name":"IconName","Value":""},{"ExecutionCriteria":true,"Name":"Id","Value":"wnd[0]/usr/subSA_0100_1:SAPLEXAMPLE_ENTRY_SCREEN:0200/subSA_200_1:SAPLEXAMPLE_ENTRY_SCREEN:0800/cntlCC_HTML_INDEX/shellcont/shell"},{"ExecutionCriteria":false,"Name":"Left","Value":"0"},{"ExecutionCriteria":false,"Name":"Modified","Value":"True"},{"ExecutionCriteria":false,"Name":"Name","Value":"shell"},{"ExecutionCriteria":false,"Name":"OcxEvents","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"Parent","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ParentFrame","Value":""},{"ExecutionCriteria":false,"Name":"ScreenLeft","Value":"4"},{"ExecutionCriteria":false,"Name":"ScreenTop","Value":"134"},{"ExecutionCriteria":false,"Name":"SubType","Value":"HTMLViewer"},{"ExecutionCriteria":false,"Name":"Text","Value":"SAP.HTMLControl.1"},{"ExecutionCriteria":false,"Name":"Tooltip","Value":""},{"ExecutionCriteria":false,"Name":"Top","Value":"0"},{"ExecutionCriteria":false,"Name":"Type","Value":"GuiShell"},{"ExecutionCriteria":false,"Name":"TypeAsNumber","Value":"122"},{"ExecutionCriteria":false,"Name":"Width","Value":"170"},{"ExecutionCriteria":true,"Name":"SessionId","Value":"/app/con[0]/ses[0]"},{"ExecutionCriteria":false,"Name":"ClickX","Value":"79"},{"ExecutionCriteria":false,"Name":"ClickY","Value":"60"}]</PAR>
  </xsl:template>

  <xsl:template name="ObjectProperties">
    <PAR Name="ObjectProperties" Type="String">
      [{"ExecutionCriteria":false,"Name":"AccDescription","Value":""},{"ExecutionCriteria":false,"Name":"AccText","Value":""},{"ExecutionCriteria":false,"Name":"AccTextOnRequest","Value":""},{"ExecutionCriteria":false,"Name":"BrowserHandle","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"Changeable","Value":"True"},{"ExecutionCriteria":false,"Name":"Children","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ContainerType","Value":"True"},{"ExecutionCriteria":false,"Name":"CurrentContextMenu","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"DefaultTooltip","Value":""},{"ExecutionCriteria":false,"Name":"DocumentComplete","Value":"True"},{"ExecutionCriteria":false,"Name":"DragDropSupported","Value":"False"},{"ExecutionCriteria":false,"Name":"Handle","Value":"7738350"},{"ExecutionCriteria":false,"Name":"Height","Value":"601"},{"ExecutionCriteria":false,"Name":"IconName","Value":""},{"ExecutionCriteria":true,"Name":"Id","Value":"<xsl:value-of select="utils:splitstring(PlayBack--AdditionalInfo-CONTROL_ABSOLUTE_UNIQUE_ID_FOR_BOT_SCRIPT)"/>"},{"ExecutionCriteria":false,"Name":"Left","Value":"0"},{"ExecutionCriteria":false,"Name":"Modified","Value":"True"},{"ExecutionCriteria":false,"Name":"Name","Value":"shell"},{"ExecutionCriteria":false,"Name":"OcxEvents","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"Parent","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ParentFrame","Value":""},{"ExecutionCriteria":false,"Name":"ScreenLeft","Value":"4"},{"ExecutionCriteria":false,"Name":"ScreenTop","Value":"134"},{"ExecutionCriteria":false,"Name":"SubType","Value":"HTMLViewer"},{"ExecutionCriteria":false,"Name":"Text","Value":"SAP.HTMLControl.1"},{"ExecutionCriteria":false,"Name":"Tooltip","Value":""},{"ExecutionCriteria":false,"Name":"Top","Value":"0"},{"ExecutionCriteria":false,"Name":"Type","Value":"GuiShell"},{"ExecutionCriteria":false,"Name":"TypeAsNumber","Value":"122"},{"ExecutionCriteria":false,"Name":"Width","Value":"170"},{"ExecutionCriteria":true,"Name":"SessionId","Value":"<xsl:value-of select="utils:getSessionID()"/>"},{"ExecutionCriteria":false,"Name":"ClickX","Value":"79"},{"ExecutionCriteria":false,"Name":"ClickY","Value":"60"}]
    </PAR>
  </xsl:template>
  
  <xsl:template name="ObjectPropertiesTREE">
    <PAR Name="ObjectProperties" Type="String">
      [{"ExecutionCriteria":false,"Name":"AccDescription","Value":""},{"ExecutionCriteria":false,"Name":"AccText","Value":""},{"ExecutionCriteria":false,"Name":"AccTextOnRequest","Value":""},{"ExecutionCriteria":false,"Name":"BrowserHandle","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"Changeable","Value":"True"},{"ExecutionCriteria":false,"Name":"Children","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ContainerType","Value":"True"},{"ExecutionCriteria":false,"Name":"CurrentContextMenu","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"DefaultTooltip","Value":""},{"ExecutionCriteria":false,"Name":"DocumentComplete","Value":"True"},{"ExecutionCriteria":false,"Name":"DragDropSupported","Value":"False"},{"ExecutionCriteria":false,"Name":"Handle","Value":"7738350"},{"ExecutionCriteria":false,"Name":"Height","Value":"601"},{"ExecutionCriteria":false,"Name":"IconName","Value":""},{"ExecutionCriteria":true,"Name":"Id","Value":"<xsl:value-of select="utils:splitstring(PlayBack--AdditionalInfo-CONTROL_ABSOLUTE_UNIQUE_ID_FOR_BOT_SCRIPT)"/>"},{"ExecutionCriteria":false,"Name":"Left","Value":"0"},{"ExecutionCriteria":false,"Name":"Modified","Value":"True"},{"ExecutionCriteria":false,"Name":"Name","Value":"shell"},{"ExecutionCriteria":false,"Name":"OcxEvents","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"Parent","Value":"System.__ComObject"},{"ExecutionCriteria":false,"Name":"ParentFrame","Value":""},{"ExecutionCriteria":false,"Name":"ScreenLeft","Value":"4"},{"ExecutionCriteria":false,"Name":"ScreenTop","Value":"134"},{"ExecutionCriteria":false,"Name":"SubType","Value":"HTMLViewer"},{"ExecutionCriteria":false,"Name":"Text","Value":"SAP.HTMLControl.1"},{"ExecutionCriteria":false,"Name":"Tooltip","Value":""},{"ExecutionCriteria":false,"Name":"Top","Value":"0"},{"ExecutionCriteria":false,"Name":"Type","Value":"GuiShell"},{"ExecutionCriteria":false,"Name":"TypeAsNumber","Value":"122"},{"ExecutionCriteria":false,"Name":"Width","Value":"170"},{"ExecutionCriteria":true,"Name":"SessionId","Value":"<xsl:value-of select="utils:getSessionID()"/>"},{"ExecutionCriteria":false,"Name":"ClickX","Value":"79"},{"ExecutionCriteria":false,"Name":"ClickY","Value":"60"}]
    </PAR>
  </xsl:template>
  

  <xsl:template name="apiTemplate">
    <xsl:choose>
      <xsl:when test="PlayBack--ControlInfo-Role='editable text' and PlayBack--GeneralInfo-Event='TYPETEXT'">SetText</xsl:when>
      <xsl:when test="PlayBack--ControlInfo-Role='check box'">SetCheckBoxStatus</xsl:when>
      <xsl:when test="PlayBack--ControlInfo-Role='radio button'">SelectRadioButton</xsl:when>
      <xsl:otherwise>Click</xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template name="objTypeTemplate">
    <xsl:choose>
      <xsl:when test="PlayBack--ControlInfo-Role='editable text'">TextBox</xsl:when>
      <xsl:when test="PlayBack--ControlInfo-Role='check box'">CheckBox</xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="optTemplate">
    <xsl:choose>
      <xsl:when test="PlayBack--ControlInfo-Role='editable text' and PlayBack--GeneralInfo-Event='TYPETEXT'">12</xsl:when>
      <xsl:when test="PlayBack--ControlInfo-Role='check box'">13</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
