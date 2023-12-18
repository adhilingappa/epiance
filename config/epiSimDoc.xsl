<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />

<!-- epiSimDocEditor.xml -->
	<xsl:template match="//Settings">
		<xsl:element name="epiSimDoc_Editor">
			<xsl:call-template name="DeveloperEditor">
			</xsl:call-template>
			<xsl:call-template name="FinalizeSettings"></xsl:call-template>
		</xsl:element>
	</xsl:template>


	<xsl:template name="DeveloperEditor">

		<xsl:element name="DeveloperSettings">
			<xsl:attribute name="ReGenSenOnGrping">
			   <xsl:value-of
				select="Preferences/Preference/ReGenSenOnGrping"></xsl:value-of>
            </xsl:attribute>

			<xsl:attribute name="CtrlRegionColor">
              <xsl:value-of
				select="Preferences/Preference/AnnotationDefaults/OuterRegion/@Color">
              </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="CtrlRegionThickness">
               <xsl:value-of
				select="Preferences/Preference/AnnotationDefaults/OuterRegion/@Thickness">
               </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="FontStyle">
               <xsl:value-of
				select="Preferences/Preference/AnnotationDefaults/Font/Face">
               </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="FontStyleBold">
               <xsl:value-of
				select="Preferences/Preference/AnnotationDefaults/Font/B">
               </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="FontStyleItalic">
              <xsl:value-of
				select="Preferences/Preference/AnnotationDefaults/Font/I">
              </xsl:value-of>
            </xsl:attribute>

			<xsl:attribute name="FontStyleUnderLine">
                <xsl:value-of
				select="Preferences/Preference/AnnotationDefaults/Font/U">
                </xsl:value-of>
            </xsl:attribute>

			<xsl:attribute name="CalloutColor">
            <xsl:value-of
				select="Preferences/Preference/AnnotationDefaults/Callout/@Color">
				</xsl:value-of>
				</xsl:attribute>

			<xsl:attribute name="CalloutOrientation">
		    <xsl:value-of
				select="Preferences/Preference/AnnotationDefaults/Callout/@Orientation">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="VoiceType">
		    <xsl:value-of
				select="Preferences/Preference/Audio/TTS/@Type">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="Gender">
		    <xsl:value-of
				select="Preferences/Preference/Audio/TTS/@Gender">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="Voice">
		    <xsl:value-of
				select="Preferences/Preference/Audio/TTS/@Voice">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="Prompt">
		    <xsl:value-of
				select="PersonalPreferences/Prompts/Prompt[@Key='Prompt2']">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="AutoScrollCanvas">
		    <xsl:value-of
				select="PersonalPreferences/AutoScrollCanvas">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="ShowEPSSSentence">
		    <xsl:value-of
				select="PersonalPreferences/ShowEpssCuecardDescription">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="NewSenApplyTo">
		    <xsl:value-of
				select="ToolsSettings/NewSentence/@ApplyTo">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="SentenceStructure">
		    <xsl:value-of
				select="ToolsSettings/NewSentence/@SentenceStructure">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="SentenceFormat">
		    <xsl:value-of
				select="ToolsSettings/NewSentence/@SentenceFormat">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="UseControlImage">
		    <xsl:value-of
				select="ToolsSettings/NewSentence/@UseCtrlImg">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="SyncAutoCalloutToNotes">
		    <xsl:value-of
				select="ToolsSettings/NewSentence/@SyncAutoCalloutToNotes">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="ToolsCalloutColor">
		    <xsl:value-of
				select="ToolsSettings/ApplyCalloutSettings/@Callout_color">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="ToolsStickyColor">
		    <xsl:value-of
				select="ToolsSettings/ApplyCalloutSettings/@Sticky_color">
		    </xsl:value-of>
		    </xsl:attribute>


			<xsl:attribute name="AddAudioToCalloutAndSticky">
			<xsl:value-of
				select="ToolsSettings/AutoGenMgmt/@MainTask">
			</xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="ExcludeRegThickness">
		    <xsl:value-of
				select="ToolsSettings/ApplyCtrlRgnSettings/@InnerCtrlThickVal">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="ExcludeRegColor">
		    <xsl:value-of
				select="ToolsSettings/ApplyCtrlRgnSettings/@InnerCtrlTag">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="TextToSpeechOverrideStepAudio">
		    <xsl:value-of
				select="ToolsSettings/AudioMgmt/@Override">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="TextToSpeechApplyTo">
		    <xsl:value-of
				select="ToolsSettings/AudioMgmt/@ApplyTo">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="UpdateFontName">
		    <xsl:value-of
				select="ToolsSettings/FontUpdate/@FontName"></xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="UpdateFontColor">
		    <xsl:value-of
				select="ToolsSettings/FontUpdate/@UpdateFontColor">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="UpdateAnnotation">
		    <xsl:value-of
				select="ToolsSettings/FontUpdate/@UpdateAnnotation">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="UpdateNotes">
		    <xsl:value-of
				select="ToolsSettings/FontUpdate/@UpdateNotes">
		    </xsl:value-of>
		    </xsl:attribute>



			<xsl:attribute name="HTML_Template">
		    <xsl:value-of select="SelectedTemplates/ProcessHTML">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="DOCX_Template">
		    <xsl:value-of select="SelectedTemplates/ProcessWord">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="XML_Template">
		    <xsl:value-of select="SelectedTemplates/ProcessXML">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="PPT_Template">
		    <xsl:value-of select="SelectedTemplates/ProcessPPT">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="Excel_Template">
		    <xsl:value-of
				select="SelectedTemplates/ProcessExcel">
		    </xsl:value-of>
		    </xsl:attribute>

			<xsl:attribute name="Simulation_Template">
		    <xsl:value-of
				select="SelectedTemplates/HTML5EpiLearn">
		    </xsl:value-of>
		    </xsl:attribute>


			<xsl:attribute name="GenDocSaveInDocxFormat">
		      <xsl:value-of
				select="Wizards/DocWizards/DocWiz/SaveAsDocx">
		      </xsl:value-of>
		      </xsl:attribute>

			<xsl:attribute name="GenDocLaunchAfter">
		      <xsl:value-of
				select="Wizards/DocWizards/DocWiz/LaunchDocument">
		      </xsl:value-of>
		      </xsl:attribute>

			<xsl:attribute name="GenSimLaunchAfter">
		      <xsl:value-of
				select="Wizards/epiLearnWizards/epiLearnWiz/LaunchepiLearn">
		      </xsl:value-of>
		      </xsl:attribute>

			<xsl:attribute name="UseEpssCuecardSens">
		      <xsl:value-of
				select="Wizards/CuecardWizards/CuecardWiz/UseEpssCuecardSens">
		      </xsl:value-of>
		      </xsl:attribute>

			<xsl:attribute name="GenCuecardInfoStep">
		      <xsl:value-of
				select="Wizards/CuecardWizards/CuecardWiz/IncludeInfoSteps">
		      </xsl:value-of>
		      </xsl:attribute>

			<xsl:attribute name="GenVideoApplyThemeToAnnotation">
		      <xsl:value-of
				select="Wizards/MP4Wizards/MP4Wiz/ApplyThemeToAnnotation">
		      </xsl:value-of>
		      </xsl:attribute>

			<xsl:attribute name="GenVideoShowMousePointer">
		      <xsl:value-of
				select="Wizards/MP4Wizards/MP4Wiz/ShowMousePointer">
		      </xsl:value-of>
		      </xsl:attribute>

			<xsl:attribute name="GenVideoStepDelay">
		      <xsl:value-of
				select="Wizards/MP4Wizards/MP4Wiz/StepDelay">
		      </xsl:value-of>
		      </xsl:attribute>

			<xsl:attribute name="GenVideoLaunchAfter">
		      <xsl:value-of
				select="Wizards/MP4Wizards/MP4Wiz/LaunchMP4">
		      </xsl:value-of>
		      </xsl:attribute>


		</xsl:element>
	</xsl:template>

	<xsl:template name="FinalizeSettings">
		<xsl:element name="FinalizeSettings">

			<xsl:attribute name="ImportCaptureAudio">
			<xsl:value-of
				select="Wizards/NewFileWizards/NewFileWizard/Audio/ImportAudio">
			</xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="SentenceStructure">
           <xsl:value-of
				select="Wizards/NewFileWizards/NewFileWizard/Sentences/Format">
           </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="AddCalloutStickyNoteToSteps">
           <xsl:value-of
				select="Wizards/NewFileWizards/NewFileWizard/AnnotateWithSentence/AutoPopulate">
           </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="ExactValue">
           <xsl:value-of
				select="Wizards/NewFileWizards/NewFileWizard/OverrideSettings/Validations/ExactValue">
           </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="ValidationForTypeText">
           <xsl:value-of
				select="Wizards/NewFileWizards/NewFileWizard/OverrideSettings/Validations/VType/@type">
           </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="FontStyle">
           <xsl:value-of
				select="Wizards/NewFileWizards/NewFileWizard/OverrideSettings/FontSettings/Face">
           </xsl:value-of>
           </xsl:attribute>

			<xsl:attribute name="BackgroundColor">
           <xsl:value-of
				select="Wizards/NewFileWizards/NewFileWizard/OverrideSettings/FontSettings/BackColor">
           </xsl:value-of>
           </xsl:attribute>


		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
