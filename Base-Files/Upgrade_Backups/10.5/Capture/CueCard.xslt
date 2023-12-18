<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl" xmlns:extra="urn:extra-functions">
    <xsl:output method="xml" indent="yes"/>
  <msxsl:script implements-prefix="extra" language="VBScript" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
    Dim IsGroupStepCompleted
    Dim GroupuStepCunt

    Function SetIsGroupStepCompleted()
    IsGroupStepCompleted = 1
    SetIsGroupStepCompleted = IsGroupStepCompleted
    End Function

    Function ReSetIsGroupStepCompleted()
    IsGroupStepCompleted = 0
    ReSetIsGroupStepCompleted = IsGroupStepCompleted
    End Function

    Function GetIsGroupStepCompleted()
    GetIsGroupStepCompleted = IsGroupStepCompleted
    End Function

    Function InitGroupStepCount()
    GroupuStepCunt = 0
    InitGroupStepCount = GroupuStepCunt
    End Function

    Function GetGroupStepCount()
    GroupuStepCunt = GroupuStepCunt+1
    GetGroupStepCount = GroupuStepCunt
    End Function


  </msxsl:script>
    <xsl:template match="/WorkFlow">
        <!--<xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>-->
      
      <xsl:element name ="WorkSpaceClient">
        <xsl:copy-of select ="@*"/>        
        <xsl:element name ="Header">
          <xsl:copy-of select="Header/Summary"/>
        </xsl:element>
        <xsl:call-template name="CreateProcess"/>
      </xsl:element>
    </xsl:template>
  <xsl:template name ="CreateProcess" >
    <xsl:element name ="Process">
      <xsl:if test ="extra:ReSetIsGroupStepCompleted()"/>
      <xsl:element name ="Dialogs">
        <xsl:for-each select ="//GroupStep">
          <xsl:if test ="extra:GetGroupStepCount() > 1">
              <xsl:call-template name="CreateDialog"/>
          </xsl:if>
        </xsl:for-each>
      </xsl:element>
    </xsl:element>
  </xsl:template>
  <xsl:template name ="CreateDialog">
    <xsl:element name ="Dialog">
      <xsl:attribute name="ID">
        <xsl:value-of select ="@ID"/>
      </xsl:attribute>
      <xsl:attribute name="Name">
        <xsl:value-of select ="@Caption"/>
      </xsl:attribute>
	   <xsl:element name ="DisplayText">
        <xsl:element name ="Plain"><xsl:value-of select ="@Caption"/></xsl:element>
        <xsl:element name ="HTML"><xsl:value-of select ="Sentence/HTML"/></xsl:element>
        <xsl:element name ="RTF"><xsl:value-of select ="Sentence/HTML"/></xsl:element>
      </xsl:element>
      <xsl:element name ="Steps">
        <xsl:if test="extra:ReSetIsGroupStepCompleted()"></xsl:if>
        <xsl:for-each select ="following-sibling::node()">
        <xsl:if test="name() = 'GroupStep'">
          <xsl:if test="extra:SetIsGroupStepCompleted()"/>
        </xsl:if>
        <xsl:if test="extra:GetIsGroupStepCompleted() = 0">
          <xsl:call-template name="CreateStep"></xsl:call-template>
        </xsl:if>
      </xsl:for-each>
      </xsl:element>  
    </xsl:element>
  </xsl:template>
  <xsl:template name="CreateStep" >
    <xsl:if test="not(MSAA/Control/@Event ='CaptionDestroy' or MSAA/Control/@Event ='Collapse Popup' or MSAA/Control/@Event ='Menu Popup' )">      
      <xsl:element name ="Step">
      <xsl:attribute  name ="ID">
        <xsl:value-of select="@ID"/>
      </xsl:attribute>
	       <xsl:attribute  name ="ParentID">
        <xsl:value-of select="@ParentID"/>
      </xsl:attribute>
      <xsl:attribute  name ="ControlHashCode"><xsl:value-of select ="@HashCode"/></xsl:attribute>
      <xsl:element name ="ExtraInfo">       
        <xsl:attribute name="ControlData"><xsl:value-of select ="MSAA/Control/ControlData"/></xsl:attribute>
        <xsl:attribute name="Role"><xsl:value-of select ="MSAA/Control/@Role"/></xsl:attribute>
        <xsl:attribute name="Event"><xsl:value-of select ="MSAA/Control/@Event"/></xsl:attribute>
        <xsl:attribute name="Caption"><xsl:value-of select ="MSAA/Control/@Role"/></xsl:attribute>
        <xsl:attribute name="ShortCut"><xsl:value-of select ="MSAA/Control/@KBShortcut"/></xsl:attribute>
        <xsl:attribute name="Class"><xsl:value-of select ="Standard/Control/@Class"/></xsl:attribute> 
      </xsl:element>
      <xsl:element name ="DisplayText">
        <xsl:element name ="Plain"><xsl:value-of select ="Sentence/@Plain"/></xsl:element>
        <xsl:element name ="HTML"><xsl:value-of select ="Sentence/HTML"/></xsl:element>
        <xsl:element name ="RTF"><xsl:value-of select ="Sentence/HTML"/></xsl:element>
      </xsl:element>
      <xsl:element name ="Notes">
        <xsl:element name ="Plain"></xsl:element>
        <xsl:element name ="HTML"></xsl:element>
        <xsl:element name ="RTF"></xsl:element>
      </xsl:element>
      <xsl:element name ="ControlImage">
        <xsl:attribute name="FileName"></xsl:attribute>
        <xsl:attribute name="ImageSize"></xsl:attribute>
      </xsl:element>      
    </xsl:element>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
