<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils">
	<xsl:output method="xml" indent="yes"/>
	<!--IE BluePrism Final 3 date:08/05/2020-->
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
		int initialPositionX = 15;
		int initialPositionY = -45;
		string lastGuid = "";
		
		string lastExcHanGuid = "";
		string endStageGuid = "";
		
		string dvfNotNullString = "";
		string dvfNullString = "";
		
		public const int Ctrl = 1;
        public const int Shift = 2;
        public const int Alt = 4;
        public const int CtrlShift = 3;
        public const int CtrlAlt = 5;
        public const int ShiftAlt = 6;
        public const int AltCtrlShift = 7;
		
		public void concatStringForms(string stepId)
		{
			dvfNotNullString += "field_" + stepId + "=myDictionary[\"field_" + stepId + "\"];";
			
			dvfNullString += "field_" + stepId + "=\"\";";
			
		}
		
		public string getDvfNotNullString()
		{
			return dvfNotNullString+"isDvfNull=false;";
		}
		
		public string getDvfNullString()
		{
			return dvfNullString+"isDvfNull=true;";
		}
		
		public  string GetShortCut(string VKey,string controlData)
        {
            try
            {
                if (VKey == string.Empty) return string.Empty;
                long SpKeyStatus = Convert.ToInt32(VKey);
                string ShortCutKey = string.Empty;
                if ((SpKeyStatus & Shift) == Shift)
                {
                    ShortCutKey = "+";
                }
                if ((SpKeyStatus & Alt) == Alt)
                {
                    ShortCutKey = "%";
                }
                if ((SpKeyStatus & Ctrl) == Ctrl)
                {
                    ShortCutKey = "^";
                }
                if ((SpKeyStatus & CtrlAlt) == CtrlAlt)
                {
                    ShortCutKey = "^%";
                }
                if ((SpKeyStatus & CtrlShift) == CtrlShift)
                {
                    ShortCutKey = "^+";
                }
                if ((SpKeyStatus & ShiftAlt) == ShiftAlt)
                {
                    ShortCutKey = "+%";
                }
                if ((SpKeyStatus & AltCtrlShift) == AltCtrlShift)
                {
                    ShortCutKey = "&^+";
                }
				
                return ShortCutKey+"{"+controlData.ToLower()+"}";
            }
            catch (Exception)
            {

                return string.Empty;
            }
        }
		
		public int getPositionY(int incr){
    initialPositionY = initialPositionY+incr;
    return initialPositionY;
		}
		
		public int getPositionX(int incr){
    initialPositionX = initialPositionX+incr;
    return initialPositionX;
		}
		
		public void resetPositionY(int val){
		initialPositionY = -45;
		}
		
		public void resetPositionX(int val){
		initialPositionX = val;
		}
		
		public void setLastGuid(string temp){
		     lastGuid = temp;
		}

		public string getLastGuid(){
		     return lastGuid;
		}
		
			public void setLastGuidExcHan(string temp){
		     lastExcHanGuid = temp;
		}

		public string getLastGuidExcHan(){
		     return lastExcHanGuid;
		}
		
		public string guid(){
		string gi = Guid.NewGuid().ToString();
		return gi;
		}
		
		public string getGuid(){
		string gi = Guid.NewGuid().ToString();
		setLastGuid(gi);
		return gi;
		}
		
		public string getGuidExcHan(){
		string gi = Guid.NewGuid().ToString();
		setLastGuidExcHan(gi);
		return gi;
		}
		
		public string getExeName(string exeName)
		{
		  string exeNamewithoutExe =  "";
		 exeNamewithoutExe=  exeName;
		 exeNamewithoutExe = exeNamewithoutExe.Replace(".exe","");
		 return exeNamewithoutExe;
	}
		
		public void setEndGuid(string tempGuid)
	{
	  endStageGuid = tempGuid;
	}
	
	public string getEndGuid()
	{
	  return endStageGuid ;
	}
		
	public string trim(string alias)
	{
			return alias.Trim();
	}
	
	public string getWaitTime(string waitForIteration,string delay,string IsDelayincluded,string IsWaitforIterationincluded)
	{
		int waitForIterationNumber =1;
		int delayNumber =30;
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
  
  public string ToLower(string stringValue)
      {
        string result = String.Empty;

        if(!String.IsNullOrEmpty(stringValue))
        {
          result = stringValue.ToLower(); 
        }

        return result;
      } 
	  
	 
	
    ]]></msxsl:script>
	<!--Variables-->
	<xsl:variable name="GpsId">
		<xsl:value-of select="/Document/Meta/GpsId"/>
	</xsl:variable>
	<xsl:variable name="GpsFile">
		<xsl:value-of select="/Document/Meta/ExternalBotFileName"/>
	</xsl:variable>
	<xsl:variable name="ExeName">
		<xsl:value-of select="/Document/EXE_NAME"/>
	</xsl:variable>
	<xsl:variable name="true">True</xsl:variable>
	<xsl:variable name="text">text</xsl:variable>
	<xsl:variable name="false">False</xsl:variable>
	<xsl:variable name="number">number</xsl:variable>
	<!--<xsl:variable name="centerClick">UIAClickCentre</xsl:variable>-->
	<xsl:variable name="newtext">newtext</xsl:variable>
	<xsl:variable name="normal">Normal</xsl:variable>
	<xsl:variable name="sendKeys">SendKeys</xsl:variable>
	<xsl:variable name="interval">interval</xsl:variable>
	<xsl:variable name="uiaElement">UIAElement</xsl:variable>
	<xsl:variable name="firstGuid">
		<xsl:value-of select="/Document/Process/Step/Step_Guid"/>
	</xsl:variable>
	<xsl:variable name="one">1</xsl:variable>
	<xsl:variable name="two">2</xsl:variable>
	<xsl:variable name="start">Start</xsl:variable>
	<xsl:variable name="end">end</xsl:variable>
	<xsl:variable name="step">Step</xsl:variable>
	<xsl:variable name="isConnected">IsConnected</xsl:variable>
	<xsl:variable name="endGuidforAttachAction">b6467db4-83b5-41c2-bac0-b67be67900ba</xsl:variable>
	<xsl:variable name="attachSubSheetId">7eebd8ed-b866-44d2-86b9-62cdc9202ea3</xsl:variable>
	<xsl:variable name="exceptionGuid">71705180-ac15-468f-8c7f-bc760d88544e</xsl:variable>
	<xsl:variable name="htmlCenterClick">HTMLClickCentre</xsl:variable>
	<xsl:variable name="selectItem">SelectItem</xsl:variable>
	<xsl:variable name="position">position</xsl:variable>
	<xsl:variable name="html">HTML</xsl:variable>
	<xsl:variable name="launch">Launch</xsl:variable>
	<xsl:variable name="attach">Attach</xsl:variable>
	<xsl:variable name="isAttachedVarName">G_Attached</xsl:variable>
	<xsl:variable name="objSuccessVarName">O_ObjectSuccess</xsl:variable>
	<xsl:variable name="textToWriteVarName">I_TextToWrite</xsl:variable>
	<xsl:variable name="valueReadVarName">ValueRead</xsl:variable>
	<xsl:variable name="valueReadvarNameReadTemplate">O_ValueRead</xsl:variable>
	<xsl:variable name="stepDelayLaunch">10</xsl:variable>
	<xsl:variable name="stepDelay">1</xsl:variable>
	<xsl:template match="/">
		<xsl:element name="process">
			<xsl:attribute name="name">
				<xsl:value-of select="concat($GpsFile,'_iexplore')"/>
			</xsl:attribute>
			<xsl:attribute name="version">1.0</xsl:attribute>
			<xsl:attribute name="bpversion">6.7.0.20116</xsl:attribute>
			<xsl:attribute name="narrative"/>
			<xsl:attribute name="byrefcollection">true</xsl:attribute>
			<xsl:attribute name="type">object</xsl:attribute>
			<xsl:attribute name="runmode">Exclusive</xsl:attribute>
			<xsl:attribute name="preferredid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<appdef>
				<xsl:element name="element">
					<xsl:attribute name="name">
						<xsl:value-of select="$GpsFile"/>
					</xsl:attribute>
					<xsl:element name="id">
						<xsl:value-of select="$GpsId"/>
					</xsl:element>
					<xsl:for-each select="Document/Process/Step">
						<xsl:choose>
							<xsl:when test="PlayBack__GeneralInfo_Event = 'Click' or PlayBack__GeneralInfo_Event = 'Select' or PlayBack__GeneralInfo_Event='TYPETEXT'">
								<xsl:call-template name="elementTemplateIe"/>
								<xsl:call-template name="elementTemplateUia"/>
								<xsl:call-template name="elementWindowTemplate"/>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
					<type>Application</type>
					<basetype>Application</basetype>
					<datatype>unknown</datatype>
					<diagnose>False</diagnose>
				</xsl:element>
				<xsl:call-template name="appTypeInfoTemplate"/>
			</appdef>
			<xsl:call-template name="boilerStageTemplate"/>
			<xsl:if test="Document/Meta/IsDvf='true' and Document/Meta/IsValidForm='true'">
				<xsl:call-template name="formsTemplate"/>
			</xsl:if>
			<xsl:call-template name="attachTemplate"/>
			<xsl:for-each select="Document/Process/Step">
				<xsl:choose>
					<xsl:when test="PlayBack__GeneralInfo_Event='TYPETEXT' and PlayBack__GeneralInfo_SPKeyStatus!='17'">
						<xsl:call-template name="actionTemplate"/>
						<xsl:call-template name="actionTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
							<xsl:with-param name="type" select="$two"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="actionTemplate"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="Document/Process/Step">
				<xsl:choose>
					<xsl:when test="PlayBack__GeneralInfo_Event = 'Click' or PlayBack__GeneralInfo_Event = 'Select'">
						<xsl:call-template name="variableDeclarationClickTemplate"/>
						<xsl:call-template name="startStageTemplate"/>
						<xsl:call-template name="linkPageTemplate"/>
						<xsl:if test="/Document/Meta/wndWait='true'">
							<!--wait for window-->
							<xsl:call-template name="waitTemplate">
								<xsl:with-param name="groupId" select="Additional_guid2"/>
								<xsl:with-param name="waitForType" select="1"/>
							</xsl:call-template>
							<xsl:call-template name="exceptionHandlingTemplate">
								<xsl:with-param name="exc" select="concat('Failed to find Window. Page1 - ',PlayBack__AppInfo_DialogName)"/>
							</xsl:call-template>
							<xsl:call-template name="activateTemplate"/>
						</xsl:if>
						<!--wait for precondition-->
						<xsl:if test="utils:ToLower(Pre_Condition_Control_visible) = 'yes' and utils:ToLower(Include_Pre_Condition_Control_visible) = 'true'">
							<xsl:call-template name="waitTemplate">
								<xsl:with-param name="groupId" select="Step_Guid"/>
								<xsl:with-param name="waitForType" select="2"/>
							</xsl:call-template>
							<xsl:call-template name="exceptionHandlingTemplate">
								<xsl:with-param name="exc" select="concat(PlayBack__ControlInfo_ControlName, ' element not found')"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="clickTemplate"/>
						<!--wait for postcondition-->
						<!--<xsl:call-template name="waitTemplate">
							<xsl:with-param name="groupId" select="Additional_guid3" />
							<xsl:with-param name="waitForType" select="3" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" />-->
						<xsl:call-template name="calculationTemplate"/>
						<xsl:call-template name="endStageTemplate"/>
					</xsl:when>
					<xsl:when test="PlayBack__GeneralInfo_Event='KEYEVENT' or (PlayBack__GeneralInfo_Event='TYPETEXT' and Standard__Control_TypedKey_En='V' and PlayBack__GeneralInfo_SPKeyStatus='17')">
						<xsl:call-template name="startStageTemplate"/>
						<xsl:call-template name="keyPressTemplate"/>
						<xsl:call-template name="endStageTemplate"/>
					</xsl:when>
					<xsl:when test="PlayBack__GeneralInfo_Event='TYPETEXT'">
						<xsl:call-template name="variableDeclarationTypeTemplate"/>
						<xsl:call-template name="startStageTemplate"/>
						<xsl:call-template name="linkPageTemplate"/>
						<xsl:if test="/Document/Meta/wndWait='true'">
							<!--wait for window-->
							<xsl:call-template name="waitTemplate">
								<xsl:with-param name="groupId" select="Additional_guid2"/>
								<xsl:with-param name="waitForType" select="1"/>
							</xsl:call-template>
							<xsl:call-template name="exceptionHandlingTemplate">
								<xsl:with-param name="exc" select="concat('Failed to find Window. Page - ',PlayBack__AppInfo_DialogName)"/>
							</xsl:call-template>
							<xsl:call-template name="activateTemplate"/>
						</xsl:if>
						<!--wait for precondition-->
						<xsl:if test="utils:ToLower(Pre_Condition_Control_visible) = 'yes' and utils:ToLower(Include_Pre_Condition_Control_visible) = 'true'">
						<xsl:call-template name="waitTemplate">
							<xsl:with-param name="groupId" select="Step_Guid"/>
							<xsl:with-param name="waitForType" select="2"/>
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate">
							<xsl:with-param name="exc" select="concat(PlayBack__ControlInfo_ControlName, ' element not found')"/>
						</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="typeTextTemplate"/>
						<xsl:call-template name="readTemplate"/>
						<xsl:call-template name="decisionTemplate">
							<xsl:with-param name="exp" select="concat('[',$textToWriteVarName,'_',Step_ID,']=[',$valueReadVarName,']')"/>
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate">
							<xsl:with-param name="exc" select="concat('value in element does not match value typed in element - ',PlayBack__ControlInfo_ControlName)"/>
						</xsl:call-template>
						<xsl:call-template name="calculationTemplate"/>
						<xsl:call-template name="endStageTemplate"/>
						<!--Read action-->
						<xsl:call-template name="variableDeclarationReadTemplate"/>
						<xsl:call-template name="startStageTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
						</xsl:call-template>
						<xsl:call-template name="linkPageTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
						</xsl:call-template>
						<xsl:if test="/Document/Meta/wndWait='true'">
							<!--wait for window-->
							<xsl:call-template name="waitTemplate">
								<xsl:with-param name="subsheetId" select="Additional_guid1"/>
								<xsl:with-param name="groupId" select="Additional_guid2"/>
								<xsl:with-param name="waitForType" select="1"/>
							</xsl:call-template>
							<xsl:call-template name="exceptionHandlingTemplate">
								<xsl:with-param name="subsheetId" select="Additional_guid1"/>
								<xsl:with-param name="exc" select="concat('Failed to find Window. Page - ',PlayBack__AppInfo_DialogName)"/>
							</xsl:call-template>
							<xsl:call-template name="activateTemplate">
								<xsl:with-param name="subsheetId" select="Additional_guid1"/>
							</xsl:call-template>
						</xsl:if>
						<!--wait for precondition-->
						<xsl:call-template name="waitTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
							<xsl:with-param name="groupId" select="Step_Guid"/>
							<xsl:with-param name="waitForType" select="2"/>
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
							<xsl:with-param name="exc" select="concat(PlayBack__ControlInfo_ControlName, ' element not found')"/>
						</xsl:call-template>
						<xsl:call-template name="readTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
							<xsl:with-param name="variableToStoreValueIn" select="$valueReadvarNameReadTemplate"/>
						</xsl:call-template>
						<xsl:call-template name="decisionTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
							<xsl:with-param name="exp" select="concat('[',$valueReadvarNameReadTemplate,']&lt;&gt;&quot;&quot;')"/>
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
							<xsl:with-param name="exc" select="concat('empty value read from element ',PlayBack__ControlInfo_ControlName)"/>
						</xsl:call-template>
						<xsl:call-template name="calculationTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
						</xsl:call-template>
						<xsl:call-template name="endStageTemplate">
							<xsl:with-param name="subsheetId" select="Additional_guid1"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="actionTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:param name="type" select="$one"/>
		<xsl:element name="subsheet">
			<xsl:attribute name="subsheetid">
				<xsl:value-of select="$subsheetId"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:value-of select="$normal"/>
			</xsl:attribute>
			<xsl:attribute name="published">
				<xsl:value-of select="$true"/>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="PlayBack__AppInfo_ExeName='mstsc.exe'">
					<xsl:element name="name">
						<xsl:value-of select="concat($step,'_',Step_ID)"/>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="name">
						<!--	<xsl:value-of select="utils:getActionCount()"/> -->
						<!--<xsl:value-of select="Step_ID"/> -->
						<!--Map same value in process-->
						<!--<xsl:variable name="tempAlias">
							<xsl:value-of select="Step_AliasName"/>
						</xsl:variable>
						<xsl:variable name="trimAlias">
							<xsl:value-of select="utils:trim($tempAlias)"/>
						</xsl:variable>-->
						<xsl:choose>
							<xsl:when test="$type=$one">
								<xsl:value-of select="concat(actionNameForBp,'_',Step_ID)"/>
							</xsl:when>
							<xsl:when test="$type=$two">
								<xsl:value-of select="concat(actionNameForBp,'_read_',Step_ID)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(actionNameForBp,'_',Step_ID)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
			<view>
				<camerax>0</camerax>
				<cameray>0</cameray>
				<zoom version="2">1.25</zoom>
			</view>
		</xsl:element>
	</xsl:template>
	<xsl:template name="elementTemplateIe">
		<xsl:element name="element">
			<xsl:attribute name="name">
				<xsl:value-of select="concat('Ie_',PlayBack__ControlInfo_ControlName)"/>
			</xsl:attribute>
			<xsl:element name="id">
				<xsl:value-of select="Step_Guid"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:value-of select="$html"/>
			</xsl:element>
			<xsl:element name="basetype">
				<xsl:value-of select="$html"/>
			</xsl:element>
			<xsl:element name="datatype">
				<xsl:value-of select="$text"/>
			</xsl:element>
			<xsl:element name="diagnose">
				<xsl:value-of select="$false"/>
			</xsl:element>
			<xsl:element name="attributes">
				<xsl:element name="attribute">
					<xsl:attribute name="name">TagName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_PlayBack__ControlInfo_IEControlAttributeTagName='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_PlayBack__ControlInfo_IEControlAttributeTagName='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$true"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__ControlInfo_IEControlAttributeTagName"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">ClassName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__ControlInfo_IEControlClassName='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__ControlInfo_IEControlClassName='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:when test="BP_PlayBack__ControlInfo_IEControlClassName!=''">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__ControlInfo_IEControlClassName"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">ID</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_PlayBack__ControlInfo_IEControlID='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_PlayBack__ControlInfo_IEControlID='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:when test="BP_PlayBack__AdditionalInfo_Web_IFrameFullXPath='' and BP_PlayBack__AdditionalInfo_Web_Name='' and PlayBack__ControlInfo_IEControlID!=''">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
						</xsl:attribute>
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__ControlInfo_IEControlID"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">pURL</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_PlayBack__AppInfo_IEDocURL='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_PlayBack__AppInfo_IEDocURL='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__AppInfo_IEDocURL"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">Title</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__ControlInfo_IEControlTitle='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__ControlInfo_IEControlTitle='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__ControlInfo_IEControlTitle"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">MatchIndex</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_MatchIndex='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_MatchIndex='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="$one"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">Path</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_IFrameFullXPath='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_IFrameFullXPath='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$true"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__AdditionalInfo_Web_IFrameFullXPath"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">Link</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:choose>
								<!--TODO : use Href value instead of controlData-->
								<xsl:when test="PlayBack__ControlInfo_Role='link'">
									<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
								</xsl:when>
								<xsl:otherwise>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">InputType</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_Type='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_Type='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="PlayBack__ControlInfo_IEControlAttributeTagName='INPUT'">
									<xsl:value-of select="BP_PlayBack__AdditionalInfo_Web_Type"/>
								</xsl:when>
								<xsl:otherwise>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">InputIdentifier2</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_Name='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_Name='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:when test="BP_PlayBack__AdditionalInfo_Web_IFrameFullXPath='' and BP_PlayBack__AdditionalInfo_Web_Name!=''">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__AdditionalInfo_Web_Name"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">Value</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_Value='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_Value='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__AdditionalInfo_Web_Value"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">AncestorCount</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_AncestorCount='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_Web_AncestorCount='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$number"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__AdditionalInfo_Web_AncestorCount"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="elementTemplateUia">
		<xsl:element name="element">
			<xsl:attribute name="name">
				<xsl:value-of select="concat('uia_',PlayBack__ControlInfo_ControlName,' element')"/>
			</xsl:attribute>
			<xsl:element name="id">
				<xsl:value-of select="utils:guid()"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:call-template name="matchDictionaryTemplate1"/>
			</xsl:element>
			<xsl:element name="basetype">
				<xsl:call-template name="matchDictionaryTemplate1"/>
			</xsl:element>
			<xsl:element name="datatype">
				<xsl:value-of select="$text"/>
			</xsl:element>
			<xsl:element name="diagnose">
				<xsl:value-of select="$false"/>
			</xsl:element>
			<xsl:element name="attributes">
				<xsl:element name="attribute">
					<xsl:attribute name="name">uName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_NAME='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_NAME='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$true"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__AdditionalInfo_UIA_NAME"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">uLocalizedControlType</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$true"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">uAutomationId</xsl:attribute>
					<xsl:if test="BP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID">
						<xsl:attribute name="inuse">
							<xsl:choose>
								<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID='False'">
									<xsl:value-of select="$false"/>
								</xsl:when>
								<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID='True'">
									<xsl:value-of select="$true"/>
								</xsl:when>
								<xsl:when test="BP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID = ''">
									<xsl:value-of select="$false"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$true"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</xsl:if>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">puName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_PARENT_NAME='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_PARENT_NAME='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__AdditionalInfo_UIA_PARENT_NAME"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">puLocalizedControlType</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE='False'">
								<xsl:value-of select="$false"/>
							</xsl:when>
							<xsl:when test="Include_BP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE='True'">
								<xsl:value-of select="$true"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$false"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="BP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">MatchIndex</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="$one"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="elementWindowTemplate">
		<xsl:element name="element">
			<xsl:attribute name="name">
				<xsl:value-of select="concat('uia_',PlayBack__ControlInfo_ControlName,' elementWindow')"/>
			</xsl:attribute>
			<xsl:element name="id">
				<xsl:value-of select="Additional_guid1"/>
			</xsl:element>
			<xsl:element name="type">
				<xsl:value-of select="'Window'"/>
			</xsl:element>
			<xsl:element name="basetype">
				<xsl:value-of select="'Window'"/>
			</xsl:element>
			<xsl:element name="datatype">
				<xsl:value-of select="$text"/>
			</xsl:element>
			<xsl:element name="diagnose">
				<xsl:value-of select="$false"/>
			</xsl:element>
			<xsl:element name="attributes">
				<xsl:element name="attribute">
					<xsl:attribute name="name">WindowText</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__AppInfo_DialogName"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">ClassName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">Visible</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="'flag'"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="$true"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">ScreenVisible</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="'flag'"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="$true"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="attribute">
					<xsl:attribute name="name">Enabled</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="'flag'"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="$true"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="appTypeInfoTemplate">
		<apptypeinfo>
			<id>HTMLLaunch</id>
			<parameters>
				<parameter>
					<name>Path</name>
					<value>
						<xsl:value-of select="concat(/Document/Process/Step/PlayBack__AppInfo_Path,'\',/Document/Process/Step/PlayBack__AppInfo_ExeName)"/>
					</value>
				</parameter>
				<parameter>
					<name>CommandLineParams</name>
					<value>
						<xsl:value-of select="/Document/Process/Step/PlayBack__AppInfo_IEDocURL"/>
					</value>
				</parameter>
				<parameter>
					<name>ActiveTabOnly</name>
					<value>True</value>
				</parameter>
				<parameter>
					<name>UseJavaInBrowser</name>
					<value>False</value>
				</parameter>
				<parameter>
					<name>ExcludeHTC</name>
					<value>True</value>
				</parameter>
				<parameter>
					<name>ProcessMode</name>
					<value>Internal</value>
				</parameter>
				<parameter>
					<name>ExternalProcessTimeout</name>
					<value>0</value>
				</parameter>
			</parameters>
		</apptypeinfo>
	</xsl:template>
	<xsl:template name="formsTemplate">
		<stage stageid="e25da745-ebca-4d3f-9787-5aa23f77a4f9" name="Start" type="Start">
			<subsheetid>a680af40-f256-40fb-88e0-2dfcf483cb18</subsheetid>
			<loginhibit/>
			<display x="-270" y="-405"/>
			<onsuccess>0cc6a221-adb8-4049-a91b-7b417595a9d1</onsuccess>
		</stage>
		<stage stageid="0cc6a221-adb8-4049-a91b-7b417595a9d1" name="launch form" type="Code">
			<subsheetid>a680af40-f256-40fb-88e0-2dfcf483cb18</subsheetid>
			<loginhibit/>
			<display x="-270" y="-345"/>
			<outputs>
				<xsl:for-each select="Document/Process/Step">
					<xsl:if test="PlayBack__ControlInfo_Role='editable text' and  PlayBack__GeneralInfo_Event='TYPETEXT' and PlayBack__GeneralInfo_SPKeyStatus!='17'">
						<xsl:element name="output">
							<xsl:attribute name="type">text</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="concat('field_',Step_ID)"/>
							</xsl:attribute>
							<xsl:attribute name="stage">
								<xsl:value-of select="concat('I_TextToWrite_',Step_ID)"/>
							</xsl:attribute>
						</xsl:element>
						<xsl:value-of select="utils:concatStringForms(Step_ID)"/>
					</xsl:if>
				</xsl:for-each>
				<output type="flag" name="isDvfNull" stage="isDvfNull"/>
			</outputs>
			<onsuccess>a2c098a7-3fe5-4f12-9508-80f0114087b9</onsuccess>
			<xsl:element name="code">
				<xsl:text disable-output-escaping="yes">
