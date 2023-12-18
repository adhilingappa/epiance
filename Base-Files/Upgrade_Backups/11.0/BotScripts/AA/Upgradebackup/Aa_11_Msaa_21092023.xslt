<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes"/>

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<msxsl:using namespace="System.IO" />
		<![CDATA[
		
		public string guidMsaa(){
		string gi = Guid.NewGuid().ToString();
		return gi;
		}
		
		public string getNameWithoutExtMsaa(string fn)
		{
			return Path.GetFileNameWithoutExtension(fn);
		}
		]]>
	</msxsl:script>

	<xsl:variable name="num1">1</xsl:variable>
	<xsl:variable name="num2">2</xsl:variable>
	<xsl:variable name="num3">3</xsl:variable>
	<xsl:variable name="num12">12</xsl:variable>
	<xsl:variable name="num15">15</xsl:variable>

	<xsl:variable name="wndInd">3.1.1.1.1</xsl:variable>
	
	<xsl:variable name="Windows">Windows</xsl:variable>
	<xsl:variable name="Click">Click</xsl:variable>

	<xsl:variable name="true">True</xsl:variable>
	<xsl:variable name="false">False</xsl:variable>

	<xsl:variable name="default">Default</xsl:variable>
	<xsl:variable name="SMARTRecorder">SMARTRecorder</xsl:variable>
	<xsl:variable name="SMARTWndCtrl">SMARTWndCtrl</xsl:variable>
	
	<xsl:variable name="TextBox">TextBox</xsl:variable>

    <xsl:template match="/">
		
    </xsl:template>

	<xsl:template name="mainMsaaTemplate">
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
					<xsl:when test="PlayBack--ControlInfo-Role='menu item' or PlayBack--ControlInfo-Role='page tab' or PlayBack--ControlInfo-Role='list item' or PlayBack--ControlInfo-Role='list'">SelectItemByText</xsl:when>
					<xsl:otherwise>Click</xsl:otherwise>
				</xsl:choose>

				<!--<xsl:call-template name="apiTemplate" /> -->
			</xsl:attribute>

			<xsl:element name="PARS">
				<xsl:choose>
					<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">
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
				<xsl:element name="PAR">
					<xsl:attribute name="Name">WindowTitle</xsl:attribute>
					<xsl:attribute name="Type">String</xsl:attribute>
					<xsl:value-of select="PlayBack--AppInfo-DialogName"/>
				</xsl:element>
				<xsl:element name="PAR">
					<xsl:attribute name="Name">ObjName</xsl:attribute>
					<xsl:attribute name="Type">String</xsl:attribute>
					<xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
				</xsl:element>
				<xsl:element name="PAR">
					<xsl:attribute name="Name">ObjType</xsl:attribute>
					<xsl:attribute name="Type">String</xsl:attribute>
					<xsl:call-template name="objTypeTemplate" />
				</xsl:element>
				<xsl:if test="PlayBack--ControlInfo-Role='menu item' or PlayBack--ControlInfo-Role='page tab' or PlayBack--ControlInfo-Role='list item'">
						<xsl:element name="PAR">
							<xsl:attribute name="Name">Text</xsl:attribute>
							<xsl:attribute name="Type">String</xsl:attribute>
							<xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
						</xsl:element>
				</xsl:if>
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
					<xsl:choose>
						<xsl:when test="PlayBack--ControlInfo-Role='menu item' or PlayBack--ControlInfo-Role='page tab' or PlayBack--ControlInfo-Role='list item'">
							<xsl:call-template name="SmartObjectTemplateParentMsaa"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="SmartObjectTemplateMsaa"/>
						</xsl:otherwise>
					</xsl:choose>
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
						<xsl:when test="PlayBack--ControlInfo-Role='menu item' or PlayBack--ControlInfo-Role='page tab' or PlayBack--ControlInfo-Role='list item'">16</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
					<!--<xsl:call-template name="optTemplate" />-->
					<!--<xsl:value-of select="$num12"/>-->
				</xsl:element>
				<xsl:element name="PAR">
					<xsl:attribute name="Name">WindowTitleID</xsl:attribute>
					<xsl:attribute name="Type">String</xsl:attribute>

				</xsl:element>
				<xsl:element name="PAR">
					<xsl:attribute name="Name">BrowserUsed</xsl:attribute>
					<xsl:attribute name="Type">String</xsl:attribute>
					<xsl:value-of select="$Windows"/>
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

	<xsl:template name="SmartObjectTemplateMsaa">
		&lt;SI&gt;
		&lt;SmartObject&gt;
			&lt;PropertyInformation /&gt;
				&lt;AttributeInformation&gt;
				&lt;AAPropertyInfo&gt;
				&lt;CK&gt;false&lt;/CK&gt;
				&lt;PN&gt;Unique ID&lt;/PN&gt;
				&lt;PV&gt;<xsl:value-of select="utils:guidMsaa()"/>&lt;/PV&gt;
				&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;

				&lt;AAPropertyInfo&gt;
				&lt;CK&gt;false&lt;/CK&gt;
				&lt;PN&gt;Object ID&lt;/PN&gt;
				&lt;PV /&gt;
				&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
				<xsl:choose>
				<xsl:when test="PlayBack--ControlInfo-ControlName!=''">&lt;CK&gt;true&lt;/CK&gt;</xsl:when>
				<xsl:otherwise>&lt;CK&gt;false&lt;/CK&gt;</xsl:otherwise>
				</xsl:choose>
				&lt;PN&gt;Name&lt;/PN&gt;
				&lt;PV&gt;<xsl:value-of select="PlayBack--ControlInfo-ControlName"/>&lt;/PV&gt;
				&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;

				&lt;AAPropertyInfo&gt;
				&lt;CK&gt;false&lt;/CK&gt;
				&lt;PN&gt;Value&lt;/PN&gt;
				&lt;PV /&gt;
				&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
				&lt;CK&gt;false&lt;/CK&gt;
				&lt;PN&gt;Class&lt;/PN&gt;
				&lt;PV /&gt;
				&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
				&lt;CK&gt;false&lt;/CK&gt;
				&lt;PN&gt;Parent&lt;/PN&gt;
				&lt;PV&gt;<xsl:value-of select="PlayBack--ParentInfo-ParentName"/>&lt;/PV&gt;
				&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;

				&lt;AAPropertyInfo&gt;
				&lt;CK&gt;false&lt;/CK&gt;
				&lt;PN&gt;Window Title&lt;/PN&gt;
				&lt;PV&gt;<xsl:value-of select="PlayBack--AppInfo-DialogName"/>&lt;/PV&gt;
				&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;

				&lt;AAPropertyInfo&gt;
				&lt;CK&gt;true&lt;/CK&gt;
				&lt;PN&gt;Type&lt;/PN&gt;
				&lt;PV&gt;<xsl:call-template name="roleTypeDictionaryMsaa"/>&lt;/PV&gt;
				&lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Path&lt;/PN&gt;
		        &lt;PV /&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Index&lt;/PN&gt;
		        &lt;PV /&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Left&lt;/PN&gt;
		        &lt;PV&gt;&lt;/PV&gt;;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Top&lt;/PN&gt;
		        &lt;PV&gt;&lt;/PV&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Width&lt;/PN&gt;
		        &lt;PV /&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Height&lt;/PN&gt;
		        &lt;PV /&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Click X&lt;/PN&gt;
		        &lt;PV&gt;&lt;/PV&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Click Y&lt;/PN&gt;
		        &lt;PV&gt;&lt;/PV&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Description&lt;/PN&gt;
		        &lt;PV /&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;State(s)&lt;/PN&gt;
		        &lt;PV /&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;
		
				&lt;AAPropertyInfo&gt;
		        &lt;CK&gt;false&lt;/CK&gt;
		        &lt;PN&gt;Action&lt;/PN&gt;
		        &lt;PV /&gt;
		        &lt;SH&gt;false&lt;/SH&gt;
				&lt;/AAPropertyInfo&gt;


		&lt;/AttributeInformation&gt;
		&lt;ExtraItemProperty /&gt;
		&lt;/SmartObject&gt;

		&lt;TEC&gt;MSAA&lt;/TEC&gt;
		&lt;PLF&gt;NONE&lt;/PLF&gt;
		<xsl:choose>
			<xsl:when test="PlayBack--GeneralInfo-Event='TYPETEXT'">&lt;SA&gt;SetText&lt;/SA&gt;</xsl:when>
			<xsl:when test="PlayBack--GeneralInfo-IsCitrix='1'">&lt;SA&gt;LeftClick&lt;/SA&gt;</xsl:when>
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

	<xsl:template name="SmartObjectTemplateParentMsaa">
		&lt;SI&gt;
		&lt;SmartObject&gt;
		&lt;PropertyInformation /&gt;
		&lt;AttributeInformation&gt;
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Unique ID&lt;/PN&gt;
		&lt;PV&gt;<xsl:value-of select="utils:guidMsaa()"/>&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Object ID&lt;/PN&gt;
		&lt;PV /&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		<xsl:choose>
		<xsl:when test="PlayBack--ParentInfo-ParentName!=''">&lt;CK&gt;true&lt;/CK&gt;</xsl:when>
		<xsl:otherwise>&lt;CK&gt;false&lt;/CK&gt;</xsl:otherwise>
		</xsl:choose>
		&lt;PN&gt;Name&lt;/PN&gt;
		&lt;PV&gt;<xsl:value-of select="PlayBack--ParentInfo-ParentName"/>&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Value&lt;/PN&gt;
		&lt;PV /&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Class&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Parent&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Window Title&lt;/PN&gt;
		&lt;PV&gt;<xsl:value-of select="PlayBack--AppInfo-DialogName"/>&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;true&lt;/CK&gt;
		&lt;PN&gt;Type&lt;/PN&gt;
		&lt;PV&gt;<xsl:call-template name="roleIdDictionaryMsaa" />&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Path&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Index&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Left&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Top&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Width&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Height&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Click X&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Click Y&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Description&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;State(s)&lt;/PN&gt;
		&lt;PV&gt;&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Action&lt;/PN&gt;
		&lt;PV /&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		
		&lt;/AttributeInformation&gt;
		&lt;ExtraItemProperty&gt;
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Item Name&lt;/PN&gt;
		&lt;PV&gt;<xsl:value-of select="PlayBack--ControlInfo-ControlName"/>&lt;/PV&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;
		&lt;AAPropertyInfo&gt;
		&lt;CK&gt;false&lt;/CK&gt;
		&lt;PN&gt;Item Value&lt;/PN&gt;
		&lt;PV /&gt;
		&lt;SH&gt;false&lt;/SH&gt;
		&lt;/AAPropertyInfo&gt;

		&lt;/ExtraItemProperty&gt;
		&lt;/SmartObject&gt;

		&lt;TEC&gt;MSAA&lt;/TEC&gt;
		&lt;PLF&gt;NONE&lt;/PLF&gt;
		&lt;SA&gt;SelectItemByText&lt;/SA&gt;
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
	<xsl:template name="roleTypeDictionaryMsaa">
		<xsl:choose>
			<xsl:when test="PlayBack--ControlInfo-Role = 'menu item'">MenuItem</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'push button'">PushButton</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'check box'">CheckBox</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'radio button'">RadioButton</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'list item'">ListItem</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'combo box'">ComboBox</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'page tab'">PageTab</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'editable text'">TextBox</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'grid drop down button'">DropDownGridButton</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'link'">Link</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="objTypeTemplate">
		<xsl:choose>
			<xsl:when test="PlayBack--ControlInfo-Role = 'menu item'">MenuItem</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'push button'">PushButton</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'check box'">CheckBox</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'radio button'">RadioButton</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'list item'">ListItem</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'combo box'">ComboBox</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'page tab'">PageTab</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'editable text'">TextBox</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'grid drop down button'">DropDownGridButton</xsl:when>
			<xsl:when test="PlayBack--ControlInfo-Role = 'link'">Link</xsl:when>
			<xsl:otherwise>TextBox</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="roleIdDictionaryMsaa">
		<xsl:choose>
			<xsl:when test="PlayBack--ParentInfo-ParentRoleId = '2'">MenuBar</xsl:when>
			<xsl:when test="PlayBack--ParentInfo-ParentRoleId = '9'">Window</xsl:when>
			<xsl:when test="PlayBack--ParentInfo-ParentRoleId = '11'">Menu</xsl:when>
			<xsl:when test="PlayBack--ParentInfo-ParentRoleId = '1'">TitleBar</xsl:when>
			<xsl:when test="PlayBack--ParentInfo-ParentRoleId = '60'">PageTabList</xsl:when>
			<xsl:when test="PlayBack--ParentInfo-ParentRoleId = '37'">PageTab</xsl:when>
			<xsl:when test="PlayBack--ParentInfo-ParentRoleId = '33'">ListView</xsl:when>
			<xsl:when test="PlayBack--ParentInfo-ParentRoleId = '34'">ListItem</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
