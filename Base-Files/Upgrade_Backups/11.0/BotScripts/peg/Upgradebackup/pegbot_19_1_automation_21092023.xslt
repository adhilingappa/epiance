<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:my="my:my"  xmlns:incr="urn:my-scripts" exclude-result-prefixes="msxsl" >
  <msxsl:script implements-prefix='incr' language='CSharp'>
    
    <![CDATA[ 
     int a=0;
     int b=0;
     int c=0;
     int d=0;
     int e=0;
     int f=0;
     int g=0;
     int h=0;
     int i=0;
     int j=0;
     int k=0;
     int l=0;
     int m=0;
    
    string[] ConnectionBlockPartIDLIst = new string[]{"3","4","5","6","7","8","10","11"};
   
    string[] LinkPartIDLIst = new string[]{"13","14","15","16","17","18","19","20"};
    
    string[] FromPartIDLIst = new string[]{"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"};
    
    string[] ToPartIDLIst = new string[]{"2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"};
    
    string[] txtBoxList= new string[]{"TextBox-8D7D7F52A304201","TextBox-8D7D7F52A304202","TextBox-8D7D7F52A304203"};
   
   string[] connectableMethodsList = new string[]{
              "connectableMethod2",
              "connectableMethod3",
              "connectableMethod4",
              "connectableMethod5",
              "connectableMethod6",
              "connectableMethod7",
              "connectableMethod8",
              "connectableMethod9",
              "connectableMethod10",
              "connectableMethod11",

};  
 public string GettxtBox1()
    {
      String gi = txtBoxList[m];
        m++;
        return gi;

    }
    
string[] connectablePropertiesLists = new string[]{
        "connectableProperties1",
        "connectableProperties2",
        "connectableProperties3",
        "connectableProperties4",
        "connectableProperties5",
        "connectableProperties6",
        "connectableProperties7",
        "connectableProperties8",
        "connectableProperties9",
};
       
public string GettxtBox()
{
     String gi = txtBoxList[l];
       l++;
       return gi;

}  
public string GetconnectablePropertiess()
{
     String gi = connectablePropertiesLists[i];
       i++;
       return gi;

} 
    public string connectableMethods()
    {
      String gi = connectableMethodsList[h];
      h++;
      return gi;

    }
    public string GetConnectionBlockPartID()
    {
        String gi = ConnectionBlockPartIDLIst[a];
        a++;
        return gi;
    }  
    
    public string GetLinkPartID()
    {
        String gi = LinkPartIDLIst[b];
        b++;
        return gi;
    }
    
    public string GetFromPartID()
    {
        String gi = FromPartIDLIst[c];
        c++;
        return gi;
    }
    
    public string GetToPartID()
    {
        String gi = ToPartIDLIst[d];
        d++;
        return gi;
    }
   

    string[] ConnectablePropertiesLIst = new string[]{
    "ConnectableProperties-8D7D7F562F7FB90",
    "ConnectableProperties-8D7D7F562F7FB90",
    "ConnectableProperties-8D7D7F56CF5D5D4","15","16","17","18","19","20","21"};
    
    string[] GetConnectableMethodsLIst = new string[]{
    "ConnectableMethod-8D7D7F55E0BE44F",
     "ConnectableMethod-8D7D7F5686537CA",
    "ConnectableMethod-8D7D7F5686537CA",
    "ConnectableMethod-8D7D7F5686537CA",
    "ConnectableMethod-8D7D7F55E0BE44F",
    "ConnectableMethod-8D7D7F54818627F",
    "ConnectableMethod-8D7D7F55E0BE44F",
    "15","16","17","18","19","20","21"};
  
  

    string[] GetConnectableUniqueIdLIst = new string[]{"ConnectableMethod-8D7D7F55E0BE44F","ConnectableProperties-8D7D7F562F7FB90","ConnectableMethod-8D7D7F5686537CA","ConnectableProperties-8D7D7F56CF5D5D4","ConnectableMethod-8D7D7F54818628F","ConnectableProperties-8D7DA479ADE280F","sdf","fgfg","sdf","fgfg","sdf","fgfg","sdf","fgfg","sdf","fgfg"};
    string[] GetConnectablePropertiesList = new string[]{"ConnectableProperties-8D7DA477655694C","ConnectableProperties-8D7DA4787271E56","ConnectableProperties-8D7DA479ADE280F"};
    string[] GetConnectableMethodsLIst1 = new string[]{"ConnectableMethod-8D7D7F55E0BE44F","ConnectableMethod-8D7D7F5686537CA","ConnectableMethod-8D7D7F54818628F","ConnectableMethod-8D7D7F55E0BE44F","15","16","17","18","19","20","21"};
  
    public string GetConnectableProperties()
    {
        String gi = ConnectablePropertiesLIst[e];
        e++;
        return gi;
    }
    
    public string GetConnectableProperties1()
    {
        String gi = GetConnectablePropertiesList[j];
        j++;
        return gi;
    }
    public string GetConnectableMethodsLIst11()
    {
        String gi = GetConnectableMethodsLIst1[k];
        k++;
        return gi;
    }
    
    public string GetConnectableMethods()
    {
        String gi = GetConnectableMethodsLIst[f];
        f++;
        return gi;
    }
    public string GetConnectableUniqueId()
    {
        String gi = GetConnectableUniqueIdLIst[g];
        g++;
        return gi;
    }
    
string[] GetConnectableUniqueIdLIstVikas = new string[]{
"ConnectableMethod-8D7DA4768D8B65C",
"ConnectableProperties-8D7DA477655694C",
"ConnectableMethod-8D7D7F55E0BE44F", 
"ConnectableProperties-8D7DA4787271E56",
"ConnectableMethod-8D7DA4794587FE1",
"ConnectableProperties-8D7DA479ADE280F",
"vi7",
"ConnectableProperties-vi8",
"vi9",
"vi10",
"vi11",
"vi11"};

int vik=0; int vik1=3;  int vikConn=0; int vikName=0; int vik2=2;

    public string GetConnectableMethodsVikas()
    {
        String gi = GetConnectableUniqueIdLIstVikas[vik];
        vik++;
        return gi;
    }
    
    public string GetConnectableMethodsVikas1()
    {
        String gi = GetConnectableUniqueIdLIstVikas[vik1];
        vik1++;
        return gi;
    }
    
    public string GetConnectableMethodsTO()
    {
        String gi = GetConnectableUniqueIdLIstVikas[vik2];
        vik2++;
        return gi;
    }
    
    public string GetConnectableMethodsVikasConnection()
    {
         String gi = GetConnectableUniqueIdLIstVikas[vikConn];
         vikConn++;
         return gi;
    }
    
    public string GetConnectableMethodsVikasName()
    {
         String gi = GetConnectableUniqueIdLIstVikas[vikName];
        vikName++;
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
  </xsl:template> <!--End of template match-->
  
  
  
<!--***********************************************************-->
  <xsl:template  name="AutomationDocumentTemplate"> <!-- elementTemplate Start-->
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
            <xsl:call-template name="WaitElementTemplate"/>
             <xsl:for-each select="Document/Process/Step">
               <xsl:choose>
                 <xsl:when test="Event = 'Click'">
                      <xsl:call-template name="StepConnectionForClickTemplate"/>
                   </xsl:when>                  
               </xsl:choose>
               <xsl:choose>
                 <xsl:when test="Event = 'TypeText'">
                      <xsl:call-template name="StepConnectionForTypeTemplate"/>
                 </xsl:when>
               </xsl:choose>
             </xsl:for-each>
        </xsl:element><!--End Objects-->
        <xsl:element name="Links">
           <xsl:call-template name="LinksElementTemplate"/>
        </xsl:element><!--End Links-->
        <xsl:element name="Comments"> </xsl:element>
        <xsl:element name="SubGraphs"> </xsl:element>
      </xsl:element><!--End AutomationDocument-->       
    </xsl:element> <!--End OpenSpan.Automation.Automator-->
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
      <OpenSpan.Automation.ConnectableMethod Name="connectableMethod1" Id="ConnectableMethod-8D7D7F54818627F">
          <ComponentName Value="Product_Request" />
          <DisplayName Value="WaitForCreate" />
          <ExceptionsHandled Value="False" />
          <InstanceTypeName Value="OpenSpan.Adapters.Web.Controls.WebPage" />
          <InstanceUniqueId Value="WebAdapter-8D7D7F4F1DE848D\WebPage-8D7D7F52A6B3181" />        
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
        </OpenSpan.Automation.ConnectableMethod>
      
       <xsl:for-each select="Document/Process/Step">           
               <xsl:choose>                  
                  <xsl:when test="Event = 'Click'">
	                 <xsl:call-template name="ConnectableMethodTemplate3"/>
                  </xsl:when>                  
            </xsl:choose>  
           <xsl:choose>                  
                  <xsl:when test="Event = 'TypeText'">
	                   <xsl:call-template name="ConnectablePropertiesTemplate"/>
                  </xsl:when>                  
            </xsl:choose>  
    </xsl:for-each>   
  </Component>
  </xsl:template>  <!--End of AutomationDocumentTemplate-->

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
          <xsl:value-of select="'180'"/>
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
    </xsl:element> <!-- ConnectionBlock-->
  </xsl:template> <!-- End AllProjectsStartedTemplate-->
  <xsl:template  name="WaitElementTemplate">
    <!-- WaitElementTemplate Start-->
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'WaitForCreate'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <!--<xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableUniqueId())"/>-->
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableMethod-8D7D7F54818627F'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="'2'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Left">
        <xsl:attribute name="Value">
          <xsl:value-of select="'560'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Top">
        <xsl:attribute name="Value">
          <xsl:value-of select="'200'"/>
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
          <xsl:value-of select="'Product_Request'"/>
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
    </xsl:element>  <!-- ConnectionBlock-->
  </xsl:template> <!-- WaitElementTemplate End-->

  <xsl:template  name="StepConnectionForClickTemplate">   
      <xsl:element name="ConnectionBlock">
        <xsl:element name="DisplayName">
          <xsl:attribute name="Value">
            <xsl:value-of select="'PerformClick'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="ConnectableUniqueId">
          <xsl:attribute name="Value">
            <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableMethodsVikasConnection())"/>
            <!--<xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableEvent())"/>-->
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="PartID">
          <xsl:attribute name="Value">
            <!-- <xsl:value-of select="incr:GetPartID()"/>-->
            <xsl:value-of select="incr:GetConnectionBlockPartID()"/>
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
          <xsl:attribute name="Value2222">
            <xsl:value-of select="PlayBack/ControlInfo/@IEControlID"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="OverriddenIds">    </xsl:element>
      </xsl:element>
      <!-- ConnectionBlock-->    
  </xsl:template> <!-- End StepConnectionForClickTemplate-->

  <xsl:template  name="StepConnectionForTypeTemplate">
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'Properties'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <!--<xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableProperties())"/>-->
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableMethodsVikasConnection())"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="incr:GetConnectionBlockPartID()"/>
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
    </xsl:element>   <!-- ConnectionBlock-->
  </xsl:template> <!-- End StepConnectionForTypeTemplate-->

  <xsl:template  name="LinksElementTemplate">    
      <xsl:call-template name="LinkElementTemplate"/>
      <xsl:call-template name="DecisionEventLinkTemplate"/>
     <xsl:for-each select="Document/Process/Step">
        <xsl:choose>
          <xsl:when test="Event = 'Click'">
            <xsl:call-template name="STEPLinkElementTemplate"/>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="Event = 'TypeText'">
            <xsl:call-template name="STEPTypeTextElementTemplate"/>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each> 
  </xsl:template> <!--End LinksElementTemplate-->


  <xsl:template  name="LinkElementTemplate">
    <xsl:element name="Link">
      <xsl:attribute name="PartID">
         <xsl:value-of select="'11'"/>
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
          <xsl:value-of select="incr:GetFromPartID()"/>
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
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\EMPTY'"/>
        </xsl:attribute>  
      </xsl:element><!--End From-->
      <xsl:element name="To">
        <xsl:attribute name="PartID">
            <xsl:value-of select="incr:GetToPartID()"/>
          </xsl:attribute>
        <xsl:attribute name="PortName">
             <xsl:value-of select="'DoWork'"/>
         </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableMethod-8D7D7F54818627F'"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableMethod-8D7D7F54818627F'"/>
        </xsl:attribute>
      </xsl:element> <!--End To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>               
        </xsl:element> <!--End Point-->
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

      </xsl:element> <!--End LinkPoints-->
      
      
      
      
    </xsl:element> <!--End Link-->
  </xsl:template> <!--End LinkElementTemplate-->

  <xsl:template  name="DecisionEventLinkTemplate">
     <xsl:element name="DecisionEventLink">
      <xsl:attribute name="PartID">
         <xsl:value-of select="'12'"/>
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
          <xsl:value-of select="incr:GetFromPartID()"/>
        </xsl:attribute>
        <xsl:attribute name="ParentMemberName">
          <xsl:value-of select="'Result'"/>
        </xsl:attribute>
        <xsl:attribute name="DecisionValue">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableMethod-8D7D7F54818627F'"/>
        </xsl:attribute>
       </xsl:element><!--End From-->
      <xsl:element name="To">
        <xsl:attribute name="PartID">
            <xsl:value-of select="incr:GetToPartID()"/>
          </xsl:attribute>
        <xsl:attribute name="PortName">
             <xsl:value-of select="'DoWork'"/>
         </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableMethod-8D7D7F55E0BE44F'"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableMethod-8D7D7F55E0BE44F'"/>
        </xsl:attribute>
      </xsl:element> <!--End To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>               
        </xsl:element> <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>       <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>     <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>    <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>     <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>    <!--End Point-->

      </xsl:element> <!--End LinkPoints-->
     </xsl:element> <!--End DecisionEventLink-->
  </xsl:template> <!--End DecisionEventLinkTemplate-->
 
  <xsl:template  name="STEPLinkElementTemplate">   
    <xsl:variable name="methodConne" select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableMethodsTO())" />
    <xsl:variable name="propertyConne" select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableProperties())" />
     <xsl:element name="Link">
      <xsl:attribute name="PartID">
         <xsl:value-of select="incr:GetLinkPartID()"/>
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
          <xsl:value-of select="incr:GetFromPartID()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'Complete'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Event'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableIdvikasFrom">
          <xsl:value-of select="$methodConne"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="$methodConne"/>
        </xsl:attribute>  
      </xsl:element><!--End From-->
      <xsl:element name="To">
        <xsl:attribute name="PartID">
            <xsl:value-of select="incr:GetToPartID()"/>
          </xsl:attribute>
        <xsl:attribute name="PortName">
             <xsl:value-of select="'DoWork'"/>
         </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableIdvikasTo">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableMethodsVikas1())"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="$propertyConne"/>
        </xsl:attribute>
      </xsl:element> <!--End To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>               
        </xsl:element> <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>       <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>      <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>       <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>     <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>    <!--End Point-->
      </xsl:element> <!--End LinkPoints-->  
    </xsl:element> <!--End Link-->
  </xsl:template> <!--End LinkElementTemplate-->
 
   <xsl:template  name="STEPTypeTextElementTemplate">   
    <xsl:variable name="bodyTextSize" select="incr:GetConnectableMethodsTO()" />
     <xsl:variable name="propertyConne" select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableProperties())" />
     <xsl:element name="Link">
      <xsl:attribute name="PartID">
         <xsl:value-of select="incr:GetLinkPartID()"/>
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
          <xsl:value-of select="incr:GetFromPartID()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'Complete'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Event'"/>
        </xsl:attribute>
       <xsl:attribute name="ConnectableIdvikas">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$bodyTextSize)"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',$bodyTextSize)"/>
        </xsl:attribute>
      </xsl:element><!--End From-->
      <xsl:element name="To">
        <xsl:attribute name="PartID">
            <xsl:value-of select="incr:GetToPartID()"/>
          </xsl:attribute>
        <xsl:attribute name="PortName">
             <xsl:value-of select="'DoWork'"/>
         </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\',incr:GetConnectableMethodsVikas1())"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="$bodyTextSize"/>
        </xsl:attribute>
      </xsl:element> <!--End To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>               
        </xsl:element> <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>       <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>      <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>       <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>     <!--End Point-->
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 149'"/>
          </xsl:attribute>
        </xsl:element>    <!--End Point-->
      </xsl:element> <!--End LinkPoints-->  
    </xsl:element> <!--End Link-->
  </xsl:template> <!--End LinkElementTemplate-->
  
