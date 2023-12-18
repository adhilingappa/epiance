<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils"
>
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<![CDATA[
			public string guid(){
				string gi = Guid.NewGuid().ToString();
				return gi;
				}
		]]>
	</msxsl:script>
  <!--Flat intermediate BluePrism 1 date:15/05/2020 DD/MM/YYYY-->
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="GPS_NAME"></xsl:param>
  <xsl:param name="ImagePath"></xsl:param>
  <xsl:variable name="nodes">PlayBack Sentence Standard MSAA ImageStore</xsl:variable>
  <!--only mention immediate child nodes of Step-->
  <xsl:variable name="StepNodeAttributes">Version ActiveChannelID AdaptorID AliasName Guid ParentID IsStrayStep</xsl:variable>
  <!--only specify step attributes-->
  <xsl:template match="/">

    <Document>
      <Meta>
        <GpsFile>
          <xsl:value-of select="$GPS_NAME"/>
        </GpsFile>
        <GpsId>
          <xsl:value-of select="WorkFlow/Header/Summary/@GPSID"/>
        </GpsId>
        <ExePath>
          <xsl:value-of select="concat(WorkFlow/Header/TAPS/TAP/@Path,'\',WorkFlow/Header/TAPS/TAP/@EXEName)"/>
        </ExePath>
		<ImagePath>          
		   <xsl:value-of select="$ImagePath"/>
        </ImagePath>
      </Meta>
      <Process>

        <xsl:for-each select="WorkFlow/*">
          <xsl:choose>
            <xsl:when test="name()='GroupStep'">
              <xsl:element name="GStep">
                <xsl:attribute name="ID">
                  <xsl:value-of select="@ID"/>
                </xsl:attribute>
                <xsl:attribute name="DialogName">
                  <xsl:value-of select="@Caption"/>
                </xsl:attribute>
              </xsl:element>
            </xsl:when>
            <xsl:when test="name()='Step'">
              <xsl:choose>
                <xsl:when test="@IsStrayStep='1'">
                  
                </xsl:when>
                <xsl:otherwise>
              <xsl:element name="Step">
                <xsl:attribute name="DialogName">
                  <xsl:value-of select="PlayBack/AppInfo/@DialogName"/>
                </xsl:attribute>


                <xsl:for-each select="@*">
                  <!--<xsl:if test="(name() = 'ID') or (name() = 'Version') or (name() = 'ActiveChannelID') or (name() = 'AdaptorID') or (name() = 'AliasName') or (name() = 'Guid')">  -->
                  <xsl:if test="contains($StepNodeAttributes,name())">
                    <xsl:element name="{concat('Step-',name())}" >
                      <!--Get all attributes of Step element-->                      
                      <xsl:value-of select="."/>
                    </xsl:element>
                  </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="node()" >
                  <!--forEach immediate child element of Step element-->
                  <xsl:variable name="parentName">
                    <xsl:value-of select="name()"/>
                  </xsl:variable>

                  <!--<xsl:if test="($parentName='PlayBack') or ($parentName='Sentence')">  -->
                  <xsl:if test="contains($nodes,$parentName)">

                    <xsl:for-each select="@*">
                      <xsl:element name="{concat($parentName,'-',name())}">
                        <xsl:value-of select="."/>
                      </xsl:element>
                    </xsl:for-each>

                    <xsl:call-template name="buildElementTemplate">
                      <xsl:with-param name="parentName">
                        <xsl:value-of select="$parentName"/>
                      </xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:for-each>

				<!--Additional guids for blue prism -->
				<xsl:element name="Additional-guid1">
					<xsl:value-of select="utils:guid()" />
				</xsl:element>
				
				<xsl:element name="Additional-guid2">
					<xsl:value-of select="utils:guid()" />
				</xsl:element>
				
				<xsl:element name="Additional-guid3">
					<xsl:value-of select="utils:guid()" />
				</xsl:element>

              </xsl:element>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>

      </Process>
    </Document>
  </xsl:template>

  <xsl:template name="buildElementTemplate">
    <!--Recursive template-->
    <xsl:param name="parentName"/>
    <xsl:if test="*">
      <xsl:for-each select="node()" >
        <xsl:variable name="elementName">
          <xsl:value-of select="name()"/>
        </xsl:variable>
        <xsl:variable name="elementNameFinalWithoutAttribute">
          <xsl:value-of select="concat($parentName,'--',$elementName)"/>
        </xsl:variable>
        <xsl:for-each select="@*">
          <xsl:element name="{concat($elementNameFinalWithoutAttribute,'-',name())}" >
            <xsl:value-of select="."/>
          </xsl:element>
        </xsl:for-each>
        <xsl:if test="*">
          <xsl:call-template name="buildElementTemplate" >
            <xsl:with-param name="parentName">
              <xsl:value-of select="$elementNameFinalWithoutAttribute"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
