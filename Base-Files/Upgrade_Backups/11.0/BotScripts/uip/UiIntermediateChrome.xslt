<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:utils="urn:my-scripts"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>

	<!--Chrome Ui INTERMEDIATE 2 date:18/05/2020  DD/MM/YYYY-->
	<!--May-18-2020-V1-->
	<msxsl:script implements-prefix='utils' language='CSharp'>



		<![CDATA[ 
			
		 public string removeTab(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 return replacedControlName;
		 }
		 
		 public string getCssPathFromXpathChrome(string XpathStr)
		 {
		 
				if(XpathStr=="")
								return "";
								
				XpathStr.Replace("/html","");              
								
				string cssPath = "";
				cssPath = XpathStr;
				
				var charsToRemove = new string[] { "[", "]", "1", "2", "3" , "4", "5", "6", "7", "8", "9", "0"};
				foreach (var c in charsToRemove)
				{
						cssPath = cssPath.Replace(c, string.Empty);
				}
				
				cssPath = cssPath.Remove(0, 1);
				 cssPath = cssPath.Replace('/','>');
				 return cssPath;
		 }
		 
		 public string getTitleforChrome(string completeTitle)
		 {
					string title = ""; 
					title = completeTitle;
					
					if(title=="")
						return title;
						
					title = title.Replace(" - Google Chrome","");
					return title;
					
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
					<xsl:if test="PlayBack__ControlInfo_Role!='title bar'">
						<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT'">
							<xsl:choose>
								<xsl:when test="(PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/PlayBack__ControlInfo_Role = 'combo box') or (PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[2]/PlayBack__ControlInfo_Role = 'combo box')">

								</xsl:when>

								<xsl:otherwise>

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
													<xsl:value-of select="PlayBack__ControlInfo_XPath"/>
												</xsl:variable>
												<xsl:value-of select="utils:getCssPathFromXpathChrome($tempXpath1)"/>
											</xsl:element>

											<xsl:element name="Modified-Title">
												<xsl:variable name="tempTitle">
													<xsl:value-of select="PlayBack__AppInfo_DialogName"/>
												</xsl:variable>
												<xsl:value-of select="utils:getTitleforChrome($tempTitle)"/>
											</xsl:element>
											
											<xsl:if test="PlayBack__ControlInfo_Role='list item'">
												<Modified_Item>
													<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
												</Modified_Item>
											</xsl:if>

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
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</Process>
		</Document>
	</xsl:template>
</xsl:stylesheet>

