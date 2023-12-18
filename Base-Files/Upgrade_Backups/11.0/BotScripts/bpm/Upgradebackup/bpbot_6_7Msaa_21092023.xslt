<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<!--MSAA BluePrism Final 3 date:08/05/2020-->
	<xsl:output method="xml" indent="yes"/>
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
	<xsl:variable name="centerClick">UIAClickCentre</xsl:variable>
	<xsl:variable name="scrollIntoView">UIAScrollIntoView</xsl:variable>
	<xsl:variable name="newtext">newtext</xsl:variable>

	<xsl:variable name="firstGuid">
		<xsl:value-of select="/Document/Process/Step/Step-Guid"/>
	</xsl:variable>
	<xsl:variable name="one">1</xsl:variable>
	<xsl:variable name="end">end</xsl:variable>
	<xsl:variable name="endGuid">32e2ab11-ff48-44fe-969e-69d402f68bbd</xsl:variable>

	<xsl:variable name="launch">Launch</xsl:variable>

	<xsl:variable name="stepDelayLaunch">10</xsl:variable>

	<xsl:variable name="stepDelay">1</xsl:variable>

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
		int initialPositionY = -45;
		string lastGuid = "";
		
		public int getPositionY(){
    initialPositionY = initialPositionY+60;
    return initialPositionY;
		}
		public void setLastGuid(string temp){
		     lastGuid = temp;
		}

