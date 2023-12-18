<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:safe="http://www.esa.int/safe/sentinel-1.0" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils">
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<msxsl:using namespace="System.Collections.Generic"/>
    <![CDATA[
    int NodeID=0;
    public int getNodeID()
    {
      return ++NodeID;
    }
    
    
    int srcID=2; /*Begins with 3rd*/
    public int getSourceNodeID()
    {
      return ++srcID;
    }
    
    int tgtID=3; /*Begins with 4th*/
    public int getTargetNodeID()
    {
      return ++tgtID;
    }
    
    
    public int getLastNodeID()
    {
      return tgtID;
    }
    
    
    public string getWidgetType(string eventType)
	{
		try
		{
			if(eventType!=null)
			{
				if(eventType.ToLower() == "click" || eventType.ToLower() == "select")
					return "MouseScriptNode";
				else if(eventType.ToLower() == "typetext")
					return "KeyBoardScriptNode";
				else if(eventType.ToLower() == "windowactivate")
					return "MouseScriptNode";
				else
					return "MouseScriptNode";
			}
			else
			{
				return "RoboScriptNode";
			}
		}
		catch(Exception er)
		{
			return "RoboScriptNode";
		}
	}
  
  int iindex=0;
	 public int getIndexValue1()
     {
        return ++iindex;
     }
     int YCoordinate=200;
	 public int getYCoordinateValue()
     {
	    YCoordinate= YCoordinate+50;
        return YCoordinate;
     }
     
     public string removeSpecialCharacters(string data)
    {
      //  string eonFileName = Regex.Replace(data, "[*@&'-.:(\\s)<>#|/~`]", "");
        string eonFileName = Regex.Replace(data, @"\W+", "");
        eonFileName = eonFileName.Replace("_", "");
        return eonFileName;
    }
    
    public string replaceTabSpace(string controlName)
        {
            string tmpcontrolName = controlName;
            try
            {                
                if (controlName != "")
                {
                    tmpcontrolName = tmpcontrolName.Replace("	", "\\t");
                }
                return tmpcontrolName;
            }
            catch(Exception er)
            {
                return tmpcontrolName;
            }
        }
        public string removeExe(string applicationName)
    {
        string appName = Regex.Replace(applicationName, ".exe", "");
        return appName;
    }
     
		]]></msxsl:script>
	<xsl:param name="IsDVF"/>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<xsl:element name="WorkFlow">
			<xsl:element name="START">
				<xsl:call-template name="StartNode"/>
			</xsl:element>
			<xsl:element name="START">
				<xsl:call-template name="EndNode"/>
			</xsl:element>
			<!--Form Node Starts-->
			<xsl:if test="$IsDVF='true' and Document/Meta/IsValidForm='true'">
				<xsl:element name="START">
					<xsl:call-template name="FormNode"/>
				</xsl:element>
			</xsl:if>
			<!--Form Node Starts-->
			<xsl:for-each select="Document/Process/Step">
				
					<xsl:element name="START">
						<xsl:call-template name="RoboScript"/>
					</xsl:element>
				
			</xsl:for-each>
			<xsl:element name="START">
				<xsl:call-template name="connectionNodeFORStart"/>
			</xsl:element>
			<!--Form Connection Starts-->
			<xsl:if test="$IsDVF='true' and Document/Meta/IsValidForm='true'">
				<xsl:element name="START">
					<xsl:call-template name="connectionNode"/>
				</xsl:element>
			</xsl:if>
			<!--Form Connection Ends-->
			<xsl:for-each select="Document/Process/Step">
					<xsl:if test="position() != last()">
						<xsl:element name="START">
							<xsl:call-template name="connectionNode"/>
						</xsl:element>
					</xsl:if>				
			</xsl:for-each>
			<xsl:element name="START">
				<xsl:call-template name="connectionNodeFOREnd"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<!--Function-->
	<xsl:template name="StartNode">
		<xsl:element name="type">
			<xsl:value-of select="'wkspace.shape.Start'"/>
		</xsl:element>
		<xsl:element name="id">
			<xsl:value-of select="utils:getNodeID()"/>
		</xsl:element>
		<xsl:element name="x">
			<xsl:value-of select="'200'"/>
		</xsl:element>
		<xsl:element name="y">
			<xsl:value-of select="'100'"/>
		</xsl:element>
		<xsl:element name="angle">
			<xsl:value-of select="'0'"/>
		</xsl:element>
		<xsl:element name="userData">
			<xsl:element name="subtype">
				<xsl:value-of select="'node'"/>
			</xsl:element>
			<xsl:element name="Caption">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:value-of select="'StartNode'"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="EndNode">
		<xsl:element name="type">
			<xsl:value-of select="'wkspace.shape.End'"/>
		</xsl:element>
		<xsl:element name="id">
			<xsl:value-of select="utils:getNodeID()"/>
		</xsl:element>
		<xsl:element name="x">
			<xsl:value-of select="'110'"/>
		</xsl:element>
		<xsl:element name="y">
			<xsl:value-of select="'500'"/>
		</xsl:element>
		<xsl:element name="angle">
			<xsl:value-of select="'0'"/>
		</xsl:element>
		<xsl:element name="userData">
			<xsl:element name="subtype">
				<xsl:value-of select="'node'"/>
			</xsl:element>
			<xsl:element name="Caption">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:value-of select="'EndNode'"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="FormNode">
		<xsl:variable name="IDVale">
			<xsl:value-of select="utils:getNodeID()"/>
		</xsl:variable>
		<xsl:element name="type">
			<xsl:value-of select="'wkspace.shape.FormNode'"/>
		</xsl:element>
		<xsl:element name="id">
			<xsl:value-of select="$IDVale"/>
		</xsl:element>
		<xsl:element name="x">
			<xsl:value-of select="'200'"/>
		</xsl:element>
		<xsl:element name="y">
			<xsl:value-of select="'170'"/>
		</xsl:element>
		<xsl:element name="angle">
			<xsl:value-of select="'0'"/>
		</xsl:element>
		<xsl:element name="userData">
			<xsl:element name="subtype">
				<xsl:value-of select="'node'"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:value-of select="'FormNode'"/>
			</xsl:element>
			<xsl:element name="Caption">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="FormFile">
				<xsl:value-of select="'$FormFile'"/>
			</xsl:element>
			<xsl:element name="FormWidth">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="FormHeight">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="FormPositionX">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="FormPositionY">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="FormFileJsonData">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="formSizeOption">
				<xsl:value-of select="'FullScreen'"/>
			</xsl:element>
			<xsl:element name="formCustomStartOption">
				<xsl:value-of select="'Center'"/>
			</xsl:element>
			<xsl:element name="InputVar">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="OutputVar">
				<xsl:value-of select="'formObj'"/>
			</xsl:element>
			<xsl:element name="FORMVARIABLES"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="RoboScript">
		<xsl:variable name="WindowActivateStep">
			<xsl:value-of select="PlayBack__GeneralInfo_Event"/>
		</xsl:variable>
		<xsl:variable name="index">
			<xsl:value-of select="utils:getIndexValue1()"/>
		</xsl:variable>
		<xsl:variable name="IDVale">
			<xsl:value-of select="utils:getNodeID()"/>
		</xsl:variable>
		<xsl:variable name="YVale">
			<xsl:value-of select="utils:getYCoordinateValue()"/>
		</xsl:variable>
		<xsl:element name="type">
			<xsl:value-of select="concat('wkspace.shape.',(utils:getWidgetType(PlayBack__GeneralInfo_Event)))"/>
		</xsl:element>
		<xsl:element name="id">
			<xsl:value-of select="$IDVale"/>
		</xsl:element>
		<xsl:element name="x">
			<xsl:value-of select="'200'"/>
		</xsl:element>
		<xsl:element name="y">
			<xsl:value-of select="$YVale"/>
		</xsl:element>
		<xsl:element name="angle">
			<xsl:value-of select="'0'"/>
		</xsl:element>
		<xsl:element name="userData">
			<xsl:element name="subtype">
				<xsl:value-of select="'node'"/>
			</xsl:element>
			<xsl:element name="Caption">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:value-of select="utils:getWidgetType(PlayBack__GeneralInfo_Event)"/>
			</xsl:element>
			<xsl:element name="ScriptLoadFile">
				<xsl:value-of select="concat(utils:removeSpecialCharacters(concat(PlayBack__ControlInfo_ControlName,PlayBack__GeneralInfo_Event,Step_ID)),'.eon')"/>
			</xsl:element>
			<xsl:if test="PlayBack__GeneralInfo_AdaptorID='3'">
				<xsl:element name="ControlId">
					<xsl:value-of select="PlayBack__ControlInfo_IEControlID"/>
				</xsl:element>
				<xsl:element name="ControlXpath">
					<xsl:value-of select="PlayBack__ControlInfo_RelativeCSSPath"/>
				</xsl:element>
				<xsl:element name="ControlClasssName">
					<xsl:value-of select="PlayBack__ControlInfo_IEControlClassName"/>
				</xsl:element>
			</xsl:if>
			<xsl:element name="ControlName">
				<xsl:value-of select="utils:replaceTabSpace(PlayBack__ControlInfo_ControlName)"/>
			</xsl:element>
			<xsl:element name="ControlData">
				<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
			</xsl:element>
			<xsl:element name="className">
				<xsl:value-of select="concat('Class',utils:removeSpecialCharacters(concat(PlayBack__ControlInfo_ControlName,PlayBack__GeneralInfo_Event,Step_ID)))"/>
			</xsl:element>
			<xsl:element name="InputVar">
				<xsl:value-of select="''"/>
			</xsl:element>
			<xsl:element name="OutputVar">
				<xsl:if test="PlayBack__GeneralInfo_Event='WindowActivate'">
					<xsl:value-of select="concat('ObjIE',',',concat('Msaa_',utils:removeExe(PlayBack__AppInfo_ExeName)),',',concat('SAP_',utils:removeExe(PlayBack__AppInfo_ExeName)),',',concat('JAVA_',utils:removeExe(PlayBack__AppInfo_ExeName)))"/>
				</xsl:if>
				<xsl:if test="PlayBack__GeneralInfo_Event!='WindowActivate'">
					<xsl:value-of select="''"/>
				</xsl:if>
			</xsl:element>
			<xsl:element name="ProcessNameVar">
				<xsl:value-of select="(utils:removeSpecialCharacters(concat(PlayBack__ControlInfo_ControlName,PlayBack__GeneralInfo_Event,$index)))"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="connectionNode">
		<xsl:param name="InstanceName" select="'Untitled'"/>
		<xsl:variable name="Var1">
			<xsl:value-of select="utils:getSourceNodeID()"/>
		</xsl:variable>
		<xsl:variable name="Var2">
			<xsl:value-of select="utils:getTargetNodeID()"/>
		</xsl:variable>
		<xsl:variable name="Var3">
			<xsl:value-of select="'utils:updateIndexValueConnection()'"/>
		</xsl:variable>
		<xsl:element name="type">
			<xsl:value-of select="'wkspace.shape.AutoConnection'"/>
		</xsl:element>
		<xsl:element name="id">
			<xsl:value-of select="utils:getNodeID()"/>
		</xsl:element>
		<xsl:element name="angle">
			<xsl:value-of select="'0'"/>
		</xsl:element>
		<xsl:element name="userData">
			<xsl:element name="subtype">
				<xsl:value-of select="'connection'"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:value-of select="'AutoConnection'"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="policy">
			<xsl:value-of select="'draw2d.policy.line.LineSelectionFeedbackPolicy'"/>
		</xsl:element>
		<xsl:element name="outlineStroke">
			<xsl:value-of select="'draw2d.layout.connection.ManhattanConnectionRouter'"/>
		</xsl:element>
		<xsl:element name="source">
			<xsl:element name="node">
				<xsl:value-of select="$Var1"/>
			</xsl:element>
			<xsl:element name="port">
				<xsl:value-of select="'output0'"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="target">
			<xsl:element name="node">
				<xsl:value-of select="$Var2"/>
			</xsl:element>
			<xsl:element name="port">
				<xsl:value-of select="'input0'"/>
			</xsl:element>
			<xsl:element name="decoration">
				<xsl:value-of select="'draw2d.decoration.connection.ArrowDecorator'"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="label">
			<xsl:value-of select="'null'"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="connectionNodeFORStart">
		<xsl:param name="InstanceName" select="'Untitled'"/>
		<xsl:variable name="Var1">
			<xsl:value-of select="'1'"/>
		</xsl:variable>
		<xsl:variable name="Var2">
			<xsl:value-of select="'3'"/>
		</xsl:variable>
		<xsl:variable name="Var3">
			<xsl:value-of select="'utils:updateIndexValueConnection()'"/>
		</xsl:variable>
		<xsl:element name="type">
			<xsl:value-of select="'wkspace.shape.AutoConnection'"/>
		</xsl:element>
		<xsl:element name="id">
			<xsl:value-of select="utils:getNodeID()"/>
		</xsl:element>
		<xsl:element name="angle">
			<xsl:value-of select="'0'"/>
		</xsl:element>
		<xsl:element name="userData">
			<xsl:element name="subtype">
				<xsl:value-of select="'connection'"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:value-of select="'AutoConnection'"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="policy">
			<xsl:value-of select="'draw2d.policy.line.LineSelectionFeedbackPolicy'"/>
		</xsl:element>
		<xsl:element name="outlineStroke">
			<xsl:value-of select="'draw2d.layout.connection.ManhattanConnectionRouter'"/>
		</xsl:element>
		<xsl:element name="source">
			<xsl:element name="node">
				<xsl:value-of select="$Var1"/>
			</xsl:element>
			<xsl:element name="port">
				<xsl:value-of select="'output0'"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="target">
			<xsl:element name="node">
				<xsl:value-of select="$Var2"/>
			</xsl:element>
			<xsl:element name="port">
				<xsl:value-of select="'input0'"/>
			</xsl:element>
			<xsl:element name="decoration">
				<xsl:value-of select="'draw2d.decoration.connection.ArrowDecorator'"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="label">
			<xsl:value-of select="'null'"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="connectionNodeFOREnd">
		<xsl:param name="InstanceName" select="'Untitled'"/>
		<xsl:variable name="Var1">
			<xsl:value-of select="utils:getLastNodeID()"/>
		</xsl:variable>
		<xsl:variable name="Var2">
			<xsl:value-of select="'2'"/>
		</xsl:variable>
		<xsl:variable name="Var3">
			<xsl:value-of select="'utils:updateIndexValueConnection()'"/>
		</xsl:variable>
		<xsl:element name="type">
			<xsl:value-of select="'wkspace.shape.AutoConnection'"/>
		</xsl:element>
		<xsl:element name="id">
			<xsl:value-of select="utils:getNodeID()"/>
		</xsl:element>
		<xsl:element name="angle">
			<xsl:value-of select="'0'"/>
		</xsl:element>
		<xsl:element name="userData">
			<xsl:element name="subtype">
				<xsl:value-of select="'connection'"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:value-of select="'AutoConnection'"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="policy">
			<xsl:value-of select="'draw2d.policy.line.LineSelectionFeedbackPolicy'"/>
		</xsl:element>
		<xsl:element name="outlineStroke">
			<xsl:value-of select="'draw2d.layout.connection.ManhattanConnectionRouter'"/>
		</xsl:element>
		<xsl:element name="source">
			<xsl:element name="node">
				<xsl:value-of select="$Var1"/>
			</xsl:element>
			<xsl:element name="port">
				<xsl:value-of select="'output0'"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="target">
			<xsl:element name="node">
				<xsl:value-of select="$Var2"/>
			</xsl:element>
			<xsl:element name="port">
				<xsl:value-of select="'input0'"/>
			</xsl:element>
			<xsl:element name="decoration">
				<xsl:value-of select="'draw2d.decoration.connection.ArrowDecorator'"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="label">
			<xsl:value-of select="'null'"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>