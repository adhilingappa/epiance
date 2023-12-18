<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes" />
  <xsl:key name="StepDialogue" match="Step" use="@DialogName" />
  <xsl:template match="/Document">
    <Document>
       <xsl:copy-of select="Meta"/> 
      <Process>
        <xsl:apply-templates select="Process/Step[generate-id(.)=generate-id(key('StepDialogue',@DialogName)[1])]"/>
      </Process>
      </Document>
    </xsl:template>
  <xsl:template match="Step">
    <GStep DialogName="{@DialogName}">
      <xsl:for-each select="key('StepDialogue', @DialogName)">             
            <xsl:copy-of select="."/>         
      </xsl:for-each>
    </GStep>
  </xsl:template>
</xsl:stylesheet>