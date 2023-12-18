<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

  <!--chrome intermediate with MODIFIED xpath from netOn (handling capitalization and braces conversion IN NETON)-->
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="GPS_NAME"></xsl:param>
  <xsl:variable name="click">Click</xsl:variable>
  <xsl:variable name="text">te[st]</xsl:variable>
  <xsl:variable name="ob">[</xsl:variable>
  <xsl:variable name="ocb">(</xsl:variable>
  <xsl:variable name="cb">]</xsl:variable>
  <xsl:variable name="ccb">)</xsl:variable>
  <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
  <xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>

  <xsl:variable name="true">True</xsl:variable>
  <xsl:template match="/">
    <Document>
      <Process>
        <GpsFile>
          <xsl:value-of select="$GPS_NAME"/>
        </GpsFile>
        <ExePath>
          <xsl:value-of select="concat(WorkFlow/Header/TAPS/TAP/@Path,'\',WorkFlow/Header/TAPS/TAP/@EXEName)"/>
        </ExePath>

        <xsl:for-each select="WorkFlow/Step">
          <xsl:if test="((PlayBack/ControlInfo/@Role) != 'title bar')">
            <xsl:if test="((PlayBack/ControlInfo/@Role) != 'client')">

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
                <!-- <Event>
                  <xsl:value-of select="PlayBack/GeneralInfo/@Event"/>
                </Event>
                -->
                <!-- <ControlName>
                <xsl:value-of select="PlayBack/ControlInfo/@ControlName"/>
              </ControlName>
              
              
              <Role>
                <xsl:value-of select="PlayBack/ControlInfo/@Role"/>
              </Role>
              -->


                <Url>
                  <xsl:value-of select="PlayBack/AppInfo/@IEDocURL"/>
                </Url>

                <Enabled>
                  <xsl:value-of select="$true"/>
                </Enabled>
                <!--<XPath>
                <xsl:variable name="inter1">
                  <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="PlayBack/ControlInfo/@XPath" />
                    <xsl:with-param name="replace" select="$ob" />
                    <xsl:with-param name="by" select="$ocb" />
                  </xsl:call-template>
                  </xsl:variable>
                <xsl:variable name="inter2">
                <xsl:call-template name="string-replace-all">
                  <xsl:with-param name="text" select="$inter1" />
                  <xsl:with-param name="replace" select="$cb" />
                  <xsl:with-param name="by" select="$ccb" />
                </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="translate($inter2, $lower, $upper)"/>
              </XPath>
              -->
                <XPath>
                  <xsl:value-of select="PlayBack/ControlInfo/@XPath"/>
                </XPath>

                <ControlData>
                  <xsl:value-of select="PlayBack/ControlInfo/@ControlData"/>
                </ControlData>

                <Role>
                  <xsl:value-of select="PlayBack/ControlInfo/@Role"/>
                </Role>
								<xsl:if test="PlayBack/ControlInfo/@Role='combo box'">
									<Item>
										<xsl:call-template name="it">
											<xsl:with-param name="PurchaseOrder" select="position()+1"/>
										</xsl:call-template>
									</Item>
								</xsl:if>
              </Step>

              



            </xsl:if>
          </xsl:if>

        </xsl:for-each>
      </Process>
    </Document>
  </xsl:template>

  <xsl:template name="it">
    <xsl:param name="PurchaseOrder"/>
    <xsl:value-of select="//Step[position()=$PurchaseOrder]/PlayBack/ControlInfo/@ControlData"/>
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
