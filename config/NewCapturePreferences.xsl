<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	
	<!-- NewCapturePreferences.xml -->
	<xsl:template match="//Preference">
		<xsl:element name="NewCapturePreference">
			<xsl:call-template name="CaptureSettings">
			</xsl:call-template>
			<xsl:call-template name="ProcessEditor">
			</xsl:call-template>
		</xsl:element>
	</xsl:template>

	<xsl:template name="CaptureSettings">
		<xsl:element name="HomeCaptureSettings">

			<xsl:attribute name="AudioVideoSelection">
                        <xsl:value-of
				select="Processor/CaptureSettings/AudioVideo/@Allow">
				</xsl:value-of>
                  </xsl:attribute>

			<xsl:attribute name="CaptureAudio">
                    <xsl:value-of
				select="Processor/CaptureSettings/AudioVideo/@CapturePreference">
                    </xsl:value-of>
                  </xsl:attribute>

			<xsl:attribute name="FullScreenMode">
					<xsl:value-of
				select="Processor/CaptureSettings/NotesAndImages/AutoImage/ScreenImage/@Mode">
					</xsl:value-of>
					</xsl:attribute>

			<xsl:attribute name="HotKeyAudioVideo">
			<xsl:value-of
				select="Processor/CaptureSettings/AudioVideo/@HotKey">
			</xsl:value-of>
			</xsl:attribute>

			<xsl:attribute name="HotKeyValidation">
			<xsl:value-of
				select="Processor/CaptureSettings/InputValidation/HotkeyShortcuts/HotKey[@keycode='80']">
			</xsl:value-of>
			</xsl:attribute>

			<xsl:attribute name="HotKeyException">
		 	<xsl:value-of
				select="Processor/CaptureSettings/InputValidation/HotkeyShortcuts/HotKey[@keycode='88']"></xsl:value-of>
			</xsl:attribute>

			<xsl:attribute name="HotKeyNarration">
			<xsl:value-of
				select="Processor/CaptureSettings/InputValidation/HotkeyShortcuts/HotKey[@keycode='77']">
			</xsl:value-of>
			</xsl:attribute>

			<xsl:attribute name="SentenceStructure">
			<xsl:value-of
				select="Processor/Common/Sentence/@Structure">
			</xsl:value-of>
			</xsl:attribute>

			<xsl:attribute name="SentenceFormat">
           <xsl:value-of
				select="Processor/Common/Sentence/@Format"></xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="UseControlImg_Uncheck">
           <xsl:value-of
				select="Processor/Common/Sentence/@UseCtrlImage"></xsl:value-of></xsl:attribute>

			<xsl:attribute name="ApplyAliasName">
           <xsl:value-of
				select="Processor/Common/ApplyAliasName"></xsl:value-of></xsl:attribute>

			<xsl:attribute name="ApplicationFilterInclude">
           <xsl:value-of
				select="Processor/CaptureSettings/ApplicationFilter/@CaptureOnlyIncluded">
           </xsl:value-of></xsl:attribute>

			<xsl:attribute name="ApplicationFilterApps">
           <xsl:value-of
				select="Processor/CaptureSettings/ApplicationFilter/Applications">
           </xsl:value-of></xsl:attribute>

			<xsl:attribute name="Organization">
           <xsl:value-of
				select="Processor/Common/Properties/@Organization"></xsl:value-of></xsl:attribute>

			<xsl:attribute name="CopyRight">
           <xsl:value-of
				select="Processor/Common/Properties/@CopyRight"></xsl:value-of></xsl:attribute>

			<xsl:attribute name="PropertiesWhileSave">
           <xsl:value-of
				select="Processor/CaptureSettings/ShowPropertiesDialogWhileSaving"></xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="SensDataMaskRuleImg">
           <xsl:value-of
				select="Processor/CaptureSettings/@ADSEnabled">
           </xsl:value-of></xsl:attribute>

			<xsl:attribute name="TaxonomyAddToNextStepsOnly">
           <xsl:value-of
				select="Processor/CaptureSettings/Taxonomy/@AddToNextStepOnly"></xsl:value-of></xsl:attribute>

			<xsl:attribute name="UIACaptureEnabled">
           <xsl:value-of
				select="Processor/CaptureSettings/UIACapture/@Enabled">
           </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="NLPEnabled">
           <xsl:value-of
				select="Processor/CaptureSettings/@NLPEnabled">
           </xsl:value-of>
           </xsl:attribute>


		</xsl:element>
	</xsl:template>

	<xsl:template name="ProcessEditor">

		<xsl:element name="ProcessEditor">
			<xsl:attribute name="HideNoiseStep">
	 <xsl:value-of
				select="Processor/EditorSettings/UserSettings/Settings/@HideNoiseSteps">
	 </xsl:value-of>
	  </xsl:attribute>

			<xsl:attribute name="ShowHideKeyStepGrid">
	  <xsl:value-of
				select="Processor/EditorSettings/UserSettings/ViewMenu/@ShowKeyStep">
	  </xsl:value-of>
	   </xsl:attribute>

			<xsl:attribute name="ShowHideAdditionalGrid">
	   <xsl:value-of
				select="Processor/EditorSettings/UserSettings/ViewMenu/@ShowVPEDS">
	   </xsl:value-of>
	   </xsl:attribute>

			<xsl:attribute name="BorderColor">
	          <xsl:value-of
				select="Processor/Common/Border/@Color">
	         </xsl:value-of>
	              </xsl:attribute>

			<xsl:attribute name="BorderThickness">
              <xsl:value-of
				select="Processor/Common/Border/@Thickness">
              </xsl:value-of></xsl:attribute>
			<xsl:attribute name="BorderShow">
                <xsl:value-of
				select="Processor/Common/Border/@Show">
				</xsl:value-of>
                </xsl:attribute>

			<xsl:attribute name="ShowMousePointer">
                <xsl:value-of
				select="Processor/Common/MousePointer/@Show">
                </xsl:value-of>
                </xsl:attribute>

			<xsl:attribute name="ShowNavigationData">
               <xsl:value-of
				select="Processor/EditorSettings/@IsEnableNavigationUI">
               </xsl:value-of> 
               </xsl:attribute>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