&lt;![CDATA[FormViewer.Forms formObj = new FormViewer.Forms();</xsl:text>
				<xsl:value-of select="concat('dynamic Data1=formObj.ShowDVF(@&quot;',Document/Meta/RepositoryPath,'\BotScripts\Blue Prism\',Document/Meta/TemplateVersion,'\',$GpsFile,'\',Document/Meta/ExternalBotFileName,'Forms.efm&quot;,null,1920,1080);')"/>
				<xsl:text disable-output-escaping="yes">
if(Data1!=null)
{
dynamic myDictionary = JsonConvert.DeserializeObject&lt;Dictionary&lt;string, string&gt;&gt;(Data1);
				</xsl:text>
				<xsl:value-of select="utils:getDvfNotNullString()"/>
				<xsl:text disable-output-escaping="yes">
}
else
{
				</xsl:text>
				<xsl:value-of select="utils:getDvfNullString()"/>
				<xsl:text disable-output-escaping="yes">
}]]&gt;
				</xsl:text>
			</xsl:element>
		</stage>
		<stage stageid="a2c098a7-3fe5-4f12-9508-80f0114087b9" name="End" type="End">
			<subsheetid>a680af40-f256-40fb-88e0-2dfcf483cb18</subsheetid>
			<loginhibit/>
			<display x="-270" y="-285"/>
			<outputs>
				<output type="flag" name="isDvfNull1" stage="isDvfNull"/>
			</outputs>
		</stage>
		<stage stageid="7bd9a36f-7f29-4534-ba85-f9ac783a5c07" name="isDvfNull" type="Data">
			<subsheetid>a680af40-f256-40fb-88e0-2dfcf483cb18</subsheetid>
			<display x="-450" y="-375"/>
			<datatype>flag</datatype>
			<initialvalue/>
			<private/>
			<alwaysinit/>
		</stage>
	</xsl:template>
	<xsl:template name="boilerStageTemplate">
		<view>
			<camerax>0</camerax>
			<cameray>0</cameray>
			<zoom version="2">1.25</zoom>
		</view>
		<preconditions/>
		<endpoint narrative=""/>
		<subsheet subsheetid="7608d98f-dc54-4977-8045-c6760e6ec101" type="CleanUp" published="True">
			<name>Clean Up</name>
			<view>
				<camerax>0</camerax>
				<cameray>0</cameray>
				<zoom version="2">1.25</zoom>
			</view>
		</subsheet>
		<subsheet subsheetid="7eebd8ed-b866-44d2-86b9-62cdc9202ea3" type="Normal" published="True">
			<name>Attach</name>
			<view>
				<camerax>0</camerax>
				<cameray>0</cameray>
				<zoom version="2">1.25</zoom>
			</view>
		</subsheet>
		<xsl:if test="Document/Meta/IsDvf='true' and Document/Meta/IsValidForm='true'">
			<subsheet subsheetid="a680af40-f256-40fb-88e0-2dfcf483cb18" type="Normal" published="True">
				<name>Forms</name>
				<view>
					<camerax>-155</camerax>
					<cameray>-273</cameray>
					<zoom version="2">1.25</zoom>
				</view>
			</subsheet>
		</xsl:if>
		<stage stageid="230b4dc4-5ea6-419c-a906-78a27bddc2ec" name="Start" type="Start">
			<loginhibit/>
			<display x="15" y="-105"/>
			<onsuccess>1f001a2c-3ee5-49ee-bfeb-b11d960e5c59</onsuccess>
		</stage>
		<stage stageid="1f001a2c-3ee5-49ee-bfeb-b11d960e5c59" name="End" type="End">
			<loginhibit/>
			<display x="15" y="90"/>
		</stage>
		<stage stageid="f280d612-ea58-4131-a54b-eecb42feead1" name="Stage1" type="ProcessInfo">
			<display x="-195" y="-105" w="150" h="90"/>
			<references>
				<reference>System.dll</reference>
				<reference>System.Data.dll</reference>
				<reference>System.Xml.dll</reference>
				<reference>System.Drawing.dll</reference>
				<reference>System.Core.dll</reference>
				<reference>Microsoft.CSharp.dll</reference>
				<reference>CustomDLLForAutomationTools.dll</reference>
				<reference>FormViewer.dll</reference>
				<reference>Newtonsoft.Json.dll</reference>
				<reference>System.Windows.Forms.dll</reference>
			</references>
			<imports>
				<import>System</import>
				<import>System.Drawing</import>
				<import>System.Data</import>
				<import>System.Dynamic</import>
				<import>Microsoft.CSharp.RuntimeBinder</import>
				<import>CustomDLLForAutomationTools</import>
				<import>FormViewer</import>
				<import>Newtonsoft.Json</import>
				<import>System.Windows.Forms</import>
				<import>System.Collections.Generic</import>
			</imports>
			<language>csharp</language>
		</stage>
		<stage stageid="16f0c0aa-36d0-4f47-a0b2-0fbe2d178ad0" name="Clean Up" type="SubSheetInfo">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<display x="-195" y="-105" w="150" h="90"/>
		</stage>
		<stage stageid="c8929f82-3259-40e8-98df-02472b2f7a45" name="Start" type="Start">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<loginhibit/>
			<display x="15" y="-105"/>
			<onsuccess>d7cbfcb1-9c03-4643-8459-2e5ef78c6332</onsuccess>
		</stage>
		<stage stageid="86847ebf-f4e0-47d4-ab94-78ded084e0b9" name="End" type="End">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<loginhibit/>
			<display x="15" y="90"/>
		</stage>
		<stage stageid="cd240663-4801-477e-9b09-3e1521d0d535" name="Note1" type="Note">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<narrative>
				Clean Up Page

				This is an optional page where you might choose to perform some finalisation (or "cleanup") tasks as your business object is closed down.

				The cleanup action will be called automatically immediately after closing your business object at the end of a business process.

				You will not be able to call this action from a business process, nor will it be called at any other time than before the disposal of the business object.
			</narrative>
			<display x="-180" y="60" w="180" h="230"/>
		</stage>
		<stage stageid="8ba4126b-0eec-4bb4-89ec-0a7fb4a184a1" name="Note2" type="Note">
			<narrative>
				Initialise Page

				This is an optional page where you might choose to perform some initialisation tasks after your business object is loaded.

				The initialise action will be called automatically immediately after loading your business object.

				You will not be able to call this action from a business process, nor will it be called at any other time than after the creation of the object.
			</narrative>
			<display x="-180" y="60" w="180" h="230"/>
		</stage>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$isAttachedVarName"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<display x="240" y="-45" w="150" h="30"/>
			<!-- <xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>flag</datatype>
			<initialvalue>True</initialvalue>
			<alwaysinit/>
		</xsl:element>
		<stage stageid="d7cbfcb1-9c03-4643-8459-2e5ef78c6332" name="Terminate Application" type="Navigate">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<loginhibit/>
			<display x="15" y="-15" w="120" h="30"/>
			<onsuccess>86847ebf-f4e0-47d4-ab94-78ded084e0b9</onsuccess>
			<step>
				<xsl:element name="element">
					<xsl:attribute name="id">
						<xsl:value-of select="$GpsId"/>
					</xsl:attribute>
				</xsl:element>
				<action>
					<id>Terminate</id>
				</action>
			</step>
		</stage>
	</xsl:template>
	<xsl:template name="linkPageTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$attach"/>
			</xsl:attribute>
			<xsl:attribute name="type">SubSheet</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<xsl:element name="processid">
				<xsl:value-of select="$attachSubSheetId"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="clickTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="Sentence_Plain"/>
			</xsl:attribute>
			<xsl:attribute name="type">Navigate</xsl:attribute>
			<xsl:attribute name="interval">
				<xsl:value-of select="$stepDelay"/>
			</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!--<display x="15" y="-15" />-->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(0)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<xsl:call-template name="stepTemplate"/>
			<!--	<xsl:value-of select="utils:setLastGuid(Step_Guid)"/>  -->
		</xsl:element>
	</xsl:template>
	<xsl:template name="typeTextTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="Sentence_Plain"/>
			</xsl:attribute>
			<xsl:attribute name="type">Write</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(0)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<xsl:call-template name="stepTemplate1"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="keyPressTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="Sentence_Plain"/>
			</xsl:attribute>
			<xsl:attribute name="type">Navigate</xsl:attribute>
			<xsl:attribute name="interval">
				<xsl:value-of select="$stepDelay"/>
			</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!--<display x="15" y="-15" />-->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(0)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<xsl:call-template name="stepTemplate2"/>
			<!--	<xsl:value-of select="utils:setLastGuid(Step_Guid)"/>  -->
		</xsl:element>
	</xsl:template>
	<xsl:template name="readTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:param name="variableToStoreValueIn" select="$valueReadVarName"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="concat('Read data from ',PlayBack__ControlInfo_ControlName)"/>
			</xsl:attribute>
			<xsl:attribute name="type">Read</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(0)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<xsl:element name="step">
				<xsl:attribute name="stage">
					<xsl:value-of select="$variableToStoreValueIn"/>
				</xsl:attribute>
				<xsl:element name="element">
					<xsl:attribute name="id">
						<xsl:value-of select="Step_Guid"/>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="action">
					<xsl:element name="id">
						<xsl:value-of select="'ReadCurrentValue'"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="decisionTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:param name="exp"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$exp"/>
			</xsl:attribute>
			<xsl:attribute name="type">Decision</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(0)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="decision">
				<xsl:attribute name="expression">
					<xsl:value-of select="$exp"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="ontrue">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<xsl:element name="onfalse">
				<xsl:value-of select="utils:getGuidExcHan()"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="calculationTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="'Success'"/>
			</xsl:attribute>
			<xsl:attribute name="type">Calculation</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(0)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<xsl:element name="calculation">
				<xsl:attribute name="expression">
					<xsl:value-of select="$true"/>
				</xsl:attribute>
				<xsl:attribute name="stage">
					<xsl:value-of select="$objSuccessVarName"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="stepTemplate">
		<xsl:choose>
			<xsl:when test="PlayBack__ControlInfo_Role = 'combo box' or (PlayBack__ControlInfo_Role = 'list item' and PlayBack__ControlInfo_IEControlAttributeTagName='SELECT')">
				<xsl:element name="step">
					<xsl:element name="element">
						<xsl:attribute name="id">
							<xsl:value-of select="Step_Guid"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="action">
						<xsl:element name="id">
							<xsl:value-of select="$selectItem"/>
						</xsl:element>
						<xsl:element name="arguments">
							<xsl:element name="argument">
								<xsl:element name="id">
									<xsl:value-of select="$newtext"/>
								</xsl:element>
								<xsl:element name="value">"<xsl:value-of select="Modified_Item"/>"</xsl:element>
							</xsl:element>
							<xsl:element name="argument">
								<xsl:element name="id">
									<xsl:value-of select="$position"/>
								</xsl:element>
								<xsl:element name="value"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="step">
					<xsl:element name="element">
						<xsl:attribute name="id">
							<xsl:value-of select="Step_Guid"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="action">
						<xsl:element name="id">
							<xsl:value-of select="$htmlCenterClick"/>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="stepTemplate1">
		<xsl:element name="step">
			<xsl:attribute name="expr">
				<xsl:value-of select="concat('[',$textToWriteVarName,'_',Step_ID,']')"/>
			</xsl:attribute>
			<xsl:element name="element">
				<xsl:attribute name="id">
					<xsl:value-of select="Step_Guid"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="stepTemplate2">
		<xsl:element name="step">
			<xsl:element name="element">
				<xsl:attribute name="id">
					<xsl:value-of select="$GpsId"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="action">
				<xsl:element name="id">
					<xsl:value-of select="$sendKeys"/>
				</xsl:element>
				<xsl:element name="arguments">
					<xsl:element name="argument">
						<xsl:element name="id">
							<xsl:value-of select="$newtext"/>
						</xsl:element>
						<xsl:element name="value">
							<xsl:value-of select="concat('&quot;',utils:GetShortCut(PlayBack__GeneralInfo_SPKeyStatus,Standard__Control_TypedKey_En),'&quot;')"/>
						</xsl:element>
					</xsl:element>
					<xsl:element name="argument">
						<xsl:element name="id">
							<xsl:value-of select="$interval"/>
						</xsl:element>
						<xsl:element name="value">

						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="startStageTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$start"/>
			</xsl:attribute>
			<xsl:attribute name="type">Start</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="endStageTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:element name="stage">
			<xsl:variable name="tempEndGuid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:variable>
			<xsl:attribute name="stageid">
				<xsl:value-of select="$tempEndGuid"/>
				<xsl:value-of select="utils:setEndGuid($tempEndGuid)"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$end"/>
			</xsl:attribute>
			<xsl:attribute name="type">End</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(0)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
		<xsl:value-of select="utils:resetPositionX(15)"/>
		<xsl:value-of select="utils:resetPositionY(-45)"/>
	</xsl:template>
	<xsl:template name="attachTemplate">
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$start"/>
			</xsl:attribute>
			<xsl:attribute name="type">Start</xsl:attribute>
			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="'Is Connected?'"/>
			</xsl:attribute>
			<xsl:attribute name="type">Read</xsl:attribute>
			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<xsl:element name="step">
				<xsl:attribute name="stage">
					<xsl:value-of select="$isAttachedVarName"/>
				</xsl:attribute>
				<xsl:element name="element">
					<xsl:attribute name="id">
						<xsl:value-of select="$GpsId"/>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="action">
					<xsl:element name="id">
						<xsl:value-of select="$isConnected"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="concat('[',$isAttachedVarName,']?')"/>
			</xsl:attribute>
			<xsl:attribute name="type">Decision</xsl:attribute>
			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="decision">
				<xsl:attribute name="expression">
					<xsl:value-of select="concat('[',$isAttachedVarName,']')"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="ontrue">
				<xsl:value-of select="$endGuidforAttachAction"/>
			</xsl:element>
			<xsl:element name="onfalse">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
		</xsl:element>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="$endGuidforAttachAction"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$end"/>
			</xsl:attribute>
			<xsl:attribute name="type">End</xsl:attribute>
			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(90)"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$attach"/>
			</xsl:attribute>
			<xsl:attribute name="type">Navigate</xsl:attribute>
			<xsl:attribute name="interval">
				<xsl:value-of select="$stepDelayLaunch"/>
			</xsl:attribute>
			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<loginhibit/>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(90)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(-90)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<step>
				<xsl:element name="element">
					<xsl:attribute name="id">
						<xsl:value-of select="$GpsId"/>
					</xsl:attribute>
				</xsl:element>
				<action>
					<id>AttachApplication</id>
					<arguments>
						<argument>
							<id>WindowTitlesCollection</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>WindowTitle</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>ProcessName</id>
							<value>"<xsl:value-of select="'iexplore'"/>"</value>
						</argument>
						<argument>
							<id>ProcessID</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>Username</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>ChildIndex</id>
							<value>0</value>
						</argument>
					</arguments>
				</action>
			</step>
		</xsl:element>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="'Sucessfully attached note'"/>
			</xsl:attribute>
			<xsl:attribute name="type">Note</xsl:attribute>
			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<loginhibit/>
			<xsl:element name="narrative">
				<xsl:value-of select="'Successfully attached - continue'"/>
			</xsl:element>
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(0)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(90)"/>
				</xsl:attribute>
			</xsl:element>
			<font family="Segoe UI" size="10" style="Bold" color="0000FF"/>
			<xsl:element name="onsuccess">
				<xsl:value-of select="$endGuidforAttachAction"/>
			</xsl:element>
		</xsl:element>
		<xsl:value-of select="utils:resetPositionX(15)"/>
		<xsl:value-of select="utils:resetPositionY(-45)"/>
	</xsl:template>
	<xsl:template name="waitTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:param name="groupId"/>
		<xsl:param name="waitForType"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Wait1</xsl:attribute>
			<xsl:attribute name="type">WaitStart</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!--<display x="-90" y="-105" w="30" h="30" />-->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$waitForType='1'">
							<xsl:value-of select="15"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="utils:getPositionX(0)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
				<xsl:attribute name="w">30</xsl:attribute>
				<xsl:attribute name="h">30</xsl:attribute>
			</xsl:element>
			<groupid>
				<xsl:value-of select="$groupId"/>
			</groupid>
			<xsl:choose>
				<xsl:when test="$waitForType='1'">
					<choices>
						<choice reply="True">
							<name>Window Check Exists</name>
							<distance>90</distance>
							<ontrue>
								<xsl:value-of select="utils:getGuid()"/>
							</ontrue>
							<xsl:element name="element">
								<xsl:attribute name="id">
									<xsl:value-of select="Additional_guid1"/>
								</xsl:attribute>
							</xsl:element>
							<condition>
								<id>CheckExists</id>
							</condition>
							<comparetype>Equal</comparetype>
						</choice>
					</choices>
					<timeout>
						<xsl:value-of select="utils:getWaitTime(WaitforIteration,Delay,Include_Delay,Include_WaitforIteration)"/>
					</timeout>
				</xsl:when>
				<xsl:when test="$waitForType='2'">
					<choices>
						<choice reply="True">
							<name>cancel Check Exists</name>
							<distance>90</distance>
							<ontrue>
								<xsl:value-of select="utils:getGuid()"/>
							</ontrue>
							<xsl:element name="element">
								<xsl:attribute name="id">
									<xsl:value-of select="Step_Guid"/>
								</xsl:attribute>
							</xsl:element>
							<condition>
								<id>CheckExists</id>
							</condition>
							<comparetype>Equal</comparetype>
						</choice>
					</choices>
					<timeout>
						<xsl:value-of select="utils:getWaitTime(WaitforIteration,Delay,Include_Delay,Include_WaitforIteration)"/>
					</timeout>
				</xsl:when>
				<xsl:when test="$waitForType='3'">
					<choices>
						<choice reply="True">
							<name>cancel Check Exists</name>
							<distance>90</distance>
							<ontrue>
								<xsl:value-of select="utils:getGuid()"/>
							</ontrue>
							<xsl:element name="element">
								<xsl:attribute name="id">
									<xsl:value-of select="Step_Guid"/>
								</xsl:attribute>
							</xsl:element>
							<condition>
								<id>CheckExists</id>
							</condition>
							<comparetype>Equal</comparetype>
						</choice>
					</choices>
					<timeout>
						<xsl:value-of select="utils:getWaitTime(WaitforIteration,Delay,Include_Delay,Include_WaitforIteration)"/>
					</timeout>
				</xsl:when>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Time Out1</xsl:attribute>
			<xsl:attribute name="type">WaitEnd</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!--<display x="-90" y="15" w="30" h="30" />-->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(60)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(0)"/>
				</xsl:attribute>
				<xsl:attribute name="w">30</xsl:attribute>
				<xsl:attribute name="h">30</xsl:attribute>
			</xsl:element>
			<onsuccess>
				<xsl:value-of select="utils:getGuidExcHan()"/>
			</onsuccess>
			<groupid>
				<xsl:value-of select="$groupId"/>
			</groupid>
		</xsl:element>
	</xsl:template>
	<xsl:template name="exceptionHandlingTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:param name="exc" select="concat(PlayBack__ControlInfo_ControlName, ' element exception')"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuidExcHan()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Exception</xsl:attribute>
			<xsl:attribute name="type">Exception</xsl:attribute>
			<xsl:element name="subsheetid">
				<xsl:value-of select="$subsheetId"/>
			</xsl:element>
			<loginhibit/>
			<!--<display x="-135" y="60" />-->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(60)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(0)"/>
				</xsl:attribute>
				<xsl:attribute name="w">30</xsl:attribute>
				<xsl:attribute name="h">30</xsl:attribute>
			</xsl:element>
			<xsl:element name="exception">
				<xsl:attribute name="localized">yes</xsl:attribute>
				<xsl:attribute name="type">System</xsl:attribute>
				<xsl:attribute name="detail">"<xsl:value-of select="$exc"/>"</xsl:attribute>
			</xsl:element>
		</xsl:element>
		<xsl:value-of select="utils:resetPositionX(105)"/>
	</xsl:template>
	<xsl:template name="activateTemplate">
		<xsl:param name="subsheetId" select="Step_Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="concat('Window activate - ',PlayBack__AppInfo_DialogName)"/>
			</xsl:attribute>
			<xsl:attribute name="type">Navigate</xsl:attribute>
			<xsl:attribute name="interval">
				<xsl:value-of select="$stepDelay"/>
			</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="$subsheetId"/>
			</subsheetid>
			<loginhibit/>
			<!--<display x="15" y="-15" />-->
			<xsl:element name="display">
				<xsl:attribute name="x">
					<xsl:value-of select="utils:getPositionX(0)"/>
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
			<xsl:element name="step">
				<xsl:element name="element">
					<xsl:attribute name="id">
						<xsl:value-of select="Additional_guid1"/>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="action">
					<xsl:element name="id">
						<xsl:value-of select="'ActivateApp'"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="variableDeclarationClickTemplate">
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$objSuccessVarName"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="Step_Guid"/>
			</subsheetid>
			<loginhibit/>
			<display x="-180" y="90" w="150" h="30"/>
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>flag</datatype>
			<initialvalue/>
			<private/>
			<alwaysinit/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="variableDeclarationTypeTemplate">
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="concat($textToWriteVarName,'_',Step_ID)"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="Step_Guid"/>
			</subsheetid>
			<loginhibit/>
			<display x="-180" y="90" w="150" h="30"/>
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>text</datatype>
			<initialvalue xml:space="preserve"><xsl:value-of select="PlayBack__ControlInfo_ControlData"/></initialvalue>
		</xsl:element>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$valueReadVarName"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="Step_Guid"/>
			</subsheetid>
			<loginhibit/>
			<display x="-180" y="165" w="150" h="30"/>
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>text</datatype>
			<initialvalue/>
			<private/>
			<alwaysinit/>
		</xsl:element>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$objSuccessVarName"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="Step_Guid"/>
			</subsheetid>
			<loginhibit/>
			<display x="-180" y="240" w="150" h="30"/>
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>flag</datatype>
			<initialvalue/>
			<private/>
			<alwaysinit/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="variableDeclarationReadTemplate">
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$objSuccessVarName"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="Additional_guid1"/>
			</subsheetid>
			<loginhibit/>
			<display x="-180" y="90" w="150" h="30"/>
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>flag</datatype>
			<initialvalue/>
			<private/>
			<alwaysinit/>
		</xsl:element>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$valueReadvarNameReadTemplate"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="Additional_guid1"/>
			</subsheetid>
			<loginhibit/>
			<display x="-180" y="165" w="150" h="30"/>
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>text</datatype>
			<initialvalue/>
			<private/>
			<alwaysinit/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="matchDictionaryTemplate1">
		<xsl:choose>
			<xsl:when test="PlayBack__ControlInfo_Role = 'menu item'">UIAMenuItem</xsl:when>
			<xsl:when test="(PlayBack__ControlInfo_Role = 'push button') or (PlayBack__ControlInfo_Role = 'grid drop down button')">UIAButton</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'check box'">UIACheckBox</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'radio button'">UIARadio</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'editable text'">UIAEdit</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'list item'">UIAListItem</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'combo box'">UIAComboBox</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'page tab'">UIATabItem</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'drop down button'">UIAButton</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'link'">UIAHyperlink</xsl:when>
			<xsl:otherwise>UIAElement</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
