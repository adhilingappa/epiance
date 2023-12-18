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
						<xsl:when test="PlayBack--GeneralInfo-AdaptorID='1' or PlayBack--GeneralInfo-AdaptorID='9'">
							<xsl:if test="PlayBack--ControlInfo-Role!='client'">
								<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT' or PlayBack--GeneralInfo-Event='KEYEVENT'">
									<xsl:choose>
									<xsl:when test="(PlayBack--AdditionalInfo-UIA_LOCALIZED_CONTROL_TYPE='list item' and preceding-sibling::Step[1]/PlayBack--AdditionalInfo-UIA_LOCALIZED_CONTROL_TYPE = 'combo box') or (PlayBack--AdditionalInfo-UIA_LOCALIZED_CONTROL_TYPE='list item' and preceding-sibling::Step[2]/PlayBack--AdditionalInfo-UIA_LOCALIZED_CONTROL_TYPE = 'combo box')">
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
															<xsl:value-of select="utils:removeSpecailCharsMsaa($tempControlName)"/>
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
													<xsl:value-of select="following-sibling::Step[1 and PlayBack--AdditionalInfo-UIA_LOCALIZED_CONTROL_TYPE = 'list item']/PlayBack--ControlInfo-ControlData"/>
												</Modified-Item>
											</xsl:if>

										</xsl:if>

									</Step>
									</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="PlayBack--GeneralInfo-AdaptorID='3'">
							<xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
								<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT' or PlayBack--GeneralInfo-Event='KEYEVENT'">
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
																	<xsl:value-of select="utils:removeTabIe($tempControlName)"/>
																</xsl:when>
																<xsl:when test="name()='PlayBack--ControlInfo-IEControlTitle'">
																	<xsl:value-of select="utils:removeSpecailCharsIe(.)"/>
																</xsl:when>
																<xsl:when test="name()='PlayBack--ControlInfo-IEControlInnerText'">
																	<xsl:value-of select="utils:removeSpecailCharsIe(.)"/>
																</xsl:when>
																<xsl:when test="name()='PlayBack--AdditionalInfo-Web_Value'">
																	<xsl:value-of select="utils:removeSpecailCharsIe(.)"/>
																</xsl:when>
																<xsl:when test="name()='PlayBack--AppInfo-IEDocURL'">
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
															<xsl:value-of select="PlayBack--ControlInfo-XPath"/>
														</xsl:variable>
														<xsl:value-of select="utils:getCssPathFromXpathIe($tempXpath1)"/>
													</xsl:element>

													<xsl:element name="Modified-CssPathWithIndex">
														<xsl:variable name="tempCssPath">
														<xsl:value-of select="PlayBack--ControlInfo-CSSPath"/>
														</xsl:variable>
														<xsl:value-of select="utils:getCssPathWithIndexFromCss($tempCssPath)"/>
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
						</xsl:when>
						<xsl:when test="PlayBack--GeneralInfo-AdaptorID='12'">
							<xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
						<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT' or PlayBack--GeneralInfo-Event='KEYEVENT'">
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
															<xsl:value-of select="utils:removeSpecailCharsChrome($tempControlName)"/>
														</xsl:when>
														<xsl:when test="name()='PlayBack--AdditionalInfo-Web_Value'">
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
													<xsl:value-of select="PlayBack--ControlInfo-XPath"/>
												</xsl:variable>
												<xsl:value-of select="utils:getCssPathFromXpathChrome($tempXpath1)"/>
											</xsl:element>

											<xsl:element name="Modified-Title">
												<xsl:variable name="tempTitle">
													<xsl:value-of select="PlayBack--AppInfo-DialogName"/>
												</xsl:variable>
												<xsl:value-of select="utils:getTitleforChrome($tempTitle)"/>
											</xsl:element>
											
											<xsl:if test="PlayBack--ControlInfo-Role='list item'">
												<Modified-Item>
													<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
												</Modified-Item>
											</xsl:if>

											<!--if control is combo box, then get list item from the next step-->
											<xsl:if test="PlayBack--ControlInfo-Role='combo box'">
											   <xsl:variable name ="tmpCombVal" select="following-sibling::Step[1 and PlayBack--ControlInfo-Role = 'list item']/PlayBack--ControlInfo-ControlData"></xsl:variable>
											   <xsl:variable name ="CombVal" select="utils:replaceSquareBracket($tmpCombVal)"></xsl:variable>
												<Modified-Item>
													<!--remove \ when uncommenting
				<xsl:value-of select="following-sibling::Step[PlayBack-\-ControlInfo-Role = 'list item']/PlayBack-\-ControlInfo-ControlData"/>
										-->
													<xsl:value-of select="$CombVal"/>  <!--VIKAS -->
												</Modified-Item>
											</xsl:if>

										</xsl:if>

									</Step>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:if>
						</xsl:when>
						<xsl:when test="PlayBack--GeneralInfo-AdaptorID='6'">
              <xsl:if test="PlayBack--GeneralInfo-Event !='WindowActivate' or PlayBack--GeneralInfo-Event !='START TRANSACTION' or                
											PlayBack--GeneralInfo-Event !='MESSAGE' or PlayBack--GeneralInfo-Event !='END TRANSACTION' or PlayBack--ControlInfo-Role!='client'
											or PlayBack--ControlInfo-Role!='SAPGuiMenubar'">

                <Step>
                  <xsl:if test="*">
                    <xsl:for-each select="*">
                      <xsl:element name="{name()}">
                        <xsl:choose>
                          <xsl:when test="name()='PlayBack--ControlInfo-ControlName'">
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
                    <xsl:if test="PlayBack--ControlInfo-Role='SAPGuiComboBox'">
                      <Modified-Item>
                        <xsl:value-of select="following-sibling::Step[1 and PlayBack--ControlInfo-Role = 'list']/PlayBack--ControlInfo-ControlData"/>
                      </Modified-Item>
                    </xsl:if>
                  </xsl:if>
                </Step>
              </xsl:if>
            </xsl:when>
			<xsl:when test="PlayBack--GeneralInfo-AdaptorID='2'">
							<xsl:if test="PlayBack--ControlInfo-Role!='client'">
								<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT' or PlayBack--GeneralInfo-Event='KEYEVENT'">
									<xsl:choose>
									<xsl:when test="(PlayBack--ControlInfo-Role='list item' and preceding-sibling::Step[1]/PlayBack--ControlInfo-Role = 'combo box')">
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
															<xsl:value-of select="utils:removeSpecailCharsJava($tempControlName)"/>
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
													<xsl:value-of select="following-sibling::Step[1]/PlayBack--ControlInfo-ControlData"/>
												</Modified-Item>
											</xsl:if>

											<xsl:if test="PlayBack--ControlInfo-Role='combo box'">
												<Modified-Item>
													<xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
												</Modified-Item>
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
 