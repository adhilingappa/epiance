<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:utils="urn:my-scripts"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>
	<!--MSAA UiPath INTERMEDIATE 2 -->
	<!--May-14-2020-V1-->
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[ 
      
			
		 public string removeTab(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 return replacedControlName;
		 }
		 
		public string removeSpecailChars(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
      ]]>

	</msxsl:script>


	<xsl:template match="/">
		<Document>

			<!--Copy the Meta node-->
			<xsl:copy-of select="Document/Meta"/>

			<Process>


				<xsl:for-each select="Document/Process/Step">
					<xsl:if test="PlayBack__ControlInfo_Role!='client'">
						<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT'">


							<Step>

								<!--Copy the step Node-->
								<xsl:if test="*">

									<xsl:for-each select="*">
										<xsl:element name="{name()}">
											<xsl:choose>
												<xsl:when test="name()='PlayBack__ControlInfo_ControlName'">
													<xsl:variable name="tempControlName">
														<xsl:value-of select="."/>
													</xsl:variable>
													<xsl:value-of select="utils:removeSpecailChars($tempControlName)"/>
												</xsl:when>

												<xsl:otherwise>
													<xsl:value-of select="."/>
												</xsl:otherwise>
											</xsl:choose>

										</xsl:element>
									</xsl:for-each>


									<!--if control is combo box, then get list item from the next step-->
									<xsl:if test="PlayBack__ControlInfo_Role='combo box'">
										<Modified_Item>
											<!--remove \ when uncommenting
				<xsl:value-of select="following-sibling::Step[PlayBack-\-ControlInfo_Role = 'list item']/PlayBack-\-ControlInfo_ControlData"/>
										-->
											<xsl:value-of select="following-sibling::Step[1 and PlayBack__ControlInfo_Role = 'list item']/PlayBack__ControlInfo_ControlData"/>
										</Modified_Item>
									</xsl:if>

								</xsl:if>

							</Step>

						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</Process>
		</Document>
	</xsl:template>
</xsl:stylesheet>
