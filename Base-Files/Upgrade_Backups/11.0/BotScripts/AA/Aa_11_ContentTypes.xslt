<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
    <xsl:output method="xml" indent="no"/>

	<xsl:variable name="imageType">image/jpeg</xsl:variable>

	<msxsl:script implements-prefix='utils' language='CSharp'>
		<msxsl:using namespace="System.IO" />
		<![CDATA[
		int index1 = 1;
		
		public string getFileNameWithoutExtension(string fn)
		{
			if(fn.Contains(" "))
			{	
				fn = getFileNameWithoutSapce(fn);
			}
			return Path.GetFileNameWithoutExtension(fn);
		}
		
		public string getFileNameWithoutSapce(string fileNameWithSpace)
		{
			return fileNameWithSpace.Replace(" ","_");
		}
		]]>
	</msxsl:script>

    <xsl:template match="/">
		<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
			<Override PartName="/properties" ContentType="text/xml" />
			<Override PartName="/dependencies" ContentType="text/xml" />
			<Override PartName="/commands" ContentType="text/xml" />
			<xsl:for-each select="Document/Process/Step">
				<xsl:element name="Override">
					<xsl:attribute name="PartName">
						<xsl:value-of select="concat('/',utils:getFileNameWithoutExtension(ImageStore--ControlImage--ImageData-FileName))"/>
					</xsl:attribute>
					<xsl:attribute name="ContentType">
						<xsl:value-of select="$imageType"/>
					</xsl:attribute>
				</xsl:element>
			</xsl:for-each>
			<Override PartName="/Document" ContentType="Automation/Resource" />
		</Types>
    </xsl:template>
</xsl:stylesheet>
