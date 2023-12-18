<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"  xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl"
>
	<!--Intermediate UiPath 2-->
	<!--Jun-12-2020-V2m-->
	
    <xsl:output method="xml" indent="yes"/>
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<msxsl:using namespace="System.Text.RegularExpressions" />
		<![CDATA[ 
      
			
		 public string removeTabMsaa(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 return replacedControlName;
		 }
		 
		public string removeSpecailCharsMsaa(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 public string removeSpecailCharsJava(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("&","&amp;");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 public string removeTabIe(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Trim();       //trim to stay consistant with UiPath
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("&","&amp;");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 
		 public string removeSpecailCharsIe(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("&","&amp;");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 
		 public string getCssPathFromXpathIe(string XpathStr)
		 {
		 
				if(XpathStr=="")
								return "";
								
				string cssPath = "";
				cssPath = XpathStr;
				
				cssPath = Regex.Replace(cssPath, @"\[[0-9]+\]", string.Empty);
				
				cssPath = cssPath.Remove(0, 1);
				 cssPath = cssPath.Replace('/','>');
				 return cssPath;
		 }
		 
	
	public string removeSpecailCharsChrome(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("&","&amp;");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 public string getCssPathFromXpathChrome(string XpathStr)
		 {
		 
				if(XpathStr=="")
								return "";
								
				XpathStr.Replace("/html","");              
								
				string cssPath = "";
				cssPath = XpathStr;
				
				cssPath = Regex.Replace(cssPath, @"\[[0-9]+\]", string.Empty);
				
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
		public string replaceSquareBracket(string str)
		{
			
				if(str!="")
				{
					if(str.Contains("[") && str.Contains("]"))
					{
						str= "%"+str;
					}					
				   return str;
				}
				return str;				
			
		}
		
		public string getUrlForIe(string url)
		 {
			url = url.Replace("&","&amp;");
			return url;
		 }
		 
		  public string getCssPathWithIndexFromCss(string cssPath)
		  {
			cssPath = Regex.Replace(cssPath, @"#[^\s]*|\.[^\s]*|'", string.Empty);
			return cssPath;
		  }
		 
      ]]>
	</msxsl:script>
    <xsl:template match="/">
		<Document>

			<!--Copy the Meta node-->
			<xsl:copy-of select="Document/Meta"/>

			<Process>
				<xsl:for-each select="Document/Process/Step">
					<xsl:choose>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID='1' or PlayBack__GeneralInfo_AdaptorID='9'">
							<xsl:if test="PlayBack__ControlInfo_Role!='client'">
								<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT' or PlayBack__GeneralInfo_Event='KEYEVENT'">
									<xsl:choose>
									<xsl:when test="(PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='list item' and preceding-sibling::Step[1]/PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE = 'combo box') or (PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='list item' and preceding-sibling::Step[2]/PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE = 'combo box')">
									</xsl:when>
									<xsl:otherwise>

									<Step>

										<!--Copy the step Node-->
										<xsl:if test="*">

											<xsl:for-each select="*">
												<xsl:element name="{name()}">
													<xsl:choose>
														<xsl:when test="name()='UIP_PlayBack__ControlInfo_ControlName'">
															<xsl:variable name="tempControlName">
																<xsl:value-of select="."/>
															</xsl:variable>
															<xsl:value-of select="utils:removeSpecailCharsMsaa($tempControlName)"/>
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
													<xsl:value-of select="following-sibling::Step[1 and PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE = 'list item']/PlayBack__ControlInfo_ControlData"/>
												</Modified_Item>
											</xsl:if>

										</xsl:if>

									</Step>
									</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID='3'">
							<xsl:if test="PlayBack__ControlInfo_Role!='title bar'">
								<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT' or PlayBack__GeneralInfo_Event='KEYEVENT'">
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
																	<xsl:value-of select="utils:removeTabIe($tempControlName)"/>
																</xsl:when>
																<xsl:when test="name()='PlayBack__ControlInfo_IEControlTitle'">
																	<xsl:value-of select="utils:removeSpecailCharsIe(.)"/>
																</xsl:when>
																<xsl:when test="name()='PlayBack__ControlInfo_IEControlInnerText'">
																	<xsl:value-of select="utils:removeSpecailCharsIe(.)"/>
																</xsl:when>
																<xsl:when test="name()='PlayBack__AdditionalInfo_Web_Value'">
																	<xsl:value-of select="utils:removeSpecailCharsIe(.)"/>
																</xsl:when>
																<xsl:when test="name()='PlayBack__AppInfo_IEDocURL'">
																	<xsl:variable name="tempUrl">
																		<xsl:value-of select="."/>
																	</xsl:variable>
																	<xsl:value-of select="utils:getUrlForIe($tempUrl)"/>
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
														<xsl:value-of select="utils:getCssPathFromXpathIe($tempXpath1)"/>
													</xsl:element>

													<xsl:element name="Modified-CssPathWithIndex">
														<xsl:variable name="tempCssPath">
														<xsl:value-of select="PlayBack__ControlInfo_CSSPath"/>
														</xsl:variable>
														<xsl:value-of select="utils:getCssPathWithIndexFromCss($tempCssPath)"/>
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
						</xsl:when>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID='12'">
							<xsl:if test="PlayBack__ControlInfo_Role!='title bar'">
						<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT' or PlayBack__GeneralInfo_Event='KEYEVENT'">
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
															<xsl:value-of select="utils:removeSpecailCharsChrome($tempControlName)"/>
														</xsl:when>
														<xsl:when test="name()='PlayBack__AdditionalInfo_Web_Value'">
																<xsl:value-of select="utils:removeSpecailCharsChrome(.)"/>
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
											   <xsl:variable name ="tmpCombVal" select="following-sibling::Step[1 and PlayBack__ControlInfo_Role = 'list item']/PlayBack__ControlInfo_ControlData"></xsl:variable>
											   <xsl:variable name ="CombVal" select="utils:replaceSquareBracket($tmpCombVal)"></xsl:variable>
												<Modified_Item>
													<!--remove \ when uncommenting
				<xsl:value-of select="following-sibling::Step[PlayBack-\-ControlInfo_Role = 'list item']/PlayBack-\-ControlInfo_ControlData"/>
										-->
													<xsl:value-of select="$CombVal"/>  <!--VIKAS -->
												</Modified_Item>
											</xsl:if>

										</xsl:if>

									</Step>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:if>
						</xsl:when>
						<xsl:when test="PlayBack__GeneralInfo_AdaptorID='6'">
              <xsl:if test="PlayBack__GeneralInfo_Event !='WindowActivate' or PlayBack__GeneralInfo_Event !='START TRANSACTION' or                
											PlayBack__GeneralInfo_Event !='MESSAGE' or PlayBack__GeneralInfo_Event !='END TRANSACTION' or PlayBack__ControlInfo_Role!='client'
											or PlayBack__ControlInfo_Role!='SAPGuiMenubar'">

                <Step>
                  <xsl:if test="*">
                    <xsl:for-each select="*">
                      <xsl:element name="{name()}">
                        <xsl:choose>
                          <xsl:when test="name()='PlayBack__ControlInfo_ControlName'">
                            <xsl:variable name="tempControlName">
                              <xsl:value-of select="."/>
                            </xsl:variable>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="."/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:element>
                    </xsl:for-each>
                    <xsl:if test="PlayBack__ControlInfo_Role='SAPGuiComboBox'">
                      <Modified_Item>
                        <xsl:value-of select="following-sibling::Step[1 and PlayBack__ControlInfo_Role = 'list']/PlayBack__ControlInfo_ControlData"/>
                      </Modified_Item>
                    </xsl:if>
                  </xsl:if>
                </Step>
              </xsl:if>
            </xsl:when>
			<xsl:when test="PlayBack__GeneralInfo_AdaptorID='2'">
							<xsl:if test="PlayBack__ControlInfo_Role!='client'">
								<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT' or PlayBack__GeneralInfo_Event='KEYEVENT'">
									<xsl:choose>
									<xsl:when test="(PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/PlayBack__ControlInfo_Role = 'combo box')">
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
															<xsl:value-of select="utils:removeSpecailCharsJava($tempControlName)"/>
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
													<xsl:value-of select="following-sibling::Step[1]/PlayBack__ControlInfo_ControlData"/>
												</Modified_Item>
											</xsl:if>

											<xsl:if test="PlayBack__ControlInfo_Role='combo box'">
												<Modified_Item>
													<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
												</Modified_Item>
											</xsl:if>

										</xsl:if>

									</Step>
									</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</xsl:if>
						
						</xsl:when>
					</xsl:choose>					
				</xsl:for-each>
			</Process>
		</Document>
    </xsl:template>
</xsl:stylesheet>
 