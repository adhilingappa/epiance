<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

	<xsl:param name="EXE_NAME"></xsl:param>
	<xsl:param name="AdopterID"></xsl:param>
	<xsl:param name="EXE_PATH"></xsl:param>

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<msxsl:using namespace="System.Collections.Generic" />
		<![CDATA[ 
		List<string> excludeClickList = new List<string>() {"SAPGuiMainWindow","SAPGuiPasswordField","SAPGuiOkCodeField"};
		
		public string shouldExcludeClick(string sapRole)
		{
			if(excludeClickList.Contains(sapRole))
			{
				return "true";
			}
			else
			{
				return "false";
			}
		}
		 ]]>

	</msxsl:script>

    <xsl:template match="/">
		<Document>
			<xsl:copy-of select="Document/Meta"/>

			<EXE_NAME>
				<xsl:value-of select="$EXE_NAME"/>
			</EXE_NAME>
			<AdopterID>
				<xsl:value-of select="$AdopterID"/>
			</AdopterID>
			<EXE_PATH>
				<xsl:value-of select="$EXE_PATH"/>
			</EXE_PATH>

			<Process>

				<xsl:for-each select="Document/Process/Step">
					<xsl:if test="PlayBack__GeneralInfo_AdaptorID='6'">
					<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='DoubleClick' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT'">
						<xsl:variable name="sapRole">
							<xsl:value-of select="PlayBack__ControlInfo_Role"/>
						</xsl:variable>
						<xsl:variable name="shouldExclude">
							<xsl:value-of select="utils:shouldExcludeClick($sapRole)"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="PlayBack__GeneralInfo_Event='Click' and $shouldExclude='true'">
								
							</xsl:when>
							<xsl:otherwise>
								<Step>
									<xsl:for-each select="*">
										<xsl:element name="{name()}">
											<xsl:value-of select="."/>
										</xsl:element>
									</xsl:for-each>
									<!--if control is combo box, then get list item from the next step-->
									<xsl:if test="PlayBack__ControlInfo_Role='SAPGuiComboBox'">
										<Modified_Item>
											<!--remove \ when uncommenting
				<xsl:value-of select="following-sibling::Step[PlayBack-\-ControlInfo_Role = 'list item']/PlayBack-\-ControlInfo_ControlData"/>
										-->
											<xsl:value-of select="following-sibling::Step[1 and PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE = 'list item']/PlayBack__ControlInfo_ControlData"/>
										</Modified_Item>
									</xsl:if>
								</Step>
							</xsl:otherwise>
						</xsl:choose>
						
					</xsl:if>
					</xsl:if>
				</xsl:for-each>
				
			</Process>
		</Document>
    </xsl:template>
</xsl:stylesheet>
