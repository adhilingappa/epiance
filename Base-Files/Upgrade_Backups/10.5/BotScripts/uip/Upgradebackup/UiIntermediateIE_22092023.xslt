<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:utils="urn:my-scripts"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>

	<!--IE Ui INTERMEDIATE 2 date:18/05/2020  DD/MM/YYYY-->
	<!--May-18-2020-V1-->
	<msxsl:script implements-prefix='utils' language='CSharp'>



		<![CDATA[ 
			
		 public string removeTab(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Trim();       //trim to stay consistant with UiPath
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 return replacedControlName;
		 }
		 
		 public string getCssPathFromXpath(string XpathStr)
		 {
		 
				if(XpathStr=="")
								return "";
								
				string cssPath = "";
				cssPath = XpathStr;
				
				var charsToRemove = new string[] { "[1]", "[2]", "[3]" , "[4]", "[5]", "[6]", "[7]", "[8]", "[9]", "[0]"};
				foreach (var c in charsToRemove)
				{
						cssPath = cssPath.Replace(c, string.Empty);
				}
				
				cssPath = cssPath.Remove(0, 1);
				 cssPath = cssPath.Replace('/','>');
				 return cssPath;
		 }
      ]]>

	</msxsl:script>

	<xsl:variable name="tabText">\t</xsl:variable>
	<xsl:variable name="tabHex">
		<xsl:text>&#x9;</xsl:text>
	</xsl:variable>



	<xsl:template match="/">
		<Document>

			<!--Copy the Meta node-->
			<xsl:copy-of select="Document/Meta"/>

			<Process>


				<xsl:for-each select="Document/Process/Step">
					<xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
						<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
							<xsl:choose>
								<xsl:when test="(PlayBack--ControlInfo-Role='list item' and preceding-sibling::Step[1]/PlayBack--ControlInfo-Role = 'combo box') or (PlayBack--ControlInfo-Role='list item' and preceding-sibling::Step[2]/PlayBack--ControlInfo-Role = 'combo box')">

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

											<xsl:element name="Modified-CssPath">
												<xsl:variable name="tempXpath1">
													<xsl:value-of select="PlayBack--ControlInfo-XPath"/>
												</xsl:variable>
												<xsl:value-of select="utils:getCssPathFromXpath($tempXpath1)"/>
											</xsl:element>
											
											
											<xsl:if test="PlayBack--ControlInfo-Role='list item'">
												<Modified-Item>
													<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
												</Modified-Item>
											</xsl:if>
											

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
				</xsl:for-each>
			</Process>
		</Document>
	</xsl:template>
</xsl:stylesheet>

