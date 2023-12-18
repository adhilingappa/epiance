<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<xsl:output method="xml" indent="yes"/>

	<!--IE BluePrism Final 3 date:08/05/2020-->

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
		int initialPositionX = 15;
		int initialPositionY = -45;
		string lastGuid = "";
		
		string lastExcHanGuid = "";
		string endStageGuid = "";
		
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
	
    ]]>
	</msxsl:script>

	<!--Variables-->
	<xsl:variable name="GpsId">
		<xsl:value-of select="/Document/Meta/GpsId"/>
	</xsl:variable>
	<xsl:variable name="GpsFile">
		<xsl:value-of select="/Document/Meta/GpsFile"/>
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

	<xsl:variable name="uiaElement">UIAElement</xsl:variable>

	<xsl:variable name="firstGuid">
		<xsl:value-of select="/Document/Process/Step/Step-Guid"/>
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
			<xsl:attribute name="narrative"></xsl:attribute>
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
							<xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event = 'Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
								<xsl:call-template name="elementTemplateIe"/>
								<xsl:call-template name="elementTemplateUia" />
								<xsl:call-template name="elementWindowTemplate" />
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

			<xsl:call-template name="attachTemplate" />

			<xsl:for-each select="Document/Process/Step">
				<xsl:choose>
					<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">
						<xsl:call-template name="actionTemplate"/>
						<xsl:call-template name="actionTemplate">
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
							<xsl:with-param name="type" select="$two" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="actionTemplate"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>

			<xsl:for-each select="Document/Process/Step">
				<xsl:choose>
					<xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event = 'Select'">
						<xsl:call-template name="variableDeclarationClickTemplate" />
						<xsl:call-template name="startStageTemplate" />
						<xsl:call-template name="linkPageTemplate" />
						<!--wait for window-->
						<xsl:call-template name="waitTemplate">
							<xsl:with-param name="groupId" select="Additional-guid2" />
							<xsl:with-param name="waitForType" select="1" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" >
							<xsl:with-param name="exc" select ="concat('Failed to find Window. Page - ',PlayBack--AppInfo-DialogName)" />
						</xsl:call-template>
						<xsl:call-template name="activateTemplate" />
						<!--wait for precondition-->
						<xsl:call-template name="waitTemplate">
							<xsl:with-param name="groupId" select="Step-Guid" />
							<xsl:with-param name="waitForType" select="2" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" >
							<xsl:with-param name="exc" select="concat(PlayBack--ControlInfo-ControlName, ' element not found')" />
						</xsl:call-template>
						<xsl:call-template name="clickTemplate" />
						<!--wait for postcondition-->
						<!--<xsl:call-template name="waitTemplate">
							<xsl:with-param name="groupId" select="Additional-guid3" />
							<xsl:with-param name="waitForType" select="3" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" />-->
						<xsl:call-template name="calculationTemplate" />
						<xsl:call-template name="endStageTemplate" />
					</xsl:when>

					<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">
						<xsl:call-template name="variableDeclarationTypeTemplate" />
						<xsl:call-template name="startStageTemplate" />
						<xsl:call-template name="linkPageTemplate" />
						<!--wait for window-->
						<xsl:call-template name="waitTemplate">
							<xsl:with-param name="groupId" select="Additional-guid2" />
							<xsl:with-param name="waitForType" select="1" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" >
							<xsl:with-param name="exc" select ="concat('Failed to find Window. Page - ',PlayBack--AppInfo-DialogName)" />
						</xsl:call-template>
						<xsl:call-template name="activateTemplate" />
						<!--wait for precondition-->
						<xsl:call-template name="waitTemplate">
							<xsl:with-param name="groupId" select="Step-Guid" />
							<xsl:with-param name="waitForType" select="2" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" >
							<xsl:with-param name="exc" select="concat(PlayBack--ControlInfo-ControlName, ' element not found')" />
						</xsl:call-template>
						<xsl:call-template name="typeTextTemplate" />
						<xsl:call-template name="readTemplate" />
						<xsl:call-template name="decisionTemplate">
							<xsl:with-param name="exp" select="concat('[',$textToWriteVarName,']=[',$valueReadVarName,']')" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" >
							<xsl:with-param name="exc" select="concat('value in element does not match value typed in element - ',PlayBack--ControlInfo-ControlName)" />
						</xsl:call-template>
						<xsl:call-template name="calculationTemplate" />
						<xsl:call-template name="endStageTemplate" />

						<!--Read action-->
						<xsl:call-template name="variableDeclarationReadTemplate" />
						<xsl:call-template name="startStageTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
						</xsl:call-template>
						<xsl:call-template name="linkPageTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
						</xsl:call-template>
						<!--wait for window-->
						<xsl:call-template name="waitTemplate">
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
							<xsl:with-param name="groupId" select="Additional-guid2" />
							<xsl:with-param name="waitForType" select="1" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
							<xsl:with-param name="exc" select ="concat('Failed to find Window. Page - ',PlayBack--AppInfo-DialogName)" />
						</xsl:call-template>
						<xsl:call-template name="activateTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
						</xsl:call-template>
						<!--wait for precondition-->
						<xsl:call-template name="waitTemplate">
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
							<xsl:with-param name="groupId" select="Step-Guid" />
							<xsl:with-param name="waitForType" select="2" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
							<xsl:with-param name="exc" select="concat(PlayBack--ControlInfo-ControlName, ' element not found')" />
						</xsl:call-template>
						<xsl:call-template name="readTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
							<xsl:with-param name="variableToStoreValueIn" select="$valueReadvarNameReadTemplate" />
						</xsl:call-template>
						<xsl:call-template name="decisionTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
							<xsl:with-param name="exp" select="concat('[',$valueReadvarNameReadTemplate,']&lt;&gt;&quot;&quot;')" />
						</xsl:call-template>
						<xsl:call-template name="exceptionHandlingTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
							<xsl:with-param name="exc" select="concat('empty value read from element ',PlayBack--ControlInfo-ControlName)" />
						</xsl:call-template>
						<xsl:call-template name="calculationTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
						</xsl:call-template>
						<xsl:call-template name="endStageTemplate" >
							<xsl:with-param name="subsheetId" select="Additional-guid1" />
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>



		</xsl:element>
	</xsl:template>

	<xsl:template name="actionTemplate">
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:param name="type" select="$one"/>
		<xsl:element name="subsheet">
			<xsl:attribute name="subsheetid"><xsl:value-of select="$subsheetId"/></xsl:attribute>
			<xsl:attribute name="type">
				<xsl:value-of select="$normal"/>
			</xsl:attribute>
			<xsl:attribute name="published">
				<xsl:value-of select="$true"/>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="PlayBack--AppInfo-ExeName='mstsc.exe'">
					<xsl:element name="name">
						<xsl:value-of select="concat($step,'_',Step-ID)"/>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="name">
						<!--	<xsl:value-of select="utils:getActionCount()"/> -->
						<!--<xsl:value-of select="Step-ID"/> -->
						<!--Map same value in process-->
						<xsl:variable name="tempAlias">
							<xsl:value-of select="Step-AliasName"/>
						</xsl:variable>
						<xsl:variable name="trimAlias">
							<xsl:value-of select="utils:trim($tempAlias)"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$type=$one">
								<xsl:value-of select="concat($trimAlias,'_',Step-ID)"/>
							</xsl:when>
							<xsl:when test="$type=$two">
								<xsl:value-of select="concat($trimAlias,'_read_',Step-ID)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($trimAlias,'_',Step-ID)"/>
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


	<xsl:template  name="elementTemplateIe">
		<xsl:element name="element">
			<xsl:attribute name="name">
				<xsl:value-of select="concat('Ie_',PlayBack--ControlInfo-ControlName)"/>
			</xsl:attribute>
			<xsl:element name="id">
				<xsl:value-of select="Step-Guid"/>
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
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--ControlInfo-IEControlAttributeTagName"/>

						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">ClassName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="PlayBack--ControlInfo-IEControlClassName!=''">
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
							<xsl:value-of select="PlayBack--ControlInfo-IEControlClassName"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>


				<xsl:element name="attribute">
					<xsl:attribute name="name">ID</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="PlayBack--AdditionalInfo-Web_IFrameFullXPath='' and PlayBack--AdditionalInfo-Web_Name='' and PlayBack--ControlInfo-IEControlID!=''">
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
							<xsl:value-of select="PlayBack--ControlInfo-IEControlID"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>



				<xsl:element name="attribute">
					<xsl:attribute name="name">pURL</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AppInfo-IEDocURL"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">Title</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--ControlInfo-IEControlTitle"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">MatchIndex</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
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
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-Web_IFrameFullXPath"/>
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
								<xsl:when test="PlayBack--ControlInfo-Role='link'">
									<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
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
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="PlayBack--ControlInfo-IEControlAttributeTagName='INPUT'">
									<xsl:value-of select="PlayBack--AdditionalInfo-Web_Type"/>
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
							<xsl:when test="PlayBack--AdditionalInfo-Web_IFrameFullXPath='' and PlayBack--AdditionalInfo-Web_Name!=''">
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
							<xsl:value-of select="PlayBack--AdditionalInfo-Web_Name"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">Value</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-Web_Value"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">AncestorCount</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$number"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-Web_AncestorCount"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="elementTemplateUia">
		<xsl:element name="element">
			<xsl:attribute name="name">
				<xsl:value-of select="concat('uia_',PlayBack--ControlInfo-ControlName,' element')"/>
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
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-UIA_NAME"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">uLocalizedControlType</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-UIA_LOCALIZED_CONTROL_TYPE"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">uAutomationId</xsl:attribute>
					<xsl:if test="PlayBack--AdditionalInfo-UIA_AUTOMATIONID">
						<xsl:attribute name="inuse">
							<xsl:choose>
								<xsl:when test="PlayBack--AdditionalInfo-UIA_AUTOMATIONID = ''">
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
							<xsl:value-of select="PlayBack--AdditionalInfo-UIA_AUTOMATIONID"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">puName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-UIA_PARENT_NAME"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">puLocalizedControlType</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>
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
				<xsl:value-of select="concat('uia_',PlayBack--ControlInfo-ControlName,' elementWindow')"/>
			</xsl:attribute>
			<xsl:element name="id">
				<xsl:value-of select="Additional-guid1"/>
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
							<xsl:value-of select="PlayBack--AppInfo-DialogName"/>
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
							<xsl:value-of select="PlayBack--AdditionalInfo-UIA_FOREGROUND_WINDOW_TYPE"/>
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
					<value>C:\Program Files\Internet Explorer\iexplore.exe</value>
				</parameter>
				<parameter>
					<name>CommandLineParams</name>
					<value>
						<xsl:value-of select="/Document/Process/Step/PlayBack--AppInfo-IEDocURL"/>
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

	<xsl:template name="boilerStageTemplate">
		<view>
			<camerax>0</camerax>
			<cameray>0</cameray>
			<zoom version="2">1.25</zoom>
		</view>
		<preconditions />
		<endpoint narrative="" />
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

		<stage stageid="230b4dc4-5ea6-419c-a906-78a27bddc2ec" name="Start" type="Start">
			<loginhibit />
			<display x="15" y="-105" />
			<onsuccess>1f001a2c-3ee5-49ee-bfeb-b11d960e5c59</onsuccess>
		</stage>
		<stage stageid="1f001a2c-3ee5-49ee-bfeb-b11d960e5c59" name="End" type="End">
			<loginhibit />
			<display x="15" y="90" />
		</stage>
		<stage stageid="f280d612-ea58-4131-a54b-eecb42feead1" name="Stage1" type="ProcessInfo">
			<display x="-195" y="-105" w="150" h="90" />
			<references>
				<reference>System.dll</reference>
				<reference>System.Data.dll</reference>
				<reference>System.Xml.dll</reference>
				<reference>System.Drawing.dll</reference>
			</references>
			<imports>
				<import>System</import>
				<import>System.Drawing</import>
				<import>System.Data</import>
			</imports>
			<language>visualbasic</language>

		</stage>
		<stage stageid="16f0c0aa-36d0-4f47-a0b2-0fbe2d178ad0" name="Clean Up" type="SubSheetInfo">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<display x="-195" y="-105" w="150" h="90" />
		</stage>
		<stage stageid="c8929f82-3259-40e8-98df-02472b2f7a45" name="Start" type="Start">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<loginhibit />
			<display x="15" y="-105" />
			<onsuccess>d7cbfcb1-9c03-4643-8459-2e5ef78c6332</onsuccess>
		</stage>
		<stage stageid="86847ebf-f4e0-47d4-ab94-78ded084e0b9" name="End" type="End">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<loginhibit />
			<display x="15" y="90" />
		</stage>


		<stage stageid="cd240663-4801-477e-9b09-3e1521d0d535" name="Note1" type="Note">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<narrative>
				Clean Up Page

				This is an optional page where you might choose to perform some finalisation (or "cleanup") tasks as your business object is closed down.

				The cleanup action will be called automatically immediately after closing your business object at the end of a business process.

				You will not be able to call this action from a business process, nor will it be called at any other time than before the disposal of the business object.
			</narrative>
			<display x="-180" y="60" w="180" h="230" />
		</stage>
		<stage stageid="8ba4126b-0eec-4bb4-89ec-0a7fb4a184a1" name="Note2" type="Note">
			<narrative>
				Initialise Page

				This is an optional page where you might choose to perform some initialisation tasks after your business object is loaded.

				The initialise action will be called automatically immediately after loading your business object.

				You will not be able to call this action from a business process, nor will it be called at any other time than after the creation of the object.
			</narrative>
			<display x="-180" y="60" w="180" h="230" />
		</stage>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$isAttachedVarName"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<display x="240" y="-45" w="150" h="30" />
			<!-- <xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>flag</datatype>
			<initialvalue>True</initialvalue>
			<alwaysinit />
		</xsl:element>

		<stage stageid="d7cbfcb1-9c03-4643-8459-2e5ef78c6332" name="Terminate Application" type="Navigate">
			<subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
			<loginhibit />
			<display x="15" y="-15" w="120" h="30" />
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
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$attach"/>
			</xsl:attribute>
			<xsl:attribute name="type">SubSheet</xsl:attribute>
			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>
			<loginhibit />
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
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="Sentence-Plain"/>
			</xsl:attribute>
			<xsl:attribute name="type">Navigate</xsl:attribute>

			<xsl:attribute name="interval">
				<xsl:value-of select="$stepDelay"/>
			</xsl:attribute>

			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>

			<loginhibit />
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
			<!--	<xsl:value-of select="utils:setLastGuid(Step-Guid)"/>  -->

		</xsl:element>

	</xsl:template>

	<xsl:template name="typeTextTemplate">
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="Sentence-Plain"/>
			</xsl:attribute>
			<xsl:attribute name="type">Write</xsl:attribute>


			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>
			<loginhibit />
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

	<xsl:template name="readTemplate">
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:param name="variableToStoreValueIn" select="$valueReadVarName" />
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="concat('Read data from ',PlayBack--ControlInfo-ControlName)"/>
			</xsl:attribute>
			<xsl:attribute name="type">Read</xsl:attribute>


			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>
			<loginhibit />
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
						<xsl:value-of select="Step-Guid"/>
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
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:param name="exp" />
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$exp"/>
			</xsl:attribute>
			<xsl:attribute name="type">Decision</xsl:attribute>
			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>
			<loginhibit />
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
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="'Success'"/>
			</xsl:attribute>
			<xsl:attribute name="type">Calculation</xsl:attribute>
			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>
			<loginhibit />
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
			<xsl:when test="PlayBack--ControlInfo-Role = 'combo box' or (PlayBack--ControlInfo-Role = 'list item' and PlayBack--ControlInfo-IEControlAttributeTagName='SELECT')">

				<xsl:element name="step">
					<xsl:element name="element">
						<xsl:attribute name="id">
							<xsl:value-of select="Step-Guid"/>
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
								<xsl:element name="value">"<xsl:value-of select="Modified-Item"/>"</xsl:element>
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
							<xsl:value-of select="Step-Guid"/>
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
			<xsl:attribute name="expr">"<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>"</xsl:attribute>
			<xsl:element name="element">
				<xsl:attribute name="id">
					<xsl:value-of select="Step-Guid"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="startStageTemplate">
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$start"/>
			</xsl:attribute>
			<xsl:attribute name="type">Start</xsl:attribute>
			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>
			<loginhibit />
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
		<xsl:param name="subsheetId" select="Step-Guid"/>
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
			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>
			<loginhibit />
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
			<loginhibit />
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
			<loginhibit />
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
			<loginhibit />
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
			<loginhibit />
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
			<loginhibit />
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
			<loginhibit />
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
			<font family="Segoe UI" size="10" style="Bold" color="0000FF" />
			<xsl:element name="onsuccess">
				<xsl:value-of select="$endGuidforAttachAction"/>
			</xsl:element>
		</xsl:element>
		<xsl:value-of select="utils:resetPositionX(15)"/>
		<xsl:value-of select="utils:resetPositionY(-45)"/>
	
	</xsl:template>

	<xsl:template name="waitTemplate">
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:param name="groupId" />
		<xsl:param name="waitForType" />
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Wait1</xsl:attribute>
			<xsl:attribute name="type">WaitStart</xsl:attribute>

			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>
			<loginhibit />
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
									<xsl:value-of select="Additional-guid1"/>
								</xsl:attribute>
							</xsl:element>
							<condition>
								<id>CheckExists</id>
							</condition>
							<comparetype>Equal</comparetype>
						</choice>
					</choices>
					<timeout>30</timeout>
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
									<xsl:value-of select="Step-Guid"/>
								</xsl:attribute>
							</xsl:element>
							<condition>
								<id>CheckExists</id>
							</condition>
							<comparetype>Equal</comparetype>
						</choice>
					</choices>
					<timeout>30</timeout>
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
									<xsl:value-of select="Step-Guid"/>
								</xsl:attribute>
							</xsl:element>
							<condition>
								<id>CheckExists</id>
							</condition>
							<comparetype>Equal</comparetype>
						</choice>
					</choices>
					<timeout>30</timeout>
				</xsl:when>

			</xsl:choose>

		</xsl:element>

		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Time Out1</xsl:attribute>
			<xsl:attribute name="type">WaitEnd</xsl:attribute>
			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>
			<loginhibit />
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
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:param name="exc" select="concat(PlayBack--ControlInfo-ControlName, ' element exception')" />
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuidExcHan()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Exception</xsl:attribute>
			<xsl:attribute name="type">Exception</xsl:attribute>
			<xsl:element name="subsheetid"><xsl:value-of select="$subsheetId"/></xsl:element>
			<loginhibit />
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
				<xsl:attribute name="detail">"<xsl:value-of select="$exc" />"</xsl:attribute>
			</xsl:element>
		</xsl:element>
		<xsl:value-of select="utils:resetPositionX(105)"/>
	</xsl:template>
	
	<xsl:template name="activateTemplate">
		<xsl:param name="subsheetId" select="Step-Guid"/>
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="concat('Window activate - ',PlayBack--AppInfo-DialogName)"/>
			</xsl:attribute>
			<xsl:attribute name="type">Navigate</xsl:attribute>
			
			<xsl:attribute name="interval">
				<xsl:value-of select="$stepDelay"/>
			</xsl:attribute>

			<subsheetid><xsl:value-of select="$subsheetId"/></subsheetid>

			<loginhibit />
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
					<xsl:value-of select="Additional-guid1"/>
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
			<subsheetid><xsl:value-of select="Step-Guid"/></subsheetid>
			<loginhibit />
			<display x="-180" y="90" w="150" h="30" />
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>flag</datatype>
			<initialvalue />
			<private />
			<alwaysinit />
		</xsl:element>
	</xsl:template>
	
	<xsl:template name="variableDeclarationTypeTemplate">
		
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$textToWriteVarName"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid><xsl:value-of select="Step-Guid"/></subsheetid>
			<loginhibit />
			<display x="-180" y="90" w="150" h="30" />
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>text</datatype>
			<initialvalue xml:space="preserve"><xsl:value-of select="PlayBack--ControlInfo-ControlData"/></initialvalue>
			<private />
			<alwaysinit />
		</xsl:element>
			
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$valueReadVarName"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid><xsl:value-of select="Step-Guid"/></subsheetid>
			<loginhibit />
			<display x="-180" y="165" w="150" h="30" />
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>text</datatype>
			<initialvalue />
			<private />
			<alwaysinit />
		</xsl:element>
			
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$objSuccessVarName"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid><xsl:value-of select="Step-Guid"/></subsheetid>
			<loginhibit />
			<display x="-180" y="240" w="150" h="30" />
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>flag</datatype>
			<initialvalue />
			<private />
			<alwaysinit />
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
			<subsheetid><xsl:value-of select="Additional-guid1"/></subsheetid>
			<loginhibit />
			<display x="-180" y="90" w="150" h="30" />
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>flag</datatype>
			<initialvalue />
			<private />
			<alwaysinit />
		</xsl:element>
	
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$valueReadvarNameReadTemplate"/>
			</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>
			<subsheetid><xsl:value-of select="Additional-guid1"/></subsheetid>
			<loginhibit />
			<display x="-180" y="165" w="150" h="30" />
			<!--<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY(60)"/>
				</xsl:attribute>
			</xsl:element>-->
			<datatype>text</datatype>
			<initialvalue />
			<private />
			<alwaysinit />
		</xsl:element>
	</xsl:template>

	<xsl:template name="matchDictionaryTemplate1">
		<xsl:choose>
			<xsl:when test="PlayBack--ControlInfo-Role = 'menu item'">UIAMenuItem</xsl:when>
			<xsl:when test="(PlayBack--ControlInfo-Role = 'push button') or (PlayBack--ControlInfo-Role = 'grid drop down button')">UIAButton</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'check box'">UIACheckBox</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'radio button'">UIARadio</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'editable text'">UIAEdit</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'list item'">UIAListItem</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'combo box'">UIAComboBox</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'page tab'">UIATabItem</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'drop down button'">UIAButton</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'link'">UIAHyperlink</xsl:when>
			<xsl:otherwise>UIAElement</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
