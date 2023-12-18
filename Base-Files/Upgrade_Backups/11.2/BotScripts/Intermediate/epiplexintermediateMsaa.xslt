<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

  <!--MSAA Intermediate-->
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="GPS_NAME"></xsl:param>
  <xsl:variable name="click">Click</xsl:variable>
  <xsl:template match="/">
    <Document>
      <Process>
        <GpsFile><xsl:value-of select="$GPS_NAME"/></GpsFile>
        <ExePath>
          <xsl:value-of select="concat(WorkFlow/Header/TAPS/TAP/@Path,'\',WorkFlow/Header/TAPS/TAP/@EXEName)"/>
        </ExePath>
        
    <xsl:for-each select="WorkFlow/Step">
      <xsl:if test="((MSAA/Control/@Role) != 'client')">
        <xsl:if test="((MSAA/Control/@Role) != 'title bar')">

          <!-- <Step>
          <controlName>
            <xsl:value-of select="MSAA/Control/@Name"/>
          </controlName>
          <role>
            <xsl:value-of select="MSAA/Control/@Role"/>
          </role>
        </Step> -->
          <xsl:choose>
            <xsl:when test="MSAA/Control/@Role = 'combo box'">  <!--get combo dox controls from MSAA node of GPS to fix openButton-->
              <Step>
                <Event>
                  <xsl:choose>
                    <xsl:when test="PlayBack/GeneralInfo/@Event = 'Select'">
                      <xsl:value-of select="$click"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="PlayBack/GeneralInfo/@Event"/>
                    </xsl:otherwise>
                  </xsl:choose>

                </Event>
                <ControlData>
                  <xsl:value-of select="PlayBack/ControlInfo/@ControlData"/>
                </ControlData>

                <ControlName>
                  <xsl:value-of select="MSAA/Control/@Name"/>
                </ControlName>

                <Role>
                  <xsl:value-of select="MSAA/Control/@Role"/>
                </Role>

              </Step>
            </xsl:when>
            <xsl:otherwise>
              <Step>
                <Event>
                  <xsl:choose>
                    <xsl:when test="PlayBack/GeneralInfo/@Event = 'Select'">
                      <xsl:value-of select="$click"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="PlayBack/GeneralInfo/@Event"/>
                    </xsl:otherwise>
                  </xsl:choose>

                </Event>
                <ControlData>
                  <xsl:value-of  select="PlayBack/ControlInfo/@ControlData"/>
                </ControlData>

                <ControlName>

                  
                  <xsl:value-of  select="PlayBack/ControlInfo/@ControlName"/>
                  
                </ControlName>

                <Role>
                  <xsl:value-of select="PlayBack/ControlInfo/@Role"/>
                </Role>

								<AutomationId>
									<xsl:value-of select="PlayBack/AdditionalInfo/@UIA_AUTOMATIONID"/>
								</AutomationId>

								<ClassName>
									<xsl:value-of select="PlayBack/AdditionalInfo/@UIA_CLASSNAME"/>
								</ClassName>

              
                
                

              </Step>
            </xsl:otherwise>
          </xsl:choose>
          
      
      </xsl:if>
      </xsl:if>
    </xsl:for-each>
      </Process>
    </Document>
  </xsl:template>

  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="$text = '' or $replace = ''or not($replace)" >
        <!-- Prevent this routine from hanging -->
        <xsl:value-of select="$text" />
      </xsl:when>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
