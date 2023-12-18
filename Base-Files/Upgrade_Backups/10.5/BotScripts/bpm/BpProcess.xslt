<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
    <xsl:output method="xml" indent="yes"/>
	<xsl:variable name="action">Action</xsl:variable>
	<xsl:variable name="endGuid">59b10ddf-5a3d-4031-b15d-acbe3d09fcf0</xsl:variable>

	<xsl:variable name="firstGuid">
		<xsl:value-of select="/Document/Process/Step/Step-Guid"/>
	</xsl:variable>
	
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
		
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
		<xsl:element name="process">
			<xsl:attribute name="name">
				<xsl:value-of select="Document/Meta/GpsFile"/>
			</xsl:attribute>

			<xsl:attribute name="version">1.0</xsl:attribute>
			<xsl:attribute name="bpversion">6.7.0.20116</xsl:attribute>
			<xsl:attribute name="narrative"></xsl:attribute>
			<xsl:attribute name="byrefcollection">true</xsl:attribute>

			<xsl:attribute name="preferredid">
				<xsl:value-of select="utils:guid()"/>
			</xsl:attribute>

			<xsl:call-template name="boilerplateTemplate" />
			
			<xsl:for-each select="Document/Process/Step">
				<xsl:call-template name="stageTemplate" />
			</xsl:for-each>
		</xsl:element>
    </xsl:template>

	<xsl:template name="boilerplateTemplate">
		<view>
			<camerax>0</camerax>
			<cameray>0</cameray>
			<zoom version="2">1.25</zoom>
		</view>
		<preconditions />
		<endpoint narrative="" />
		<stage stageid="722cbefe-015b-4018-990e-76756c2564c0" name="Start" type="Start">
			<display x="15" y="-105" />
			<xsl:element name="onsuccess">
				<xsl:value-of select="$firstGuid"/>
			</xsl:element>
			
		</stage>
		<stage stageid="59b10ddf-5a3d-4031-b15d-acbe3d09fcf0" name="End" type="End">
			<display x="15" y="90" />
		</stage>
		<stage stageid="10b23705-998c-4df4-a663-f35b84e47c05" name="Stage1" type="ProcessInfo">
			<display x="-195" y="-105" w="150" h="90" />
		</stage>
	</xsl:template>

	<xsl:template name="stageTemplate">
		<xsl:element name="stage">
			<xsl:attribute name="stageid">
				<xsl:value-of select="Step-Guid"/>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:value-of select="PlayBack--AppInfo-ExeName"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:value-of select="$action"/>
			</xsl:attribute>
			<loginhibit onsuccess="true" />
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
			<xsl:element name="resource">
				<xsl:variable name="exe">
					<xsl:value-of select="utils:getExeName(PlayBack--AppInfo-ExeName)"/>
				</xsl:variable>
				<xsl:attribute name="object">
							<xsl:value-of select="concat(/Document/Meta/GpsFile,'_',$exe)"/>
				</xsl:attribute>
				<xsl:attribute name="action">Action 1</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
