<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:my="my:my"  xmlns:incr="urn:my-scripts" exclude-result-prefixes="msxsl" >
  <xsl:import href="pegbot_19_1_automataionIE.xslt"/>
  <xsl:import href="pegbot_19_1_automationMSAA.xslt"/>
  <xsl:import href="pegbot_19_1_automataionCHROME.xslt"/>

  <msxsl:script implements-prefix='incr' language='CSharp'>
    <![CDATA[

  public string ToLower(string stringValue)
  {
    string result = String.Empty;

    if(!String.IsNullOrEmpty(stringValue))
    {
    result = stringValue.ToLower();
    }
      return result;
  }
  
   /*Connection Unique ID*/
   int Unique_Id=0;
   public string connectableMethods123()
   {
      String gi = "ConnectableMethod";
      Unique_Id++;
      return gi+Unique_Id;
   }
   
   /*Link From*/
   int FromConnectable_Id=0;
   public string connectableMethodsFrom()
   {
      String gi = "ConnectableMethod";
      FromConnectable_Id++;
      return gi+FromConnectable_Id;
   }
   
   int ToConnectable_Id=0;
   public string connectableMethodsTo()
   {
      String gi = "ConnectableMethod";
      ToConnectable_Id++;
      return gi+ToConnectable_Id;
   }
   
   
   /*Connectable methods*/
   int Connectable_methodId=0;
   public string connectableMethodsID()
   {
      String gi = "ConnectableMethod";
      Connectable_methodId++;
      return gi+Connectable_methodId;
   }
   
   int Conn_PartID=1;
   public int getPartIDConnectio()
   {
   return ++Conn_PartID;
   }
   
   
   string LAdopterId="";
   
   string GetLatestAdopterId()
   {
      return LAdopterId;
   }
   
   
   
     string tmpAID=""; int AName=0;
      public void postAdopterID(string AID)
      {
        if(AName==0)
        {
          if(AID!="")
          {
            if(tmpAID=="")
	            tmpAID=AID;     
	            AName++;
          }
         }    
      }
      
      public string getAdopterID()
      {
      string tmpAID1=tmpAID;
      AName=0; tmpAID="";
      return tmpAID1;
      }
	  
	  int top=100; int tmptop;string position2="";
	  public int getTopPosition(string position="")
      {
			if(position!="")
				  position2="50";
			
      int position1=Convert.ToInt32(position);
			tmptop = top+position1;
			top=tmptop;
			return tmptop;
      }
  
  ]]>
  </msxsl:script>

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

  <xsl:template  name="AutomationDocumentTemplate">
    <Component Version="1.0">
      <xsl:element name="OpenSpan.Automation.Automator">
        <xsl:attribute name="Name">
          <xsl:value-of select="concat(Document/Meta/GpsFile,'_automation')"/>
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
          <!--Connections-->
          <xsl:element name="Objects">
            <xsl:call-template name="AllProjectsStartedTemplate"/>
            <xsl:for-each select="Document/Process/GStep">
              <xsl:choose>
                <xsl:when test="Step">
                  <xsl:for-each select="Step">
                    <xsl:if test="PlayBack--GeneralInfo-Event!='WindowActivate'">
                      <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
                        <xsl:if test="PlayBack--ControlInfo-Role!='client'">
                          <xsl:value-of select="incr:postAdopterID(Step-AdaptorID)"/>
                        </xsl:if>
                      </xsl:if>
                    </xsl:if>
                  </xsl:for-each>
                  <xsl:variable name="cnt" select="incr:getAdopterID()"></xsl:variable>

                  <xsl:if test="$cnt ='1'">
                    <!-- Condition-->
                    <xsl:call-template name="WaitElementTemplateMSAA">
                      <xsl:with-param name="Title" select="@DialogName"/>
                      <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                      <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                      <xsl:with-param name="TopPosition" select="incr:getTopPosition(100)"/>
                    </xsl:call-template>
                    <xsl:call-template name="ActivateWindowMSAA">
                      <xsl:with-param name="Title" select="@DialogName"/>
                      <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                      <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                      <xsl:with-param name="TopPosition" select="incr:getTopPosition(100)"/>
                    </xsl:call-template>
                  
                  </xsl:if>
                  <xsl:if test="$cnt ='3'">
                    <!-- Condition-->
                    <xsl:call-template name="WaitElementTemplate">
                      <xsl:with-param name="Title" select="@DialogName"/>
                      <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                      <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                      <xsl:with-param name="TopPosition" select="incr:getTopPosition(100)"/>
                    </xsl:call-template>
                    <xsl:call-template name="ActivateWindowIE">
                      <xsl:with-param name="Title" select="@DialogName"/>
                      <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                      <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                      <xsl:with-param name="TopPosition" select="incr:getTopPosition(100)"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$cnt ='12'">
                    <!-- Condition-->
                    <xsl:call-template name="WaitElementTemplate_Chrome">
                      <xsl:with-param name="Title" select="@DialogName"/>
                      <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                      <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                      <xsl:with-param name="TopPosition" select="incr:getTopPosition(100)"/>
                    </xsl:call-template>
                   <xsl:call-template name="ActivateWindow_Chrome">
                      <xsl:with-param name="Title" select="@DialogName"/>
                      <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                      <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                      <xsl:with-param name="TopPosition" select="incr:getTopPosition(100)"/>
                    </xsl:call-template>
                  </xsl:if>

                </xsl:when>
              </xsl:choose>

              <xsl:for-each select="Step">
                <xsl:choose>
                  <!--<xsl:if test="$AdaptorID ='3'">-->
                  <xsl:when test="Step-AdaptorID = '3'">
                    <xsl:choose>
                      <xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or  PlayBack--GeneralInfo-Event = 'Select'">

                        <xsl:if test="PlayBack--ControlInfo-Role ='editable text' or 
									                    PlayBack--ControlInfo-Role ='list item' or 				
									                    PlayBack--ControlInfo-Role ='radio button' or 
									                    PlayBack--ControlInfo-Role ='push button'  or
									                    PlayBack--ControlInfo-Role ='check box' or 
									                    PlayBack--ControlInfo-Role ='menu item'">
                          <xsl:call-template name="StepConnectionForClickTemplate">
                            <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                            <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                            <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                            <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="PlayBack--ControlInfo-Role ='link'">
                          <xsl:call-template name="LinkConnectionForClickTemplate">
                            <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                            <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                            <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                            <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:when>

                      <xsl:when test="PlayBack--GeneralInfo-Event = 'TypeText' or PlayBack--GeneralInfo-Event = 'TYPETEXT'">
                        <xsl:call-template name="StepConnectionForTypeTemplate">
                          <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                          <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                          <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                        </xsl:call-template>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:when>

                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="Step-AdaptorID = '1' or Step-AdaptorID = '9'">
                        <xsl:choose>
                          <xsl:when test="incr:ToLower(PlayBack--GeneralInfo-Event) = 'click' or incr:ToLower(PlayBack--GeneralInfo-Event) ='select'">
                            <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'editable text'">
                              <xsl:call-template name="TextClickConnectionTemplate">
                                <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                                <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                                <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                              </xsl:call-template>
                            </xsl:if>

                            <xsl:if test="PlayBack--ControlInfo-Role ='check box' or PlayBack--ControlInfo-Role ='menu item' or PlayBack--ControlInfo-Role = 'push button'">
                              <xsl:call-template name="menuitemConnectionTemplate">
                                <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                                <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                                <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                                <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                              </xsl:call-template>
                            </xsl:if>

                            <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'list'  or incr:ToLower(PlayBack--ControlInfo-Role) = 'radio button' ">
                              <!-- list and Combo Box -->
                              <xsl:call-template name="listConnectionTemplate">
                                <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                                <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                                <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                                <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                              </xsl:call-template>
                            </xsl:if>

                          </xsl:when>
                          <xsl:when test="incr:ToLower(PlayBack--GeneralInfo-Event) = 'typetext'">
                            <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'editable text'">
                              <xsl:call-template name="TypetextConnectionTemplate">
                                <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                                <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                                <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:choose>
                          <xsl:when test="Step-AdaptorID = '12'">
                            <xsl:choose>
                              <xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or  PlayBack--GeneralInfo-Event = 'Select'">
                                <xsl:if test="PlayBack--ControlInfo-Role ='editable text' or 
												                      PlayBack--ControlInfo-Role ='radio button' or 
												                      PlayBack--ControlInfo-Role ='list item' or
												                      PlayBack--ControlInfo-Role ='push button'">
                                  <xsl:call-template name="StepConnectionForClickTemplate_Chrome">
                                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                                    <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                                    <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                                    <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                                  </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="PlayBack--ControlInfo-Role ='link'">
                                  <xsl:call-template name="LinkConnectionForClickTemplate_Chrome">
                                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                                    <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                                    <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                                    <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                                  </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="PlayBack--ControlInfo-Role ='check box' or PlayBack--ControlInfo-Role ='menu item' ">
                                  <xsl:call-template name="menuitemConnectionTemplate_Chrome">
                                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                                    <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                                    <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                                    <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                                  </xsl:call-template>
                                </xsl:if>
                              </xsl:when>
                              <xsl:when test="PlayBack--GeneralInfo-Event = 'TypeText' or PlayBack--GeneralInfo-Event = 'TYPETEXT'">
                                <xsl:call-template name="StepConnectionForTypeTemplate_Chrome">
                                  <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
                                  <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
                                  <xsl:with-param name="TopPosition" select="incr:getTopPosition(80)"/>
                                </xsl:call-template>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>

                </xsl:choose>
              </xsl:for-each>
            </xsl:for-each>
            <!--Connection to close-->
            <xsl:call-template name="TerminationConnectionTemplate">
              <xsl:with-param name="UniqueId" select="incr:connectableMethods123()"/>
              <xsl:with-param name="PartID" select="incr:getPartIDConnectio()"/>
              <xsl:with-param name="TopPosition" select="incr:getTopPosition(100)"/>
            </xsl:call-template>
          </xsl:element>
          <!--Links-->
          <Links>
            <xsl:call-template name="LinkElementTemplate">
              <xsl:with-param name="connectableFrom" select="incr:connectableMethodsTo()"/>
            </xsl:call-template>
           
            <xsl:for-each select="Document/Process/GStep">
              <xsl:choose>
                <xsl:when test="Step">
                  <xsl:for-each select="Step">
                    <xsl:if test="PlayBack--GeneralInfo-Event!='WindowActivate'">
                      <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
                        <xsl:if test="PlayBack--ControlInfo-Role!='pane'">
                          <xsl:if test="PlayBack--ControlInfo-Role!='client'">
                            <xsl:value-of select="incr:postAdopterID(Step-AdaptorID)"/>
                          </xsl:if>
                        </xsl:if>
                      </xsl:if>
                    </xsl:if>
                  </xsl:for-each>
                  <xsl:variable name="cnt" select="incr:getAdopterID()"></xsl:variable>
                  <xsl:if test="$cnt ='1' or  $cnt ='3'  or  $cnt ='12' ">
                    <xsl:call-template name="DecisionEventLinkTemplate">
                      <xsl:with-param name="Title" select="@DialogName"/>
                      <xsl:with-param name="connectableFrom" select="incr:connectableMethodsFrom()"/>
                      <xsl:with-param name="connectableTO" select="incr:connectableMethodsTo()"/>
                    </xsl:call-template>
                   <xsl:call-template name="STEPLinkElementTemplate">
                        <xsl:with-param name="connectableFrom" select="incr:connectableMethodsFrom()"/>
                        <xsl:with-param name="connectableTO" select="incr:connectableMethodsTo()"/>
                      </xsl:call-template>
                  </xsl:if>
                </xsl:when>
              </xsl:choose>
              <xsl:for-each select="Step">
                <xsl:choose>
                  <xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event ='Select'">
                    <xsl:if test="PlayBack--ControlInfo-Role ='editable text'">
                      <xsl:call-template name="STEPLinkElementTemplate">
                        <xsl:with-param name="connectableFrom" select="incr:connectableMethodsFrom()"/>
                        <xsl:with-param name="connectableTO" select="incr:connectableMethodsTo()"/>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:if test="PlayBack--ControlInfo-Role ='radio button'  or 
								  PlayBack--ControlInfo-Role ='link' or 						
								  incr:ToLower(PlayBack--ControlInfo-Role) = 'combo boxDelete'">
                      <xsl:call-template name="STEPLinkElementTemplate">
                        <xsl:with-param name="connectableFrom" select="incr:connectableMethodsFrom()"/>
                        <xsl:with-param name="connectableTO" select="incr:connectableMethodsTo()"/>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:if test="PlayBack--ControlInfo-Role ='list item'">
                      <xsl:call-template name="STEPLinkElementTemplate">
                        <xsl:with-param name="connectableFrom" select="incr:connectableMethodsFrom()"/>
                        <xsl:with-param name="connectableTO" select="incr:connectableMethodsTo()"/>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:if test="PlayBack--ControlInfo-Role ='push button'">
                      <xsl:call-template name="STEPLinkElementTemplate">
                        <xsl:with-param name="connectableFrom" select="incr:connectableMethodsFrom()"/>
                        <xsl:with-param name="connectableTO" select="incr:connectableMethodsTo()"/>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:if test="PlayBack--ControlInfo-Role ='check box' or  PlayBack--ControlInfo-Role ='menu item'">
                      <xsl:call-template name="STEPLinkElementTemplate">
                        <xsl:with-param name="connectableFrom" select="incr:connectableMethodsFrom()"/>
                        <xsl:with-param name="connectableTO" select="incr:connectableMethodsTo()"/>
                      </xsl:call-template>
                    </xsl:if>
                     
					 <xsl:if test="Step-AdaptorID = '1'">
						<xsl:if test="PlayBack--ControlInfo-Role ='list'">
							<xsl:call-template name="STEPLinkElementTemplate">
								<xsl:with-param name="connectableFrom" select="incr:connectableMethodsFrom()"/>
								<xsl:with-param name="connectableTO" select="incr:connectableMethodsTo()"/>
							</xsl:call-template>
						</xsl:if>
					 </xsl:if>
				  
				  </xsl:when>
                  <xsl:when test="PlayBack--GeneralInfo-Event = 'TypeText' or PlayBack--GeneralInfo-Event = 'TYPETEXT'">
                    <xsl:call-template name="STEPLinkElementTemplate">
                      <xsl:with-param name="connectableFrom" select="incr:connectableMethodsFrom()"/>
                      <xsl:with-param name="connectableTO" select="incr:connectableMethodsTo()"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
              </xsl:for-each>
            </xsl:for-each>
          </Links>
          <xsl:element name="Comments"> </xsl:element>
          <xsl:element name="SubGraphs"> </xsl:element>
        </xsl:element>
      </xsl:element>

      <!--Connectable methods-->
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

      <xsl:for-each select="Document/Process/GStep">
        <xsl:choose>
          <xsl:when test="Step">
            <xsl:for-each select="Step">
              <xsl:if test="PlayBack--GeneralInfo-Event!='WindowActivate'">
                <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
                  <xsl:if test="PlayBack--ControlInfo-Role!='pane'">
                    <xsl:if test="PlayBack--ControlInfo-Role!='client'">
                      <xsl:value-of select="incr:postAdopterID(Step-AdaptorID)"/>
                    </xsl:if>
                  </xsl:if>
                </xsl:if>
              </xsl:if>
            </xsl:for-each>
            <xsl:variable name="cnt" select="incr:getAdopterID()"></xsl:variable>
            <xsl:if test="$cnt ='1'">
              <xsl:call-template name="waitConnectableMethodMsaa">
                <xsl:with-param name="connectableID" select="incr:connectableMethodsID()"/>
                <xsl:with-param name="Title" select="@DialogName"/>
              </xsl:call-template>
            <xsl:call-template name="ActivateConnectableMethodMSAA">
                <xsl:with-param name="connectableID" select="incr:connectableMethodsID()"/>
                <xsl:with-param name="Title" select="@DialogName"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$cnt ='3'">
              <xsl:call-template name="waitConnectableMethod">
                <xsl:with-param name="connectableID" select="incr:connectableMethodsID()"/>
                <xsl:with-param name="Title" select="@DialogName"/>
              </xsl:call-template>
            <xsl:call-template name="ActivateConnectableMethod">
                <xsl:with-param name="connectableID" select="incr:connectableMethodsID()"/>
                <xsl:with-param name="Title" select="@DialogName"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$cnt ='12'">
              <xsl:call-template name="waitConnectableMethod_Chrome">
                <xsl:with-param name="connectableID" select="incr:connectableMethodsID()"/>
                <xsl:with-param name="Title" select="@DialogName"/>
              </xsl:call-template>
             <xsl:call-template name="ActivateConnectableMethod_Chrome">
                <xsl:with-param name="connectableID" select="incr:connectableMethodsID()"/>
                <xsl:with-param name="Title" select="@DialogName"/>
              </xsl:call-template>
            </xsl:if>
          </xsl:when>

        </xsl:choose>

        <xsl:for-each select="Step">
          <xsl:if test="Step-AdaptorID = '3'">
            <xsl:if test="Step-IsStrayStep !='1'">
              <xsl:if test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event = 'Select'">
                <xsl:if test="PlayBack--ControlInfo-Role ='editable text'">
                  <xsl:if test="PlayBack--AdditionalInfo-Web_Type ='textarea'">
                    <xsl:call-template name="ConnectableMethodTemplateArea">
                      <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                      <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="PlayBack--AdditionalInfo-Web_Type !='textarea'">
                    <xsl:call-template name="ConnectableMethodTemplateText">
                      <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                      <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="PlayBack--ControlInfo-Role ='radio button'">
                  <xsl:call-template name="RadioBtnConnectableMethod">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="PlayBack--ControlInfo-Role ='link'">
                  <xsl:call-template name="LinkConnectableMethod">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>

                <xsl:if test="PlayBack--ControlInfo-Role ='list item'">
                  <xsl:call-template name="DropDownConnectableMethod">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>

                <xsl:if test="PlayBack--ControlInfo-Role ='push button'">
                  <xsl:call-template name="ConnectableMethodTemplateButton">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>

                <xsl:if test="PlayBack--ControlInfo-Role ='check box'">
                  <xsl:call-template name="CheckBoxConnectableMethod">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>

              <xsl:if test="PlayBack--GeneralInfo-Event = 'TypeText' or PlayBack--GeneralInfo-Event = 'TYPETEXT'">
                <xsl:if test="PlayBack--AdditionalInfo-Web_Type ='textarea'">
                  <xsl:variable name="prevStepAreaID">
                    <xsl:value-of select="preceding-sibling::Step[1]/Step-ID"/>
                  </xsl:variable>
                  <xsl:call-template name="ConnectablePropertiesTemplateIETextArea">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-IEControlID,$prevStepAreaID)"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="PlayBack--AdditionalInfo-Web_Type !='textarea'">
                  <xsl:variable name="prevStepID">
                    <xsl:value-of select="preceding-sibling::Step[1]/Step-ID"/>
                  </xsl:variable>
                  <xsl:call-template name="ConnectablePropertiesTemplate">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-IEControlID,$prevStepID)"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
            </xsl:if>
          </xsl:if>
          <xsl:if test="Step-AdaptorID = '1' or Step-AdaptorID = '9'">
            <xsl:if test="Step-IsStrayStep !='1'">
              <xsl:if test="incr:ToLower(PlayBack--GeneralInfo-Event) ='select' or incr:ToLower(PlayBack--GeneralInfo-Event) ='click' ">
                <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'menu item'">
                  <xsl:call-template name="ConnectableMethodTemplateFormenuitem">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>

                <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'editable text'">
                  <xsl:call-template name="ConnectableMethodTemplateForTextBoxClick">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>

                <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'check box'">
                  <xsl:call-template name="ConnectableMethodTemplateForCheckBox">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>

                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'push button'">
                  <xsl:call-template name="ConnectableMethodTemplateForpushbutton">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>

                </xsl:if>

                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'list'">
                  <!-- list and Combo Box -->

                  <xsl:variable name="prevStepRole">
                    <xsl:value-of select="preceding-sibling::Step[1]/PlayBack--ControlInfo-Role"/>
                  </xsl:variable>
                  <xsl:if test="$prevStepRole ='combo box'">
                    <xsl:call-template name="ConnectableMethodTemplateForComboBox">
                      <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                      <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$prevStepRole !='combo box'">
                    <xsl:call-template name="ConnectableMethodTemplateForlist">
                      <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                      <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="PlayBack--ControlInfo-Role ='radio button'">
                  <xsl:call-template name="ConnectableMethodTemplateForRadioButton">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
              <xsl:if test="incr:ToLower1(PlayBack--GeneralInfo-Event) = 'typetext'">
                <xsl:if test="incr:ToLower1(PlayBack--ControlInfo-Role) = 'editable text'">
                  <xsl:call-template name="ConnectableMethodTemplateForTextBoxTypeText">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
            </xsl:if>
          </xsl:if>
          <xsl:if test="Step-AdaptorID = '12'">
            <xsl:if test="Step-IsStrayStep !='1'">
              <xsl:if test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event = 'Select'">
                <xsl:if test="PlayBack--ControlInfo-Role ='editable text'">
                  <xsl:if test="PlayBack--AdditionalInfo-Web_Type ='textarea'">
                    <xsl:call-template name="ConnectableMethodTemplateArea_Chrome">
                      <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                      <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="PlayBack--AdditionalInfo-Web_Type !='textarea'">
                    <xsl:call-template name="ConnectableMethodForTextTemplate_Chrome">
                      <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                      <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="PlayBack--ControlInfo-Role ='check box'">
                  <xsl:call-template name="CheckBoxConnectableMethod_Chrome">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="PlayBack--ControlInfo-Role ='radio button'">
                  <xsl:call-template name="RadioBtnConnectableMethod_Chrome">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="PlayBack--ControlInfo-Role ='list item'">
                  <xsl:call-template name="DropDownConnectableMethod_Chrome">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="PlayBack--ControlInfo-Role ='push button'">
                  <xsl:call-template name="ConnectableMethodTemplateButton_Chrome">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="PlayBack--ControlInfo-Role ='link'">
                  <xsl:call-template name="LinkConnectableMethod_Chrome">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
              <xsl:if test="PlayBack--GeneralInfo-Event = 'TypeText' or PlayBack--GeneralInfo-Event = 'TYPETEXT'">
                <xsl:if test="PlayBack--AdditionalInfo-Web_Type ='textarea'">
                  <xsl:call-template name="ConnectablePropertiesTemplateTextArea">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--AdditionalInfo-Web_ID,Step-ID)"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="PlayBack--AdditionalInfo-Web_Type !='textarea'">
                  <xsl:variable name="prevStepID">
                    <xsl:value-of select="preceding-sibling::Step[1]/Step-ID"/>
                  </xsl:variable>
                  <xsl:call-template name="ConnectablePropertiesTemplate_Chrome">
                    <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
                    <xsl:with-param name="InstanceName" select="concat(PlayBack--AdditionalInfo-Web_ID,$prevStepID)"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
            </xsl:if>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
      <!--Connection to close-->
      <xsl:call-template name="ConnectableMethodTemplateForTermination">
        <xsl:with-param name="methodConne" select="incr:connectableMethodsID()"/>
      </xsl:call-template>


    </Component>
  </xsl:template>
</xsl:stylesheet>
