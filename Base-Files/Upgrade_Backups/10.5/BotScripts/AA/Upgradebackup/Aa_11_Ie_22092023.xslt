<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes"/>

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
		
		public string guidIe(){
		string gi = Guid.NewGuid().ToString();
		return gi;
		}
		]]>
	</msxsl:script>

	<xsl:variable name="num1">1</xsl:variable>
	<xsl:variable name="num2">2</xsl:variable>
	<xsl:variable name="num3">3</xsl:variable>
	<xsl:variable name="num12">12</xsl:variable>
	<xsl:variable name="num15">15</xsl:variable>
	
	<xsl:variable name="wndInd">1.1.1.1.1</xsl:variable>

	<xsl:variable name="ie">IE</xsl:variable>
	<xsl:variable name="Click">Click</xsl:variable>
	<xsl:variable name="LeftClick">LeftClick</xsl:variable>

	<xsl:variable name="true">True</xsl:variable>
	<xsl:variable name="false">False</xsl:variable>

	<xsl:variable name="default">Default</xsl:variable>
	<xsl:variable name="SMARTRecorder">SMARTRecorder</xsl:variable>
	<xsl:variable name="SMARTWndCtrl">SMARTWndCtrl</xsl:variable>
	
	<xsl:variable name="TextBox">TextBox</xsl:variable>
	<xsl:template match="/">

		

	</xsl:template>

	<xsl:template name="mainIeTemplate">
		<xsl:param name="index" />
			<xsl:element name="CMD">
				<xsl:attribute name="GRP">
					<xsl:value-of select="$SMARTRecorder"/>
				</xsl:attribute>
				<xsl:attribute name="NAM">
					<xsl:value-of select="$SMARTWndCtrl"/>
				</xsl:attribute>
				<xsl:attribute name="API">
					<xsl:choose>
						<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">SetText</xsl:when>
						<xsl:when test="PlayBack--GeneralInfo-IsCitrix='1'">Click</xsl:when>
						<xsl:when test="PlayBack--ControlInfo-Role='list item' and PlayBack--ControlInfo-IEControlAttributeTagName='SELECT'">SelectItemByText</xsl:when>
						<xsl:otherwise>Click</xsl:otherwise>
					</xsl:choose>

					<!--<xsl:call-template name="apiTemplateIe" /> -->
				</xsl:attribute>

					<xsl:element name="PAR">
						<xsl:attribute name="Name">WindowTitle</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>
						<xsl:value-of select="PlayBack--AppInfo-DialogName"/>
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">ObjName</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">ObjType</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>
						<xsl:if test="PlayBack--ControlInfo-Role='list item' and PlayBack--ControlInfo-IEControlAttributeTagName='SELECT'">ComboBox</xsl:if>
						<!--<xsl:value-of select="$TextBox"/>-->
						<!--<xsl:call-template name="objTypeTemplateIe" />-->
					</xsl:element>
					
					<xsl:element name="PARS">
					<xsl:choose>
						<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">
							<xsl:element name="PAR">
								<xsl:attribute name="Name">Text</xsl:attribute>
								<xsl:attribute name="Type">String</xsl:attribute>
								<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
							</xsl:element>
						</xsl:when>
						<xsl:when test="PlayBack--GeneralInfo-IsCitrix='1'">
							<xsl:element name="PAR">
								<xsl:attribute name="Name">ClkType</xsl:attribute>
								<xsl:attribute name="Type">Integer</xsl:attribute>
								<xsl:value-of select="$num2"/>
							</xsl:element>
						</xsl:when>
						<xsl:when test="PlayBack--ControlInfo-Role='list item' and PlayBack--ControlInfo-IEControlAttributeTagName='SELECT'">
							<xsl:element name="PAR">
								<xsl:attribute name="Name">Text</xsl:attribute>
								<xsl:attribute name="Type">String</xsl:attribute>
								<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="PAR">
								<xsl:attribute name="Name">ClkType</xsl:attribute>
								<xsl:attribute name="Type">Integer</xsl:attribute>
								<xsl:value-of select="$num2"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
					<!--
						<xsl:if test="PlayBack-\-GeneralInfo-Event='TYPETEXT'">
							<xsl:element name="PAR">
							<xsl:attribute name="Name">Text</xsl:attribute>
							<xsl:attribute name="Type">String</xsl:attribute>
							<xsl:value-of select="PlayBack-\-ControlInfo-ControlData"/>
						</xsl:element>

						</xsl:if>
						<xsl:if test="PlayBack-\-ControlInfo-Role='check box'">
							<xsl:element name="PAR">
							<xsl:attribute name="Name">SelChkBoxStat</xsl:attribute>
							<xsl:attribute name="Type">String</xsl:attribute>
							<xsl:value-of select="$num1"/>
						</xsl:element>
						</xsl:if>
						-->
					<xsl:element name="PAR">
						<xsl:attribute name="Name">PlayMode</xsl:attribute>
						<xsl:attribute name="Type">Integer</xsl:attribute>
						<xsl:choose>
							<xsl:when test="PlayBack--GeneralInfo-IsCitrix='1'">
								<xsl:value-of select="$num3"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$num1"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">CmdOpt</xsl:attribute>
						<xsl:attribute name="Type">Integer</xsl:attribute>
						<xsl:value-of select="$num1"/>
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">AvtId</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>

					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">ObjId</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>

					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">WndInd</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>
						<xsl:value-of select="concat($index,'.1.1.1.1')"/>
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">Wait</xsl:attribute>
						<xsl:attribute name="Type">Integer</xsl:attribute>
						<xsl:value-of select="$num15"/>
					</xsl:element>


					<!--TODO :Add SmartObjectTemplate here-->
					<xsl:element name="PAR">
						<xsl:attribute name="Name">ObjInfo</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>
						<xsl:call-template name="SmartObjectTemplateIe"/>
					</xsl:element>


					<xsl:element name="PAR">
						<xsl:attribute name="Name">ImgThumb</xsl:attribute>
						<xsl:attribute name="Type">Image</xsl:attribute>
						<xsl:value-of select="concat('/',utils:getNameWithoutExtAll(ImageStore--ControlImage--ImageData-FileName))"/>
					</xsl:element>

					<xsl:element name="PAR">
						<xsl:attribute name="Name">ImgInd</xsl:attribute>
						<xsl:attribute name="Type">Image</xsl:attribute>

					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">Opt</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>
						<xsl:choose>
							<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">12</xsl:when>
							<xsl:when test="PlayBack--GeneralInfo-IsCitrix='1'">0</xsl:when>
							<xsl:when test="PlayBack--ControlInfo-Role='list item' and PlayBack--ControlInfo-IEControlAttributeTagName='SELECT'">16</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
						<!--<xsl:call-template name="optTemplateIe" />-->
						<!--<xsl:value-of select="$num12"/>-->
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">WindowTitleID</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>

					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">BrowserUsed</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>
						<xsl:value-of select="$ie"/>
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">IsMobile</xsl:attribute>
						<xsl:attribute name="Type">Boolean</xsl:attribute>
						<xsl:value-of select="$false"/>
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">IsProtected</xsl:attribute>
						<xsl:attribute name="Type">Boolean</xsl:attribute>
						<xsl:value-of select="$false"/>
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">LegacyTechnology</xsl:attribute>
						<xsl:attribute name="Type">Boolean</xsl:attribute>
						<xsl:value-of select="$false"/>
					</xsl:element>
					<xsl:element name="PAR">
						<xsl:attribute name="Name">CaptureTechnology</xsl:attribute>
						<xsl:attribute name="Type">String</xsl:attribute>
						<xsl:value-of select="$default"/>
					</xsl:element>


				</xsl:element>
			</xsl:element>
	</xsl:template>

	<xsl:template name="SmartObjectTemplateIe">
		&lt;SI&gt;
		&lt;SmartObject&gt;
			&lt;PropertyInformation&gt;
				&lt;AAPropertyInfo&gt;
					<!--
					<xsl:element name="CK">
						<xsl:value-of select="$true"/>
					</xsl:element>
					<xsl:element name="PN">
						<xsl:value-of select="$true"/>
					</xsl:element>
					<xsl:element name="PV">
						<xsl:value-of select="$true"/>
					</xsl:element>
					<xsl:element name="SH">
						<xsl:value-of select="$true"/>
					</xsl:element>
					-->
					&lt;CK&gt;true&lt;/CK&gt;
					&lt;PN&gt;DOMXPath&lt;/PN&gt;
					&lt;PV&gt;<xsl:value-of select="PlayBack--ControlInfo-XPath"/>&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		

				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML ID&lt;/PN&gt;
					&lt;PV&gt;<xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML Name&lt;/PN&gt;
					&lt;PV&gt;<xsl:value-of select="PlayBack--AdditionalInfo-Web_Name"/>&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML Tag&lt;/PN&gt;
					&lt;PV&gt;<xsl:value-of select="PlayBack--ControlInfo-IEControlAttributeTagName"/>&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML Class&lt;/PN&gt;
					&lt;PV&gt;<xsl:value-of select="PlayBack--AdditionalInfo-Web_ClassName"/>&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
				
				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML InnerText&lt;/PN&gt;
					&lt;PV&gt;&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML SourceIndex&lt;/PN&gt;
					&lt;PV&gt;&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
				
				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML HRef&lt;/PN&gt;
					&lt;PV&gt;&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
				
				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML Type&lt;/PN&gt;
					&lt;PV&gt;<xsl:value-of select="PlayBack--AdditionalInfo-Web_Type"/>&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML Type&lt;/PN&gt;
					&lt;PV&gt;<xsl:value-of select="PlayBack--AdditionalInfo-Web_Value"/>&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
			
				&lt;AAPropertyInfo&gt;
					&lt;CK&gt;false&lt;/CK&gt;
					&lt;PN&gt;HTML Tag Index&lt;/PN&gt;
					&lt;PV&gt;&lt;/PV&gt;
					&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		<!--
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>HTML Alt</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>HTML ClassId</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>HTML Title</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>HTML Height</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>HTML Width</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>HTML Top</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>HTML Left</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
			</xsl:element>
			-->
				
					
					<!--
					<xsl:element name="AAPropertyInfo">
						<CK>false</CK>
						<PN>Unique ID</PN>
						<PV>
							<xsl:value-of select="utils:guidIe()"/>
						</PV>
						<SH>false</SH>
					</xsl:element>
					-->
					<!--
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>Object ID</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>Name</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>Class</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>Parent</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>Window Title</PN>
					<PV><xsl:value-of select="PlayBack\-\-AppInfo-DialogName"/></PV>
					<SH>false</SH>
				</xsl:element>
				<xsl:element name="AAPropertyInfo">
					<CK>false</CK>
					<PN>Parent</PN>
					<PV></PV>
					<SH>false</SH>
				</xsl:element>
			<!\-\-TODO: Add other properties-\->
			-->
				

			
			&lt;/PropertyInformation&gt;
			&lt;AttributeInformation /&gt;
			&lt;ExtraItemProperty /&gt;
			&lt;/SmartObject&gt;
			&lt;TEC&gt;HTML&lt;/TEC&gt;
			&lt;PLF&gt;WEB&lt;/PLF&gt;
			
			<xsl:choose>
				<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">&lt;SA&gt;SetText&lt;/SA&gt;</xsl:when>
				<xsl:when test="PlayBack--GeneralInfo-IsCitrix='1'">&lt;SA&gt;LeftClick&lt;/SA&gt;</xsl:when>
				<xsl:when test="PlayBack--ControlInfo-Role='list item' and PlayBack--ControlInfo-IEControlAttributeTagName='SELECT'">&lt;SA&gt;SelectItemByText&lt;/SA&gt;</xsl:when>
				<xsl:when test="PlayBack--ControlInfo-IEControlAttributeTagName='svg' or PlayBack--ControlInfo-IEControlAttributeTagName='A' or PlayBack--ControlInfo-Role='push button'">&lt;SA&gt;Click&lt;/SA&gt;</xsl:when>
				<xsl:otherwise>&lt;SA&gt;LeftClick&lt;/SA&gt;</xsl:otherwise>
			</xsl:choose>
			&lt;XP&gt;0&lt;/XP&gt;
			&lt;YP&gt;0&lt;/YP&gt;
			&lt;PER&gt;90&lt;/PER&gt;
			&lt;RL&gt;0&lt;/RL&gt;
			&lt;RT&gt;0&lt;/RT&gt;
			&lt;RW&gt;0&lt;/RW&gt;
			&lt;RH&gt;0&lt;/RH&gt;
			&lt;MG&gt;false&lt;/MG&gt;
		&lt;/SI&gt;


	</xsl:template>

	<xsl:template name="apiTemplateIe">
		<xsl:choose>
			<xsl:when test="PlayBack--ControlInfo-Role='editable text' and PlayBack--GeneralInfo-Event='TYPETEXT'">SetText</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role='check box'">SetCheckBoxStatus</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role='radio button'">SelectRadioButton</xsl:when>
			<xsl:otherwise>Click</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
	
	<xsl:template name="objTypeTemplateIe">
		<xsl:choose>
			<xsl:when test="PlayBack--ControlInfo-Role='editable text'">TextBox</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role='check box'">CheckBox</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="optTemplateIe">
		<xsl:choose>
			<xsl:when test="PlayBack--ControlInfo-Role='editable text' and PlayBack--GeneralInfo-Event='TYPETEXT'">12</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role='check box'">13</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