<xsl:template name="ConnectableMethodTemplate3">
<xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="incr:connectableMethods()"/>
      </xsl:attribute>
      <xsl:attribute name="Id123">
        <xsl:value-of select="incr:GetConnectableMethodsVikasName()"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="Role"/>
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
          <xsl:value-of select="'OpenSpan.Adapters.Web.Controls.TextBox'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WebAdapter-8D7D7F4F1DE848D\',incr:GettxtBox())"/>        
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
            </xsl:element>     <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Method'"/>
              </xsl:attribute>
            </xsl:element>         <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.Void'"/>
              </xsl:attribute>
            </xsl:element>         <!--TypeName-->
            <xsl:element name="Content">
              <xsl:attribute name="Name">
                <xsl:value-of select="'Signature'"/>
              </xsl:attribute>
              <xsl:element name="OpenSpan.Automation.MethodSignature">
                <xsl:element name="ReturnType">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="'System.Void'"/>
                  </xsl:attribute>
                </xsl:element>  <!-- ReturnType-->
              </xsl:element>  <!--OpenSpan.Automation.MethodSignature-->
            </xsl:element>   <!--Content-->
          </xsl:element>      <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>      <!--Items-->
      </xsl:element>    <!--Content-->
    </xsl:element>   <!-- OpenSpan.Automation.ConnectableMethod-->
