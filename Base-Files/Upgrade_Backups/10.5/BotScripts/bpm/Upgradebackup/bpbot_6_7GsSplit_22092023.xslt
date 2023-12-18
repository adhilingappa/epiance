<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<xsl:output method="xml" indent="yes"/>

	<!--IE BluePrism Final 3 date:08/05/2020-->

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
		int initialPositionY = -45;
		string lastGuid = "";
		string lastExcHanGuid = "";
		string endStageGuid = "";
		
		public int getPositionY(){
    initialPositionY = initialPositionY+60;
    return initialPositionY;
		}
		
		public void resetPosition(){
		initialPositionY = -45;
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
	
	public string getExeName(string exeName)
		{
		  string exeNamewithoutExe =  "";
		 exeNamewithoutExe=  exeName;
		 exeNamewithoutExe = exeNamewithoutExe.Replace(".exe","");
		 return exeNamewithoutExe;
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
	<!--<xsl:variable name="centerClick">UIAClickCentre</xsl:variable>-->
	<xsl:variable name="newtext">newtext</xsl:variable>

	<xsl:variable name="terminalField">TerminalField</xsl:variable>
	<xsl:variable name="number">number</xsl:variable>

	<xsl:variable name="firstGuid">
		<xsl:value-of select="/Document/Process/Step/Step-Guid"/>
	</xsl:variable>
	<xsl:variable name="one">1</xsl:variable>
	<xsl:variable name="end">end</xsl:variable>
	<xsl:variable name="endGuid">32e2ab11-ff48-44fe-969e-69d402f68bbd</xsl:variable>

	<xsl:variable name="normal">Normal</xsl:variable>
	<xsl:variable name="start">Start</xsl:variable>

	<xsl:variable name="exceptionGuid">71705180-ac15-468f-8c7f-bc760d88544e</xsl:variable>

	<xsl:variable name="htmlCenterClick">HTMLClickCentre</xsl:variable>
	<xsl:variable name="selectItem">SelectItem</xsl:variable>
	<xsl:variable name="position">position</xsl:variable>
	<xsl:variable name="html">HTML</xsl:variable>

	<xsl:variable name="mainframeSendKeys">MainframeSendKeys</xsl:variable>
	<xsl:variable name="sendKeyEvents">SendKeyEvents</xsl:variable>
	<xsl:variable name="interval">interval</xsl:variable>

	<xsl:variable name="rectangular">Rectangular</xsl:variable>

	<xsl:variable name="launch">Launch</xsl:variable>

	<xsl:variable name="stepDelayLaunch">10</xsl:variable>

	<xsl:variable name="stepDelay">1</xsl:variable>

	<xsl:variable name="step">Step</xsl:variable>

	<xsl:template match="/">
		<xsl:variable name="exeWithoutExt">
		<xsl:value-of select="utils:getExeName($ExeName)"/>
		</xsl:variable>
		<xsl:element name="process">
			<xsl:attribute name="name">
				<xsl:value-of select="concat($GpsFile,'_',$exeWithoutExt)"/>
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
							<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT' or  PlayBack--GeneralInfo-Event = 'KEYEVENT'">
								<xsl:call-template name="elementTemplate"/>
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

			<xsl:call-template name="launchTemplate" />
			
			<xsl:for-each select="Document/Process/Step">
				<xsl:if test="PlayBack--GeneralInfo-Event='TYPETEXT' or  PlayBack--GeneralInfo-Event = 'KEYEVENT'">
				<xsl:call-template name="actionTemplate"/>
				</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="Document/Process/Step">
				<xsl:call-template name="startStageTemplate" />
				<!--<xsl:call-template name="waitTemplate" /> -->
				<xsl:choose>

					<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">
						<xsl:element name="stage">
							<xsl:attribute name="stageid">
								<xsl:value-of select="utils:getLastGuid()"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="Sentence-Plain"/>
							</xsl:attribute>
							<xsl:attribute name="type">Write</xsl:attribute>


							<subsheetid>
								<xsl:value-of select="Step-Guid"/>
							</subsheetid>
							<loginhibit />
							<!-- <display x="15" y="-15" /> -->
							<xsl:element name="display">
								<xsl:attribute name="x">15</xsl:attribute>
								<xsl:attribute name="y">
									<xsl:value-of select="utils:getPositionY()"/>
								</xsl:attribute>
							</xsl:element>

							<xsl:element name="onsuccess">
								<xsl:value-of select="utils:getGuid()"/>
							</xsl:element>

							<xsl:call-template name="stepTemplate1"/>
						</xsl:element>

					</xsl:when>
					<xsl:when test="PlayBack--GeneralInfo-Event='KEYEVENT'">
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

							<subsheetid>
								<xsl:value-of select="Step-Guid"/>
							</subsheetid>

							<loginhibit />
							<!--<display x="15" y="-15" />-->
							<xsl:element name="display">
								<xsl:attribute name="x">15</xsl:attribute>
								<xsl:attribute name="y">
									<xsl:value-of select="utils:getPositionY()"/>
								</xsl:attribute>
							</xsl:element>

							<xsl:element name="onsuccess">
								<xsl:value-of select="utils:getGuid()"/>
							</xsl:element>

							<xsl:call-template name="stepTemplate2"/>
							<!--	<xsl:value-of select="utils:setLastGuid(Step-Guid)"/>  -->





						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<xsl:call-template name="endStageTemplate" />
				<!--<xsl:call-template name="exceptionHandlingTemplate" />-->
			</xsl:for-each>

		</xsl:element>
	</xsl:template>

	<xsl:template name="actionTemplate">
		<xsl:element name="subsheet">
			<xsl:attribute name="subsheetid">
				<xsl:value-of select="Step-Guid"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:value-of select="$normal"/>
			</xsl:attribute>
			<xsl:attribute name="published">
				<xsl:value-of select="$true"/>
			</xsl:attribute>

			<xsl:element name="name">
				<!--	<xsl:value-of select="utils:getActionCount()"/> -->
				<!--	<xsl:value-of select="Step-ID"/>    -->
				<!--Map same value in process-->
				<!--<xsl:variable name="tempAlias">
					<xsl:value-of select="Step-AliasName"/>
				</xsl:variable>
				<xsl:variable name="trimAlias">
					<xsl:value-of select="utils:trim($tempAlias)"/>
				</xsl:variable>-->
				<xsl:value-of select="concat($step,'_',Step-ID)"/>
			</xsl:element>
			<view>
				<camerax>0</camerax>
				<cameray>0</cameray>
				<zoom version="2">1.25</zoom>
			</view>
		</xsl:element>
	</xsl:template>

	<xsl:template  name="elementTemplate">
		<xsl:element name="element">
			<xsl:attribute name="name">
				<xsl:value-of select="concat(PlayBack--ControlInfo-ControlName, ' element')"/>
			</xsl:attribute>
			<xsl:element name="id">
				<xsl:value-of select="Step-Guid"/>
			</xsl:element>


			<xsl:element name="type">
				<xsl:value-of select="$terminalField"/>
			</xsl:element>

			<xsl:element name="basetype">
				<xsl:value-of select="$terminalField"/>
			</xsl:element>

			<xsl:element name="datatype">
				<xsl:value-of select="$text"/>
			</xsl:element>

			<xsl:element name="diagnose">
				<xsl:value-of select="$false"/>
			</xsl:element>

			<xsl:element name="attributes">


				<xsl:element name="attribute">
					<xsl:attribute name="name">StartX</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$number"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-WHLL_STARTY"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">StartY</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$number"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-WHLL_STARTX"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>


				<xsl:element name="attribute">
					<xsl:attribute name="name">EndX</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$number"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-WHLL_ENDY"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>



				<xsl:element name="attribute">
					<xsl:attribute name="name">EndY</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$number"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack--AdditionalInfo-WHLL_ENDX"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">FieldType</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$true"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="$rectangular"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">FieldText</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">

						</xsl:attribute>
					</xsl:element>
				</xsl:element>



			</xsl:element>
		</xsl:element>
	</xsl:template>


	<xsl:template name="appTypeInfoTemplate">
		<apptypeinfo>
			<id>MainframePCH</id>
			<parameters>
				<parameter>
					<name>Session ID</name>
					<value>A</value>
				</parameter>
				<parameter>
					<name>ProcessMode</name>
					<value>Ext32bit</value>
				</parameter>
				<parameter>
					<name>ExternalProcessTimeout</name>
					<value>60</value>
				</parameter>
				<parameter>
					<name>Options</name>
					<value>
					</value>
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
			<name>Launch</name>
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
			<onsuccess>86847ebf-f4e0-47d4-ab94-78ded084e0b9</onsuccess>
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
								<xsl:element name="value">
									"<xsl:value-of select="Modified-Item"/>"
								</xsl:element>
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

	<xsl:template name="stepTemplate2">
		<xsl:element name="step">
			<xsl:element name="element">
				<xsl:attribute name="id">
					<xsl:value-of select="$GpsId"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:choose>
				<xsl:when test="PlayBack--ControlInfo-ControlData='Enter'">
					<xsl:element name="action">
						<xsl:element name="id">
							<xsl:value-of select="$mainframeSendKeys"/>
						</xsl:element>
						<xsl:element name="arguments">
							<xsl:element name="argument">
								<xsl:element name="id">
									<xsl:value-of select="$newtext"/>
								</xsl:element>
								<xsl:element name="value">"<xsl:value-of select="concat('{',PlayBack--ControlInfo-ControlData,'}')"/>"</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="action">
						<xsl:element name="id">
							<xsl:value-of select="$sendKeyEvents"/>
						</xsl:element>
						<xsl:element name="arguments">
							<xsl:element name="argument">
								<xsl:element name="id">
									<xsl:value-of select="$newtext"/>
								</xsl:element>
								<xsl:element name="value">"<xsl:value-of select="concat('{',PlayBack--ControlInfo-ControlData,'}')"/>"</xsl:element>
							</xsl:element>
							<xsl:element name="argument">
								<xsl:element name="id">
									<xsl:value-of select="$interval"/>
								</xsl:element>
								<xsl:element name="value"></xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
			
		</xsl:element>
	</xsl:template>

	<xsl:template name="startStageTemplate">

		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="$start"/>
			</xsl:attribute>
			<xsl:attribute name="type">Start</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="Step-Guid"/>
			</subsheetid>
			<loginhibit />
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY()"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuid()"/>
			</xsl:element>
		</xsl:element>

	</xsl:template>

	<xsl:template name="endStageTemplate">

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
				<xsl:value-of select="Step-Guid"/>
			</subsheetid>
			<loginhibit />
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY()"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
		<xsl:value-of select="utils:resetPosition()"/>
	</xsl:template>

	<xsl:template name="launchTemplate">
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
					<xsl:value-of select="utils:getPositionY()"/>
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
				<xsl:value-of select="$launch"/>
			</xsl:attribute>
			<xsl:attribute name="type">Navigate</xsl:attribute>
			<xsl:attribute name="interval">
				<xsl:value-of select="$stepDelayLaunch"/>
			</xsl:attribute>
			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<loginhibit />
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY()"/>
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
					<id>Launch</id>
					<arguments>
						<argument>
							<id>Session ID</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>ProcessMode</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>ExternalProcessTimeout</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>Options</id>
							<value>
							</value>
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
				<xsl:value-of select="$end"/>
			</xsl:attribute>
			<xsl:attribute name="type">End</xsl:attribute>
			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<loginhibit />
			<!-- <display x="15" y="-15" /> -->
			<xsl:element name="display">
				<xsl:attribute name="x">15</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="utils:getPositionY()"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="waitTemplate">

		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Wait1</xsl:attribute>
			<xsl:attribute name="type">WaitStart</xsl:attribute>

			<subsheetid>
				<xsl:value-of select="Step-Guid"/>
			</subsheetid>
			<loginhibit />
			<display x="-90" y="-105" w="30" h="30" />
			<groupid>
				<xsl:value-of select="Step-Guid"/>
			</groupid>

			<choices>
				<choice reply="True">
					<name>cancel Check Exists</name>
					<distance>53.03301</distance>
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
		</xsl:element>

		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Time Out1</xsl:attribute>
			<xsl:attribute name="type">WaitEnd</xsl:attribute>
			<subsheetid>
				<xsl:value-of select="Step-Guid"/>
			</subsheetid>
			<loginhibit />
			<display x="-90" y="15" w="30" h="30" />
			<onsuccess>
				<xsl:value-of select="utils:getGuidExcHan()"/>
			</onsuccess>
			<groupid>
				<xsl:value-of select="Step-Guid"/>
			</groupid>
		</xsl:element>
	</xsl:template>

	<xsl:template name="exceptionHandlingTemplate">

		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuidExcHan()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Exception</xsl:attribute>
			<xsl:attribute name="type">Exception</xsl:attribute>
			<xsl:element name="subsheetid">
				<xsl:value-of select="Step-Guid"/>
			</xsl:element>
			<loginhibit />
			<display x="-135" y="60" />
			<xsl:element name="exception">
				<xsl:attribute name="localized">yes</xsl:attribute>
				<xsl:attribute name="type">System</xsl:attribute>
				<xsl:attribute name="detail">"<xsl:value-of select="concat(PlayBack--ControlInfo-ControlName, ' element not found')" />"</xsl:attribute>
			</xsl:element>
		</xsl:element>

		<!--
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Recover1</xsl:attribute>
			<xsl:attribute name="type">Recover</xsl:attribute>

			<xsl:element name="subsheetid">
				<xsl:value-of select="Step-Guid"/>
			</xsl:element>
			<loginhibit />
			<display x="-135" y="60" />
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuidExcHan()"/>
			</xsl:element>
		</xsl:element>


		
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuidExcHan()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Calc1</xsl:attribute>
			<xsl:attribute name="type">Calculation</xsl:attribute>

			<xsl:element name="subsheetid">
				<xsl:value-of select="Step-Guid"/>
			</xsl:element>
			<loginhibit />
			<display x="-225" y="90" />
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getGuidExcHan()"/>
			</xsl:element>
			<calculation expression="ExceptionDetail()" stage="exDetails" />
		</xsl:element>

		
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:getLastGuidExcHan()"/>
			</xsl:attribute>
			<xsl:attribute name="name">Resume1</xsl:attribute>
			<xsl:attribute name="type">Resume</xsl:attribute>

			<xsl:element name="subsheetid">
				<xsl:value-of select="Step-Guid"/>
			</xsl:element>
			<loginhibit />
			<display x="-135" y="135" />
			<xsl:element name="onsuccess">
				<xsl:value-of select="utils:getEndGuid()"/>
			</xsl:element>
		</xsl:element>

		
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>
			<xsl:attribute name="name">exDetails</xsl:attribute>
			<xsl:attribute name="type">Data</xsl:attribute>

			<xsl:element name="subsheetid">
				<xsl:value-of select="Step-Guid"/>
			</xsl:element>

			<display x="150" y="90" />
			<datatype>text</datatype>
			<initialvalue />
			<private />
			<alwaysinit />
		</xsl:element>
		-->
		<!--
		<stage stageid="5fd6e1c5-eeca-4d53-b5d7-d3ac2dc46712" name="Resume1" type="Resume">
			<subsheetid><xsl:value-of select="Step-Guid"/></subsheetid>
			<loginhibit />
			<display x="-135" y="135" />
			<onsuccess><xsl:value-of select="utils:getEndGuid()"/></onsuccess>
		</stage>
		
		
		<stage stageid="d4794756-bf91-48ac-9426-0e980a57fd05" name="Recover1" type="Recover">
			<subsheetid><xsl:value-of select="Step-Guid"/></subsheetid>
			<loginhibit />
			<display x="-135" y="60" />
			<onsuccess>0a6343b5-649d-46bd-8887-bce8410dc1b0</onsuccess>
		</stage>
		<stage stageid="0a6343b5-649d-46bd-8887-bce8410dc1b0" name="Calc1" type="Calculation">
			<subsheetid><xsl:value-of select="Step-Guid"/></subsheetid>
			<loginhibit />
			<display x="-225" y="90" />
			<onsuccess>5fd6e1c5-eeca-4d53-b5d7-d3ac2dc46712</onsuccess>
			<calculation expression="ExceptionDetail()" stage="exDetails" />
		</stage>
		<stage stageid="7a8e4587-3c4b-4c39-bed6-ab04b46114a1" name="exDetails" type="Data">
			<subsheetid><xsl:value-of select="Step-Guid"/></subsheetid>
			<display x="150" y="90" />
			<datatype>text</datatype>
			<initialvalue />
			<private />
			<alwaysinit />
		</stage>
-->

	</xsl:template>



</xsl:stylesheet>
