<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:utils="urn:my-scripts"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>
	
	<!--Chrome BluePrism INTERMEDIATE 2 date:08/05/2020  DD/MM/YYYY-->


	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[ 
      public string GetXpath(string XpathStr)
      {         
        
        string finalXpath="";
        String[] XpathArry = XpathStr.Split('/');
        for (int i = 0; i < XpathArry.Length; i++)
        {
            string s = XpathArry[i];
						
             if(!s.Contains("["))
             {
                if(s!="")
								{
								if(i==XpathArry.Length-1)
								{
                  s=s+"[1]";  
									}
									else{
									s=s+"[1]/"; 
									}
									
									}
             }
             else
             {
						 if(i==XpathArry.Length-1)
								{
                  s=s+""; 
									}
									else{
									s=s+"/";
									}
                
             }
             
            finalXpath =finalXpath+ s;
        }
				finalXpath = finalXpath.ToUpper();
				finalXpath = "/" + finalXpath;
       return finalXpath;
         
      }
			
		 public string removeTab(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 return replacedControlName;
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
					<xsl:if test="PlayBack__ControlInfo_Role!='title bar' and PlayBack__GeneralInfo_AdaptorID='12'">
						<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT'  or PlayBack__GeneralInfo_Event='KEYEVENT'">
							<xsl:choose>
								<xsl:when test="PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/PlayBack__ControlInfo_Role = 'combo box'">

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
														<xsl:when test="name()='PlayBack__ControlInfo_XPath'">
															<xsl:variable name="tempXpath">
																<xsl:value-of select="."/>
															</xsl:variable>
															<xsl:value-of select="utils:GetXpath($tempXpath)"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="."/>
														</xsl:otherwise>
													</xsl:choose>

												</xsl:element>
											</xsl:for-each>

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
