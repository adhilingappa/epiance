<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:my="my:my"  xmlns:incr="urn:my-scripts" exclude-result-prefixes="msxsl" >
  <msxsl:script implements-prefix='incr' language='CSharp'>
    <![CDATA[
    
    int partID=2; int c=1000; int a=0; int b=1; int d=1;int e=0; int f=1000; int LinkPartID=1000; int g=1000;
    int ConnectionBlockPartID=10002; int vik2=1000; int cM=1000; int txt=1; int ProTxt=1; int ii=10; int iii=10; int chk=0;
    
	public int GetPartID()
      {
          ++partID;
          return partID;
      }
      
      public string getGText()
      {
         return "MenuItem-"+ii;
      }
      
       public string getGText1()
      {
         return "MenuItem-"+iii;
      }
      
      int clkTxt=0 ; int clkTxt1=0; int clkTxt2=0;int clkTxt3=0; int clkTxt4=0; int clkTxt5=0;
      public string GetTestBoxInstanceNameForClick()
      {
           int no= ++clkTxt;
           return "TXtBox"+no;
      }
      
      public string GetTestBoxInstanceNameForType()
      {
            int no= ++clkTxt1;
           return "TXtBox"+no;
      }
      
      public string GetTestBoxInstanceNameID()
      {
            int no= ++clkTxt4;
           return "TextBox"+no;
      }
       public string GetTestBoxInstanceNameID1()
      {
            int no= ++clkTxt5;
           return "TextBox"+no;
      }
      
      public string GetTestBoxInstanceNameForTypeMethod()
      {
            int no= ++clkTxt2;
           return "TXtBox"+no;
      }
      
      public string GetTestBoxInstanceNameForTypeMethod1()
      {
            int no= ++clkTxt3;
           return "TXtBox"+no;
      }
      
      
    public int getGlist2(){  
      return ++c;
    }
    
    public int GetLinkPartID()
    {      
       return LinkPartID++;        
    }
    
      public int GetFromPartID()
      {
          return ++a;
      }
      public int GetTOPartID()
      {
         return ++b;
      }
      
      public string getConnectableMethodName(){
       int num= ++d;       
       return "connectableMethod"+num;
        }
        
        public string getGlist3(){
               int num= ++e;
               return "MenuItem-"+num;       
          }
          
           public int getGlist4(){  
              return ++f;
          }
          
      public int GetConnectionBlockPartID()
      {
         
          return ConnectionBlockPartID++;
      } 
      
    public int GetConnectableMethodsTO4()
    {
      return ++cM;
        
    }
    
    public int GetConnectableMethodsTO()
    { 
        return  vik2++;;
    }
    
    public string  getCheckBoxName()
        {
            int no=++chk;
           return "Check"+no;
        }
        
        public string ToLower1(string stringValue)
      {
        string result = String.Empty;

        if(!String.IsNullOrEmpty(stringValue))
        {
          result = stringValue.ToLower(); 
        }

        return result;
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
          <Assembly Value="OpenSpan.Adapters, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Automation, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Runtime.Core, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
        </AssemblyReferences>
        <DynamicAssemblyReferences />
        <FileReferences />
        <BuildReferences />
      </ComponentInfo>
      <Component Version="1.0">
        <xsl:call-template name="elementTemplate"/>
        <xsl:call-template name="AllProjectsStartedtEMPALTE"/>
        <xsl:call-template name="waitConnectableMethodMsaa"></xsl:call-template>
      </Component>
    </OpenSpanDesignDocument>
  </xsl:template>

  <xsl:template  name="elementTemplate">
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
          <xsl:element name="ConnectionBlock">
            <xsl:element name="DisplayName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'RuntimeLoader.AllProjectsStarted'"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:element name="ConnectableUniqueId">
              <xsl:attribute name="Value">
                <xsl:value-of select="'Automator-8D7D7F4EA4A6A52\ConnectableEvent-8D7D55F60012841'"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:element name="PartID">
              <xsl:attribute name="Value">
                <xsl:value-of select="'1'"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:element name="Left">
              <xsl:attribute name="Value">
                <xsl:value-of select="'160'"/>
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
          <!-- <xsl:call-template name="WaitElementTemplate"/>-->
          <xsl:for-each select="Document/Process">
            <xsl:choose>
              <xsl:when test="Step">
                <xsl:for-each select="Step">
                  <xsl:choose>
                    <xsl:when test="incr:ToLower1(PlayBack--GeneralInfo-Event) ='select'">
                      <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'menu item'">
                        <xsl:call-template name="menuitemConnectionTemplate"/>
                      </xsl:if>
                    </xsl:when>
                    <xsl:when test="incr:ToLower1(PlayBack--GeneralInfo-Event )= 'click'">
                      <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'editable text'">
                        <xsl:call-template name="TextClickConnectionTemplate"/>
                      </xsl:if>
                      <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'check box' or  incr:ToLower1(PlayBack--ControlInfo-Role) = 'push button'">
                        <xsl:call-template name="CheckBoxConnectionTemplate"/>
                      </xsl:if>
                    </xsl:when>
                    <xsl:when test="incr:ToLower1(PlayBack--GeneralInfo-Event) = 'typetext'">
                      <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'editable text'">
                        <xsl:call-template name="TypetextConnectionTemplate"/>
                      </xsl:if>
                    </xsl:when>
                  </xsl:choose>
                  <!--<xsl:if test="SubSteps/Step">
              <xsl:choose>
                <xsl:when test="Event = 'Click'">
                  <xsl:call-template name="SubmenuitemConnectionTemplate"/>
                </xsl:when>
              </xsl:choose>
            </xsl:if>-->
                </xsl:for-each>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </xsl:element>
        <!-- Objects-->
        <xsl:call-template name="LinkElementTemplate1"/>
        <xsl:element name="Comments"> </xsl:element>
        <xsl:element name="SubGraphs"> </xsl:element>
      </xsl:element>
      <!--AutomationDocument-->
    </xsl:element>
    <!--OpenSpan.Automation.Automator-->
  </xsl:template>


  <!-- Connection Template-->
  <xsl:template  name="WaitElementTemplateMSAA">
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
          <xsl:value-of select="'WindowsApplication'"/>
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

  <xsl:template  name="TextClickConnectionTemplate">
    <!--Vikas-->
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
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>


  <xsl:template  name="listConnectionTemplate">
    <xsl:param name="UniqueId" select="'Untitled'"/>
    <xsl:param name="PartID" select="'Untitled'"/>
    <xsl:param name="TopPosition" select="'100'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'SelectItem'"/>
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

  <xsl:template  name="RadiobtnConnectionTemplate">
    <xsl:param name="UniqueId" select="'Untitled'"/>
    <xsl:param name="PartID" select="'Untitled'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'Focus'"/>
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
          <xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>

  <xsl:template  name="TerminationConnectionTemplate">
    <!--Vikas-->
    <xsl:param name="UniqueId" select="'Untitled'"/>
    <xsl:param name="PartID" select="'Untitled'"/>
    <xsl:param name="TopPosition" select="'100'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'TerminateRuntime'"/>
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
          <xsl:value-of select="'OpenSpan.Runtime.RuntimeHost'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>

  <xsl:template  name="ActivateWindowMSAA">
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

  <xsl:template  name="menuitemConnectionTemplate">
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

  <xsl:template name="CheckBoxConnectionTemplate">
    <xsl:param name="UniqueId" select="'Untitled'"/>
    <xsl:param name="PartID" select="'Untitled'"/>
    <xsl:element name="ConnectionBlock">
      <xsl:element name="DisplayName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'PerformClick'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ConnectableUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('Automator-8D7D7F4EA4A6A52\ConnectableMethod-', $UniqueId)"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="PartID">
        <xsl:attribute name="Value">
          <xsl:value-of select="$PartID"/>
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
          <xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>

  <xsl:template  name="TypetextConnectionTemplate">
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
          <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="OverriddenIds">    </xsl:element>
    </xsl:element>
    <!-- ConnectionBlock-->
  </xsl:template>

  <xsl:template  name="LinkElementTemplate1">
    <xsl:element name="Links">
      <xsl:call-template name="StartLinkTemplateFor"/>
      <xsl:call-template name="DecisionLinkTemplate"/>
      <xsl:for-each select="Document/Process">
        <xsl:choose>
          <xsl:when test="Step">
            <xsl:for-each select="Step">
              <xsl:choose>
                <xsl:when test="PlayBack--GeneralInfo-Event ='Select'">
                  <xsl:if test="PlayBack--ControlInfo-Role ='menu item'">
                    <xsl:call-template name="menuitemLinkForClick"/>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="PlayBack--GeneralInfo-Event = 'Click'">
                  <xsl:if test="PlayBack--ControlInfo-Role ='editable text'">
                    <xsl:call-template name="menuitemLinkForClick"/>
                  </xsl:if>
                  <xsl:if test="PlayBack--ControlInfo-Role = 'check box' or  PlayBack--ControlInfo-Role = 'push button'">
                    <xsl:call-template name="CheckBoxLink"/>
                  </xsl:if>
                </xsl:when>
              </xsl:choose>

              <!--<xsl:if test="SubSteps/Step">
          <xsl:choose>
            <xsl:when test="SubSteps/Step/Role = 'menu item'">
              <xsl:call-template name="menuitemLinkForClick"/>
            </xsl:when>
          </xsl:choose>
        </xsl:if>-->
              <xsl:choose>
                <xsl:when test="incr:ToLower1(PlayBack--GeneralInfo-Event) = 'typetext'">
                  <xsl:call-template name="menuitemLinkForClick"></xsl:call-template>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>

          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
    </xsl:element>
    <!--Links-->
  </xsl:template>
  <xsl:template  name="StartLinkTemplateFor">
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
          <xsl:value-of select="'Raised'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Event'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="'Automator-8D7D342BEBC01A7\ConnectableEvent-8D7D55F60012841'"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="'Automator-8D7D342BEBC01A7\EMPTY'"/>
        </xsl:attribute>
      </xsl:element>
      <!--End From-->
      <xsl:element name="To">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetTOPartID()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'DoWork'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="'Automator-8D7D342BEBC01A7\ConnectableMethod-8D7D55FD0ED60EF'"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="'Automator-8D7D342BEBC01A7\ConnectableMethod-8D7D55FD0ED60EF'"/>
        </xsl:attribute>
      </xsl:element>
      <!--To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'388, 89'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'398, 89'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'427, 89'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'427, 189'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'455, 189'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'465, 189'"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:element>
      <!--LinkPoints-->
    </xsl:element>
    <!--Link-->
  </xsl:template>
  <xsl:template  name="DecisionLinkTemplate">
    <xsl:element name="DecisionEventLink">
      <xsl:attribute name="PartID">
        <xsl:value-of select="incr:GetConnectionBlockPartID()"/>
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
          <xsl:value-of select="'Automator-8D7D342BEBC01A7\ConnectableMethod-8D7D55FD0ED60EF'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="To">
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetTOPartID()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'DoWork'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="'Automator-8D7D342BEBC01A7\ConnectableMethod-1000'"/>
        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="'Automator-8D7D342BEBC01A7\ConnectableMethod-1000'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'693,237'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'703, 237'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'739, 237'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'739, 237'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'775, 237'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'785, 237'"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:element>
      <!--LinkPoints-->
    </xsl:element>
    <!--DecisionEventLink-->
  </xsl:template>
  <xsl:template  name="menuitemLinkForClick">
    <xsl:element name="Link">
      <xsl:attribute name="PartID">
        <xsl:value-of select="incr:GetConnectionBlockPartID()"/>
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
        <xsl:variable name="methodConne" select="concat('Automator-8D7D342BEBC01A7\ConnectableMethod-',incr:GetConnectableMethodsTO())" />
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetFromPartID()"/>
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
          <xsl:value-of select="'Automator-8D7D342BEBC01A7\ConnectableMethod-8D7D55FD4C0C8C8'"/>
        </xsl:attribute>
      </xsl:element>
      <!--End From-->
      <xsl:element name="To">
        <xsl:variable name="methodConne" select="concat('Automator-8D7D342BEBC01A7\ConnectableMethod-',incr:GetConnectableMethodsTO4())" />
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetTOPartID()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'DoWork'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="$methodConne"/>

        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="$methodConne"/>
        </xsl:attribute>
      </xsl:element>
      <!--End To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'904, 229'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'914, 229'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'914, 319'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'895, 319'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'895, 409'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'905, 409'"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:element>
      <!--LinkPoints-->
    </xsl:element>
    <!--Link-->
  </xsl:template>
  <xsl:template name="CheckBoxLink">
    <xsl:element name="Link">
      <xsl:attribute name="PartID">
        <xsl:value-of select="incr:GetConnectionBlockPartID()"/>
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
        <xsl:variable name="methodConne" select="concat('Automator-8D7D342BEBC01A7\ConnectableMethod-',incr:GetConnectableMethodsTO())" />
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetFromPartID()"/>
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
          <xsl:value-of select="'Automator-8D7D342BEBC01A7\ConnectableMethod-8D7D55FD4C0C8C8'"/>
        </xsl:attribute>
      </xsl:element>
      <!--From-->
      <xsl:element name="To">
        <xsl:variable name="methodConne" select="concat('Automator-8D7D342BEBC01A7\ConnectableMethod-',incr:GetConnectableMethodsTO4())" />
        <xsl:attribute name="PartID">
          <xsl:value-of select="incr:GetTOPartID()"/>
        </xsl:attribute>
        <xsl:attribute name="PortName">
          <xsl:value-of select="'DoWork'"/>
        </xsl:attribute>
        <xsl:attribute name="PortType">
          <xsl:value-of select="'Method'"/>
        </xsl:attribute>
        <xsl:attribute name="ConnectableId">
          <xsl:value-of select="$methodConne"/>

        </xsl:attribute>
        <xsl:attribute name="MemberComponentId">
          <xsl:value-of select="$methodConne"/>
        </xsl:attribute>
      </xsl:element>
      <!--To-->
      <xsl:element name="LinkPoints">
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'904, 229'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'914, 229'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'914, 319'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'895, 319'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'895, 409'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="Point">
          <xsl:attribute name="value">
            <xsl:value-of select="'905, 409'"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:element>
      <!--LinkPoints-->
    </xsl:element>
  </xsl:template>


  <!--Methods Template-->
  <xsl:template name="AllProjectsStartedtEMPALTE">
    <OpenSpan.Automation.ConnectableEvent Name="connectableEvent1" Id="ConnectableEvent-8D7D55F60012841">
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
  </xsl:template>

  <xsl:template name="waitConnectableMethodMsaa">
    <xsl:param name="connectableID" select="'Untitled'"/>
    <xsl:param name="Title" select="'Untitled'"/>
    <xsl:element name ="OpenSpan.Automation.ConnectableMethod">
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
      <InstanceTypeName Value="OpenSpan.Adapters.Controls.Form" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',$Title)"/>
        </xsl:attribute>
      </xsl:element>
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

  <xsl:template name="ActivateConnectableMethodMSAA">
    <xsl:param name="connectableID" select="'Untitled'"/>
    <xsl:param name="Title" select="'Untitled'"/>
   <!-- <xsl:variable name="connectableID1" select="incr:connectableMethods()" />-->
    
    
    
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
      <DisplayName Value="Activate" />
      <ExceptionsHandled Value="False" />
      <InstanceTypeName Value="OpenSpan.Adapters.Controls.Form" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',$Title)"/>
        </xsl:attribute>
      </xsl:element>
      <MemberDetails Value=".Activate() Method" />
      <ParamsLength Value="0" />
      <SerializedParamsDefaultValues Value="" />
      <Content Name="MemberPrototypes">
        <Items>
          <OpenSpan.Automation.MemberPrototype>
            <MemberName Value="Activate" />
            <MemberType Value="Method" />
            <TypeName Value="System.Void" />
            <Content Name="Signature">
              <OpenSpan.Automation.MethodSignature>
                <ReturnType Value="System.Void" />
              </OpenSpan.Automation.MethodSignature>
            </Content>
          </OpenSpan.Automation.MemberPrototype>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>


  <xsl:template name="ConnectableMethodTemplateCall">
    <xsl:for-each select="Document/Process">
      <xsl:choose>
        <xsl:when test="Step">
          <xsl:for-each select="Step">
            <xsl:choose>
              <xsl:when test="incr:ToLower1(PlayBack--GeneralInfo-Event) ='select'">
                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'menu item'">
                  <xsl:call-template name="ConnectableMethodTemplateFormenuitem"/>
                </xsl:if>
                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'check box'">
                  <xsl:call-template name="ConnectableMethodTemplateForCheckBox"/>
                </xsl:if>
              </xsl:when>
              <xsl:when test="incr:ToLower1(PlayBack--GeneralInfo-Event) ='click'">
                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'editable text'">
                  <xsl:call-template name="ConnectableMethodTemplateForTextBoxClick"/>
                </xsl:if>
                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'radio button'">
                  <xsl:call-template name="ConnectableMethodTemplateForRadioButton"/>
                </xsl:if>
                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'combo box'">
                  <xsl:call-template name="ConnectableMethodTemplateForComboBox"/>
                </xsl:if>
                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'push button'">
                  <xsl:call-template name="ConnectableMethodTemplateForpushbutton"/>
                </xsl:if>

              </xsl:when>
              <xsl:when test="incr:ToLower1(PlayBack--GeneralInfo-Event) = 'typetext'">
                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'editable text'">
                  <xsl:call-template name="ConnectableMethodTemplateForTextBoxTypeText"/>
                </xsl:if>
              </xsl:when>
            </xsl:choose>
            <!--<xsl:if test="SubSteps/Step">
        <xsl:choose>
          <xsl:when test="SubSteps/Step/Role = 'menu item'">
            <xsl:call-template name="ConnectableMethodTemplateForSubmenuitem"/> 
          </xsl:when>
        </xsl:choose>
      </xsl:if>-->
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="ConnectableMethodTemplateFormenuitem">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>

    <xsl:element name="OpenSpan.Automation.ConnectableMethod">
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
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
          <xsl:value-of select="'OpenSpan.Adapters.Controls.MenuItem'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',concat(PlayBack--ControlInfo-ControlData,@DialogName))"/>
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


  <xsl:template name="ConnectableMethodTemplateForTextBoxClick">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
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
          <xsl:value-of select="'OpenSpan.Adapters.Controls.TextBox'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',concat(PlayBack--ControlInfo-ControlName,@DialogName))"/>
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


  <xsl:template name="ConnectableMethodTemplateForCheckBox">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:element name="OpenSpan.Automation.ConnectableMethod" >
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

      <DisplayName Value="PerformClick" />
      <ExceptionsHandled Value="False" />
      <InstanceTypeName Value="OpenSpan.Adapters.Controls.CheckBox" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',concat(PlayBack--ControlInfo-ControlName,@DialogName))"/>
          <!--<xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',incr:getGText())"/>-->
        </xsl:attribute>
      </xsl:element>
      <MemberDetails Value=".PerformClick() Method" />
      <ParamsLength Value="0" />
      <SerializedParamsDefaultValues Value="" />
      <Content Name="MemberPrototypes">
        <Items>
          <OpenSpan.Automation.MemberPrototype>
            <MemberName Value="PerformClick" />
            <MemberType Value="Method" />
            <TypeName Value="System.Void" />
            <Content Name="Signature">
              <OpenSpan.Automation.MethodSignature>
                <ReturnType Value="System.Void" />
              </OpenSpan.Automation.MethodSignature>
            </Content>
          </OpenSpan.Automation.MemberPrototype>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>


  <xsl:template name="ConnectableMethodTemplateForRadioButton">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:element name="OpenSpan.Automation.ConnectableMethod" >
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

      <DisplayName Value="Focus" />
      <ExceptionsHandled Value="False" />
      <InstanceTypeName Value="OpenSpan.Adapters.Controls.CheckBox" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',concat(PlayBack--ControlInfo-ControlName,@DialogName))"/>
          <!--<xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',incr:getGText())"/>-->
        </xsl:attribute>
      </xsl:element>
      <MemberDetails Value=".Focus() Method" />
      <ParamsLength Value="0" />
      <SerializedParamsDefaultValues Value="" />
      <Content Name="MemberPrototypes">
        <Items>
          <OpenSpan.Automation.MemberPrototype>
            <MemberName Value="Focus" />
            <MemberType Value="Method" />
            <TypeName Value="System.Void" />
            <Content Name="Signature">
              <OpenSpan.Automation.MethodSignature>
                <ReturnType Value="System.Void" />
              </OpenSpan.Automation.MethodSignature>
            </Content>
          </OpenSpan.Automation.MemberPrototype>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ConnectableMethodTemplateForComboBox">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:element name="OpenSpan.Automation.ConnectableProperties" >
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
          <xsl:value-of select="concat('SelectedItem=',PlayBack--ControlInfo-ControlName)"/>
        </xsl:attribute>
      </xsl:element>

      <DisplayName Value="Properties" />
      <ExceptionsHandled Value="False" />
      <InstanceTypeName Value="OpenSpan.Adapters.Controls.ComboBox" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',concat(PlayBack--ControlInfo-ControlName,@DialogName))"/>
          <!--<xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',incr:getGText())"/>-->
        </xsl:attribute>
      </xsl:element>
      <MemberDetails Value=".SelectedItem Property" />
      <Content Name="MemberPrototypes">
        <Items>
          <OpenSpan.Automation.MemberPrototype>
            <MemberName Value="SelectedItem" />
            <MemberType Value="Property" />
            <TypeName Value="System.String" />
          </OpenSpan.Automation.MemberPrototype>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ConnectableMethodTemplateForTextBoxTypeText">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
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
          <xsl:value-of select="'OpenSpan.Adapters.Controls.TextBox'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',concat(PlayBack--ControlInfo-ControlName,@DialogName))"/>
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

  <xsl:template name="ConnectableMethodTemplateForpushbutton">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:element name="OpenSpan.Automation.ConnectableMethod" >
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
      <DisplayName Value="PerformClick" />
      <ExceptionsHandled Value="False" />
      <InstanceTypeName Value="OpenSpan.Adapters.Controls.Button" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',concat(PlayBack--ControlInfo-ControlName,@DialogName))"/>
          <!--<xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',incr:getGText())"/>-->
        </xsl:attribute>
      </xsl:element>
      <MemberDetails Value=".PerformClick() Method" />
      <ParamsLength Value="0" />
      <SerializedParamsDefaultValues Value="" />
      <Content Name="MemberPrototypes">
        <Items>
          <OpenSpan.Automation.MemberPrototype>
            <MemberName Value="PerformClick" />
            <MemberType Value="Method" />
            <TypeName Value="System.Void" />
            <Content Name="Signature">
              <OpenSpan.Automation.MethodSignature>
                <ReturnType Value="System.Void" />
              </OpenSpan.Automation.MethodSignature>
            </Content>
          </OpenSpan.Automation.MemberPrototype>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ConnectableMethodTemplateForTermination">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>
    <xsl:element name="OpenSpan.Automation.ConnectableMethod" >
      <xsl:attribute name="Name">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="$methodConne"/>
      </xsl:attribute>

      <xsl:element name="ComponentName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Runtime.RuntimeHost'"/>
        </xsl:attribute>
      </xsl:element>

      <DisplayName Value="TerminateRuntime" />
      <ExceptionsHandled Value="False" />
      <InstanceTypeName Value="OpenSpan.Runtime.RuntimeHost" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="'EMPTY'"/>
        </xsl:attribute>
      </xsl:element>
      <MemberDetails Value=".TerminateRuntime() Method" />
      <ParamsLength Value="0" />
      <SerializedParamsDefaultValues Value="" />
      <Content Name="MemberPrototypes">
        <Items>
          <OpenSpan.Automation.MemberPrototype>
            <MemberName Value="TerminateRuntime" />
            <MemberType Value="Method" />
            <TypeName Value="System.Void" />
            <Content Name="Signature">
              <OpenSpan.Automation.MethodSignature>
                <ReturnType Value="System.Void" />
              </OpenSpan.Automation.MethodSignature>
            </Content>
          </OpenSpan.Automation.MemberPrototype>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ConnectableMethodTemplateForlist">
    <xsl:param name="methodConne" select="'Untitled'"/>
    <xsl:param name="InstanceName" select="'Untitled'"/>

    <xsl:element name="OpenSpan.Automation.ConnectableMethod" >
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
          <xsl:value-of select="'SelectItem'"/>
        </xsl:attribute>
      </xsl:element>
      <ExceptionsHandled Value="False" />
      <InstanceTypeName Value="OpenSpan.Adapters.Controls.ComboBox" />
      <xsl:element name="InstanceUniqueId">
        <xsl:attribute name="Value">
          <xsl:value-of select="concat('WindowsAdapter-8D7D55F69665FC7\',concat(PlayBack--ControlInfo-ControlName,@DialogName))"/>
        </xsl:attribute>
      </xsl:element>
      <MemberDetails Value=".SelectItem() Method" />
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
            <MemberName Value="SelectItem" />
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
                      <xsl:element name="DefaultValue">
                        <xsl:attribute name="Value">
                          <xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
                        </xsl:attribute>
                      </xsl:element>
                      <ParamName Value="wildcard" />
                      <Position Value="0" />
                      <TypeName Value="System.String" />
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
</xsl:stylesheet>