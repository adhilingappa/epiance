<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:my="my:my"  xmlns:incr="urn:my-scripts" exclude-result-prefixes="msxsl" >
  <msxsl:script implements-prefix='incr' language='CSharp'>
    <![CDATA[
    
       int mnuItem=0; int b=0; int c=0;
       String latGuid = ""; int k=0; int txt=1; int frm=1; int no=0; int clkTxt1=0; int clkTxt2=0;
       int num=1; int chk=0; int frmNum=0;
       
       public string GetNumbeForForm()
       {
          int no=++frmNum;
          return "Form"+no;
       } 
       
       public int GEtNumber()
       {
          return ++num;
       }
       
       public string getGlist1(){
             int num= ++mnuItem;
             return "MenuItem-"+num;
        }
        
        public string  getCheckBoxName()
        {
            int no=++chk;
           return "Check"+no;
        }
  
        public string GetTestBoxInstanceNameForType()
        {
              int no= ++clkTxt1;
             return "TXtBox"+no;
        }
      
         public string GetTestBoxInstanceNameID()
        {
              int no= ++clkTxt2;
             return "TextBox"+no;
        }
  
        public string getGlist3(){
         int num= ++b;
         return "MenuItem-"+num;
       }
    
       public string GetmenuItemPathMatchRule(){       
         int num=++c;
          return "menuItemPathMatchRule"+num;      
      } 
  
        public string getGuid(){
         String gi = Guid.NewGuid().ToString();
         latGuid = gi;
         return latGuid;
        }
 
       public string GetTextBoxes()
       {
         return "TextBox"+txt;
       }
       
       public string getfroms()
       {
           int no= ++frm;
           return "Form"+no;
       }
       
       public int getNumber()
       {
          return no++;
       }

       ArrayList list = new ArrayList(); 
       public void addDialogueToArray(string dlgName)
       {
          if(!list.Contains(dlgName))
                list.Add(dlgName);
       }
 
       public bool checkDlgNamExists(string dlgname)
       {
          if(list.Contains(dlgname))
          {
            return true;
          }
          else
          {
           return false;
          }
       }
       
      public string GetExePath(string str)
      {
          //string name = @"C:\WINDOWS\SYSTEM32\notepad.exe";   
		string path_Str="";
		if(str!="")
		{
		  path_Str = str.TrimEnd('\\');
		  path_Str = path_Str.Remove(path_Str.LastIndexOf('\\'));        
		  path_Str=path_Str.Replace("&#xA;",string.Empty).Trim();
		}		  
        return path_Str;                     
      } 
	  
	  public string RemoveSpaces(string str)
      {			       
		if(str!="")
		{
			str=str.Replace("&#xA;",string.Empty).Trim();		
		}
		return str;                     
      }
	  
	  
	  public string GetWorkingDirectory(string str)
      {
			string workingDir="";		
		//string name = @"C:\WINDOWS\SYSTEM32\notepad.exe";          
		if(str!="")
		{
			workingDir = str.TrimEnd('\\');
			workingDir = workingDir.Remove(workingDir.LastIndexOf('\\'));
			int pos = workingDir.LastIndexOf("\\") + 1;
			workingDir=workingDir.Substring(pos, workingDir.Length - pos); 
			workingDir = Regex.Replace(workingDir, @"[\d-]", string.Empty);
			
			workingDir=workingDir.Replace("&#xA;",string.Empty).Trim();
			
			
		}
		return workingDir;                     
      }
      
      string tmpParentName="";
      int i=0;
      public void postStepUIA_PARENT_NAME(string parentName)
      {
        if(i==0)
        {
          if(parentName!="")
          {
              if(tmpParentName=="")
                  tmpParentName=parentName;     
                  i++;
          }
        }    
      }
      
      public string getStepUIA_PARENT_NAME()
      {
        string tmpParentName1=tmpParentName;
          i=0; tmpParentName="";
          return tmpParentName1;
      }
      
      public string ToLower(string stringValue)
      {
        string result = String.Empty;

        if(!String.IsNullOrEmpty(stringValue))
        {
          result = stringValue.ToLower(); 
        }

        return result;
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
	  
	 
      public string ReplaceExe(string exeName)
		{
			string exeNamewithoutExe =  "";
			if(exeName!="")
			{
				exeNamewithoutExe=  exeName;
				exeNamewithoutExe = exeNamewithoutExe.Replace(".exe","");
				return exeNamewithoutExe;
			}
			 return exeNamewithoutExe;
		}
		
		public string GetWindowsTitleForControl(string controlData,string sbKeys)
		{
			string tmpcontrolData = controlData;
            string tmpsbKeys = sbKeys;
            if (sbKeys != "")
            {
                if (sbKeys.Contains("+"))
                {
                    tmpsbKeys = sbKeys.Substring(sbKeys.LastIndexOf("+",StringComparison.CurrentCultureIgnoreCase) + 1);
                }
                int Place = tmpcontrolData.LastIndexOf(tmpsbKeys, StringComparison.CurrentCultureIgnoreCase);
                string final= tmpcontrolData.Insert(Place, "&");               
                return final;
            }
            return tmpcontrolData;
		}
      
    
      ]]>
  </msxsl:script>


  <xsl:variable name="windowAdopter">WindowsAdapter-8D7D55F69665FC7</xsl:variable>
  <xsl:variable name="WindowsName1">Windows Application1</xsl:variable>
  <xsl:variable name="False">false</xsl:variable>
  <xsl:variable name="True">true</xsl:variable>


  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <OpenSpanDesignDocument Version="19.1.0.1" Serializer="2.0" Culture="en-IN">
      <xsl:call-template name="ReferenceTemplate"/>
      <xsl:call-template name="ComponetTemplate"/>
    </OpenSpanDesignDocument>
  </xsl:template>

  <xsl:template name="ReferenceTemplate">
    <ComponentInfo>
      <Type Value="OpenSpan.Adapters.Windows.WindowsAdapter" />
      <Assembly Value="OpenSpan.Adapters.Windows" />
      <AssemblyReferences>
        <Assembly Value="mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
        <Assembly Value="OpenSpan, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
        <Assembly Value="OpenSpan.Adapters, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
        <Assembly Value="OpenSpan.Adapters.Windows, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
        <Assembly Value="System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
      </AssemblyReferences>
      <DynamicAssemblyReferences />
      <FileReferences />
      <BuildReferences>
        <File Value="DefaultWindowFactoryConfiguration.xml" />
        <File Value="openspan.ini" />
        <File Value="OpenSpan.x32.sys" />
        <File Value="OpenSpan.x64.sys" />
        <File Value="Pega.GlobalAllocator.x32.dll" />
        <File Value="Pega.GlobalAllocator.x64.dll" />
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
  </xsl:template>

  <xsl:template name="ComponetTemplate">
    <xsl:param name="p1"/>
    <xsl:variable name="Path">
      <xsl:value-of select="Document/EXE_PATH"/>
    </xsl:variable>
    <xsl:variable name="WindowsName">
      <xsl:value-of select="Document/Meta/GpsFile"/>
    </xsl:variable>
    <xsl:variable name="ExeName">
      <xsl:value-of select="Document/EXE_NAME"/>
    </xsl:variable>

    <xsl:element name="Component">
      <xsl:attribute name="Version">
        <xsl:value-of select="1.0"/>
      </xsl:attribute>

      <xsl:element name="OpenSpan.Adapters.Windows.WindowsAdapter">
        <xsl:attribute name="Name">
          <xsl:value-of select="concat($WindowsName,'_',incr:ReplaceExe($ExeName),'_winapp')"/>
        </xsl:attribute>
        <xsl:attribute name="Id">
          <xsl:value-of select="$windowAdopter"/>
        </xsl:attribute>
        <xsl:element name="Path">
          <xsl:attribute name="Value">
            <xsl:value-of select="concat(incr:RemoveSpaces($Path) ,concat(' | ',incr:GetWorkingDirectory($Path)))"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="WorkingDirectory">
          <xsl:attribute name="Value">
            <xsl:value-of select="incr:GetExePath(Document/Meta/ExePath)"/>
          </xsl:attribute>
        </xsl:element>

        <xsl:element name="Content">
          <xsl:attribute name="Name">
            <xsl:value-of select="'Controls'"/>
          </xsl:attribute>
          <xsl:element name="Items">
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
                  <xsl:variable name="AdaptorID1" select="incr:getAdopterID()"></xsl:variable>


                  <!--<xsl:if test="$AdaptorID1 ='1' or $AdaptorID1 ='0'  or $AdaptorID1 ='9'">-->

                  <xsl:variable name="getNum" select="incr:GEtNumber()"></xsl:variable>
                  <xsl:variable name="frmID" select="incr:GetNumbeForForm()"></xsl:variable>
                  <xsl:variable name="frmName" select="@DialogName"></xsl:variable>

                  <xsl:element name="OpenSpan.Adapters.Controls.Form">
                    <xsl:attribute name="Name">
                      <xsl:value-of select="$frmName"/>
                    </xsl:attribute>
                    <xsl:attribute name="Id">
                      <xsl:value-of select="$frmName"/>
                    </xsl:attribute>
                    <xsl:element name="DummyPropertyToDetectReplaceUndo">
                      <xsl:attribute name="Value">
                        <xsl:value-of select="'0'"/>
                      </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="ForwardObjectExplorerEvent">
                      <xsl:attribute name="Value">
                        <xsl:value-of select="'True'"/>
                      </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="MatchingIndex">
                      <xsl:attribute name="Value">
                        <xsl:value-of select="'0'"/>
                      </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="TargetTypeString">
                      <xsl:attribute name="Value">
                        <xsl:value-of select="'OpenSpan.Adapters.Windows.Targets.Form, OpenSpan.Adapters.Windows'"/>
                      </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="Content">
                      <xsl:attribute name="Name">
                        <xsl:value-of select="'Controls'"/>
                      </xsl:attribute>
                      <xsl:element name="Items">
                        <xsl:for-each select="Step">
                          <xsl:if test="Step-IsStrayStep  !='1'">
                            <xsl:if test="Step-AdaptorID  ='1'">

                              <!--<xsl:value-of select="incr:postStepUIA_PARENT_NAME(PlayBack-$-AdditionalInfo-UIA_PARENT_CLASSNAME)"/>-->
                              <xsl:value-of select="incr:postStepUIA_PARENT_NAME(PlayBack--AdditionalInfo-UIA_FOREGROUND_WINDOW_TYPE)"/>

                              <xsl:if test="PlayBack--GeneralInfo-Event = 'Select' or incr:ToLower(PlayBack--GeneralInfo-Event) = 'click'">


                                <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'menu item'">
                                  <xsl:call-template name="MnuElement"/>
                                </xsl:if>

                                <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'check box'">
                                  <xsl:call-template name="checkboxelementTemplate"/>
                                </xsl:if>

                                <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'list'">
                                  <!-- list and Combo Box -->
                                  <xsl:variable name="prevStepRole">
                                    <xsl:value-of select="preceding-sibling::Step[1]/PlayBack--ControlInfo-Role"/>
                                  </xsl:variable>
                                  <xsl:if test="$prevStepRole ='combo box'">
                                    <xsl:call-template name="ComboBoxelementTemplate"/>
                                  </xsl:if>
                                  <xsl:if test="$prevStepRole !='combo box'">
                                    <xsl:call-template name="ListelementTemplate"/>
                                  </xsl:if>
                                </xsl:if>

                                <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'editable text'">
                                  <xsl:call-template name="TextelementTemplate"/>
                                </xsl:if>

                                <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'push button'">
                                  <xsl:call-template name="buttonelementTemplate"/>
                                </xsl:if>

                                <xsl:if test="incr:ToLower(PlayBack--ControlInfo-Role) = 'radio button'">
                                  <xsl:call-template name="RadioBtnelementTemplate"/>
                                </xsl:if>

                              </xsl:if>
                            </xsl:if>
                          </xsl:if>
                        </xsl:for-each>
                      </xsl:element>
                    </xsl:element>
                    <xsl:call-template name="ContentMatchRules"></xsl:call-template>
                  </xsl:element>


                </xsl:when>
              </xsl:choose>
            </xsl:for-each>

          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>



  <xsl:template  name="MnuElement">
    <xsl:element name="OpenSpan.Adapters.Controls.MenuItem">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlData,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlData,@DialogName)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="0"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="FullPath">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="'9'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Windows.Targets.MenuItem, OpenSpan.Adapters.Windows'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MatchRules'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.MenuItemPathMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetmenuItemPathMatchRule()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('MenuItemPathMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="Path">
              <xsl:if test="PlayBack--AdditionalInfo-UIA_PARENT_AUTOMATIONID = ''">
                <xsl:attribute name="Value">
                  <xsl:value-of select="concat(PlayBack--ParentInfo-ParentName,'/',PlayBack--ControlInfo-ControlData)"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="PlayBack--AdditionalInfo-UIA_PARENT_AUTOMATIONID != ''">
                <xsl:attribute name="Value">
                  <xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
                </xsl:attribute>
              </xsl:if>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="TextelementTemplate">
    <xsl:element name="OpenSpan.Adapters.Controls.TextBox">
      <xsl:attribute name="Name">
        <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,@DialogName)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
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
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Windows.Targets.TextBox, OpenSpan.Adapters.Windows'"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MatchRules'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ClassNameMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('classNameMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ClassNameMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ClassName">
              <xsl:attribute name="Value">
                <xsl:value-of select="PlayBack--ControlInfo-ClassName"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ControlIdMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('controlIdMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ControlIdMatchRule-8D7DDFFEED8A80',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ControlId">
              <xsl:attribute name="Value">
                <xsl:value-of select="PlayBack--AdditionalInfo-UIA_AUTOMATIONID"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="checkboxelementTemplate">
    <xsl:variable name="Data"  select="PlayBack--ControlInfo-ControlName"></xsl:variable>
    <xsl:variable name="windowTextMatchRule" select="concat('windowTextMatchRule',incr:GEtNumber())"></xsl:variable>
    <xsl:variable name="frmName" select="incr:GetNumbeForForm()"></xsl:variable>

    <xsl:element name="OpenSpan.Adapters.Controls.CheckBox">
      <xsl:attribute name="Name">
        <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,@DialogName)"/>
      </xsl:attribute>

      <DummyPropertyToDetectReplaceUndo Value="0" />
      <ForwardObjectExplorerEvent Value="True" />
      <MatchingIndex Value="5" />
      <TargetTypeString Value="OpenSpan.Adapters.Windows.Targets.CheckBox, OpenSpan.Adapters.Windows" />
      <Content Name="MatchRules">
        <Items>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ClassNameMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('classNameMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ClassNameMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ClassName">
              <xsl:attribute name="Value">
                <xsl:value-of disable-output-escaping="yes" select="PlayBack--ControlInfo-ClassName"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ControlIdMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('controlIdMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ControlIdMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ControlId">
              <xsl:attribute name="Value">
                <xsl:value-of select="PlayBack--AdditionalInfo-UIA_AUTOMATIONID"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <!-- <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.WindowTextMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="$windowTextMatchRule"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('WindowTextMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>

            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of disable-output-escaping="no"  select ="concat('Simple|True|(User Culture)|',$Data)"></xsl:value-of>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>-->
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

  <xsl:template name="buttonelementTemplate">
    <xsl:variable name="Data"  select="PlayBack--ControlInfo-ControlName"></xsl:variable>
    <xsl:variable name="Skey"  select="PlayBack--AdditionalInfo-UIA_ACCESSKEY"></xsl:variable>
    <xsl:variable name="windowTextMatchRule" select="concat('windowTextMatchRule',incr:GEtNumber())"></xsl:variable>
    <xsl:variable name="frmName" select="incr:GetNumbeForForm()"></xsl:variable>
    <xsl:variable name="ControlData" select="incr:GetWindowsTitleForControl($Data,$Skey)"></xsl:variable>

    <xsl:element name="OpenSpan.Adapters.Controls.Button">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,@DialogName)"/>
      </xsl:attribute>
      <DummyPropertyToDetectReplaceUndo Value="0" />
      <ForwardObjectExplorerEvent Value="True" />
      <MatchingIndex Value="5" />
      <TargetTypeString Value="OpenSpan.Adapters.Windows.Targets.Button, OpenSpan.Adapters.Windows" />
      <Content Name="MatchRules">
        <Items>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.WindowTextMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="$windowTextMatchRule"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('WindowTextMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of  select ="concat('Simple|True|(User Culture)|',$ControlData)"></xsl:value-of>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ClassNameMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('classNameMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ClassNameMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ClassName">
              <xsl:attribute name="Value">
                <xsl:value-of select="PlayBack--AdditionalInfo-UIA_CLASSNAME"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <!-- <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ControlIdMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('controlIdMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ControlIdMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ControlId">
              <xsl:attribute name="Value">
                <xsl:value-of select="PlayBack-$-AdditionalInfo-UIA_AUTOMATIONID"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>-->
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

  <xsl:template name="RadioBtnelementTemplate">
    <xsl:variable name="Data"  select="PlayBack--ControlInfo-ControlName"></xsl:variable>
    <xsl:variable name="windowTextMatchRule" select="concat('windowTextMatchRule',incr:GEtNumber())"></xsl:variable>
    <xsl:variable name="frmName" select="incr:GetNumbeForForm()"></xsl:variable>
    <xsl:element name="OpenSpan.Adapters.Controls.RadioButton">
      <xsl:attribute name="Name">
        <xsl:value-of select="$Data"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,@DialogName)"/>
      </xsl:attribute>
      <DummyPropertyToDetectReplaceUndo Value="0" />
      <ForwardObjectExplorerEvent Value="True" />
      <MatchingIndex Value="5" />
      <TargetTypeString Value="OpenSpan.Adapters.Windows.Targets.Button, OpenSpan.Adapters.Windows" />
      <Content Name="MatchRules">
        <Items>
          <!-- <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.WindowTextMatchRule">
                  <xsl:attribute name="Name">
                    <xsl:value-of select="$windowTextMatchRule"/>
                  </xsl:attribute>
                  <xsl:attribute name="Id">
                    <xsl:value-of select="concat('WindowTextMatchRule',incr:GEtNumber())"/>
                  </xsl:attribute>
                  <xsl:element name="Text">
                    <xsl:attribute name="Value">
                      <xsl:value-of  select ="concat('Simple|True|(User Culture)|',$Data)"></xsl:value-of>
                    </xsl:attribute>
                  </xsl:element>
                </xsl:element>-->
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ClassNameMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('classNameMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ClassNameMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ClassName">
              <xsl:attribute name="Value">
                <xsl:value-of select="PlayBack--ControlInfo-ClassName"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ControlIdMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('controlIdMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ControlIdMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ControlId">
              <xsl:attribute name="Value">
                <xsl:value-of select="PlayBack--AdditionalInfo-UIA_AUTOMATIONID"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ComboBoxelementTemplate">
    <xsl:variable name="Data"  select="PlayBack--ControlInfo-ControlName"></xsl:variable>
    <xsl:variable name="windowTextMatchRule" select="concat('windowTextMatchRule',incr:GEtNumber())"></xsl:variable>
    <xsl:variable name="frmName" select="incr:GetNumbeForForm()"></xsl:variable>
    <xsl:element name="OpenSpan.Adapters.Controls.ComboBox">
      <xsl:attribute name="Name">
        <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlData,@DialogName)"/>
      </xsl:attribute>
      <DummyPropertyToDetectReplaceUndo Value="0" />
      <ForwardObjectExplorerEvent Value="True" />
      <MatchingIndex Value="5" />
      <TargetTypeString Value="OpenSpan.Adapters.Windows.Targets.Button, OpenSpan.Adapters.Windows" />
      <Content Name="MatchRules">
        <Items>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ClassNameMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('classNameMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ClassNameMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ClassName">
              <xsl:attribute name="Value">
                <xsl:value-of select="preceding-sibling::Step[1]/PlayBack--ControlInfo-ClassName"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ControlIdMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('controlIdMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ControlIdMatchRule-',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ControlId">
              <xsl:attribute name="Value">
                <xsl:value-of select="preceding-sibling::Step[1]/PlayBack--AdditionalInfo-UIA_AUTOMATIONID"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>

  <xsl:template  name="ContentMatchRules">
    <xsl:variable name="getNum" select="incr:GEtNumber()"></xsl:variable>
    <xsl:variable name="WMatchRule" select="concat('windowTextMatchRule',$getNum)"></xsl:variable>
    <xsl:variable name="CMatchRule" select="concat('classNameMatchRule',$getNum)"></xsl:variable>
    <Content Name="MatchRules">
      <Items>
        <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.WindowTextMatchRule">
          <xsl:attribute name="Name">
            <xsl:value-of select="$WMatchRule"/>
          </xsl:attribute>
          <xsl:attribute name="Id">
            <xsl:value-of select="$WMatchRule"/>
          </xsl:attribute>
          <xsl:element name="Text">
            <xsl:attribute name="Value">
              <xsl:value-of select="concat('Simple|True|(User Culture)|',@DialogName)"/>
            </xsl:attribute>
          </xsl:element>
        </xsl:element>
        <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ClassNameMatchRule">
          <xsl:attribute name="Name">
            <xsl:value-of select="$CMatchRule"/>
          </xsl:attribute>
          <xsl:attribute name="Id">
            <xsl:value-of select="$CMatchRule"/>
          </xsl:attribute>
          <xsl:element name="ClassName">
            <xsl:attribute name="Value">
              <xsl:value-of select="incr:getStepUIA_PARENT_NAME()"/>
            </xsl:attribute>
          </xsl:element>
        </xsl:element>
      </Items>
    </Content>
  </xsl:template>

  <xsl:template name="ListelementTemplate">
    <xsl:variable name="Data"  select="PlayBack--ControlInfo-ControlName"></xsl:variable>
    <xsl:variable name="windowTextMatchRule" select="concat('windowTextMatchRule',incr:GEtNumber())"></xsl:variable>
    <xsl:variable name="frmName" select="incr:GetNumbeForForm()"></xsl:variable>

    <xsl:element name="OpenSpan.Adapters.Controls.ComboBox">
      <xsl:attribute name="Name">
        <xsl:value-of select="PlayBack--ControlInfo-ControlName"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlData,@DialogName)"/>
      </xsl:attribute>
      <DummyPropertyToDetectReplaceUndo Value="0" />
      <ForwardObjectExplorerEvent Value="True" />
      <MatchingIndex Value="1" />
      <TargetTypeString Value="OpenSpan.Adapters.Windows.Targets.ComboBox, OpenSpan.Adapters.Windows" />
      <Content Name="Controls">
        <Items>
          <xsl:element name="OpenSpan.Adapters.Controls.Control">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('Control',Step-ID)"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('Control',Step-ID)"/>
            </xsl:attribute>
            <DummyPropertyToDetectReplaceUndo Value="0" />
            <ForwardObjectExplorerEvent Value="True" />
            <MatchingIndex Value="0" />
            <TargetTypeString Value="OpenSpan.Adapters.Windows.Targets.Control, OpenSpan.Adapters.Windows" />
            <Content Name="MatchRules">
              <Items>
                <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ClassNameMatchRule">
                  <xsl:attribute name="Name">
                    <xsl:value-of select="concat('classNameMatchRule',incr:GEtNumber())"/>
                  </xsl:attribute>
                  <xsl:attribute name="Id">
                    <xsl:value-of select="concat('ClassNameMatchRule-',incr:GEtNumber())"/>
                  </xsl:attribute>
                  <xsl:element name="ClassName">
                    <xsl:attribute name="Value">
                      <xsl:value-of disable-output-escaping="yes" select="PlayBack--ControlInfo-ClassName"/>
                    </xsl:attribute>
                  </xsl:element>
                </xsl:element>
                <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ControlIdMatchRule">
                  <xsl:attribute name="Name">
                    <xsl:value-of select="concat('controlIdMatchRule',incr:GEtNumber())"/>
                  </xsl:attribute>
                  <xsl:attribute name="Id">
                    <xsl:value-of select="concat('ControlIdMatchRule-',incr:GEtNumber())"/>
                  </xsl:attribute>
                  <xsl:element name="ControlId">
                    <xsl:attribute name="Value">
                      <xsl:value-of select="PlayBack--AdditionalInfo-UIA_PARENT_AUTOMATIONID"/>
                    </xsl:attribute>
                  </xsl:element>
                </xsl:element>
              </Items>
            </Content>
          </xsl:element>
        </Items>
      </Content>
      <Content Name="MatchRules">
        <Items>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ClassNameMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('windowTextMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('windowTextMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ClassName">
              <xsl:attribute name="Value">
                <xsl:value-of select="'ComboBox'"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Windows.MatchRules.ControlIdMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="concat('classNameMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ClassNameMatchRule',incr:GEtNumber())"/>
            </xsl:attribute>
            <xsl:element name="ControlId">
              <xsl:attribute name="Value">
                <xsl:value-of select="'1136'"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
        </Items>
      </Content>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>