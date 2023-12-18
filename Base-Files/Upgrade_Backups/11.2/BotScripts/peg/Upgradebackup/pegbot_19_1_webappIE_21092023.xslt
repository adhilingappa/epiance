<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:my="my:my"  xmlns:incr="urn:my-scripts" exclude-result-prefixes="msxsl" >
  <msxsl:script implements-prefix='incr' language='CSharp'>
    <![CDATA[
	int Ie_l=0;
	int Ie_m=0;
	int Ie_n=0;
	int Ie_o=0;
	int Ie_q=0;
	int Ie_r=0;   

	public string GetinputTypeMatchRuleLists()
	{
		//String gi = inputTypeMatchRuleLists[r];
		String gi = "inputTypeMatchRule";
		Ie_r++;
		return gi+Ie_r;

	} 

	public string GettxtBox()
	{
		// String gi = txtBoxList[l];
		string gi="TextBox" ;   
		Ie_l++;
		return gi+Ie_l;

	} 
	
	public string GetelementIdMatchRule()
	{
		//String gi = elementIdMatchRuleLists[q];
		String gi = "elementIdMatchRuleLists";
		Ie_q++;
		return gi+Ie_q;

	} 
	
	public string GettxtBox1()
	{
		// String gi = txtBoxList[m];
		string gi="TextBox" ;          
		Ie_m++;
		return gi+Ie_m;

	} 

	public string GetInputTypeMatchRule()
	{
		// String gi = InputTypeMatchRuleList[n];
		String gi="InputTypeMatchRuleList"; 
		Ie_n++;
		return gi+Ie_n;

	} 

	public string GetElementIdMatchRule()
	{
		// String gi = ElementIdMatchRuleList[o];
		String gi = "ElementIdMatchRuleList";
		Ie_o++;
		return gi+Ie_o;

	} 


	public string GetDomain(string str)
	{
		if(str!="")
		{
			Uri url = new Uri(str);
			return url.Host;
		}
		return str;
	}

	public string GetDomainPath(string str)
	{   
		string s="";
		if(str!="")
		{
			Uri url = new Uri(str);
			if(url.Host!="")
			{      
				s=str.Replace(url.Host,"" ).Replace("http://","").Replace("https://","");
				if(s.Contains("?"))
				s = s.Substring(0, s.LastIndexOf("?"));  
			}
			return s;
		}
		return str;
	}

	public string GetRequestType(string str)
	{
		if(str!="")
		{
			var uri = new Uri(str);
			var requestType= uri.Scheme;
			return requestType;
		}
		return str;
	}

	string tmpCaptionName=""; int cap=0;
	public void postCaptionName(string CaptionName)
	{
		if(cap==0)
		{
		  if(CaptionName!="")
		  {
			  if(tmpCaptionName=="")
				  tmpCaptionName=CaptionName;     
				  cap++;
		  }
		}    
	}

	public string getCaptionName()
	{
		/*string tmpCaptionName1=tmpCaptionName;
		cap=0; tmpCaptionName="";
		return tmpCaptionName1;*/
		
		string tmpCaptionName1 ="";
		if(tmpCaptionName!="")
		{
			if(tmpCaptionName.Contains("-"))
			{
				tmpCaptionName1= tmpCaptionName.Split('-')[0];	
				cap=0; tmpCaptionName="";
				return tmpCaptionName1;					
			}
		}
		tmpCaptionName1=tmpCaptionName;
		cap=0; tmpCaptionName="";
		return tmpCaptionName1;
	}


	string tmpStartPage=""; int SPage=0;
	public void postStartPage(string StartPageUrl)
	{
		if(SPage==0)
		{
		  if(StartPageUrl!="")
		  {
			  if(tmpStartPage=="")
				  tmpStartPage=StartPageUrl;     
				  SPage++;
		  }
		}    
	}

	public string getStartPage()
	{
		string tmpCaptionName1=tmpStartPage;
		SPage=0; tmpStartPage="";
		return tmpCaptionName1;
	}


	string tmpIEAliasName=""; int AName=0;
	public void postWebPageName(string AliasName)
	{
		if(AName==0)
		{
		  if(AliasName!="")
		  {
			if(tmpIEAliasName=="")
			  tmpIEAliasName=AliasName;     
			  AName++;
		  }
		 }    
	}

	public string getWebPageName()
	{
		string tmpAliasName=tmpIEAliasName;
		AName=0; tmpIEAliasName="";
		return tmpAliasName;
	}
	int frm=0;

	int webP=0;
	public string getWebPage()
	{
		int nu=++webP;
		return "WebPage"+nu;
	}

	int UrlMatch=0; int TitleMatch=0;
	public string getDocumentUrlMatchRule()
	{
		int nu=++UrlMatch;
		return "getDocumentUrlMatchRule"+nu;
	}

	public string getDocumentTitleMatchRule()
	{
		int nu=++TitleMatch;
		return "getDocumentTitleMatchRule"+nu;
	}
	
	int frmMethodMat=0;
	public string FormMethodMatchRule()
	{
		int nu=++frmMethodMat;
		return "FormMethodMatchRule"+nu;
	}


	public string removeSpaces(string str)
	{
		string str1="";
		if(str!="")
		str1 = Regex.Replace(str, @"\s+", "");

		return str1;

	}

	string tmpAID=""; int ADName=0;
	public void postAdopterID(string AID)
	{
		if(ADName==0)
		{
		  if(AID!="")
		  {
			if(tmpAID=="")
				tmpAID=AID;     
				ADName++;
		  }
		 }    
	}

	public string getAdopterID()
	{
		string tmpAID1=tmpAID;
		ADName=0; tmpAID="";
		return tmpAID1;
	}

	string tmpRole=""; int roleN=0;
	public void postStepRole(string Role)
	{
		if(Role!="")
		{
			tmpRole=Role;     
			
		}	     
	}

	public string getStepRole()
	{
		string tmpRole1=tmpRole;
		roleN=0; tmpRole="";
		return tmpRole1;
	}


	public string GetXpath(string Xpath)
	{
		if (Xpath != "")
		{
			Xpath = Xpath.Replace("/body/", "html/body/");
			Xpath = System.Text.RegularExpressions.Regex.Replace(Xpath, @"\[[0-9]+\]", string.Empty);
			string[] arrayList = Xpath.ToUpper().Split('/');
			Array.Reverse(arrayList);
			object obj = arrayList;
			return EncryptData(obj);
		}
		return "";
	}

	private string EncryptData(object obj)
	{
	  string encdata = "";
	  System.Runtime.Serialization.Formatters.Binary.BinaryFormatter binaryFormatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
	  using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
	  {
		  binaryFormatter.Serialize(memoryStream, obj);
		  byte[] data = memoryStream.ToArray();
		  encdata = Convert.ToBase64String((data));
	  }            
	  return encdata;
	} 


	string tmpControlID=""; int controlIDN=0;
	public void postStepControlID(string CtrlId)
	{
		if(controlIDN==0)
		{
			if(CtrlId!="")
			{
			  if(tmpControlID=="")
				tmpControlID=CtrlId;     
				controlIDN++;
			}
		}    
	}




	public string getStepControlID()
	{
		string tmpRole1=tmpControlID;
		controlIDN=0; tmpControlID="";
		return tmpRole1;
	}

	string tmpControlName1=""; int controlNameN1=0;
	public void postStepControlName1(string CtrlName)
	{
		if(controlNameN1==0)
		{
			if(CtrlName!="")
			{
			if(tmpControlName1=="")
				tmpControlName1=CtrlName;     
				controlNameN1++;
			}
		}    
	}
	
	public string getStepControlName1()
	{
		string tmpCname=tmpControlName1;
		controlNameN1=0; tmpControlName1="";
		return tmpCname;
	}
  
  
    string tmpInnerTxt=""; int InnertxtN=0;
	public void postStepControlInnertText(string innerTxt)
	{
		if(InnertxtN==0)
		{
			if(innerTxt!="")
			{
			  if(tmpInnerTxt=="")
				tmpInnerTxt=innerTxt;     
				InnertxtN++;
			}
		}    
	}

	public string getStepControlInnertText()
	{
		string tmpInnerTxt1=tmpInnerTxt;
		InnertxtN=0; tmpInnerTxt="";
		return tmpInnerTxt1;
	}

    System.Collections.Generic.List<string> StepControlNameList = new System.Collections.Generic.List<string>();
	public void postStepControlNameList(string CtrlName)
	{
		   StepControlNameList.Add(CtrlName);
	}
  
	public string getStepControlName1(int i)
	{
	   return StepControlNameList[i];
	}

	System.Collections.Generic.List<string> StepInnerTextList = new System.Collections.Generic.List<string>();
	public void postStepInnerTextList(string innertext)
	{
		   StepInnerTextList.Add(innertext);
	}

	public string getStepInnerTex(int i)
	{
	   return StepInnerTextList[i];
	}

	public string getStepID(int i)
	{
		return StepIDList[i];
		/*string tmpStepID1=tmpStepID;
		StepIdN1=0; tmpStepID="";
		return tmpStepID1;*/
	}
	
	string tmpStepID=""; int StepIdN1=0;
	public void postStepIDButton(string StepID)
	{
		if(StepIdN1==0)
		{
			if(StepID!="")
			{
			if(tmpStepID=="")
				tmpStepID=StepID;     
				StepIdN1++;
			}
		}    
	}
	
	public string getStepIDButton()
	{
		
		string tmpStepID1=tmpStepID;
		StepIdN1=0; tmpStepID="";
		return tmpStepID1;
	}

    string tmpStepControlName1=""; int StepControlName2=0;
	public void postStepControlNameButton(string StepControlName)
	{
		if(StepControlName2==0)
		{
			if(StepControlName!="")
			{
			if(tmpStepControlName1=="")
				tmpStepControlName1=StepControlName;     
				StepControlName2++;
			}
		}    
	}

	public string getStepControlNameButton()
	{
		
		string tmpStepControlName12=tmpStepControlName1;
		StepControlName2=0; tmpStepControlName1="";
		return tmpStepControlName12;
	}

    System.Collections.Generic.List<string> StepIDList = new System.Collections.Generic.List<string>();
	public void postStepID(string StepID11)
	{
		 StepIDList.Add(StepID11);   
	}
  
  
	public int getCountList()
	{
		return StepIDList.Count;
	}


	string tmpFormID=""; int FormIDN=0;
	public void postFormID(string FrmID)
	{
		if(FormIDN==0)
		{
			if(FrmID!="")
			{
			  if(tmpFormID=="")
				tmpFormID=FrmID;     
				FormIDN++;
			}
		}    
	}

	public string getFormID()
	{
		string tmpFormID1=tmpFormID;
		FormIDN=0; tmpFormID="";
		return tmpFormID1;
	}
  
	int ii=0;
  
	public void reset()
	{
		ii=0;
		StepIDList.Clear();
		StepControlNameList.Clear();
		StepInnerTextList.Clear();
		StepWebIndexList.Clear();
	}
  
	public int getCountList1()
	{
		 int n=ii;
		 ii++;
		 return n;
	}
	
	
	string tmpWEBIDX=""; int SWEBIDX=0;
	public void postStepWEBIDX(string WEBIDX)
	{
		if(SWEBIDX==0)
		{
		  if(WEBIDX!="")
		  {
			if(tmpWEBIDX=="")
			  tmpWEBIDX=WEBIDX;     
			  SWEBIDX++;
		  }
		 }    
	}

	public string getStepWEBIDX()
	{
		string tmpWEBIDX1=tmpWEBIDX;
		SWEBIDX=0; tmpWEBIDX="";
		return tmpWEBIDX1;
	}
	
	string tmpIEAttributeTagName=""; int StagName=0;
	public void postStepIEAttributeTagName(string IEAttributeTagName)
	{
		if(StagName==0)
		{
		  if(IEAttributeTagName!="")
		  {
			if(tmpIEAttributeTagName=="")
			  tmpIEAttributeTagName=IEAttributeTagName;     
			  StagName++;
		  }
		 }    
	}

	public string gettStepIEAttributeTagName()
	{
		string tmpIEAttributeTagName1=tmpIEAttributeTagName;
		StagName=0; tmpIEAttributeTagName="";
		return tmpIEAttributeTagName1;
	}
	
	string tmpWeb_Type=""; int SWebType=0;
	public void postStepWeb_Type(string Web_Type)
	{
		if(SWebType==0)
		{
		  if(Web_Type!="")
		  {
			if(tmpWeb_Type=="")
			  tmpWeb_Type=Web_Type;     
			  SWebType++;
		  }
		 }    
	}

	public string gettStepWeb_Type()
	{
		string tmpWeb_Type1=tmpWeb_Type;
		SWebType=0; tmpWeb_Type="";
		return tmpWeb_Type1;
	}
	
	System.Collections.Generic.List<string> StepWebIndexList = new System.Collections.Generic.List<string>();
	public void postStepWebIndexList(string WebIdx)
	{
	   StepWebIndexList.Add(WebIdx);
	}

	public string getStepWebIdx(int i)
	{
	return StepWebIndexList[i];
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
        <xsl:variable name="WebName">
          <xsl:value-of select="Document/Meta/GpsFile"/>
        </xsl:variable>
        <xsl:element name="OpenSpan.Adapters.Web.WebAdapter">
          <xsl:attribute name="Name">
            <xsl:value-of select="concat($WebName,'_webapp')"/>
          </xsl:attribute>
          <xsl:attribute name="Id">
            <xsl:value-of select="'WebAdapter-8D7D7F4F1DE848D'"/>
          </xsl:attribute>

          <xsl:variable name="FormIDDelete" select="1"/>
          <xsl:variable name="WebPageName" select="Document/Process/GStep/Step[position()=0]/Step-AliasName"/>
          <xsl:variable name="PageCaption" select="Document/Process/Step[position()=1]/PlayBack--ControlInfo-IEActiveTabCaption"/>
          <xsl:variable name="WebPageID" select="'WebPage-8D7D7F52A6B3181'"/>
          <xsl:variable name="FormID" select="'Form-8D7D71ADBAADF1C'"/>

          <xsl:for-each select="Document/Process/GStep">
            <xsl:choose>
              <xsl:when test="Step">
                <xsl:for-each select="Step">
                  <xsl:if test="PlayBack--GeneralInfo-Event!='WindowActivate'">
                    <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
                    <xsl:if test="PlayBack--ControlInfo-Role!='client'">
                      <xsl:if test="PlayBack--GeneralInfo-AdaptorID='3'">
                        <xsl:value-of select="incr:postCaptionName(PlayBack--AppInfo-DialogName)"/>
                        <xsl:value-of select="incr:postStartPage(PlayBack--AppInfo-IEDocURL)"/>
                      </xsl:if>
                      </xsl:if>
                    </xsl:if>
                  </xsl:if>
                </xsl:for-each>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:variable name="StartPage2" select="incr:getStartPage()"/>
          <xsl:element name="StartPage">
            <xsl:attribute name="Value">
              <xsl:value-of select="$StartPage2"/>
            </xsl:attribute>
          </xsl:element>
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
              <xsl:for-each select="Document/Process/GStep">
                <xsl:choose>
                  <xsl:when test="Step">
                    <xsl:for-each select="Step">
                      <xsl:if test="PlayBack--GeneralInfo-Event!='WindowActivate'">
                        <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
                          <xsl:if test="PlayBack--ControlInfo-Role!='client'">
                            <xsl:value-of select="incr:postAdopterID(PlayBack--GeneralInfo-AdaptorID)"/>
                            <xsl:value-of select="incr:postStepRole(PlayBack--ControlInfo-Role)"/>
                            <xsl:value-of select="incr:postFormID(PlayBack--AdditionalInfo-Web_FormID)"/>
                            <!-- FormID-->
                            <xsl:if test="PlayBack--ControlInfo-Role='link'">
                              <xsl:value-of select="incr:postCaptionName(PlayBack--AppInfo-DialogName)"/>
                              <xsl:value-of select="incr:postStartPage(PlayBack--AppInfo-IEDocURL)"/>
                              <xsl:value-of select="incr:postStepControlID(PlayBack--ControlInfo-IEControlID)"/>
                              <xsl:value-of select="incr:postStepControlNameList(PlayBack--ControlInfo-ControlName)"/>
                              <xsl:value-of select="incr:postStepControlName1(PlayBack--ControlInfo-ControlName)"/>
                              <xsl:value-of select="incr:postStepID(Step-ID)"/>
                              <xsl:value-of select="incr:postStepWebIndexList(PlayBack--AdditionalInfo-Web_IDX)"/>
                              <xsl:value-of select="incr:postStepInnerTextList(PlayBack--ControlInfo-ControlName)"/>
                              <!--InnerText value Attribute value-->
                            </xsl:if>
                            <xsl:if test="PlayBack--ControlInfo-Role ='push button'">
							  <xsl:if test="PlayBack--ControlInfo-IEControlAttributeTagName !='IMG'">
									<xsl:value-of select="incr:postCaptionName(PlayBack--AppInfo-DialogName)"/>
									<xsl:value-of select="incr:postStartPage(PlayBack--AppInfo-IEDocURL)"/>
									<xsl:value-of select="incr:postStepControlID(PlayBack--ControlInfo-IEControlID)"/>
									<xsl:value-of select="incr:postStepControlNameButton(PlayBack--ControlInfo-ControlName)"/>

									<xsl:value-of select="incr:postStepIDButton(Step-ID)"/>
									<xsl:value-of select="incr:postStepWEBIDX(PlayBack--AdditionalInfo-Web_IDX)"/>
									<xsl:value-of select="incr:postStepWeb_Type(PlayBack--AdditionalInfo-Web_Type)"/>
									<xsl:value-of select="incr:postStepIEAttributeTagName(PlayBack--ControlInfo-IEControlAttributeTagName)"/>
								
                             </xsl:if>
                             </xsl:if>
                          </xsl:if>
                        </xsl:if>
                      </xsl:if>
                    </xsl:for-each>

                    <xsl:variable name="AdaptorID1" select="incr:getAdopterID()"></xsl:variable>
                    <xsl:variable name="RoleCondi" select="incr:getStepRole()"></xsl:variable>
                    <xsl:variable name="frmID" select="incr:getFormID()"></xsl:variable>

                    <xsl:if test="$AdaptorID1 ='3'">
                      <xsl:variable name="StartPage" select="Step/PlayBack--AppInfo-IEDocURL"/>
                      <xsl:element name="OpenSpan.Adapters.Web.Controls.WebPage">
                        <xsl:attribute name="Name">
                          <xsl:value-of select="@DialogName"/>
                        </xsl:attribute>
                        <xsl:attribute name="Id">
                          <xsl:value-of select="incr:removeSpaces(@DialogName)"/>
                        </xsl:attribute>
                        <DummyPropertyToDetectReplaceUndo Value="0" />
                        <ForwardObjectExplorerEvent Value="True" />
                        <IsGlobal Value="True" />
                        <MatchingIndex Value="1" />
                        <TargetTypeString Value="OpenSpan.Adapters.Web.HtmlDocument, OpenSpan.Adapters.Web" />
                        <Content Name="Controls">
                          <Items>
                            <xsl:if test="$RoleCondi='link'">
                              <xsl:call-template name="LinkTemplate"/>
                            </xsl:if>
                            <xsl:if test="$RoleCondi='push button'">
                              <xsl:call-template name="ButtonTemplate_ForWetypeButton"/>
                            </xsl:if>

                            <xsl:element name="OpenSpan.Adapters.Web.Controls.Form">
                              <xsl:attribute name="Name">
                                <xsl:value-of select="concat('Form-',Step[position()=1]/Step-AliasName,Step[position()=1]/Step-ID)"/>
                              </xsl:attribute>
                              <xsl:attribute name="Id">
                                <xsl:value-of select="@DialogName"/>
                              </xsl:attribute>
                              <DummyPropertyToDetectReplaceUndo Value="0" />
                              <ForwardObjectExplorerEvent Value="True" />
                              <MatchingIndex Value="0" />
                              <TagName Value="FORM" />
                              <xsl:element name="ElementId">
                                <xsl:attribute name="Value">
                                  <xsl:value-of select="$frmID"/>
                                </xsl:attribute>

                              </xsl:element>
                              <TargetTypeString Value="OpenSpan.Adapters.Web.HtmlFormElement, OpenSpan.Adapters.Web" />
                              <UseElementId Value="False" />
                              <Content Name="Controls">
                                <Items>
                                  <xsl:for-each select="Step">
                                    <xsl:value-of select="incr:postCaptionName(PlayBack--ControlInfo-IEActiveTabCaption)"/>
                                    <xsl:value-of select="incr:postStartPage(PlayBack--AppInfo-IEDocURL)"/>
                                    <xsl:choose>
                                      <xsl:when test="PlayBack--GeneralInfo-Event = 'Click'">
                                        <xsl:choose>
											<xsl:when test="PlayBack--ControlInfo-Role ='editable text'">
											 <xsl:choose> 
											 <xsl:when test="PlayBack--ControlInfo-IEControlAttributeTagName ='TEXTAREA'">
												<xsl:call-template name="textBoxClickTemplateTextArea"/>
											  </xsl:when>
											  <xsl:otherwise test="PlayBack--AdditionalInfo-Web_Type !='textarea'">
												<xsl:call-template name="textBoxClickTemplate"/>  
											  </xsl:otherwise>
											   </xsl:choose>
											</xsl:when>
                                        </xsl:choose>
										

                                        <xsl:if test="PlayBack--ControlInfo-Role ='radio button'">
                                          <xsl:call-template name="RadioBtnClickTemplate"/>
                                        </xsl:if>
                                        <xsl:if test="PlayBack--ControlInfo-Role ='list item'">
                                          <xsl:call-template name="DropDownTemplate"/>
                                        </xsl:if>
                                        <xsl:if test="$RoleCondi!='push button'">
                                          <xsl:if test="PlayBack--ControlInfo-Role ='push button'">
                                            <xsl:if test="PlayBack--AdditionalInfo-Web_Type !='button'">
                                              <xsl:call-template name="ButtonTemplate"/>
                                            </xsl:if>
                                            <xsl:if test="PlayBack--AdditionalInfo-Web_Type ='button'">
                                              <xsl:call-template name="ButtonTemplate_ForWetypeButton"/>
                                            </xsl:if>
                                          </xsl:if>
                                        </xsl:if>

                                        <xsl:if test="PlayBack--ControlInfo-Role ='link123'">
                                          <xsl:call-template name="LinkTemplate"/>
                                        </xsl:if>

                                        <xsl:if test="PlayBack--ControlInfo-IEControlAttributeTagName ='IMG'">
                                          <xsl:call-template name="ImageClickTemplate"/>
                                        </xsl:if>

                                      </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                      <xsl:when test="PlayBack--GeneralInfo-Event = 'Select'">
                                        <xsl:if test="PlayBack--ControlInfo-Role ='check box'">
                                          <xsl:call-template name="CheckBoxClickTemplate"/>
                                        </xsl:if>
                                        <xsl:if test="PlayBack--ControlInfo-Role ='radio button'  or PlayBack--ControlInfo-Role ='link'">
                                          <xsl:call-template name="RadioBtnClickTemplate"/>
                                        </xsl:if>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </Items>
                              </Content>
                              <Content Name="MatchRules">
                                <Items>
                                  <xsl:choose>
                                    <xsl:when test="$frmID!=''">
                                      <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementIdMatchRule">
                                        <xsl:variable name="FormMethodMatch" select="incr:FormMethodMatchRule()"/>
                                        <xsl:attribute name="Name">
                                          <xsl:value-of select="$FormMethodMatch"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="Id">
                                          <xsl:value-of select="$FormMethodMatch"/>
                                        </xsl:attribute>
                                        <xsl:element name="Text">
                                          <xsl:attribute name="Value">
                                            <xsl:value-of select="concat('Simple|True|(User Culture)|',$frmID)"/>
                                          </xsl:attribute>
                                        </xsl:element>
                                      </xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:element name="OpenSpan.Adapters.Web.MatchRules.FormMethodMatchRule">
                                        <xsl:variable name="FormMethodMatch" select="incr:FormMethodMatchRule()"/>
                                        <xsl:attribute name="Name">
                                          <xsl:value-of select="$FormMethodMatch"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="Id">
                                          <xsl:value-of select="$FormMethodMatch"/>
                                        </xsl:attribute>
                                        <xsl:element name="Method">
                                          <xsl:attribute name="Value">
                                            <xsl:value-of select="'Get'"/>
                                          </xsl:attribute>
                                        </xsl:element>
                                      </xsl:element>
                                    </xsl:otherwise>
                                  </xsl:choose>

                                </Items>
                              </Content>
                            </xsl:element>
                            <!--</OpenSpan.Adapters.Web.Controls.Form>-->
                          </Items>
                        </Content>

                        <Content Name="MatchRules">
                          <Items>
                            <xsl:element name="OpenSpan.Adapters.Web.MatchRules.DocumentUrlMatchRule">
                              <xsl:variable name="DocumentUrlMatc" select="incr:getDocumentUrlMatchRule()"/>
                              <xsl:variable name="tmpStartPage" select=" incr:getStartPage()"/>

                              <xsl:attribute name="Name">
                                <xsl:value-of select="$DocumentUrlMatc"/>
                              </xsl:attribute>
                              <xsl:attribute name="Id">
                                <xsl:value-of select="$DocumentUrlMatc"/>
                              </xsl:attribute>

                              <Fragment Value="Simple|True|(User Culture)|" />
                              <xsl:element name="Host">
                                <xsl:attribute name="Value">
                                  <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetDomain($tmpStartPage))"/>
                                </xsl:attribute>
                              </xsl:element>
                              <xsl:element name="Path">
                                <xsl:attribute name="Value">
                                  <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetDomainPath($tmpStartPage))"/>
                                </xsl:attribute>
                              </xsl:element>
                              <xsl:choose>
                                <xsl:when test="incr:GetRequestType($tmpStartPage)='https'">
                                  <Port Value="443" />
                                </xsl:when>
                                <xsl:otherwise>
                                  <Port Value="80" />
                                </xsl:otherwise>
                              </xsl:choose>
                              <Query Value="Simple|True|(User Culture)|" />
                              <xsl:element name="Scheme">
                                <xsl:attribute name="Value">
                                  <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetRequestType($tmpStartPage))"/>
                                </xsl:attribute>
                              </xsl:element>
                            </xsl:element>


                            <xsl:element name="OpenSpan.Adapters.Web.MatchRules.DocumentTitleMatchRule">
                              <xsl:variable name="DocumentTitleMatc" select="incr:getDocumentTitleMatchRule()"/>
                              <xsl:attribute name="Name">
                                <xsl:value-of select="$DocumentTitleMatc"/>
                              </xsl:attribute>
                              <xsl:attribute name="Id">
                                <xsl:value-of select="$DocumentTitleMatc"/>
                              </xsl:attribute>


                              <!-- <Text Value="concat('Simple|True|(User Culture)|','$PageCaption'" />-->
                              <xsl:element name="Text">
                                <xsl:attribute name="Value">
                                  <xsl:value-of select="concat('StartsWith|True|(User Culture)|',incr:getCaptionName())"/>
                                </xsl:attribute>
                              </xsl:element>
                            </xsl:element>
                          </Items>
                        </Content>
                      </xsl:element>
                      <!-- </OpenSpan.Adapters.Web.Controls.WebPage>-->

                    </xsl:if>
                  </xsl:when>
                </xsl:choose>
                <xsl:value-of select="incr:reset()"/>
              </xsl:for-each>
            </Items>
          </Content>
          <!-- </OpenSpan.Adapters.Web.Controls.WebPage>-->

        </xsl:element>
      </Component>
    </OpenSpanDesignDocument>
  </xsl:template>

  <xsl:template  name="textBoxClickTemplate">
    <xsl:element name="OpenSpan.Adapters.Web.Controls.TextBox">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-IEControlID,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-IEControlID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_IDX"/>
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
                <xsl:value-of select="PlayBack--AdditionalInfo-Web_Type"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementPathMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <ElementPath Value="Binary">
              <xsl:element name="Binary">
                <xsl:value-of select="incr:GetXpath(PlayBack--ControlInfo-XPath)"/>
              </xsl:element>
            </ElementPath>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="PlayBack--AdditionalInfo-Web_Name!=''">
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.InputNameMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Name)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementIdMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--ControlInfo-IEControlID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="RadioBtnClickTemplate">
    <xsl:element name="OpenSpan.Adapters.Web.Controls.RadioButton">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-IEControlID,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-IEControlID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_IDX"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TagName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'INPUT'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlInputRadioElement, OpenSpan.Adapters.Web'"/>
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
                <xsl:value-of select="PlayBack--AdditionalInfo-Web_Type"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementPathMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <ElementPath Value="Binary">
              <xsl:element name="Binary">
                <xsl:value-of select="incr:GetXpath(PlayBack--ControlInfo-XPath)"/>
              </xsl:element>
            </ElementPath>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="PlayBack--AdditionalInfo-Web_Name!=''">
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.InputNameMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Name)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementIdMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--ControlInfo-IEControlID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="CheckBoxClickTemplate">
    <xsl:element name="OpenSpan.Adapters.Web.Controls.CheckBox">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-IEControlID,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-IEControlID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_IDX"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TagName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'INPUT'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlInputCheckBoxElement, OpenSpan.Adapters.Web'"/>
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
                <xsl:value-of select="PlayBack--AdditionalInfo-Web_Type"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementPathMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <ElementPath Value="Binary">
              <xsl:element name="Binary">
                <xsl:value-of select="incr:GetXpath(PlayBack--ControlInfo-XPath)"/>
              </xsl:element>
            </ElementPath>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="PlayBack--AdditionalInfo-Web_Name!=''">
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.InputNameMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Name)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementIdMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--ControlInfo-IEControlID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>


 <xsl:template name="DropDownTemplate">
    <xsl:element name="OpenSpan.Adapters.Web.Controls.Select">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-IEControlID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_IDX"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TagName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'SELECT'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlSelectComboBoxElement, OpenSpan.Adapters.Web'"/>
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
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementPathMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <ElementPath Value="Binary">
              <xsl:element name="Binary">
                <xsl:value-of select="incr:GetXpath(PlayBack--ControlInfo-XPath)"/>
              </xsl:element>
            </ElementPath>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="PlayBack--AdditionalInfo-Web_Name!=''">
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.InputNameMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Name)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementIdMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--ControlInfo-IEControlID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ButtonTemplate">
    <xsl:variable name="StepId">
      <xsl:value-of select="incr:getStepIDButton()"/>
    </xsl:variable>
    <xsl:variable name="StepWebType">
      <xsl:value-of select="incr:gettStepWeb_Type()"/>
    </xsl:variable>

    <xsl:variable name="StepWebIDX">
      <xsl:value-of select="incr:getStepWEBIDX()"/>
    </xsl:variable>

    <xsl:variable name="StepTagName">
      <xsl:value-of select="incr:gettStepIEAttributeTagName()"/>
    </xsl:variable>

    <xsl:variable name="StepName">
      <xsl:value-of select="incr:getStepControlNameButton()"/>
    </xsl:variable>

    <xsl:element name="OpenSpan.Adapters.Web.Controls.BasicButton">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat($StepName,$StepId)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat($StepName,$StepId)"/>
      </xsl:attribute>

      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="$StepWebIDX"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:if test="$StepWebType = 'submit'">
        <xsl:element name="TagName">
          <xsl:attribute name="Value">
            <xsl:value-of select="$StepTagName"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="TargetTypeString">
          <xsl:attribute name="Value">
            <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlInputSubmitElement, OpenSpan.Adapters.Web'"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:if>
      <xsl:if test="$StepWebType = 'button'">
        <xsl:element name="TagName">
          <xsl:attribute name="Value">
            <xsl:value-of select="$StepTagName"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="TargetTypeString">
          <xsl:attribute name="Value">
            <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlButtonElement, OpenSpan.Adapters.Web'"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:if>

      <xsl:element name="UseElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
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
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:element name="Type">
              <xsl:attribute name="Value">
                <xsl:value-of select="$StepWebType"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ButtonTemplate_ForWetypeButton">
    <xsl:variable name="StepId">
      <xsl:value-of select="incr:getStepIDButton()"/>
    </xsl:variable>
    <xsl:variable name="StepWebType">
      <xsl:value-of select="incr:gettStepWeb_Type()"/>
    </xsl:variable>

    <xsl:variable name="StepWebIDX">
      <xsl:value-of select="incr:getStepWEBIDX()"/>
    </xsl:variable>

    <xsl:variable name="StepTagName">
      <xsl:value-of select="incr:gettStepIEAttributeTagName()"/>
    </xsl:variable>

    <xsl:variable name="StepName">
      <xsl:value-of select="incr:getStepControlNameButton()"/>
    </xsl:variable>

    <xsl:element name="OpenSpan.Adapters.Web.Controls.Button">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat($StepName,$StepId)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat($StepName,$StepId)"/>
      </xsl:attribute>

      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="''"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="$StepWebIDX"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:if test="$StepWebType = 'submit'">
        <xsl:element name="TagName">
          <xsl:attribute name="Value">
            <xsl:value-of select="$StepTagName"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="TargetTypeString">
          <xsl:attribute name="Value">
            <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlInputSubmitElement, OpenSpan.Adapters.Web'"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:if>
      <xsl:if test="$StepWebType = 'button'">
        <xsl:element name="TagName">
          <xsl:attribute name="Value">
            <xsl:value-of select="$StepTagName"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="TargetTypeString">
          <xsl:attribute name="Value">
            <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlInputButtonElement, OpenSpan.Adapters.Web'"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:if>

      <xsl:element name="UseElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
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
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:element name="Type">
              <xsl:attribute name="Value">
                <xsl:value-of select="$StepWebType"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template  name="textBoxClickTemplateTextArea">
    <xsl:element name="OpenSpan.Adapters.Web.Controls.TextArea">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-IEControlID,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--ControlInfo-IEControlID"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_IDX"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TagName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'TEXTAREA'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlTextAreaElement, OpenSpan.Adapters.Web'"/>
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
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementPathMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <ElementPath Value="Binary">
              <xsl:element name="Binary">
                <xsl:value-of select="incr:GetXpath(PlayBack--ControlInfo-XPath)"/>
              </xsl:element>
            </ElementPath>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="PlayBack--AdditionalInfo-Web_Name!=''">
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.InputNameMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Name)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ElementIdMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--ControlInfo-IEControlID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
		</xsl:element>
       
        <!-- ITEMS-->
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="LinkTemplate">

    <xsl:variable name="ElemId">
      <xsl:value-of select="incr:getStepControlID()"/>
    </xsl:variable>
    <xsl:variable name="Innertext1">
      <xsl:value-of select="incr:getStepControlInnertText()"/>
    </xsl:variable>



    <xsl:variable name="listCount">
      <xsl:value-of select="incr:getCountList()"/>
    </xsl:variable>
    <xsl:variable name="templistCount">
      <xsl:value-of select="'0'"/>
    </xsl:variable>

    <xsl:variable name="listCount1">
      <xsl:value-of select="incr:getCountList1()"/>
    </xsl:variable>

    <xsl:if test="$listCount1!=$listCount">
      <xsl:call-template name="LinkTemplate"/>
      <xsl:variable name="StepId">
        <xsl:value-of select="incr:getStepID($listCount1)"/>
      </xsl:variable>

      <xsl:variable name="Innertext">
        <xsl:value-of select="incr:getStepInnerTex($listCount1)"/>
      </xsl:variable>
      <xsl:variable name="StepName">
        <xsl:value-of select="incr:getStepControlName1($listCount1)"/>
      </xsl:variable>
      
	  
	  <xsl:element name="OpenSpan.Adapters.Web.Controls.Link">
        <xsl:attribute name="Name">
          <xsl:value-of select="concat($StepName,$StepId)"/>
        </xsl:attribute>
        <xsl:attribute name="Id">
          <xsl:value-of select="concat($StepName,$StepId)"/>
        </xsl:attribute>
        <xsl:element name="DummyPropertyToDetectReplaceUndo">
          <xsl:attribute name="Value">
            <xsl:value-of select="'0'"/>
            <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="ForwardObjectExplorerEvent">
          <xsl:attribute name="Value">
            <xsl:value-of select="'True'"/>
          </xsl:attribute>
        </xsl:element>

        <xsl:element name="MatchingIndex">
          <xsl:attribute name="Value">
            <xsl:value-of select="incr:getStepWebIdx($listCount1)"/>
          </xsl:attribute>
        </xsl:element>

        <xsl:element name="TagName">
          <xsl:attribute name="Value">
            <xsl:value-of select="'A'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="TargetTypeString">
          <xsl:attribute name="Value">
            <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlAnchorElement, OpenSpan.Adapters.Web'"/>
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
            <xsl:element name="OpenSpan.Adapters.Web.MatchRules.InnerTextMatchRule">
              <xsl:attribute name="Name">
                <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
              </xsl:attribute>
              <xsl:attribute name="Id">
                <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
              </xsl:attribute>
              <xsl:element name="Text">
                <xsl:attribute name="Value">
                  <xsl:value-of select="concat('Simple|True|(User Culture)|',$Innertext)"/>
                </xsl:attribute>
              </xsl:element>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:if>

  </xsl:template>

  <xsl:template name="ImageClickTemplate">
    <xsl:element name="OpenSpan.Adapters.Web.Controls.Image">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>

      <xsl:element name="ForwardObjectExplorerEvent">
        <xsl:attribute name="Value">
          <xsl:value-of select="'True'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="MatchingIndex">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_IDX"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TagName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'IMG'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.HtmlImageElement, OpenSpan.Adapters.Web'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="UseElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="'False'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="Content">
        <xsl:attribute name="Name">
          <xsl:value-of select="'MatchRules'"/>
        </xsl:attribute>
        <xsl:element name="Items">
          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ImageSourceMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <Fragment Value="Simple|True|(User Culture)|" />
            <xsl:element name="Host">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetDomain(PlayBack--AppInfo-IEDocURL))"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:element name="Path">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--ControlInfo-IEControlElmSrc)"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:choose>
              <xsl:when test="incr:GetRequestType(PlayBack--AppInfo-IEDocURL)='https'">
                <Port Value="443" />
              </xsl:when>
              <xsl:otherwise>
                <Port Value="80" />
              </xsl:otherwise>
            </xsl:choose>
            <Query Value="Simple|True|(User Culture)|" />
            <xsl:element name="Scheme">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetRequestType(PlayBack--AppInfo-IEDocURL))"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>

          <xsl:element name="OpenSpan.Adapters.Web.MatchRules.ImageAltTextMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--ControlInfo-IEControlTitle)"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
   
 </xsl:template>



  
</xsl:stylesheet>