</xsl:template>
<xsl:template name="ConnectablePropertiesTemplate">
<xsl:element name="OpenSpan.Automation.ConnectableProperties">
      <xsl:attribute name="Name">
        <xsl:value-of select="incr:GetconnectablePropertiess()"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="incr:GetConnectableMethodsVikasName()"/>
      </xsl:attribute>   
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="Role"/>
        </xsl:attribute>
      </xsl:element>
   <xsl:element name="DefaultValues">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Text=',ControlData)"/>  
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
          <xsl:value-of select="'OpenSpan.Adapters.Web.Controls.TextBox'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value"> 
        <xsl:value-of select="concat('WebAdapter-8D7D7F4F1DE848D\',incr:GettxtBox1())"/>        
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
            </xsl:element>     <!--MemberName-->
            <xsl:element name="MemberType">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Property'"/>
              </xsl:attribute>
            </xsl:element>         <!--MemberType-->
            <xsl:element name="TypeName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'System.String'"/>
              </xsl:attribute>
            </xsl:element>         <!--TypeName-->
         </xsl:element>      <!--OpenSpan.Automation.MemberPrototype-->
        </xsl:element>      <!--Items-->
      </xsl:element>    <!--Content-->
    </xsl:element>   <!-- OpenSpan.Automation.ConnectableMethod-->
</xsl:template>
</xsl:stylesheet><!--End of stylesheet-->
