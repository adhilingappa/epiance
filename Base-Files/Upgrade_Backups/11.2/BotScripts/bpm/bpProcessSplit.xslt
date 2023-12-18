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

	<xsl:variable name="step">Step</xsl:variable>

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
		int initialPositionY = -45;
		
		public int getPositionY(){
    initialPositionY = initialPositionY+60;
    return initialPositionY;
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
	
	public string trim(string alias)
	{
			return alias.Trim();
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
		<xsl:call-template name="endStageTemplate" />
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
				<xsl:value-of select="PlayBack__AppInfo_ExeName"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:value-of select="$action"/>
			</xsl:attribute>
			<loginhibit onsuccess="true" />
			
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
			<xsl:element name="resource">
				<xsl:variable name="exe">
					<xsl:value-of select="utils:getExeName(PlayBack__AppInfo_ExeName)"/>
				</xsl:variable>
				<xsl:attribute name="object">
					<xsl:value-of select="concat(/Document/Meta/GpsFile,'_',$exe)"/>
				</xsl:attribute>
				<!--	<xsl:attribute name="action">Action 1</xsl:attribute>  -->
				<xsl:attribute name="action">
					<xsl:choose>
						<xsl:when test="Step-ID='Launch'">
							<xsl:value-of select="Step-ID"/>
						</xsl:when>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID=4">
							<xsl:value-of select="concat($step,'_',Step-ID)"/>
						</xsl:when>
						<xsl:when test="PlayBack__AppInfo_ExeName='mstsc.exe'">
							<xsl:value-of select="concat($step,'_',Step-ID)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="tempAlias">
								<xsl:value-of select="Step-AliasName"/>
							</xsl:variable>
							<xsl:variable name="trimAlias">
								<xsl:value-of select="utils:trim($tempAlias)"/>
							</xsl:variable>
							<xsl:value-of select="concat($trimAlias,'_',Step-ID)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:template>


	<xsl:template name="endStageTemplate">
		<stage stageid="59b10ddf-5a3d-4031-b15d-acbe3d09fcf0" name="End" type="End">
			<xsl:element name="display">
								<xsl:attribute name="x">15</xsl:attribute>
								<xsl:attribute name="y">
									<xsl:value-of select="utils:getPositionY()"/>
								</xsl:attribute>
							</xsl:element>
		</stage>
	
	</xsl:template>
</xsl:stylesheet>
