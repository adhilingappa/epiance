<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:my="my:my"  xmlns:incr="urn:my-scripts" exclude-result-prefixes="msxsl" >
  <msxsl:script implements-prefix='incr' language='CSharp'>
 <![CDATA[
   int l=0;
   int m=0;
   int n=0;
   int o=0;
   int q=0;
   int r=0;
   string[] txtBoxList= new string[]{"TextBox-8D7D7F52A304201","TextBox-8D7D7F52A304202","TextBox-8D7D7F52A304203"};
   
   string[] InputTypeMatchRuleList=new string[]{"8D7D71ADC0F1ACD","8D7D71ADC0F1ACE","8D7D71ADC0F1ACF","8D7D71ADC0F1ACG"};
   string[] ElementIdMatchRuleList=new string[]{"8D7D71ADC5A258E","8D7D71ADC5A258F","8D7D71ADC5A258G","8D7D71ADC5A258H"};
   string[] elementIdMatchRuleLists = new string[]{"elementIdMatchRule1","elementIdMatchRule2","elementIdMatchRule3","elementIdMatchRule3"};
   string[] inputTypeMatchRuleLists = new string[]{"inputTypeMatchRule1","inputTypeMatchRule2","inputTypeMatchRule3","inputTypeMatchRule4"};
   
   
   public string GetinputTypeMatchRuleLists()
    {
      String gi = inputTypeMatchRuleLists[r];
        r++;
        return gi;

    } 
     public string GettxtBox()
    {
      String gi = txtBoxList[l];
        l++;
        return gi;

    } 
     public string GetelementIdMatchRule()
    {
      String gi = elementIdMatchRuleLists[q];
        q++;
        return gi;

    } 
    public string GettxtBox1()
    {
      String gi = txtBoxList[m];
        m++;
        return gi;

    } 
    
    public string GetInputTypeMatchRule()
    {
      String gi = InputTypeMatchRuleList[n];
        n++;
        return gi;

    } 
    
    public string GetElementIdMatchRule()
    {
      String gi = ElementIdMatchRuleList[o];
        o++;
        return gi;

    } 
         ]]>
    </msxsl:script>

  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
  <xsl:variable name="true">True</xsl:variable>
  <xsl:variable name="text">text</xsl:variable>
  <xsl:variable name="false">False</xsl:variable>
  <xsl:variable name="centerClick">UIAClickCentre</xsl:variable>
  <xsl:variable name="newtext">newtext</xsl:variable>
  <xsl:variable name="id">5ab285c7-408c-4d6b-a622-555035c5c546</xsl:variable>
  <xsl:variable name="linkFirstId">cff3d686-8313-4f5c-b984-0741f7520ab1</xsl:variable>

  <xsl:template match="/">
    <OpenSpanDesignDocument Version="19.1.0.1" Serializer="2.0" Culture="en-IN">
      <ComponentInfo>
        <Type Value="OpenSpan.Adapters.Web.WebAdapter" />
        <Assembly Value="OpenSpan.Adapters.Web" />
        <AssemblyReferences>
          <Assembly Value="mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
          <Assembly Value="OpenSpan, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters.ActiveX, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters.Web, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters.Windows, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters.WinInet, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.ApplicationFramework, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
        </AssemblyReferences>
        <DynamicAssemblyReferences />
        <FileReferences>
          <File Value="OpenSpan.WinInet.x32.dll" />
          <File Value="OpenSpan.WinInet.x64.dll" />
        </FileReferences>
        <BuildReferences>
          <File Value="DefaultWindowFactoryConfiguration.xml" />
          <File Value="openspan.ini" />
          <File Value="OpenSpan.Translators.InternetExplorer.x32.dll" />
          <File Value="OpenSpan.Translators.InternetExplorer.x64.dll" />
          <File Value="OpenSpan.WinInet.x32.dll" />
          <File Value="OpenSpan.WinInet.x64.dll" />
          <File Value="OpenSpan.x32.sys" />
          <File Value="OpenSpan.x64.sys" />
          <File Value="Pega.ActiveX.x32.dll" />
          <File Value="Pega.ActiveX.x64.dll" />
          <File Value="Pega.GlobalAllocator.x32.dll" />
          <File Value="Pega.GlobalAllocator.x64.dll" />
          <File Value="Pega.Native.Remoting.x32.dll" />
          <File Value="Pega.Native.Remoting.x64.dll" />
          <File Value="Pega.Scout.x32.dll" />
          <File Value="Pega.Scout.x64.dll" />
          <File Value="Pega.Security.x32.dll" />
          <File Value="Pega.Security.x64.dll" />
          <File Value="Pega.SharedMemory.x32.dll" />
          <File Value="Pega.SharedMemory.x64.dll" />
          <File Value="Pega.Sinon.x32.dll" />
          <File Value="Pega.Sinon.x64.dll" />
          <File Value="Pega.Utilities.x32.dll" />
          <File Value="Pega.Utilities.x64.dll" />
          <File Value="Pega.WER.x32.dll" />
          <File Value="Pega.WER.x64.dll" />
          <File Value="Pega.Windows.Broker.x32.dll" />
          <File Value="Pega.Windows.Broker.x64.dll" />
          <File Value="Pega.WinQueue.x32.dll" />
          <File Value="Pega.WinQueue.x64.dll" />
        </BuildReferences>
      </ComponentInfo>
      <Component Version="1.0">
        <OpenSpan.Adapters.Web.WebAdapter Name="Web Application1" Id="WebAdapter-8D7D7F4F1DE848D">
          <StartPage Value="C:\Users\Vikas\Desktop\Mock Applications\LicenseRequest.htm" />
          <Content Name="Controls">
            <Items>
              <OpenSpan.Adapters.ActiveX.ActiveXFactory Name="ActiveXFactory" Id="ActiveXFactory-8D7D7F511BD404D">
                <DummyPropertyToDetectReplaceUndo Value="0" />
                <ForwardObjectExplorerEvent Value="True" />
                <MatchingIndex Value="0" />
                <TargetTypeString Value="OpenSpan.Adapters.Windows.WindowsModule, OpenSpan.Adapters.Windows" />
                <UseKeys Value="True" />
                <Content Name="MatchRules">
                  <Items>
                    <OpenSpan.Adapters.Windows.MatchRules.ModuleNameMatchRule Name="moduleNameMatchRule1" Id="ModuleNameMatchRule-8D7D71AC2C59243">
                      <Text Value="Simple|True|(User Culture)|ole32.dll" />
                    </OpenSpan.Adapters.Windows.MatchRules.ModuleNameMatchRule>
                  </Items>
                </Content>
              </OpenSpan.Adapters.ActiveX.ActiveXFactory>
          <OpenSpan.Adapters.WinInet.WinInetFactory Name="WinInetFactory" Id="WinInetFactory-8D7D71AC3EA597C">
            <DummyPropertyToDetectReplaceUndo Value="0" />
            <ForwardObjectExplorerEvent Value="True" />
            <MatchingIndex Value="0" />
            <TargetTypeString Value="OpenSpan.Adapters.Windows.WindowsModule, OpenSpan.Adapters.Windows" />
            <UseKeys Value="True" />
            <Content Name="MatchRules">
              <Items>
                <OpenSpan.Adapters.Windows.MatchRules.ModuleNameMatchRule Name="moduleNameMatchRule2" Id="ModuleNameMatchRule-8D7D71AC3F7C464">
                  <Text Value="Simple|True|(User Culture)|wininet.dll" />
                </OpenSpan.Adapters.Windows.MatchRules.ModuleNameMatchRule>
              </Items>
            </Content>
          </OpenSpan.Adapters.WinInet.WinInetFactory>
          <OpenSpan.Adapters.Web.MicrosoftHTMLFactory Name="MicrosoftHTMLFactory" Id="MicrosoftHTMLFactory-8D7D71ACA1D804D">
            <DummyPropertyToDetectReplaceUndo Value="0" />
            <ForwardObjectExplorerEvent Value="True" />
            <MatchingIndex Value="0" />
            <TargetTypeString Value="OpenSpan.Adapters.Windows.WindowsModule, OpenSpan.Adapters.Windows" />
            <UseKeys Value="True" />
            <Content Name="MatchRules">
              <Items>
                <OpenSpan.Adapters.Windows.MatchRules.ModuleNameMatchRule Name="moduleNameMatchRule3" Id="ModuleNameMatchRule-8D7D71ACA3BDB1B">
                  <Text Value="Simple|True|(User Culture)|mshtml.dll" />
                </OpenSpan.Adapters.Windows.MatchRules.ModuleNameMatchRule>
              </Items>
            </Content>
          </OpenSpan.Adapters.Web.MicrosoftHTMLFactory>
          <OpenSpan.Adapters.Web.Controls.WebPage Name="Product_Request" Id="WebPage-8D7D7F52A6B3181">
            <DummyPropertyToDetectReplaceUndo Value="0" />
            <ForwardObjectExplorerEvent Value="True" />
            <IsGlobal Value="True" />
            <MatchingIndex Value="1" />
            <TargetTypeString Value="OpenSpan.Adapters.Web.HtmlDocument, OpenSpan.Adapters.Web" />
            <Content Name="Controls">
              <Items>
                <OpenSpan.Adapters.Web.Controls.Form Name="ABC_corp_product_license_request_fo" Id="Form-8D7D71ADBAADF1C">
                  <DummyPropertyToDetectReplaceUndo Value="0" />
                  <ForwardObjectExplorerEvent Value="True" />
                  <MatchingIndex Value="0" />
                  <TagName Value="FORM" />
                  <TargetTypeString Value="OpenSpan.Adapters.Web.HtmlFormElement, OpenSpan.Adapters.Web" />
                  <UseElementId Value="False" />
                  <Content Name="Controls">
                    <Items>
                      <xsl:for-each select="Document/Process/Step">
                        <xsl:choose>
                          <xsl:when test="Event = 'Click'">
                            <xsl:call-template name="ElementTemplate"/>
                          </xsl:when>
                        </xsl:choose>
                       <!-- <xsl:choose>
                          <xsl:when test="Event = 'TypeText'">
                            <xsl:call-template name="ElementTemplate1"/>
                          </xsl:when>
                        </xsl:choose>-->
                      </xsl:for-each>
                    </Items>
                  </Content>
                  <Content Name="MatchRules">
                    <Items>
                      <OpenSpan.Adapters.Web.MatchRules.FormMethodMatchRule Name="formMethodMatchRule1" Id="FormMethodMatchRule-8D7D71ADBE15342">
                        <Method Value="Get" />
                      </OpenSpan.Adapters.Web.MatchRules.FormMethodMatchRule>
                    </Items>
                  </Content>
                </OpenSpan.Adapters.Web.Controls.Form>
              </Items>
            </Content>

            <Content Name="MatchRules">
              <Items>
                <OpenSpan.Adapters.Web.MatchRules.DocumentUrlMatchRule Name="documentUrlMatchRule1" Id="DocumentUrlMatchRule-8D7D71ADBC44AC9">
                  <Fragment Value="Simple|True|(User Culture)|" />
                  <Host Value="Simple|True|(User Culture)|" />
                  <Path Value="Simple|True|(User Culture)|C:/Users/Vikas/Desktop/Mock%20Applications/LicenseRequest.htm" />
                  <Port Value="-1" />
                  <Query Value="Simple|True|(User Culture)|" />
                  <Scheme Value="Simple|True|(User Culture)|file" />
                </OpenSpan.Adapters.Web.MatchRules.DocumentUrlMatchRule>
                <OpenSpan.Adapters.Web.MatchRules.DocumentTitleMatchRule Name="documentTitleMatchRule1" Id="DocumentTitleMatchRule-8D7D71ADBCA9B27">
                  <Text Value="Simple|True|(User Culture)|Product Request" />
                </OpenSpan.Adapters.Web.MatchRules.DocumentTitleMatchRule>
              </Items>
            </Content>
          </OpenSpan.Adapters.Web.Controls.WebPage>
          </Items>
          </Content>
        </OpenSpan.Adapters.Web.WebAdapter>
      </Component>
    </OpenSpanDesignDocument>
  </xsl:template>

  <xsl:template  name="ElementTemplate">
    <xsl:element name="OpenSpan.Adapters.Web.Controls.TextBox">
      
        <xsl:attribute name="Name">
          <xsl:value-of select="ControlName"/>
        </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="incr:GettxtBox()"/>
      </xsl:attribute>
      
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack/ControlInfo/@IEControlID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="'1'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TagName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'INPUT'"/>
        </xsl:attribute>
      </xsl:element>
      
      
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlInputTextElement, OpenSpan.Adapters.Web'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="UseElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MatchRules'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.InputTypeMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/> 
            </xsl:attribute>
            <xsl:attribute name="Id"> 
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>           
            </xsl:attribute>
            <xsl:element name="Type">
              <xsl:attribute name="Value">
                <xsl:value-of select="Type"/>
              </xsl:attribute>
            </xsl:element>        
            
          </xsl:element> <!-- OpenSpan.Adapters.Web.MatchRules.InputTypeMatchRule-->
          
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementIdMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetelementIdMatchRule()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
            </xsl:attribute>
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack/ControlInfo/@IEControlID)"/>
              </xsl:attribute>
            </xsl:element>        
            
          </xsl:element> <!-- OpenSpan.Adapters.Web.MatchRules.InputTypeMatchRule-->
          
          
          
        </xsl:element> <!-- ITEMS-->
        
      </xsl:element>
     </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>
  <xsl:template  name="ElementTemplate1">
    <xsl:element name="OpenSpan.Adapters.Web.Controls.TextBox">
      
        <xsl:attribute name="Name">
          <xsl:value-of select="ControlName"/>
        </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="'TextBox-8D7D71ADB8431AA'"/>
      </xsl:attribute>
      
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="'partnerName'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="'1'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TagName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'INPUT'"/>
        </xsl:attribute>
      </xsl:element>     
      
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlInputTextElement, OpenSpan.Adapters.Web'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="UseElementId">
        <xsl:attribute name="Value4">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MatchRules'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.InputTypeMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/> 
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <xsl:element name="Type">
              <xsl:attribute name="Value6">
                <xsl:value-of select="'partnerName'"/>
              </xsl:attribute>
            </xsl:element>        
            
          </xsl:element> <!-- OpenSpan.Adapters.Web.MatchRules.InputTypeMatchRule-->
          
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementIdMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetelementIdMatchRule()"/>
            </xsl:attribute>
            <xsl:attribute name="Id"> 
              <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
           
            </xsl:attribute>
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Simple|True|(User Culture)|partnerName'"/>
              </xsl:attribute>
            </xsl:element>        
            
          </xsl:element> <!-- OpenSpan.Adapters.Web.MatchRules.InputTypeMatchRule-->
          
          
          
        </xsl:element> <!-- ITEMS-->
        
      </xsl:element>
     </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>
  <xsl:template  name="ClickElementTemplate1">    
      <xsl:element name="ConnectionBlock">
        <xsl:element name="DisplayName">
          <xsl:attribute name="Value">
            <xsl:value-of select="'Properties'"/>
          </xsl:attribute>
        </xsl:element>         
        <xsl:element name="ConnectableUniqueId">
          <xsl:attribute name="Value">
            <xsl:value-of select="ffgfgfg"/>
          </xsl:attribute>
        </xsl:element>         
        <xsl:element name="PartID">
          <xsl:attribute name="Value">
            <xsl:value-of select="'incr:GetPartID3()'"/>
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
            <xsl:value-of select="ControlName"/> 
          </xsl:attribute>
        </xsl:element>        
        <xsl:element name="OverriddenIds">    </xsl:element> 
      </xsl:element> <!-- ConnectionBlock-->   
  </xsl:template>

</xsl:stylesheet>