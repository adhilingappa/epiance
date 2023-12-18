<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml"/>
  <xsl:template match="/">
    <xsl:element name="Sentence">
      <xsl:for-each select="//Frame[@Type='0']">
        <xsl:call-template name ="Frame">
        </xsl:call-template>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template name ="Frame">
    <xsl:element name ="Step">
      <xsl:attribute name ="id">
        <xsl:value-of select ="@TPS_ID"/>
      </xsl:attribute>

      <xsl:element name ="StepData">
        
        <xsl:call-template name ="SetControlType">
          <xsl:with-param name ="Role" select ="Control/@Role"/>
          <xsl:with-param name ="ClassVal" select ="Control/@Class"/>
        </xsl:call-template>
     
        <xsl:choose>
          <xsl:when test ="Event/@Action='KeyPress'">
            <xsl:attribute name ="ControlEvent">KEYEVENT</xsl:attribute>
          </xsl:when>
          <xsl:otherwise >
            <xsl:attribute name ="ControlEvent">
              <xsl:value-of select ="Event/@Action"/>
            </xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name ="StandardizingMBandMS">
          <xsl:with-param name ="MoueButton" select ="Event/Mouse/@Button"/>
          <xsl:with-param name ="MouseStatus" select ="Event/Mouse/@Status"/>
        </xsl:call-template>

        <xsl:attribute name ="ControlData">
          <xsl:choose>
            <xsl:when test ="Control/Clubbed/Data !=''and Control/Clubbed/Data !='\n' "><xsl:value-of select ="Control/Clubbed/Data"/></xsl:when>            
            <xsl:otherwise>
                  <xsl:value-of select ="Control/Data"/>
            </xsl:otherwise >
          </xsl:choose>
        </xsl:attribute>

        <xsl:attribute name ="SpKeyStatus">
          <xsl:value-of select ="Event/@KBStatus"/>
        </xsl:attribute>

        <xsl:attribute name ="ParentContol">
          <xsl:value-of select ="Control/Parent/@Name"/>
        </xsl:attribute>

        <xsl:attribute name ="KBShortCutKey">
          <xsl:choose>
            <xsl:when test ="Control/Clubbed/@Shortcut !=''">
              <xsl:value-of select ="Control/Clubbed/@Shortcut"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select ="Control/@Shortcut"/>
            </xsl:otherwise>
          </xsl:choose>       
        </xsl:attribute>

        <xsl:call-template name ="SetValidatorValue">
          <xsl:with-param name ="ValidatorValue" select ="Event/KeyValidations/@ExactValue" />
        </xsl:call-template>

        <xsl:attribute name ="ControlName">
          <xsl:value-of select ="Control/@Name"/>
        </xsl:attribute>

        <xsl:attribute name ="ControlDialogName"></xsl:attribute>

        <xsl:attribute name ="CtrlImage">
          <xsl:value-of select ="Control/Image/@Src"/>
        </xsl:attribute>

        <xsl:attribute name ="SenteceModified">False</xsl:attribute>

        
          <xsl:attribute name ="RepeatCount">
            <xsl:choose>
              <xsl:when test ="Event/@Action != 'KeyPress'">0</xsl:when>
              <xsl:otherwise>
                <xsl:choose>
                  <xsl:when test ="Control/Clubbed/Data !=''">0</xsl:when>
                  <xsl:when test ="count(SubSteps//Frame) &gt; 0">
                    <xsl:value-of select ="count(SubSteps//Frame)+1"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select ="count(SubSteps//Frame)"/>
                  </xsl:otherwise>
                </xsl:choose>

              </xsl:otherwise>
            </xsl:choose>
            
          </xsl:attribute>  

        <xsl:attribute name ="ControlCaption"></xsl:attribute>

        <xsl:attribute name ="PacketID">
          <xsl:value-of select ="Meta/Origin/@PID"/>
        </xsl:attribute>


        <xsl:attribute name ="AliasName">
          <xsl:choose>
            <xsl:when  test ="Control/Clubbed/Data !=''">
              <xsl:choose>
              <xsl:when test ="Control/@Role = 'menu item'">
                <xsl:value-of select ="Control/Clubbed/Data"/>
              </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select ="Control/@Alias"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise >
              <xsl:value-of select ="Control/@Alias"/>
            </xsl:otherwise>
          </xsl:choose>
          
        </xsl:attribute>

        <xsl:attribute name ="StdCtrlDialogName">
          <xsl:value-of select ="Meta/@Dialog"/>
        </xsl:attribute>

        <xsl:attribute name ="InfoTapName">
          <xsl:value-of select ="Meta/@EXE"/>
        </xsl:attribute>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name ="SetControlType">
    <xsl:param name ="Role"/>
    <xsl:param name ="ClassVal"/>

    <xsl:choose >
      <xsl:when test ="$Role='combo box'">
     
        <xsl:choose >
          <xsl:when test ="$ClassVal='ComboLBox'">
            <xsl:attribute name ="ControlType">list item</xsl:attribute>
          </xsl:when>
          <xsl:when test ="Control/Clubbed/Data =''">
            <xsl:attribute name ="ControlType">
              <xsl:value-of select ="$Role" />
            </xsl:attribute >
          </xsl:when>
          <xsl:when test ="count(SubSteps//Frame) &gt; 0">
            <xsl:attribute name ="ControlType">list item</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name ="ControlType">
              <xsl:value-of select ="$Role" />
            </xsl:attribute >
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise >
        <xsl:attribute name ="ControlType">
          <xsl:value-of select ="$Role" />
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name ="StandardizingMBandMS">

    <xsl:param name ="MoueButton"/>
    <xsl:param name ="MouseStatus"/>
    <xsl:variable name ="MBMS" select="concat($MoueButton,'+',$MouseStatus)"/>

    <xsl:choose >
      <xsl:when test ="$MBMS='L+'">
        <xsl:attribute name ="MouseStatus">1</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MBMS='R+'">
        <xsl:attribute name ="MouseStatus">2</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MBMS='R+L'">
        <xsl:attribute name ="MouseStatus">3</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MBMS='M+'">
        <xsl:attribute name ="MouseStatus">16</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MBMS='M+L'">
        <xsl:attribute name ="MouseStatus">17</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MBMS='M+R'">
        <xsl:attribute name ="MouseStatus">18</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MBMS='L+M'">
        <xsl:attribute name ="MouseStatus">67</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MBMS='R+M'">
        <xsl:attribute name ="MouseStatus">68</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MBMS='L+R'">
        <xsl:attribute name ="MouseStatus">53</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MBMS='+'">
        <xsl:attribute name ="MouseStatus">0</xsl:attribute>
      </xsl:when>
      <xsl:otherwise >
        <xsl:attribute name ="MouseStatus">0</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:choose>
      <xsl:when test ="$MoueButton='L'">
        <xsl:attribute name ="MouseButton">Left</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MoueButton='R'">
        <xsl:attribute name ="MouseButton">Right</xsl:attribute>
      </xsl:when>
      <xsl:when test ="$MoueButton='M'">
        <xsl:attribute name ="MouseButton">Middle</xsl:attribute>
      </xsl:when>
      <xsl:otherwise >
        <xsl:attribute name ="MouseButton"></xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name ="SetValidatorValue">
    <xsl:param name ="ValidatorValue"/>
    <xsl:choose>
      <xsl:when test ="$ValidatorValue='Exact Value'">
        <xsl:attribute name ="Validator">Exact Value</xsl:attribute>
      </xsl:when>
      <xsl:otherwise >
        <xsl:attribute name ="Validator"></xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
