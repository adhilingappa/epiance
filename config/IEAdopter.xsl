<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="//IEFilters">
		<xsl:element name="CaptureSettings">
		
		<!-- BasedOnTag -->
			<xsl:attribute name="PushButton_BasedOnTag">
                  <xsl:value-of
				select="General/RoleIdentifier/BasedOnTags/Rule[@CurrentRole = '43' and @ParentRole='']/CurrentInfo/Condition/@className">
                  </xsl:value-of>
                  </xsl:attribute>

<!--  BasedOnAttribute -->
			<xsl:attribute name="PushButton_BasedOnAttr">
             <xsl:value-of
				select="General/RoleIdentifier/BasedOnAttributes/Rule[@Enable ='1' and @CurrentRole='43' and @ParentRole='10']/CurrentInfo/Condition/@className">
				</xsl:value-of>
				</xsl:attribute>

			<xsl:attribute name="RadioButton_BasedOnAttr">
		  <xsl:value-of
				select="General/RoleIdentifier/BasedOnAttributes/Rule[@Enable ='1' and @CurrentRole='45' and @ParentRole='10']/CurrentInfo/Condition/@className">
				</xsl:value-of>
		  </xsl:attribute>

			<xsl:attribute name="ComboBox_BasedOnAttr">
		  <xsl:value-of
				select="General/RoleIdentifier/BasedOnAttributes/Rule[@Enable ='1' and @CurrentRole='46' and @ParentRole=''][position()=2]/CurrentInfo/Condition/@className">
		  </xsl:value-of>
		  </xsl:attribute>

			<xsl:attribute name="CheckBox_BasedOnAttr">
         <xsl:value-of
				select="General/RoleIdentifier/BasedOnAttributes/Rule[@Enable ='1' and @CurrentRole='44' and @ParentRole='10']/CurrentInfo/Condition/@className">
         </xsl:value-of>
         </xsl:attribute>

      <!--  BasedOnTraverseLogic -->

			<xsl:attribute name="ListItem_span_BasedOnTraverseLogic_3">
         <xsl:value-of
				select="General/RoleIdentifier/BasedOnTraverseLogic/Rule[@Enable ='1' and  @CurrentRole='34' and @ParentRole=''][position()=3]/TraversalInfo/Path/Condition/Attributes/@TagName">
         </xsl:value-of>
         </xsl:attribute>
         
         <xsl:attribute name="ListItem_span_BasedOnTraverseLogic_1"></xsl:attribute>
         
         
			<xsl:attribute name="ComboBox_span_BasedOnTrvrsLogic">
         <xsl:value-of
				select="General/RoleIdentifier/BasedOnTraverseLogic/Rule[@Enable ='1' and  @CurrentRole='46' and @ParentRole='10']/TraversalInfo/Path[position()=4]/Condition/Attributes/@classname">
				</xsl:value-of>
				</xsl:attribute>

			<xsl:attribute name="ComboBox_div_BasedOnTrvrsLogic">
		<xsl:value-of
				select="General/RoleIdentifier/BasedOnTraverseLogic/Rule[@Enable ='1' and  @CurrentRole='46' and @ParentRole='10'][position()=5]/TraversalInfo/Path/Condition/Attributes/@classname">
		</xsl:value-of>
		</xsl:attribute>
		






		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
