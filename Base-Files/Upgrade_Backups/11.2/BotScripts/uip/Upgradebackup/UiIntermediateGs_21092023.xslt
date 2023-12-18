<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
		<Document>

			<!--Copy the Meta node-->
			<xsl:copy-of select="Document/Meta"/>

			<Process>

				<xsl:for-each select="Document/Process/Step">
					<xsl:if test="PlayBack__GeneralInfo_AdaptorID='4'">
					<xsl:if test="PlayBack__GeneralInfo_Event='TYPETEXT' or PlayBack__GeneralInfo_Event='KEYEVENT'">
						<Step>

							<!--Copy the step Node-->
							<xsl:if test="*">
								<xsl:for-each select="*">
									<xsl:element name="{name()}">
										<xsl:value-of select="."/>
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
