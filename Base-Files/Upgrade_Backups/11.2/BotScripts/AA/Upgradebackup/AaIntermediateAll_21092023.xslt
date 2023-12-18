<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
  <xsl:output method="xml" indent="yes"/>

  <msxsl:script implements-prefix='utils' language='CSharp'>



    <![CDATA[ 
		
		public string GetXpathIe(string xpath)
		
		{
		   return "/html"+xpath;
		}
		
			
		 public string removeTab(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 return replacedControlName;
		 }
		 
		 public string removeSpecailCharsAll(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("&","&amp;");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 public string removeUnwantedSymbols(string id)
		 {
			int len = id.Length;
			if(id[len-1]=='#' || id[len-1]=='*')
				id = id.Remove(len-1, 1);  
			return id;
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
						<xsl:when test='PlayBack--GeneralInfo-AdaptorID=1'>
							<xsl:if test="PlayBack--ControlInfo-Role!='title bar' and PlayBack--GeneralInfo-AdaptorID='1'">
								<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
									<xsl:choose>
										<xsl:when test="PlayBack--ControlInfo-Role='editable text' and PlayBack--GeneralInfo-Event='Click'">

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
																	<xsl:value-of select="utils:removeSpecailCharsAll($tempControlName)"/>
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
						</xsl:when>
						<xsl:when test="PlayBack--GeneralInfo-AdaptorID='3'">
						
					<xsl:if test="PlayBack--ControlInfo-Role!='title bar' and PlayBack--GeneralInfo-AdaptorID='3'">
						<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
							<xsl:choose>
								<xsl:when test="PlayBack--ControlInfo-Role='editable text' and PlayBack--GeneralInfo-Event='Click'">

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
															<xsl:value-of select="utils:removeSpecailCharsAll($tempControlName)"/>
														</xsl:when>
														<xsl:when test="name()='PlayBack--ControlInfo-XPath'">
															<xsl:variable name="tempXpath">
																<xsl:value-of select="."/>
															</xsl:variable>
															<xsl:value-of select="utils:GetXpathIe($tempXpath)"/>
														</xsl:when>
														<xsl:when test="name()='PlayBack--AdditionalInfo-Web_IFrameFullXPath'">
															<xsl:variable name="tempXpath1">
																<xsl:value-of select="."/>
															</xsl:variable>
															<xsl:value-of select="utils:GetXpathIe($tempXpath1)"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="."/>
														</xsl:otherwise>
													</xsl:choose>

                            </xsl:element>
                          </xsl:for-each>

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
              <xsl:if test="PlayBack--ControlInfo-Role!='title bar' and PlayBack--GeneralInfo-AdaptorID='12'">
                <xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
                  <xsl:choose>
                    <xsl:when test="PlayBack--ControlInfo-Role='editable text' and PlayBack--GeneralInfo-Event='Click'">

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
																	<xsl:value-of select="utils:removeSpecailCharsAll($tempControlName)"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="."/>
																</xsl:otherwise>
															</xsl:choose>

                            </xsl:element>
                          </xsl:for-each>

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
						<xsl:when test='PlayBack--GeneralInfo-AdaptorID=2'>
							<xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
								<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">
									<xsl:choose>
										<xsl:when test="PlayBack--ControlInfo-Role='editable text' and PlayBack--GeneralInfo-Event='Click'">

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
																	<xsl:value-of select="utils:removeSpecailCharsAll($tempControlName)"/>
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
						</xsl:when>
					
					    <xsl:when test='PlayBack--GeneralInfo-AdaptorID=6'>
								<xsl:if test="PlayBack--GeneralInfo-Event='Click' or PlayBack--GeneralInfo-Event='DoubleClick' or PlayBack--GeneralInfo-Event='Select' or PlayBack--GeneralInfo-Event='TYPETEXT'">

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
			  <xsl:when test="name()='PlayBack--AdditionalInfo-CONTROL_ABSOLUTE_UNIQUE_ID_FOR_BOT_SCRIPT'">
                              <xsl:value-of select="utils:removeUnwantedSymbols(.)"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="."/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:element>
                    </xsl:for-each>
		    <xsl:if test="PlayBack--ControlInfo-Role='SAPHTMLViewer'">
                      <SAPHTMLViewerLocation-X>
		      	<xsl:value-of select="(Standard--ClickPoints--Screen--Down-X - Standard--Regions--ControlRegion-Left)"/>		   
                      </SAPHTMLViewerLocation-X>
		      <SAPHTMLViewerLocation-Y>
                       	<xsl:value-of select="(Standard--ClickPoints--Screen--Down-Y - Standard--Regions--ControlRegion-Top)"/>
                      </SAPHTMLViewerLocation-Y>
                    </xsl:if>
                    <xsl:if test="PlayBack--ControlInfo-Role='SAPGuiComboBox'">
                      <Modified-Item>
                        <xsl:value-of select="following-sibling::Step[1 and PlayBack--ControlInfo-Role = 'list']/PlayBack--ControlInfo-ControlData"/>
                      </Modified-Item>
                    </xsl:if>
                  </xsl:if>
                </Step>
              </xsl:if>
						</xsl:when>
						
					</xsl:choose>
				</xsl:for-each>
			</Process>
		</Document>
    </xsl:template>
</xsl:stylesheet>
