<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>
	
	<xsl:param name="EXE_NAME"></xsl:param>
	<xsl:param name="AdopterID"></xsl:param>
	<xsl:param name="EXE_PATH"></xsl:param>

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[ 
     
			
		 public string removeTab(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 return replacedControlName;
		 }
      ]]>

	</msxsl:script>

    <xsl:template match="/">
		<Document>

			<!--Copy the Meta node-->
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
					<xsl:if test="PlayBack--AppInfo-ExeName=$EXE_NAME">
						<xsl:if test="PlayBack--ControlInfo-Role!='title bar' and PlayBack--GeneralInfo-AdaptorID='2'">
							<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
								<xsl:choose>
									<xsl:when test="PlayBack--ControlInfo-Role='list item' and preceding-sibling::Step[1]/PlayBack--ControlInfo-Role = 'combo box'">

									</xsl:when>

									<xsl:otherwise>
									

								<Step>

									<!--Copy the step Node-->
									<xsl:if test="*">

										<xsl:for-each select="*">
											<xsl:element name="{name()}">
												<xsl:choose>
													<xsl:when test="name()='PlayBack--ControlInfo-ControlName'">
														<xsl:variable name="tempControlName">
															<xsl:value-of select="."/>
														</xsl:variable>
														<xsl:value-of select="utils:removeTab($tempControlName)"/>
													</xsl:when>

													<xsl:otherwise>
														<xsl:value-of select="."/>
													</xsl:otherwise>
												</xsl:choose>

											</xsl:element>
										</xsl:for-each>


										<!--if control is combo box, then get list item from the next step-->
										<xsl:if test="PlayBack--ControlInfo-Role='combo box'">
											<Modified-Item>
												<!--remove \ when uncommenting
				<xsl:value-of select="following-sibling::Step[PlayBack-\-ControlInfo-Role = 'list item']/PlayBack-\-ControlInfo-ControlData"/>
										-->
												<xsl:value-of select="following-sibling::Step[1 and PlayBack--ControlInfo-Role = 'list item']/PlayBack--ControlInfo-ControlData"/>
											</Modified-Item>
										</xsl:if>

									</xsl:if>

								</Step>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:if>
					</xsl:if>
					
				</xsl:for-each>
			</Process>
		</Document>
    </xsl:template>
</xsl:stylesheet>
