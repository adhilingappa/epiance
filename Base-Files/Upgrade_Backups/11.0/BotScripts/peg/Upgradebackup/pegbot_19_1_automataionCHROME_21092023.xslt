<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:my="my:my"  xmlns:incr="urn:my-scripts" exclude-result-prefixes="msxsl" >
  <msxsl:script implements-prefix='incr' language='CSharp'>

    <![CDATA[ 
     int Chrome_a=0;
     int Chrome_b=0;
     int Chrome_c=0;
     int Chrome_d=0;
     int Chrome_e=0;
     int Chrome_f=0;
     int Chrome_g=0;
     int Chrome_h=0;
     int Chrome_i=0;
     int Chrome_j=0;
     int Chrome_k=0;
     int Chrome_l=0;
     int Chrome_m=0; int Chrome_To=1; int Chrome_n=0;   
    
    int Chrome_partID=2;    
    
   
   
    public string connectableMethods_Chrome()
    {
      // String gi = connectableMethodsList[h];
      String gi = "ConnectableMethod";
      Chrome_n++;
      return gi+Chrome_n;

    }
    
  
    
 
    int Chrome_LpartID=2000;
     public int GetLinkBlockPartID_Chrome()
    {
         ++Chrome_LpartID;
          return Chrome_LpartID;
    } 
    public int GetConnectionBlockPartID_Chrome()
    {
         ++Chrome_partID;
          return Chrome_partID;
    }  
    
    
    
    int Chrome_fromPartID =0;
    public int GetFromPartID1_Chrome()
    {
      /*  String gi = FromPartIDLIst[c];
        c++;
        return gi;*/
        return ++Chrome_fromPartID;
    }
    
    int Chrome_ToPartID=1;
    public int GetToPartID_Chrome()
    {
       /* String gi = ToPartIDLIst[d];
        d++;
        return gi;*/
       return ++Chrome_ToPartID;
    }
   
  
    
    
    
   
    
    public string GetConnectableMethods_Chrome()
    {
        // String gi = GetConnectableMethodsLIst[f];
        String gi = "ConnectableMethod";
        Chrome_f++;
        return gi+Chrome_f;
    }
    
    public string GetConnectableMethods2_Chrome()
    {
        // String gi = GetConnectableMethodsLIst[f];
        String gi = "ConnectableMethod";
        Chrome_To++;
        return gi+Chrome_To;
    }
    
    public string GetConnectableUniqueId_Chrome()
    {
      //  String gi = GetConnectableUniqueIdLIst[g];
        String gi = "ConnectableMethod";
        Chrome_g++;
        return gi+Chrome_g;
    }     
    
    

  
 public string removeSpaces_Chrome(string str)
 {
    string str1="";
    if(str!="")
    str1 = Regex.Replace(str, @"\s+", "");
    
    return str1;
    
 }
    ]]>
  </msxsl:script>

  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>


  <xsl:template match="/">
    <OpenSpanDesignDocument Version="19.1.0.1" Serializer="2.0" Culture="en-IN">
      <ComponentInfo>
        <Type Value="OpenSpan.Automation.Automator" />
        <Assembly Value="OpenSpan.Automation" />
        <AssemblyReferences>
          <Assembly Value="System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
          <Assembly Value="OpenSpan, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters.Web, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Automation, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Runtime.Core, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
        </AssemblyReferences>
        <DynamicAssemblyReferences />
        <FileReferences />
        <BuildReferences />
      </ComponentInfo>
      <xsl:call-template name="AutomationDocumentTemplate"/>
    </OpenSpanDesignDocument>
  </xsl:template>
  <!--End of template match-->

  <!--***********************************************************-->
  <xsl:template  name="AutomationDocumentTemplate">
    <!-- elementTemplate Start-->
    <Component Version="1.0">
      <xsl:element name="OpenSpan.Automation.Automator">
        <xsl:attribute name="Name">
          <xsl:value-of select="'Automation1'"/>
        </xsl:attribute>
        <xsl:attribute name="Id">
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52'"/>
        </xsl:attribute>
        <xsl:element name="AutomationDocument">
          <xsl:element name="Name">
            <xsl:attribute name="Value">
              <xsl:value-of select="''"/>
            </xsl:attribute>
          </xsl:element>
          <xsl:element name="Size">
            <xsl:attribute name="Value">
              <xsl:value-of select="'5000,5000'"/>
            </xsl:attribute>
          </xsl:element>
          <xsl:element name="Objects">
            <xsl:call-template name="AllProjectsStartedTemplate"/>
            <!--<xsl:call-template name="WaitElementTemplate"/>-->
            <xsl:for-each select="Document/Process/Step">
              <xsl:choose>
                <!--<xsl:when test="Event = 'Click'">
                      <xsl:call-template name="StepConnectionForClickTemplate"/>
                   </xsl:when>                  
               </xsl:choose>
               <xsl:choose>
                 <xsl:when test="Event = 'TypeText'">
                      <xsl:call-template name="StepConnectionForTypeTemplate"/>
                 </xsl:when>-->

                <xsl:when test="PlayBack--GeneralInfo-Event = 'Select'">
                  <xsl:if test="PlayBack--ControlInfo-Role ='check box'">
                    <xsl:call-template name="CheckBoxConnectionTemplate"/>
                  </xsl:if>
                </xsl:when>

                <xsl:when test="PlayBack--GeneralInfo-Event = 'Click'  or  PlayBack--GeneralInfo-Event = 'Select'">
                  <xsl:choose>
                    <xsl:when test="PlayBack--ControlInfo-Role ='editable text'">
                      <xsl:choose>
                        <xsl:when test="PlayBack--AdditionalInfo-Web_Type ='textarea'">
                          <xsl:call-template name="StepConnectionForClickTemplate"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="StepConnectionForClickTemplate"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:when>
                  </xsl:choose>
                  <xsl:if test="PlayBack--ControlInfo-Role ='radio button'  or PlayBack--ControlInfo-Role ='link'">
                    <xsl:call-template name="CheckBoxConnectionTemplate"/>
                    <!-- Same as checkbox-->
                  </xsl:if>
                  <xsl:if test="PlayBack--ControlInfo-Role ='check box'">
                    <xsl:call-template name="CheckBoxConnectionTemplate"/>
                  </xsl:if>
                  <xsl:if test="PlayBack--ControlInfo-Role ='list item'">
                    <xsl:call-template name="DropDownConnectionTemplate"/>
                  </xsl:if>
                  <xsl:if test="PlayBack--ControlInfo-Role ='push button'">
                    <xsl:call-template name="StepConnectionForClickTemplate"/>
                  </xsl:if>

                </xsl:when>
                <xsl:when test="PlayBack--GeneralInfo-Event = 'TypeText' or PlayBack--GeneralInfo-Event = 'TYPETEXT'">
                  <xsl:call-template name="StepConnectionForTypeTemplate"/>
                </xsl:when>

              </xsl:choose>
            </xsl:for-each>
          </xsl:element>
          <!--End Objects-->
         <!-- <xsl:element name="Links">
            <xsl:call-template name="LinksElementTemplate"/>
          </xsl:element>-->
          <!--End Links-->
          <xsl:element name="Comments"> </xsl:element>
          <xsl:element name="SubGraphs"> </xsl:element>
        </xsl:element>
        <!--End AutomationDocument-->
      </xsl:element>
      <!--End OpenSpan.Automation.Automator-->
      <OpenSpan.Automation.ConnectableEvent Name="connectableEvent1" Id="ConnectableEvent-8D7D7F53E9B46DD">
        <ComponentName Value="OpenSpan.Runtime.RuntimeLoader" />
        <DisplayName Value="RuntimeLoader.AllProjectsStarted" />
        <ExceptionsHandled Value="False" />
        <InstanceTypeName Value="OpenSpan.Runtime.RuntimeLoader" />
        <InstanceUniqueId Value="EMPTY" />
        <MemberDetails Value=".AllProjectsStarted Event" />
        <Content Name="MemberPrototypes">
          <Items>
            <OpenSpan.Automation.MemberPrototype>
              <MemberName Value="AllProjectsStarted" />
              <MemberType Value="Event" />
              <TypeName Value="System.EventHandler" />
            </OpenSpan.Automation.MemberPrototype>
          </Items>
        </Content>
      </OpenSpan.Automation.ConnectableEvent>

     <!-- <xsl:call-template name="waitConnectableMethod"></xsl:call-template>-->


      <xsl:for-each select="Document/Process/Step">
        <xsl:choose>
          <!-- <xsl:when test="Event = 'Click'">
	                  <xsl:call-template name="ConnectableMethodTemplate3"/>
                </xsl:when>                  
                </xsl:choose>  
                <xsl:choose>                  
                <xsl:when test="Event = 'TypeText'">
	                <xsl:call-template name="ConnectablePropertiesTemplate"/>
                </xsl:when>  -->
          <xsl:when test="PlayBack--GeneralInfo-Event = 'Click'">
            
            <xsl:if test="PlayBack--ControlInfo-Role ='radio button'  or PlayBack--ControlInfo-Role ='link'">
              <xsl:call-template name="RadioBtnConnectableMethod"/>
            </xsl:if>
            <xsl:if test="PlayBack--ControlInfo-Role ='check box'">
              <xsl:call-template name="CheckBoxConnectableMethod"/>
            </xsl:if>
            <xsl:if test="PlayBack--ControlInfo-Role ='list item'">
              <xsl:call-template name="DropDownConnectableMethod"/>
            </xsl:if>
           
          </xsl:when>

          <xsl:when test="PlayBack--GeneralInfo-Event = 'TypeText' or PlayBack--GeneralInfo-Event = 'TYPETEXT'">
            <xsl:choose>
              <xsl:when test="PlayBack--AdditionalInfo-Web_Type ='textarea'">
                <xsl:call-template name="ConnectablePropertiesTemplateTextArea"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="ConnectablePropertiesTemplate_Chrome"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>



        </xsl:choose>
      </xsl:for-each>
    </Component>
  </xsl:template>
  <!--End of AutomationDocumentTemplate-->

  <xsl:template name="waitConnectableMethod_Chrome">    
    <xsl:param name="connectableID" select="'Untitled'"/>
    <xsl:param name="Title" select="'Untitled'"/>
    <xsl:variable name="connectableID1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$connectableID"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$connectableID"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="$Title"/>
        </xsl:attribute>
      </xsl:element>      
      <DisplayName Value="WaitForCreate" />
      <ExceptionsHandled Value="False" />
      <InstanceTypeName Value="OpenSpan.Adapters.Web.WebBase.Controls.WebPage" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',incr:removeSpaces_Chrome($Title))"/>
        </xsl:attribute>
      </xsl:element>

      <!-- <xsl:call-template name="InstanceUniqueId"/>-->
      <MemberDetails Value=".WaitForCreate() Method" />
      <ParamsLength Value="0" />
      <SerializedParamsDefaultValues Value="" />
      <Content Name="DynamicMembers">
        <Items>
          <OpenSpan.DynamicMembers.DynamicPropertyInfo dynamicType="Property" name="Result" canRead="True" canWrite="False" type="System.Boolean" aliasName="Result" shouldSerialize="False" visibility="DefaultOn" source="" blockTypeName="" />
        </Items>
      </Content>
      <Content Name="MemberPrototypes">
        <Items>
          <OpenSpan.Automation.MemberPrototype>
            <MemberName Value="WaitForCreate" />
            <MemberType Value="Method" />
            <TypeName Value="System.Boolean" />
            <Content Name="Signature">
              <OpenSpan.Automation.MethodSignature>
                <ReturnType Value="System.Boolean" />
                <Content Name="ParameterPrototype">
                  <Items>
                    <OpenSpan.Automation.ParameterPrototype>
                      <CanRead Value="False" />
                      <CanWrite Value="True" />
                      <DefaultSet Value="True" />
                      <DefaultValue Value="30000" />
                      <ParamName Value="milliseconds" />
                      <Position Value="0" />
                      <TypeName Value="System.Int32" />
                    </OpenSpan.Automation.ParameterPrototype>
                  </Items>
                </Content>
              </OpenSpan.Automation.MethodSignature>
            </Content>
          </OpenSpan.Automation.MemberPrototype>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ConnectablePropertiesTemplateTextArea">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:variable name="methodConne1" select="incr:connectableMethods_Chrome()" />
    <!-- Ex: Val is 1-->
    <xsl:element name="OpenSpan.Automation.ConnectableProperties">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Text=',PlayBack--ControlInfo-ControlData)"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'Properties'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ExceptionsHandled">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceTypeName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.Controls.TextArea'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',concat(PlayBack--AdditionalInfo-Web_ID,Step-ID))"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MemberDetails">
        <xsl:attribute name="Value">
          <xsl:value-of select="'.Text Property'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MemberPrototypes'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Automation.MemberPrototype">
            <xsl:element name="MemberName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Text'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Property'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.String'"/>
              </xsl:attribute>
            </xsl:element>
            <!--TypeName-->
          </xsl:element>
          <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>
        <!--Items-->
      </xsl:element>
      <!--Content-->
    </xsl:element>
    <!-- OpenSpan.Automation.ConnectableMethod-->
  </xsl:template>

  <xsl:template name="AllProjectsStartedTemplate">
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'RuntimeLoader.AllProjectsStarted'"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <!-- <xsl:value-of select="'concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableEvent())'"/>-->
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableEvent-8D7D7F53E9B46DD'"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="'1'"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'140'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="'100'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Collapsed">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="WillExecute">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Runtime.RuntimeLoader'"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>
  <!-- End AllProjectsStartedTemplate-->

  <xsl:template  name="WaitElementTemplate_Chrome">
    <!-- WaitElementTemplate Start-->
    <xsl:param name="Title" select="'Untitled'"/>
    <xsl:param name="UniqueId" select="'Untitled'"/>
    <xsl:param name="PartID" select="'Untitled'"/>
	<xsl:param name="TopPosition" select="'100'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'WaitForCreate'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <!--<xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableUniqueId())"/>-->
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$UniqueId)"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="$PartID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'100'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="$TopPosition"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Collapsed">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="WillExecute">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceName">
        <xsl:attribute name="Value">
          <xsl:value-of select="$Title"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:element name="Fittings">
        <xsl:element name="Result">
          <xsl:attribute name="Collapsed">
            <xsl:value-of select="'False'"/>
          </xsl:attribute>
          <xsl:attribute name="ActualText">
            <xsl:value-of select="'Result'"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>
  <!-- WaitElementTemplate End-->
  <xsl:template  name="ActivateWindow_Chrome">
    <xsl:param name="Title" select="'Untitled'"/>
    <xsl:param name="UniqueId" select="'Untitled'"/>
    <xsl:param name="PartID" select="'Untitled'"/>
    <xsl:param name="TopPosition" select="'100'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'ActivateWindow'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$UniqueId)"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="$PartID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'100'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="$TopPosition"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Collapsed">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="WillExecute">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceName">
        <xsl:attribute name="Value">
          <xsl:value-of select="$Title"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template  name="StepConnectionForClickTemplate_Chrome">
    
    <xsl:param name="UniqueId" select="'Untitled'"/>
     <xsl:param name="InstanceName" select="'Untitled1'"/>
    <xsl:param name="PartID" select="'Untitled'"/>
	<xsl:param name="TopPosition" select="'100'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'PerformClick'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$UniqueId)"/>
          <!--<xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <!-- <xsl:value-of select="incr:GetPartID()"/>-->
          <xsl:value-of select="$PartID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'100'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="$TopPosition"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Collapsed">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="WillExecute">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>
  <!-- End StepConnectionForClickTemplate-->

  <xsl:template  name="menuitemConnectionTemplate_Chrome">
    <xsl:param name="UniqueId" select="'Untitled'"/>
    <xsl:param name="PartID" select="'Untitled'"/>
	<xsl:param name="TopPosition" select="'100'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'PerformClick'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\', $UniqueId)"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="$PartID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'100'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="$TopPosition"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Collapsed">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="WillExecute">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>

  <xsl:template  name="LinkConnectionForClickTemplate_Chrome">

    <xsl:param name="UniqueId" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled1'"/>
    <xsl:param name="PartID" select="'Untitled'"/>
	<xsl:param name="TopPosition" select="'100'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'PerformClick'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$UniqueId)"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="$PartID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'100'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="$TopPosition"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Collapsed">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="WillExecute">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>
  <!-- End StepConnectionForClickTemplate-->
  
  <xsl:template  name="StepConnectionForTypeTemplate_Chrome">
    <xsl:param name="UniqueId" select="'Untitled'"/>
     <xsl:param name="PartID" select="'Untitled'"/>
	 <xsl:param name="TopPosition" select="'100'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'Properties'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$UniqueId)"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="$PartID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'100'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="$TopPosition"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Collapsed">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="WillExecute">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceName">
        <xsl:attribute name="Value">
          <xsl:value-of select="ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>
  <!-- End StepConnectionForTypeTemplate-->

  <xsl:template  name="LinksElementTemplate">
    <xsl:call-template name="LinkElementTemplate"/>
    <xsl:call-template name="DecisionEventLinkTemplateVikas"/>
    <xsl:for-each select="Document/Process/Step">
      <xsl:choose>       
        <xsl:when test="PlayBack--GeneralInfo-Event = 'Click'  or  PlayBack--GeneralInfo-Event = 'Select'">
          <xsl:if test="PlayBack--ControlInfo-Role ='editable text' or 
						PlayBack--ControlInfo-Role ='radio button'  or 
						PlayBack--ControlInfo-Role ='link' or 
						PlayBack--ControlInfo-Role ='check box' or 
						PlayBack--ControlInfo-Role ='list item' or 
						PlayBack--ControlInfo-Role ='push button'">
						<xsl:call-template name="STEPLinkElementTemplate1"/>
          </xsl:if>  
        </xsl:when>

        <xsl:when test="PlayBack--GeneralInfo-Event = 'TypeText' or PlayBack--GeneralInfo-Event = 'TYPETEXT'">
          <xsl:call-template name="STEPTypeTextElementTemplate"/>
        </xsl:when>

      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <!--End LinksElementTemplate-->


  <xsl:template  name="LinkElementTemplate1">
    <xsl:param name="connectableFrom" select="'Untitled'"/>
    <xsl:element name="Link">
      <xsl:attribute name="PartID">
        <xsl:value-of select="incr:GetLinkBlockPartID_Chrome()"/>
      </xsl:attribute>
      <xsl:attribute name="Sensitive">
        <xsl:value-of select="'False'"/>
      </xsl:attribute>
      <xsl:attribute name="Asynchronous">
        <xsl:value-of select="'False'"/>
      </xsl:attribute>
      <xsl:attribute name="LogBeforeExecution">
        <xsl:value-of select="''"/>
      </xsl:attribute>
      <xsl:attribute name="LogAfterExecution">
        <xsl:value-of select="''"/>
      </xsl:attribute>

      <xsl:element name="From">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetFromPartID1_Chrome()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'Raised'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Event'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableEvent-8D7D7F53E9B46DD'"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableEvent-8D7D7F53E9B46DD'"/>
        </xsl:attribute>
      </xsl:element>
      <!--End From-->
      <xsl:element name="To">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetToPartID_Chrome()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'DoWork'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$connectableFrom)"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$connectableFrom)"/>
        </xsl:attribute>
      </xsl:element>
      <!--End To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->

      </xsl:element>
      <!--End LinkPoints-->




    </xsl:element>
    <!--End Link-->
  </xsl:template>
  <!--End LinkElementTemplate-->

  <xsl:template  name="DecisionEventLinkTemplateVikas">
    <xsl:param name="connectableFrom" select="'Untitled'"/>
    <xsl:param name="connectableTO" select="'Untitled111'"/>
    <xsl:element name="DecisionEventLink">
      <xsl:attribute name="PartID">
        <xsl:value-of select="incr:GetLinkBlockPartID_Chrome()"/>
      </xsl:attribute>
      <xsl:attribute name="Sensitive">
        <xsl:value-of select="'False'"/>
      </xsl:attribute>
      <xsl:attribute name="Asynchronous">
        <xsl:value-of select="'False'"/>
      </xsl:attribute>
      <xsl:attribute name="LogBeforeExecution">
        <xsl:value-of select="''"/>
      </xsl:attribute>
      <xsl:attribute name="LogAfterExecution">
        <xsl:value-of select="''"/>
      </xsl:attribute>
      <xsl:element name="From">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetFromPartID1_Chrome()"/>
        </xsl:attribute>
        <xsl:attribute name="ParentMemberName">
          <xsl:value-of select="'Result'"/>
        </xsl:attribute>
        <xsl:attribute name="DecisionValue">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$connectableFrom)"/>
        </xsl:attribute>
      </xsl:element>
      <!--End From-->
      <xsl:element name="To">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetToPartID_Chrome()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'DoWork'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$connectableTO)"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$connectableTO)"/>
        </xsl:attribute>
      </xsl:element>
      <!--End To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->

      </xsl:element>
      <!--End LinkPoints-->
    </xsl:element>
    <!--End DecisionEventLink-->
  </xsl:template>
  <!--End DecisionEventLinkTemplate-->

  <xsl:template  name="STEPLinkElementTemplate1">
    <xsl:param name="connectableFrom" select="'Untitled'"/>
    <xsl:param name="connectableTO" select="'Untitled111'"/>
    <xsl:variable name="methodConne" select="concat('Automator-8D7D7F4EA4A6A52\',$connectableFrom)" />    
    <!-- Ex: Val is 1-->
    <xsl:variable name="propertyConne" select="concat('Automator-8D7D7F4EA4A6A52\',$connectableTO)" />
    <!-- Ex: Then val should be next of Val is Chrome 2-->
    <xsl:element name="Link">
    
      <xsl:attribute name="PartID">
        <xsl:value-of select="incr:GetLinkBlockPartID_Chrome()"/>
        <!-- Done-->
      </xsl:attribute>
      <xsl:attribute name="Sensitive">
        <xsl:value-of select="'False'"/>
      </xsl:attribute>
      <xsl:attribute name="Asynchronous">
        <xsl:value-of select="'False'"/>
      </xsl:attribute>
      <xsl:attribute name="LogBeforeExecution">
        <xsl:value-of select="''"/>
      </xsl:attribute>
      <xsl:attribute name="LogAfterExecution">
        <xsl:value-of select="''"/>
      </xsl:attribute>
      <xsl:element name="From">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetFromPartID1_Chrome()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'Complete'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Event'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="$methodConne"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="$methodConne"/>
        </xsl:attribute>
      </xsl:element>
      <!--End From-->
      <xsl:element name="To">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetToPartID_Chrome()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'DoWork'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="$propertyConne"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="$propertyConne"/>
        </xsl:attribute>
      </xsl:element>
      <!--End To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
      </xsl:element>
      <!--End LinkPoints-->
    </xsl:element>
    <!--End Link-->
  </xsl:template>
  <!--End LinkElementTemplate-->

  <xsl:template  name="STEPTypeTextElementTemplate">
    <xsl:variable name="methodConne" select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableMethods_Chrome())" />   
    <xsl:variable name="propertyConne" select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableMethods2_Chrome())" />
    <xsl:element name="Link">
      <xsl:attribute name="PartID">
        <xsl:value-of select="incr:GetLinkBlockPartID_Chrome()"/>
      </xsl:attribute>
      <xsl:attribute name="Sensitive">
        <xsl:value-of select="'False'"/>
      </xsl:attribute>
      <xsl:attribute name="Asynchronous">
        <xsl:value-of select="'False'"/>
      </xsl:attribute>
      <xsl:attribute name="LogBeforeExecution">
        <xsl:value-of select="''"/>
      </xsl:attribute>
      <xsl:attribute name="LogAfterExecution">
        <xsl:value-of select="''"/>
      </xsl:attribute>
      <xsl:element name="From">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetFromPartID1_Chrome()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'Complete'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Event'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="$methodConne"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="$propertyConne"/>
        </xsl:attribute>
      </xsl:element>
      <!--End From-->
      <xsl:element name="To">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetToPartID_Chrome()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'DoWork'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="$propertyConne"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="$propertyConne"/>
        </xsl:attribute>
      </xsl:element>
      <!--End To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>
        <!--End Point-->
      </xsl:element>
      <!--End LinkPoints-->
    </xsl:element>
    <!--End Link-->
  </xsl:template>
  <!--End LinkElementTemplate-->

  <xsl:template name="ConnectableMethodForTextTemplate_Chrome">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:variable name="methodConne1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'PerformClick'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ExceptionsHandled">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceTypeName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Controls.TextBox'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',concat(PlayBack--AdditionalInfo-Web_ID,Step-ID))"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MemberDetails">
        <xsl:attribute name="Value">
          <xsl:value-of select="'.PerformClick() Method'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ParamsLength">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="SerializedParamsDefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MemberPrototypes'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Automation.MemberPrototype">
            <xsl:element name="MemberName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'PerformClick'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Method'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.Void'"/>
              </xsl:attribute>
            </xsl:element>
            <!--TypeName-->
            <xsl:element name="Content">
              <xsl:attribute name="Name">
                <xsl:value-of select="'Signature'"/>
              </xsl:attribute>
              <xsl:element name="OpenSpan.Automation.MethodSignature">
                <xsl:element name="ReturnType">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="'System.Void'"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:element>
            <!--Content-->
          </xsl:element>
          <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>
        <!--Items-->
      </xsl:element>
      <!--Content-->
    </xsl:element>
    <!-- OpenSpan.Automation.ConnectableMethod-->
  </xsl:template>

  <xsl:template name="ConnectableMethodTemplateButton_Chrome">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:variable name="methodConne1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'PerformClick'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ExceptionsHandled">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceTypeName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Controls.BasicButton'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',concat(PlayBack--AdditionalInfo-Web_Name,Step-ID))"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MemberDetails">
        <xsl:attribute name="Value">
          <xsl:value-of select="'.PerformClick() Method'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ParamsLength">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="SerializedParamsDefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MemberPrototypes'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Automation.MemberPrototype">
            <xsl:element name="MemberName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'PerformClick'"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Method'"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.Void'"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:element name="Content">
              <xsl:attribute name="Name">
                <xsl:value-of select="'Signature'"/>
              </xsl:attribute>
              <xsl:element name="OpenSpan.Automation.MethodSignature">
                <xsl:element name="ReturnType">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="'System.Void'"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:element>
          </xsl:element>
        </xsl:element>
        <!--Items-->
      </xsl:element>
      <!--Content-->
    </xsl:element>
    <!-- OpenSpan.Automation.ConnectableMethod-->
  </xsl:template>
  
  
  <xsl:template name="ConnectablePropertiesTemplate_Chrome">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:variable name="methodConne1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableProperties">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Text=',PlayBack--ControlInfo-ControlData)"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'Properties'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ExceptionsHandled">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceTypeName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Controls.TextBox'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',$InstanceName)"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MemberDetails">
        <xsl:attribute name="Value">
          <xsl:value-of select="'.Text Property'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MemberPrototypes'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Automation.MemberPrototype">
            <xsl:element name="MemberName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Text'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Property'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.String'"/>
              </xsl:attribute>
            </xsl:element>
            <!--TypeName-->
          </xsl:element>
          <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>
        <!--Items-->
      </xsl:element>
      <!--Content-->
    </xsl:element>
    <!-- OpenSpan.Automation.ConnectableMethod-->
  </xsl:template>


  <xsl:template name="CheckBoxConnectionTemplate">
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'Check'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableUniqueId_Chrome())"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="incr:GetConnectionBlockPartID_Chrome()"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'680'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="'220'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Collapsed">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="WillExecute">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->

  </xsl:template>

  <xsl:template name="DropDownConnectableMethod_Chrome1">
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'SelectItemByText'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableUniqueId_Chrome())"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="incr:GetConnectionBlockPartID_Chrome()"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'680'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="'220'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Collapsed">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="WillExecute">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
      <Fittings>
        <Result Collapsed="False" ActualText="Result" />
      </Fittings>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>


  <xsl:template name="CheckBoxConnectableMethod_Chrome">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:variable name="methodConne1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'Check'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ExceptionsHandled">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceTypeName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Controls.CheckBox'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',concat(PlayBack--AdditionalInfo-Web_ID,Step-ID))"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MemberDetails">
        <xsl:attribute name="Value">
          <xsl:value-of select="'.Check() Method'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ParamsLength">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="SerializedParamsDefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MemberPrototypes'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Automation.MemberPrototype">
            <xsl:element name="MemberName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Check'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Method'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.Void'"/>
              </xsl:attribute>
            </xsl:element>
            <!--TypeName-->
            <xsl:element name="Content">
              <xsl:attribute name="Name">
                <xsl:value-of select="'Signature'"/>
              </xsl:attribute>
              <xsl:element name="OpenSpan.Automation.MethodSignature">
                <xsl:element name="ReturnType">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="'System.Void'"/>
                  </xsl:attribute>
                </xsl:element>
                <!-- ReturnType-->
              </xsl:element>
              <!--OpenSpan.Automation.MethodSignature-->
            </xsl:element>
            <!--Content-->
          </xsl:element>
          <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>
        <!--Items-->
      </xsl:element>
      <!--Content-->
    </xsl:element>
    <!-- OpenSpan.Automation.ConnectableMethod-->

  </xsl:template>

  <xsl:template name="RadioBtnConnectableMethod_Chrome">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:variable name="methodConne1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'Check'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ExceptionsHandled">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceTypeName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Controls.RadioButton'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',concat(PlayBack--AdditionalInfo-Web_ID,Step-ID))"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MemberDetails">
        <xsl:attribute name="Value">
          <xsl:value-of select="'.Check() Method'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ParamsLength">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="SerializedParamsDefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MemberPrototypes'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Automation.MemberPrototype">
            <xsl:element name="MemberName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Check'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Method'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.Void'"/>
              </xsl:attribute>
            </xsl:element>
            <!--TypeName-->
            <xsl:element name="Content">
              <xsl:attribute name="Name">
                <xsl:value-of select="'Signature'"/>
              </xsl:attribute>
              <xsl:element name="OpenSpan.Automation.MethodSignature">
                <xsl:element name="ReturnType">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="'System.Void'"/>
                  </xsl:attribute>
                </xsl:element>
                <!-- ReturnType-->
              </xsl:element>
              <!--OpenSpan.Automation.MethodSignature-->
            </xsl:element>
            <!--Content-->
          </xsl:element>
          <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>
        <!--Items-->
      </xsl:element>
      <!--Content-->
    </xsl:element>
    <!-- OpenSpan.Automation.ConnectableMethod-->

  </xsl:template>

  
  <xsl:template name="LinkConnectableMethod_Chrome">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:variable name="methodConne1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'PerformClick'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ExceptionsHandled">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceTypeName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Controls.Link'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',concat(PlayBack--ControlInfo-ControlName,Step-ID))"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MemberDetails">
        <xsl:attribute name="Value">
          <xsl:value-of select="'.PerformClick() Method'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ParamsLength">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="SerializedParamsDefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MemberPrototypes'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Automation.MemberPrototype">
            <xsl:element name="MemberName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'PerformClick'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Method'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.Void'"/>
              </xsl:attribute>
            </xsl:element>
            <!--TypeName-->
            <xsl:element name="Content">
              <xsl:attribute name="Name">
                <xsl:value-of select="'Signature'"/>
              </xsl:attribute>
              <xsl:element name="OpenSpan.Automation.MethodSignature">
                <xsl:element name="ReturnType">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="'System.Void'"/>
                  </xsl:attribute>
                </xsl:element>
                <!-- ReturnType-->
              </xsl:element>
              <!--OpenSpan.Automation.MethodSignature-->
            </xsl:element>
            <!--Content-->
          </xsl:element>
          <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>
        <!--Items-->
      </xsl:element>
      <!--Content-->
    </xsl:element>
    <!-- OpenSpan.Automation.ConnectableMethod-->

  </xsl:template>
  
  
  <xsl:template name="DropDownConnectableMethod_Chrome">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:variable name="methodConne1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'SelectItemByText'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ExceptionsHandled">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceTypeName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Controls.Select'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',concat(PlayBack--AdditionalInfo-Web_ID,Step-ID))"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MemberDetails">
        <xsl:attribute name="Value">
          <xsl:value-of select="'.SelectItemByText() Method'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ParamsLength">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="SerializedParamsDefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'DynamicMembers'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <OpenSpan.DynamicMembers.DynamicPropertyInfo dynamicType="Property" name="Result" canRead="True" canWrite="False" type="System.Boolean" aliasName="Result" shouldSerialize="False" visibility="DefaultOn" source="" blockTypeName="" />
        </xsl:element>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MemberPrototypes'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Automation.MemberPrototype">
            <xsl:element name="MemberName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'SelectItemByText'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Method'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.Void'"/>
              </xsl:attribute>
            </xsl:element>
            <!--TypeName-->
            <xsl:element name="Content">
              <xsl:attribute name="Name">
                <xsl:value-of select="'Signature'"/>
              </xsl:attribute>
              <xsl:element name="OpenSpan.Automation.MethodSignature">
                <xsl:element name="ReturnType">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="'System.Boolean'"/>
                  </xsl:attribute>
                </xsl:element>
                <!-- ReturnType-->

                <Content Name="ParameterPrototype">
                  <Items>
                    <OpenSpan.Automation.ParameterPrototype>
                      <CanRead Value="False" />
                      <CanWrite Value="True" />
                      <DefaultSet Value="True" />
                      <xsl:element name="DefaultValue">
                        <xsl:attribute name="Value">
                          <xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
                        </xsl:attribute>
                      </xsl:element>
                      <!-- DefaultValue-->
                      <ParamName Value="text" />
                      <Position Value="0" />
                      <TypeName Value="System.String" />
                    </OpenSpan.Automation.ParameterPrototype>
                  </Items>
                </Content>
              </xsl:element>
              <!--OpenSpan.Automation.MethodSignature-->
            </xsl:element>
            <!--Content-->
          </xsl:element>
          <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>
        <!--Items-->
      </xsl:element>
      <!--Content-->
    </xsl:element>
    <!-- OpenSpan.Automation.ConnectableMethod-->

  </xsl:template>

  <xsl:template name="ConnectableMethodTemplateArea_Chrome">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:variable name="methodConne1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'PerformClick'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ExceptionsHandled">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceTypeName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.Controls.TextArea'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',concat(PlayBack--AdditionalInfo-Web_ID,Step-ID))"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MemberDetails">
        <xsl:attribute name="Value">
          <xsl:value-of select="'.PerformClick() Method'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ParamsLength">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="SerializedParamsDefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MemberPrototypes'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Automation.MemberPrototype">
            <xsl:element name="MemberName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'PerformClick'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Method'"/>
              </xsl:attribute>
            </xsl:element>
            <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.Void'"/>
              </xsl:attribute>
            </xsl:element>
            <!--TypeName-->
            <xsl:element name="Content">
              <xsl:attribute name="Name">
                <xsl:value-of select="'Signature'"/>
              </xsl:attribute>
              <xsl:element name="OpenSpan.Automation.MethodSignature">
                <xsl:element name="ReturnType">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="'System.Void'"/>
                  </xsl:attribute>
                </xsl:element>
                <!-- ReturnType-->
              </xsl:element>
              <!--OpenSpan.Automation.MethodSignature-->
            </xsl:element>
            <!--Content-->
          </xsl:element>
          <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>
        <!--Items-->
      </xsl:element>
      <!--Content-->
    </xsl:element>
    <!-- OpenSpan.Automation.ConnectableMethod-->
  </xsl:template>


  <xsl:template name="ActivateConnectableMethod_Chrome">
    <xsl:param name="connectableID" select="'Untitled'"/>
    <xsl:param name="Title" select="'Untitled'"/>
    <xsl:variable name="connectableID1" select="incr:connectableMethods_Chrome()" />
    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$connectableID"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$connectableID"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="$Title"/>
        </xsl:attribute>
      </xsl:element>
      <DisplayName Value="ActivateWindow" />
      <ExceptionsHandled Value="False" />
      <InstanceTypeName Value="OpenSpan.Adapters.Web.WebBase.Controls.WebPage" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('UniversalWebAdapter-8D8111E06B38B04\',incr:removeSpaces_Chrome($Title))"/>
        </xsl:attribute>
      </xsl:element>
      <MemberDetails Value=".ActivateWindow() Method" />
      <ParamsLength Value="0" />
      <SerializedParamsDefaultValues Value="" />
      <Content Name="MemberPrototypes">
        <Items>
          <OpenSpan.Automation.MemberPrototype>
            <MemberName Value="ActivateWindow" />
            <MemberType Value="Method" />
            <TypeName Value="System.Boolean" />
            <Content Name="Signature">
              <OpenSpan.Automation.MethodSignature>
                <ReturnType Value="System.Boolean" />
              </OpenSpan.Automation.MethodSignature>
            </Content>
          </OpenSpan.Automation.MemberPrototype>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
<!--End of stylesheet-->
