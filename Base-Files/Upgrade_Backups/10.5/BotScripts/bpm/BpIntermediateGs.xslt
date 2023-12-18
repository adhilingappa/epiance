<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:utils="urn:my-scripts"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>
	<xsl:param name="EXE_NAME"></xsl:param>
	<xsl:param name="AdopterID"></xsl:param>
	<xsl:param name="EXE_PATH"></xsl:param>
	<!--Image BluePrism INTERMEDIATE 2 date:08/05/2020  DD/MM/YYYY-->

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[ 
			
		string sx="";
		string sy="";
		string ex="";
		string ey="";
			
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
					<xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
						<xsl:if test="PlayBack--GeneralInfo-Event='TYPETEXT' or PlayBack--GeneralInfo-Event='KEYEVENT'">


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

									

								</xsl:if>

							</Step>

						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</Process>
		</Document>
	</xsl:template>
</xsl:stylesheet>
