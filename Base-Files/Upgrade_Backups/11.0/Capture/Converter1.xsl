<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <xsl:element  name ="Sentence" >
      <xsl:element name="SentenceStyle">
        <xsl:value-of select="//Header/Sentence/@Structure" />
      </xsl:element>
      <xsl:element name="Formattype">
        <xsl:value-of select="//Header/Sentence/@Format" />
      </xsl:element>

      <xsl:for-each select ="//Step">
        <xsl:call-template name ="stepDetail">
        </xsl:call-template>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  <xsl:template name ="stepDetail" >
    <xsl:element name ="Step">
      <xsl:attribute name ="id">
        <xsl:value-of select="@ID"/>
      </xsl:attribute>
      <xsl:element name ="StepData">
        <xsl:call-template name ="_MSAA"></xsl:call-template>
        <xsl:attribute name ="CtrlImage">
          <xsl:value-of select ="ImageStore/ControlImage/ImageData/@FileName"/>
        </xsl:attribute>

        <xsl:attribute name ="SenteceModified">
          <xsl:value-of select ="Sentence/@Modified"/>
        </xsl:attribute>
        
        <xsl:attribute name ="RepeatCount">0</xsl:attribute>
		<xsl:attribute name ="FDKeyCount">
      <xsl:choose>
        <xsl:when test="Standard/FDKeyProp/@FDKeyCount">
          <xsl:value-of select ="Standard/FDKeyProp/@FDKeyCount"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
        </xsl:attribute>
		<xsl:attribute name ="ControlCaption"></xsl:attribute>

        <xsl:attribute name ="PacketID">
          <xsl:value-of select ="@PacketID"/>
        </xsl:attribute>

        <xsl:attribute name ="AliasName">
          <xsl:value-of select ="@AliasName"/>
        </xsl:attribute>

        <xsl:attribute name ="StdCtrlDialogName">
          <xsl:value-of select ="Standard/Control/@DialogName"/>
        </xsl:attribute>

        <xsl:attribute name ="InfoTapName">
          <xsl:value-of select ="Info/TAP/@Name"/>
        </xsl:attribute>
        
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template  name="_MSAA" match ="MSAA">

    <xsl:attribute name="ControlType">
      <xsl:value-of select="MSAA/Control/@Role" />
    </xsl:attribute>


    <xsl:attribute name="ControlEvent">
      <xsl:value-of select="MSAA/Control/@Event" />
    </xsl:attribute>


    <xsl:attribute name="MouseStatus">
      <xsl:value-of select="MSAA/Control/@MouseStatus" />
    </xsl:attribute>


    <xsl:attribute name="MouseButton">
      <xsl:value-of select="MSAA/Control/@MouseButton" />
    </xsl:attribute>


    <xsl:attribute name="ControlData">
      <xsl:value-of select="MSAA/Control/ControlData/Value"/>
    </xsl:attribute>


    <xsl:attribute name="SpKeyStatus">
      <xsl:value-of select="MSAA/Control/@SPKeyStatus"/>
    </xsl:attribute>


    <xsl:attribute name="ParentContol">
      <xsl:value-of select="MSAA/ParentControl/@Name"/>
    </xsl:attribute>


    <xsl:attribute name ="KBShortCutKey">
      <xsl:value-of select ="MSAA/Control/@KBShortcut"/>
    </xsl:attribute>


    <xsl:attribute name ="EventType">
      <xsl:value-of select ="@EventType"/>
    </xsl:attribute>


    <xsl:attribute name ="HighLevelSource">
      <xsl:value-of select ="MSAA/Control/HighLevelSource"/>
    </xsl:attribute>

    <xsl:attribute name ="Validator">
      <xsl:value-of select ="@Validator"/>
    </xsl:attribute>

    <xsl:attribute  name ="ControlName">
      <xsl:value-of select ="MSAA/Control/@Name"/>
    </xsl:attribute>

    <xsl:attribute  name ="ControlDialogName">
      <xsl:value-of select ="MSAA/Control/@DialogName"/>
    </xsl:attribute>

  </xsl:template>
</xsl:stylesheet>