public string getLastGuid(){
		     return lastGuid;
		}
		
		public string guid(){
		string gi = Guid.NewGuid().ToString();
		return gi;
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
							<xsl:when test="PlayBack__GeneralInfo_Event = 'Click' or PlayBack__GeneralInfo_Event = 'Select' or PlayBack__GeneralInfo_Event='TYPETEXT'">
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
				<xsl:choose>
					<xsl:when test="PlayBack__GeneralInfo_Event = 'Click' or PlayBack__GeneralInfo_Event = 'Select'">

						<xsl:element name="stage">
							<xsl:attribute name="stageid">
								<xsl:value-of select="Step-Guid"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="Sentence-Plain"/>
							</xsl:attribute>
							<xsl:attribute name="type">Navigate</xsl:attribute>
							
							<xsl:attribute name="interval">
								<xsl:value-of select="$stepDelay"/>
							</xsl:attribute>

							<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>

							<loginhibit />
							<!--<display x="15" y="-15" />-->
							<xsl:element name="display">
								<xsl:attribute name="x">15</xsl:attribute>
								<xsl:attribute name="y">
									<xsl:value-of select="utils:getPositionY()"/>
								</xsl:attribute>
							</xsl:element>

							<xsl:element name="onsuccess">
								<xsl:choose>
									<xsl:when test="position() = last()">
										<xsl:value-of select="$endGuid"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="following-sibling::Step[1]/Step-Guid"/>
									</xsl:otherwise>
								</xsl:choose>

							</xsl:element>

							<xsl:call-template name="stepTemplate"/>
							<!--	<xsl:value-of select="utils:setLastGuid(Step-Guid)"/>  -->

						</xsl:element>
					</xsl:when>
					<xsl:when test="PlayBack__GeneralInfo_Event='TYPETEXT'">
						<xsl:element name="stage">
							<xsl:attribute name="stageid">
								<xsl:value-of select="Step-Guid"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="Sentence-Plain"/>
							</xsl:attribute>
							<xsl:attribute name="type">Write</xsl:attribute>


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
								<xsl:choose>
									<xsl:when test="position() = last()">
										<xsl:value-of select="$endGuid"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="following-sibling::Step[1]/Step-Guid"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>

							<xsl:call-template name="stepTemplate1"/>
						</xsl:element>

					</xsl:when>
				</xsl:choose>

			</xsl:for-each>

			<xsl:call-template name="endStageTemplate" />

		</xsl:element>
	</xsl:template>

	<xsl:template  name="elementTemplate">
		<xsl:element name="element">
			<xsl:attribute name="name">
				<xsl:value-of select="concat('uia_',PlayBack__ControlInfo_ControlName,' element')"/>
			</xsl:attribute>
			<xsl:element name="id">
				<xsl:value-of select="Step-Guid"/>
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
					<xsl:attribute name="name">uAutomationId</xsl:attribute>
					<xsl:if test="PlayBack__AdditionalInfo_UIA_AUTOMATIONID">
						<xsl:attribute name="inuse">
							<xsl:choose>
								<xsl:when test="PlayBack__AdditionalInfo_UIA_AUTOMATIONID = ''">
									<xsl:value-of select="$false"/>
								</xsl:when>
								<xsl:when test="PlayBack__ControlInfo_ControlName = ''">
									<xsl:value-of select="$true"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$false"/>
								</xsl:otherwise>
							</xsl:choose>

						</xsl:attribute>
					</xsl:if>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:variable name="tempUControlType">
						<xsl:call-template name="matchDictionaryTemplate"/>
					</xsl:variable>
					<xsl:attribute name="name">uControlType</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="$tempUControlType!=''">
								<xsl:value-of select="$false"/>
								<!--Change To true-->
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
							<xsl:value-of select="$tempUControlType"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>


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
							<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">uClassName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__AdditionalInfo_UIA_CLASSNAME"/>
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
							<xsl:value-of select="PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>
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

				<xsl:element name="attribute">
					<xsl:attribute name="name">uAccessKey</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__AdditionalInfo_UIA_ACCESSKEY"/>
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
							<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">puClassName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_CLASSNAME"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">puName</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:choose>
							<xsl:when test="PlayBack__ControlInfo_Role='combo box' and (PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='button' or PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='Button')">
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
							<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_NAME"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="attribute">
					<xsl:attribute name="name">puAutomationId</xsl:attribute>
					<xsl:attribute name="inuse">
						<xsl:value-of select="$false"/>
					</xsl:attribute>
					<xsl:element name="ProcessValue">
						<xsl:attribute name="datatype">
							<xsl:value-of select="$text"/>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>



			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="appTypeInfoTemplate">
		<apptypeinfo>
			<id>Win32Launch</id>
			<parameters>
				<parameter>
					<name>Path</name>
					<value>
						<xsl:value-of select="Document/EXE_PATH"/>
					</value>
				</parameter>
				<parameter>
					<name>CommandLineParams</name>
					<value>
					</value>
				</parameter>
				<parameter>
					<name>WorkingDirectory</name>
					<value>
					</value>
				</parameter>
				<parameter>
					<name>NonInvasive</name>
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
			<name>Action 1</name>
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
		<stage stageid="6c7e9331-b3f5-4cd3-9970-aa0cce06c17d" name="Action 1" type="SubSheetInfo">
			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<display x="-195" y="-105" w="150" h="90" />
		</stage>
		<stage stageid="ad5d907d-13e8-4923-9db8-d36dc07d9104" name="Start" type="Start">

			<subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
			<loginhibit />
			<display x="15" y="-105" />
			<xsl:element name="onsuccess">
				<xsl:value-of select="$GpsId"/>
			</xsl:element>

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
		<xsl:if test="PlayBack__AdditionalInfo_UIA_SCROLLITEMPATTREN='1'">
			<xsl:element name="step">
				<xsl:element name="element">
					<xsl:attribute name="id">

						<xsl:value-of select="Step-Guid"/>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="action">
					<xsl:element name="id">

						<xsl:value-of select="$scrollIntoView"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:element name="step">
			<xsl:element name="element">
				<xsl:attribute name="id">

					<xsl:value-of select="Step-Guid"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="action">
				<xsl:element name="id">

					<xsl:value-of select="$centerClick"/>
				</xsl:element>
				<xsl:element name="arguments">

					<xsl:element name="argument">
						<xsl:element name="id">
							<xsl:value-of select="$newtext"/>
						</xsl:element>
						<xsl:element name="value"/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="stepTemplate1">
		<xsl:element name="step">
			<xsl:attribute name="expr">"<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>"</xsl:attribute>
			<xsl:element name="element">
				<xsl:attribute name="id">
					<xsl:value-of select="Step-Guid"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="endStageTemplate">

		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="$endGuid"/>
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

	<xsl:template name="launchTemplate">
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="$GpsId"/>
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
				<xsl:value-of select="$firstGuid"/>
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
							<id>Path</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>CommandLineParams</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>WorkingDirectory</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>NonInvasive</id>
							<value>
							</value>
						</argument>
						<argument>
							<id>ProcessMode</id>
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
	</xsl:template>

	<!--To be removed once uControlType is available in gps-->
	<xsl:template name="matchDictionaryTemplate">
		<xsl:choose>
			<xsl:when test="PlayBack__ControlInfo_Role = 'menu item'">MenuItem</xsl:when>
			<xsl:when test="(PlayBack__ControlInfo_Role = 'push button') or (PlayBack__ControlInfo_Role = 'grid drop down button')">Button</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'check box'">CheckBox</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'radio button'">RadioButton</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'editable text'">Edit</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'list item'">ListItem</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'combo box'">ComboBox</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'grid drop down button'">B</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'page tab'">TabItem</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'drop down button'">SplitButton</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'link'">Hyperlink</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="matchDictionaryTemplate1">
		<xsl:choose>
			<xsl:when test="PlayBack__ControlInfo_Role = 'menu item'">UIAMenuItem</xsl:when>
			<xsl:when test="(PlayBack__ControlInfo_Role = 'push button') or (PlayBack__ControlInfo_Role = 'grid drop down button')">UIAButton</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'check box'">UIACheckBox</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'radio button'">UIARadio</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'editable text'">UIAEdit</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'list item' or PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='list item'">UIAListItem</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'combo box'">UIAComboBox</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'page tab'">UIATabItem</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'drop down button'">UIAButton</xsl:when>
			<xsl:when test="PlayBack__ControlInfo_Role = 'link'">UIAHyperlink</xsl:when>
			<xsl:otherwise>UIAElement</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
