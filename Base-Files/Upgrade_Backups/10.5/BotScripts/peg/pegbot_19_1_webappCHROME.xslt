<xsl:stylesheet version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:my="my:my"
	xmlns:incr="urn:my-scripts" exclude-result-prefixes="msxsl" >
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
                  tmpCaptionName=CaptionName.Trim();     
                  cap++;
          }
        }    
      }
      
      /*public string getCaptionName()
      {
        string tmpCaptionName1=tmpCaptionName;
          cap=0; tmpCaptionName="";
          return tmpCaptionName1;
      }*/
	  
	  public string getCaptionName()
      {
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
    return "virtualPropertyMatchRule"+nu;
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
	if(roleN==0)
	{
	  if(Role!="")
	  {
		if(tmpRole=="")
			tmpRole=Role;     
			roleN++;
	  }
	 }    
}

public string getStepRole()
{
	string tmpRole1=tmpRole;
	roleN=0; tmpRole="";
	return tmpRole1;
}
      
      
      public string GetXpath(string xxpath)
      {
		   if(xxpath!="")
		   {
				string xpath = xxpath.ToUpper();
				xpath = System.Text.RegularExpressions.Regex.Replace(xpath, @"\[[0-9]+\]", string.Empty);
				string[] xpathList = xpath.Split('/'); 				
				Array.Reverse(xpathList);
				var str = String.Join(",", xpathList);
				str = str.TrimEnd(',');
				return str;
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
      
      
  string tmpControlName=""; int controlNameN=0;
public void postStepControlName(string CtrlName)
{
	if(controlNameN==0)
	{
	  if(CtrlName!="")
	  {
		if(tmpControlName=="")
			tmpControlName=CtrlName;     
			controlNameN++;
	  }
	 }    
}

public string getStepControlName()
{
	string tmpRole1=tmpControlName;
	controlNameN=0; tmpControlName="";
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

public string getStepControlName11()
{
	string tmpRole1=tmpControlName1;
	controlNameN1=0; tmpControlName1="";
	return tmpRole1;
}

string tmpStepID=""; int StepIdN1=0;
public void postStepIDOLD(string StepID)
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

public string getStepID()
{
	string tmpStepID1=tmpStepID;
	StepIdN1=0; tmpStepID="";
	return tmpStepID1;
}

	string tmpWebIdx=""; int WebIdx=0;
public void postWexIDX(string StepWebIdx)
{
	if(WebIdx==0)
	{
	  if(StepWebIdx!="")
	  {
		if(tmpWebIdx=="")
			tmpWebIdx=StepWebIdx;     
			WebIdx++;
	  }
	 }    
}

public string getStepWebIdx()
{
	string tmpWebIdx1=tmpWebIdx;
	WebIdx=0; tmpWebIdx="";
	return tmpWebIdx1;
}

string tmpWebId=""; int WebId=0;
public void postWexID(string StepWebId)
{
	if(WebId==0)
	{
	  if(StepWebId!="")
	  {
		if(tmpWebId=="")
			tmpWebId=StepWebId;     
			WebId++;
	  }
	 }    
}

public string getStepWebId()
{
	string tmpWebId1=tmpWebId;
	WebId=0; tmpWebId="";
	return tmpWebId1;
}

string tmpWebbtnId=""; int WebBtnId=0;
public void postWexIDButton(string StepWebId)
{
	if(WebBtnId==0)
	{
	  if(StepWebId!="")
	  {
		if(tmpWebbtnId=="")
			tmpWebbtnId=StepWebId;     
			WebBtnId++;
	  }
	 }    
}

public string getStepWebIDButton()
{
	string tmpWebId1=tmpWebbtnId;
	WebBtnId=0; tmpWebbtnId="";
	return tmpWebId1;
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
	
	string tmpStepID2=""; int StepIdN2=0;
	public void postStepIDButton(string StepID)
	{
		if(StepIdN2==0)
		{
			if(StepID!="")
			{
			if(tmpStepID2=="")
				tmpStepID2=StepID;     
				StepIdN2++;
			}
		}    
	}
	
	public string getStepIDButton()
	{
		
		string tmpStepID1=tmpStepID2;
		StepIdN2=0; tmpStepID2="";
		return tmpStepID1;
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
	public void postStepIEAttributeTagName1(string IEAttributeTagName)
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
	
	
	string tmpWeb_Name=""; int SWebName=0;
	public void postWebNameButton(string Web_Name)
	{
		if(SWebName==0)
		{
		  if(Web_Name!="")
		  {
			if(tmpWeb_Name=="")
			  tmpWeb_Name=Web_Name;     
			  SWebName++;
		  }
		 }    
	}

	public string getWebNameButton()
	{
		string tmpWeb_Name1=tmpWeb_Name;
		SWebName=0; tmpWeb_Name="";
		return tmpWeb_Name1;
	}
	
	
	string tpWeb_Type=""; int stpWebType=0;
	public void postStepWeb_Type1(string Web_Type)
	{
		if(stpWebType==0)
		{
		  if(Web_Type!="")
		  {
			if(tpWeb_Type=="")
			  tpWeb_Type=Web_Type;     
			  stpWebType++;
		  }
		 }    
	}

	public string gettStepWeb_Type1()
	{
		string tpWeb_Type2=tpWeb_Type;
		stpWebType=0; tpWeb_Type="";
		return tpWeb_Type2;
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
	
	string tmpWeb_Xpath=""; int SWebXpath=0;
public void postWebXPathButton(string Web_Xpath)
{
	if(SWebXpath==0)
	{
	  if(Web_Xpath!="")
	  {
		if(tmpWeb_Xpath=="")
		  tmpWeb_Xpath=Web_Xpath;     
		  SWebXpath++;
	  }
	 }    
}

public string getWebXPathButton()
{
	string tmpWeb_Xpath1=tmpWeb_Xpath;
	SWebXpath=0; tmpWeb_Xpath="";
	return tmpWeb_Xpath1;
}

string tmpLink_Xpath=""; int LinkWebXpath=0;
public void postWebXPathLink(string Web_Xpath)
{
	if(LinkWebXpath==0)
	{
	  if(Web_Xpath!="")
	  {
		if(tmpLink_Xpath=="")
		  tmpLink_Xpath=Web_Xpath;     
		  LinkWebXpath++;
	  }
	 }    
}

public string getWebXPathLink()
{
	string tmpLink_Xpath1=tmpLink_Xpath;
	LinkWebXpath=0; tmpLink_Xpath="";
	return tmpLink_Xpath1;
}

string tmpLink_innertext=""; int LinkWebinnertext=0;
public void postWebinnertextLink(string Web_innertext)
{
	if(LinkWebinnertext==0)
	{
	  if(Web_innertext!="")
	  {
		if(tmpLink_innertext=="")
		  tmpLink_innertext=Web_innertext;     
		  LinkWebinnertext++;
	  }
	 }    
}

public string getWebinnertextLink()
{
	string tmpLink_innertext1=tmpLink_innertext;
	LinkWebinnertext=0; tmpLink_innertext="";
	return tmpLink_innertext1;
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
	
	public int getCountButtonList()
	{
		return StepControlNameButtonList.Count;
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
	
	System.Collections.Generic.List<string> StepWebIndexList = new System.Collections.Generic.List<string>();
	public void postStepWebIndexList(string WebIdx)
	{
	   StepWebIndexList.Add(WebIdx);
	}

	public string getStepWebIdx(int i)
	{
	return StepWebIndexList[i];
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
  
  int ii=0; 
  int jj=0;
  
	public void reset()
	{
		ii=0;
		jj=0;
		StepIDList.Clear();
		StepControlNameList.Clear();
		StepInnerTextList.Clear();
		StepWebIndexList.Clear();
		StepControlNameButtonList.Clear();
		StepIDButtonList.Clear();
		StepWebTypeList.Clear();
		StepWebTypeList1.Clear();
		StepWebIDXList.Clear();
		StepWebIDList.Clear();
		StepTagNameList.Clear();
		StepXpathList.Clear();
		StepIEAttributeTagNameList.Clear();
		WexIDButtonLIST.Clear();
		WebNameButtonLIST.Clear();
		WebXPathButtonLIST.Clear();
	}
  
	public int getCountList1()
	{
		 int n=ii;
		 ii++;
		 return n;
	}
	
	public int getCountList2()
	{
		 int n=jj;
		 jj++;
		 return n;
	}
  public string getStepIDFromList(int i)
	{
		return StepIDList[i];
		/*string tmpStepID1=tmpStepID;
		StepIdN1=0; tmpStepID="";
		return tmpStepID1;*/
	}
  
  public string getStepControlName1()
	{
		string tmpCname=tmpControlName1;
		controlNameN1=0; tmpControlName1="";
		return tmpCname;
	}
  
  System.Collections.Generic.List<string> StepControlXpath = new System.Collections.Generic.List<string>();
  public void postStepControlXpath(string Xpath)
  {
	    StepControlXpath.Add(Xpath);
  }

  public string getStepControlXpath(int i)
  {
    return StepControlXpath[i];
  }
  
  
 string tmpSStartPage=""; int SSPage=0;
public void postStStartPage(string StartPageUrl)
{
if(SSPage==0)
{
  if(StartPageUrl!="")
  {
	  if(tmpSStartPage=="")
		  tmpSStartPage=StartPageUrl;     
		  SSPage++;
  }
}    
}

public string getStStartPage()
{
string tmpPAge=tmpSStartPage;
  SSPage=0; tmpSStartPage="";
  return tmpPAge;
}

string tmpRolebtn=""; int rolebtn=0;
public void postStepRoleButton(string Role)
{
	if(rolebtn==0)
	{
	  if(Role!="")
	  {
		if(tmpRolebtn=="")
			tmpRolebtn=Role;     
			rolebtn++;
	  }
	 }    
}

public string getStepRoleButton()
{
	string tmpRole1=tmpRolebtn;
	rolebtn=0; tmpRolebtn="";
	return tmpRole1;
}


/**/
System.Collections.Generic.List<string> StepControlNameButtonList = new System.Collections.Generic.List<string>();
public void postStepControlNameForButtonList(string CtrlName)
{
	   StepControlNameButtonList.Add(CtrlName);
}

public string getStepControlNameForButtonList(int i)
{
   return StepControlNameButtonList[i];
}

System.Collections.Generic.List<string> StepIDButtonList  = new System.Collections.Generic.List<string>();
public void postStepIDButtonLIST(string ID)
{
	   StepIDButtonList.Add(ID);
}

public string getStepIDButtonLIST(int i)
{
   return StepIDButtonList[i];
}
	
	
System.Collections.Generic.List<string> StepWebTypeList  = new System.Collections.Generic.List<string>();
public void postStepWebTypeLIST(string WebID)
{
	   StepWebTypeList.Add(WebID);
}

public string getStepWebTypeLIST(int i)
{
   return StepWebTypeList[i];
}

System.Collections.Generic.List<string> StepWebTypeList1  = new System.Collections.Generic.List<string>();
public void postStepWeb_Type1LIST(string WebID)
{
	   StepWebTypeList1.Add(WebID);
}

public string getStepWeb_Type1LIST(int i)
{
   return StepWebTypeList1[i];
}

System.Collections.Generic.List<string> StepWebIDXList  = new System.Collections.Generic.List<string>();
public void postStepWEBIDXLIST(string WebIDx)
{
	   StepWebIDXList.Add(WebIDx);
}

public string getStepWebIDXLIST(int i)
{
   return StepWebIDXList[i];
}

System.Collections.Generic.List<string> StepWebIDList  = new System.Collections.Generic.List<string>();
public void postStepWebIDLIST(string ID)
{
	   StepWebIDList.Add(ID);
}

public string getStepWebIDLIST(int i)
{
   return StepWebIDList[i];
}


System.Collections.Generic.List<string> StepTagNameList  = new System.Collections.Generic.List<string>();
public void postStepTagLIST(string TagName)
{
	   StepTagNameList.Add(TagName);
}

public string getStepTagLIST(int i)
{
   return StepTagNameList[i];
}


System.Collections.Generic.List<string> StepXpathList  = new System.Collections.Generic.List<string>();
public void postStepXpathLIST(string TagName)
{
	   StepXpathList.Add(TagName);
}

public string getStepXpathLIST(int i)
{
   return StepXpathList[i];
}


System.Collections.Generic.List<string> StepIEAttributeTagNameList  = new System.Collections.Generic.List<string>();
public void postStepIEAttributeTagName(string TagName)
{
	   StepIEAttributeTagNameList.Add(TagName);
}

public string gettStepIEAttributeTagName(int i)
{
   return StepIEAttributeTagNameList[i];
}


System.Collections.Generic.List<string> WexIDButtonLIST  = new System.Collections.Generic.List<string>();
public void postWexIDButtonLIST(string TagName)
{
	   WexIDButtonLIST.Add(TagName);
}

public string getWexIDButtonLIST(int i)
{
   return WexIDButtonLIST[i];
}


System.Collections.Generic.List<string> WebNameButtonLIST  = new System.Collections.Generic.List<string>();
public void postWebNameButtonLIST(string TagName)
{
	   WebNameButtonLIST.Add(TagName);
}

public string getWebNameButtonLIST(int i)
{
   return WebNameButtonLIST[i];
}

System.Collections.Generic.List<string> WebXPathButtonLIST  = new System.Collections.Generic.List<string>();
public void postWebXPathButtonLIST(string TagName)
{
	   WebXPathButtonLIST.Add(TagName);
}

public string getWebXPathButtonLIST(int i)
{
   return WebXPathButtonLIST[i];
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
        <Type Value="OpenSpan.Adapters.Web.Universal.UniversalWebAdapter" />
        <Assembly Value="OpenSpan.Adapters.Web" />
        <AssemblyReferences>
          <Assembly Value="mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
          <Assembly Value="System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
          <Assembly Value="OpenSpan, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters.Virtual, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters.Web.Universal, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters.Web.WebBase, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
          <Assembly Value="OpenSpan.Adapters.Windows, Version=19.1.0.0, Culture=neutral, PublicKeyToken=f5db91edc02d8c5e" />
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
      <Component Version="1.0">
        <xsl:variable name="WebName">
          <xsl:value-of select="Document/Meta/GpsFile"/>
        </xsl:variable>

        <xsl:element name="OpenSpan.Adapters.Web.Universal.UniversalWebAdapter">
          <xsl:attribute name="Name">
            <xsl:value-of select="concat($WebName,'_webChrome')"/>
          </xsl:attribute>
          <xsl:attribute name="Id">
            <xsl:value-of select="'UniversalWebAdapter-8D8111E06B38B04'"/>
            <!-- <xsl:value-of select="incr:GetXpath('INPUT,DIV,DIV2')"/>-->
          </xsl:attribute>
          <xsl:variable name="StartPage2" select="Document/Process/GStep/Step/PlayBack--AppInfo-IEDocURL"/>
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
                        <xsl:if test="PlayBack--GeneralInfo-AdaptorID='12'">
                          <xsl:value-of select="incr:postStStartPage(PlayBack--AppInfo-IEDocURL)"/>
                        </xsl:if>
                      </xsl:if>
                    </xsl:if>
                  </xsl:if>
                </xsl:for-each>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:element name="StartPage">
            <xsl:attribute name="Value">
              <xsl:value-of select="incr:getStStartPage()"/>
            </xsl:attribute>
          </xsl:element>
          <Content Name="Controls">
            <Items>
              <xsl:for-each select="Document/Process/GStep">
                <xsl:choose>
                  <xsl:when test="Step">
                    <xsl:for-each select="Step">
                      <xsl:if test="PlayBack--GeneralInfo-Event!='WindowActivate'">
                        <xsl:if test="PlayBack--ControlInfo-Role!='title bar'">
                          <xsl:if test="PlayBack--ControlInfo-Role!='pane'">
                            <xsl:if test="PlayBack--ControlInfo-Role!='client'">
                              <xsl:value-of select="incr:postAdopterID(Step-AdaptorID)"/>
                              <!-- <xsl:value-of select="incr:postStepRole(PlayBack-@-ControlInfo-Role)"/>-->
                              <xsl:value-of select="incr:postFormID(PlayBack--AdditionalInfo-Web_FormID)"/>
                              <xsl:if test="PlayBack--ControlInfo-Role='link'">
                                <xsl:value-of select="incr:postStepRole(PlayBack--ControlInfo-Role)"/>
                                <xsl:value-of select="incr:postWexID(PlayBack--AdditionalInfo-Web_ID)"/>
                                <xsl:value-of select="incr:postWebXPathLink(PlayBack--ControlInfo-XPath)"/>
                                <xsl:value-of select="incr:postStepControlXpath(PlayBack--ControlInfo-XPath)"/>

                                <xsl:value-of select="incr:postCaptionName(PlayBack--AppInfo-DialogName)"/>
                                <xsl:value-of select="incr:postStartPage(PlayBack--AppInfo-IEDocURL)"/>
                                <xsl:value-of select="incr:postStepControlID(PlayBack--ControlInfo-IEControlID)"/>
                                <xsl:value-of select="incr:postStepControlNameList(PlayBack--ControlInfo-ControlName)"/>
                                <xsl:value-of select="incr:postStepControlName1(PlayBack--ControlInfo-ControlName)"/>
                                <xsl:value-of select="incr:postStepID(Step-ID)"/>
                                <xsl:value-of select="incr:postStepWebIndexList(PlayBack--AdditionalInfo-Web_IDX)"/>
                                <xsl:value-of select="incr:postStepInnerTextList(PlayBack--ControlInfo-ControlName)"/>







                              </xsl:if>
                              <xsl:if test="PlayBack--ControlInfo-Role ='push button'">
                                <xsl:if test="PlayBack--AdditionalInfo-Web_TagName !='IMG'">
                                  <xsl:value-of select="incr:postStepRoleButton(PlayBack--ControlInfo-Role)"/>
                                  <xsl:value-of select="incr:postCaptionName(PlayBack--AppInfo-DialogName)"/>
                                  <xsl:value-of select="incr:postStartPage(PlayBack--AppInfo-IEDocURL)"/>
                                  <xsl:value-of select="incr:postStepControlNameForButtonList(PlayBack--AdditionalInfo-Web_Name)"/>
                                  <xsl:value-of select="incr:postStepIDButtonLIST(Step-ID)"/>
                                  <xsl:value-of select="incr:postStepWEBIDXLIST(PlayBack--AdditionalInfo-Web_IDX)"/>
                                  <xsl:value-of select="incr:postStepWebTypeLIST(PlayBack--AdditionalInfo-Web_Type)"/>

                                  <xsl:value-of select="incr:postStepWeb_Type1LIST(PlayBack--AdditionalInfo-Web_Type)"/>
                                  <xsl:value-of select="incr:postStepTagLIST(PlayBack--AdditionalInfo-Web_TagName)"/>
                                  <xsl:value-of select="incr:postWexIDButtonLIST(PlayBack--AdditionalInfo-Web_ID)"/>
                                  <xsl:value-of select="incr:postWebNameButtonLIST(PlayBack--AdditionalInfo-Web_Name)"/>
                                  <xsl:value-of select="incr:postStepXpathLIST(PlayBack--ControlInfo-XPath)"/>

                                </xsl:if>
                              </xsl:if>
                            </xsl:if>
                          </xsl:if>
                        </xsl:if>
                      </xsl:if>
                    </xsl:for-each>

                    <xsl:variable name="AdaptorID1" select="incr:getAdopterID()"></xsl:variable>
                    <xsl:variable name="RoleCondi" select="incr:getStepRole()"></xsl:variable>
                    <xsl:variable name="RoleCondiBtn" select="incr:getStepRoleButton()"></xsl:variable>
                    <xsl:variable name="StepType" select="incr:gettStepWeb_Type1()"></xsl:variable>

                    <xsl:variable name="frmID" select="incr:getFormID()"></xsl:variable>

                    <xsl:if test="$AdaptorID1 ='12'">
                      <xsl:variable name="StartPage" select="Step/PlayBack--AppInfo-IEDocURL"/>
                      <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.WebPage">
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
                        <TargetTypeString Value="OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlDocumentTarget, OpenSpan.Adapters.Web.WebBase" />
                        <Content Name="Controls">
                          <Items>
                            <!--<xsl:choose>-->
                              <xsl:if test="$RoleCondi='link'">
                                <xsl:call-template name="LinkTemplate_Chrome"/>
                              </xsl:if>
                              <xsl:if test="$RoleCondiBtn='push button'">
                               <!-- <xsl:choose>-->
                                  <xsl:if test="$StepType ='submit'">
                                    <xsl:call-template name="ButtonTemplate_ForWetypeButton"/>
                                  </xsl:if>
                                  <xsl:if test="$StepType !='button'">
                                    <xsl:call-template name="ButtonTemplate_Chrome"/>
                                  </xsl:if>

                                <!--</xsl:choose>-->
                              </xsl:if>
                           <!-- </xsl:choose>-->


                            <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.Form">
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
                              <TargetTypeString Value="OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlFormElementTarget, OpenSpan.Adapters.Web.WebBase" />
                              <UseElementId Value="False" />
                              <Content Name="Controls">
                                <Items>
                                  <xsl:for-each select="Step">
                                    <xsl:value-of select="incr:postCaptionName(PlayBack--AppInfo-DialogName)"/>
                                    <xsl:value-of select="incr:postStartPage(PlayBack--AppInfo-IEDocURL)"/>

                                    <xsl:choose>
                                      <xsl:when test="PlayBack--GeneralInfo-Event = 'Click' or PlayBack--GeneralInfo-Event = 'Select'">
                                        <xsl:if test="PlayBack--ControlInfo-Role ='editable text'">
                                          <xsl:if test="PlayBack--AdditionalInfo-Web_TagName !='TEXTAREA'">
                                            <xsl:call-template name="textBoxClickTemplate_Chrome"/>
                                          </xsl:if>
                                          <xsl:if test="PlayBack--AdditionalInfo-Web_TagName ='TEXTAREA'">
                                            <xsl:call-template name="textBoxClickTemplateTextArea_Chrome"/>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="PlayBack--ControlInfo-Role ='radio button'">
                                          <xsl:call-template name="RadioBtnClickTemplate_Chrome"/>
                                        </xsl:if>
                                        <xsl:if test="PlayBack--ControlInfo-Role ='list item'">
                                          <xsl:call-template name="DropDownTemplate_Chrome"/>
                                        </xsl:if>
                                        <xsl:if test="$RoleCondiBtn!='push button'">
                                          <xsl:if test="PlayBack--ControlInfo-Role ='push button'">
                                            <xsl:if test="PlayBack--AdditionalInfo-Web_Type !='button'">
                                              <xsl:call-template name="ButtonTemplate_Chrome"/>
                                            </xsl:if>
                                            <xsl:if test="PlayBack--AdditionalInfo-Web_Type ='button'">
                                              <xsl:call-template name="ButtonTemplate_ForWetypeButton"/>
                                            </xsl:if>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="PlayBack--AdditionalInfo-Web_TagName ='IMG'">
                                          <xsl:call-template name="ImageClickTemplate_Chrome"/>
                                        </xsl:if>
                                        <xsl:if test="PlayBack--ControlInfo-Role ='link123'">
                                          <xsl:call-template name="LinkTemplate_Chrome"/>
                                        </xsl:if>
                                        <xsl:if test="PlayBack--ControlInfo-Role ='check box'">
                                          <xsl:call-template name="CheckBoxClickTemplate_Chrome"/>
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
                                      <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                                        <xsl:variable name="FormMethodMatch" select="incr:FormMethodMatchRule()"/>
                                        <xsl:attribute name="Name">
                                          <xsl:value-of select="$FormMethodMatch"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="Id">
                                          <xsl:value-of select="$FormMethodMatch"/>
                                        </xsl:attribute>
                                        <PropertyName Value="id" />
                                        <xsl:element name="Text">
                                          <xsl:attribute name="Value">
                                            <xsl:value-of select="concat('Simple|True|(User Culture)|',$frmID)"/>
                                          </xsl:attribute>
                                        </xsl:element>
                                      </xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                                        <xsl:variable name="FormMethodMatch" select="incr:FormMethodMatchRule()"/>
                                        <xsl:attribute name="Name">
                                          <xsl:value-of select="$FormMethodMatch"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="Id">
                                          <xsl:value-of select="$FormMethodMatch"/>
                                        </xsl:attribute>
                                        <PropertyName Value="action" />
                                        <xsl:element name="Text">
                                          <xsl:attribute name="Value">
                                            <xsl:value-of select="concat('StartsWith|True|(User Culture)|',$StartPage)"/>
                                          </xsl:attribute>
                                        </xsl:element>
                                      </xsl:element>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </Items>
                              </Content>
                            </xsl:element>

                          </Items>
                        </Content>
                        <Content Name="MatchRules">
                          <Items>
                           <!-- <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                              <xsl:variable name="DocumentUrlMatc" select="incr:getDocumentUrlMatchRule()"/>
                              <xsl:variable name="tmpStartPage" select=" incr:getStartPage()"/>
                              <xsl:attribute name="Name">
                                <xsl:value-of select="$DocumentUrlMatc"/>
                              </xsl:attribute>
                              <xsl:attribute name="Id">
                                <xsl:value-of select="$DocumentUrlMatc"/>
                              </xsl:attribute>
                              <PropertyName Value="url" />
                              <xsl:element name="Text">
                                <xsl:attribute name="Value">
                                  <xsl:value-of select="concat('Simple|True|(User Culture)|',$tmpStartPage)"/>
                                </xsl:attribute>
                              </xsl:element>
                            </xsl:element>-->
                            <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                              <xsl:attribute name="Name">
                                <xsl:value-of select="incr:getDocumentUrlMatchRule()"/>
                              </xsl:attribute>
                              <xsl:attribute name="Id">
                                <xsl:value-of select="incr:getDocumentUrlMatchRule()"/>
                              </xsl:attribute>
                              <PropertyName Value="title" />
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
        </xsl:element>
      </Component>
    </OpenSpanDesignDocument>
  </xsl:template>

  <xsl:template  name="textBoxClickTemplate_Chrome">
    <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.TextBox">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--AdditionalInfo-Web_ID,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>
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
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlInputTextElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="type" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Type)"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="openspan_path" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetXpath(PlayBack--ControlInfo-XPath))"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="PlayBack--AdditionalInfo-Web_Name!=''">
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="name" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Name)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="id" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_ID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>

              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="openspan_index" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_IDX)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="RadioBtnClickTemplate_Chrome">
    <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.RadioButton">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--AdditionalInfo-Web_ID,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>
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
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlInputRadioElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="type" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Type)"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="openspan_path" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetXpath(PlayBack--ControlInfo-XPath))"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="PlayBack--AdditionalInfo-Web_ID!=''">
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="id" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_ID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
			 
            </xsl:when>
            <xsl:otherwise>   
			  <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="name" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Name)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="openspan_index" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_IDX)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="CheckBoxClickTemplate_Chrome">
    <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.CheckBox">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--AdditionalInfo-Web_ID,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>
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
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlInputCheckBoxElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="type" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Type)"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="openspan_path" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetXpath(PlayBack--ControlInfo-XPath))"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="PlayBack--AdditionalInfo-Web_Name!=''">
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="name" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Name)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="id" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_ID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>

              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="openspan_index" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_IDX)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="DropDownTemplate_Chrome">
    <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.Select">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--AdditionalInfo-Web_ID,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>
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
          <xsl:value-of select="'SELECT'"/>
        </xsl:attribute>
      </xsl:element>

      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:if test="PlayBack--AdditionalInfo-Web_TagName='OPTION'">
            <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlSelectListBoxElementTarget, OpenSpan.Adapters.Web.WebBase'" />
          </xsl:if>
          <xsl:if test="PlayBack--AdditionalInfo-Web_TagName!='OPTION'">
            <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlSelectComboBoxElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
          </xsl:if>


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
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="tagname" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|','SELECT')"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="openspan_path" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetXpath(PlayBack--ControlInfo-XPath))"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="PlayBack--AdditionalInfo-Web_Name!=''">
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="name" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Name)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="id" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_ID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>

              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="openspan_index" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_IDX)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ButtonTemplate_Chrome">
    <xsl:variable name="StepIdOLd">
      <xsl:value-of select="incr:getStepIDButton()"/>
    </xsl:variable>
    <xsl:variable name="StepWebTypeOLD">
      <xsl:value-of select="incr:gettStepWeb_Type()"/>
    </xsl:variable>
    <xsl:variable name="StepWebIDXOLD">
      <xsl:value-of select="incr:getStepWEBIDX()"/>
    </xsl:variable>
    <xsl:variable name="wbbtnIDOLD">
      <xsl:value-of select="incr:getStepWebIDButton()"/>
    </xsl:variable>
    <xsl:variable name="StepTagNameOLD">
      <xsl:value-of select="incr:gettStepIEAttributeTagName()"/>
    </xsl:variable>
    <xsl:variable name="StepName1">
      <xsl:value-of select="incr:getStepControlNameButton()"/>
    </xsl:variable>
    <xsl:variable name="StepXpathOLd">
      <xsl:value-of select="incr:getWebXPathButton()"/>
    </xsl:variable>


    <xsl:variable name="listCount">
      <xsl:value-of select="incr:getCountButtonList()"/>
    </xsl:variable>
    <xsl:variable name="templistCount">
      <xsl:value-of select="'0'"/>
    </xsl:variable>
    <xsl:variable name="listCount1">
      <xsl:value-of select="incr:getCountList2()"/>
    </xsl:variable>
    <xsl:if test="$listCount !=0">
      <xsl:if test="$listCount1    &lt; $listCount">
        <xsl:call-template name="ButtonTemplate_Chrome"/>


        <xsl:variable name="StepId">
          <xsl:value-of select="incr:getStepIDButtonLIST($listCount1)"/>
        </xsl:variable>

        <xsl:variable name="StepTagName">
          <xsl:value-of select="incr:getStepTagLIST($listCount1)"/>
        </xsl:variable>

        <xsl:variable name="StepWebType">
          <xsl:value-of select="incr:getStepWeb_Type1LIST($listCount1)"/>
        </xsl:variable>

        <xsl:variable name="wbbtnID">
          <xsl:value-of select="incr:postStepWEBIDXLIST($listCount1)"/>
        </xsl:variable>

        <xsl:variable name="StepWebIDX">
          <xsl:value-of select="incr:getStepWebIDXLIST($listCount1)"/>
        </xsl:variable>

        <xsl:variable name="StepName">
          <xsl:value-of select="incr:getStepControlNameForButtonList($listCount1)"/>
        </xsl:variable>
        <xsl:variable name="StepXpath">
          <xsl:value-of select="incr:getStepXpathLIST($listCount1)"/>
        </xsl:variable>

        <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.BasicButton">
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
              <xsl:value-of select="$wbbtnID"/>
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
                <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlButtonElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
                <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlInputButtonElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="type" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',$StepWebType)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="openspan_path" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetXpath($StepXpath))"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
              <xsl:choose>
                <xsl:when test="$StepName!=''">
                  <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                    <xsl:attribute name="Name">
                      <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                    </xsl:attribute>
                    <xsl:attribute name="Id">
                      <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                    </xsl:attribute>
                    <PropertyName Value="name" />
                    <xsl:element name="Text">
                      <xsl:attribute name="Value">
                        <xsl:value-of select="concat('Simple|True|(User Culture)|',$StepName)"/>
                      </xsl:attribute>
                    </xsl:element>
                  </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                    <xsl:attribute name="Name">
                      <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                    </xsl:attribute>
                    <xsl:attribute name="Id">
                      <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                    </xsl:attribute>
                    <PropertyName Value="id" />
                    <xsl:element name="Text">
                      <xsl:attribute name="Value">
                        <xsl:value-of select="concat('Simple|True|(User Culture)|',$wbbtnID)"/>
                      </xsl:attribute>
                    </xsl:element>
                  </xsl:element>

                  <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                    <xsl:attribute name="Name">
                      <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                    </xsl:attribute>
                    <xsl:attribute name="Id">
                      <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                    </xsl:attribute>
                    <PropertyName Value="openspan_index" />
                    <xsl:element name="Text">
                      <xsl:attribute name="Value">
                        <xsl:value-of select="concat('Simple|True|(User Culture)|',$StepWebIDX)"/>
                      </xsl:attribute>
                    </xsl:element>
                  </xsl:element>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:if>
    </xsl:if>
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
    <xsl:variable name="wbbtnID">
      <xsl:value-of select="incr:getStepWebIDButton()"/>
    </xsl:variable>
    <xsl:variable name="StepTagName">
      <xsl:value-of select="incr:gettStepIEAttributeTagName()"/>
    </xsl:variable>
    <xsl:variable name="StepName">
      <xsl:value-of select="incr:getStepControlNameButton()"/>
    </xsl:variable>
    <xsl:variable name="StepXpath">
      <xsl:value-of select="incr:getWebXPathButton()"/>
    </xsl:variable>
    <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.Button">
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
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>
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
            <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlButtonElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
            <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlInputButtonElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="type" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',$StepWebType)"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetinputTypeMatchRuleLists()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('InputTypeMatchRule-',incr:GetInputTypeMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="openspan_path" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetXpath($StepXpath))"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:choose>
            <xsl:when test="$StepName!=''">
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="name" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',$StepName)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="id" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',$wbbtnID)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>

              <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
                <xsl:attribute name="Name">
                  <xsl:value-of select="incr:GetelementIdMatchRule()"/>
                </xsl:attribute>
                <xsl:attribute name="Id">
                  <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
                </xsl:attribute>
                <PropertyName Value="openspan_index" />
                <xsl:element name="Text">
                  <xsl:attribute name="Value">
                    <xsl:value-of select="concat('Simple|True|(User Culture)|',$StepWebIDX)"/>
                  </xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template  name="textBoxClickTemplateTextArea_Chrome">
    <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.TextArea">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--AdditionalInfo-Web_ID,Step-ID)"/>
      </xsl:attribute>
      <xsl:element name="DummyPropertyToDetectReplaceUndo">
        <xsl:attribute name="Value">
          <xsl:value-of select="'0'"/>
          <!--<xsl:value-of select="concat('Automator-8D7D71AA832020A\',incr:GetConnectableEvent())"/>-->
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="ElementId">
        <xsl:attribute name="Value">
          <xsl:value-of select="PlayBack--AdditionalInfo-Web_ID"/>
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
          <xsl:value-of select="'TEXTAREA'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlTextAreaElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetelementIdMatchRule()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="openspan_index" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_IDX)"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="LinkTemplate_Chrome">
    <xsl:variable name="StepName2">
      <xsl:value-of select="incr:getStepControlName11()"/>
    </xsl:variable>
    <xsl:variable name="StepId2">
      <xsl:value-of select="incr:getStepID()"/>
    </xsl:variable>
    <xsl:variable name="StepWebIdx">
      <xsl:value-of select="incr:getStepWebIdx()"/>
    </xsl:variable>
    <xsl:variable name="wbID">
      <xsl:value-of select="incr:getStepWebId()"/>
    </xsl:variable>
    <xsl:variable name="StepXpath1">
      <xsl:value-of select="incr:getWebXPathLink()"/>
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
      <xsl:call-template name="LinkTemplate_Chrome"/>

      <xsl:variable name="StepId">
        <xsl:value-of select="incr:getStepIDFromList($listCount1)"/>
      </xsl:variable>

      <xsl:variable name="Innertext">
        <xsl:value-of select="incr:getStepInnerTex($listCount1)"/>
      </xsl:variable>
      <xsl:variable name="StepName">
        <xsl:value-of select="incr:getStepControlName1($listCount1)"/>
      </xsl:variable>
      <xsl:variable name="StepXpath">
        <xsl:value-of select="incr:getStepControlXpath($listCount1)"/>
      </xsl:variable>

      <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.Link">
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
        <!--<xsl:element name="MatchingIndex">
          <xsl:attribute name="Value">
            <xsl:value-of select="$StepWebIdx"/>
          </xsl:attribute>
        </xsl:element>-->
        <xsl:element name="TagName">
          <xsl:attribute name="Value">
            <xsl:value-of select="'A'"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="TargetTypeString">
          <xsl:attribute name="Value">
            <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlAnchorElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
            <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
              <xsl:attribute name="Name">
                <xsl:value-of select="incr:GetelementIdMatchRule()"/>
              </xsl:attribute>
              <xsl:attribute name="Id">
                <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
              </xsl:attribute>
              <PropertyName Value="tagname" />
              <xsl:element name="Text">
                <xsl:attribute name="Value">
                  <xsl:value-of select="'Simple|True|(User Culture)|A'"/>
                </xsl:attribute>
              </xsl:element>
            </xsl:element>
            <!--<xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
              <xsl:attribute name="Name">
                <xsl:value-of select="incr:GetelementIdMatchRule()"/>
              </xsl:attribute>
              <xsl:attribute name="Id">
                <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
              </xsl:attribute>
              <PropertyName Value="openspan_path" />
              <xsl:element name="Text">
                <xsl:attribute name="Value">
                  <xsl:value-of select="concat('Simple|True|(User Culture)|',incr:GetXpath($StepXpath))"/>
                </xsl:attribute>
              </xsl:element>
            </xsl:element>-->
            <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
              <xsl:attribute name="Name">
                <xsl:value-of select="incr:GetelementIdMatchRule()"/>
              </xsl:attribute>
              <xsl:attribute name="Id">
                <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
              </xsl:attribute>
              <PropertyName Value="innertext" />
              <xsl:element name="Text">
                <xsl:attribute name="Value">
                  <xsl:value-of select="concat('Simple|True|(User Culture)|',$StepName)"/>
                </xsl:attribute>
              </xsl:element>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template  name="ImageClickTemplate_Chrome">
    <xsl:element name="OpenSpan.Adapters.Web.WebBase.Controls.Image">
      <xsl:attribute name="Name">
        <xsl:value-of select="concat(PlayBack--ControlInfo-ControlName,Step-ID)"/>
      </xsl:attribute>
      <xsl:attribute name="Id">
        <xsl:value-of select="concat(PlayBack--AdditionalInfo-Web_ID,Step-ID)"/>
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
      <xsl:element name="TagName">
        <xsl:attribute name="Value">
          <xsl:value-of select="'IMG'"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="TargetTypeString">
        <xsl:attribute name="Value">
          <xsl:value-of select="'OpenSpan.Adapters.Web.WebBase.Targets.VirtualHtmlImageElementTarget, OpenSpan.Adapters.Web.WebBase'"/>
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
          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetelementIdMatchRule()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="src" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Source)"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>

          <xsl:element name="OpenSpan.Adapters.Web.WebBase.MatchRules.VirtualPropertyMatchRule">
            <xsl:attribute name="Name">
              <xsl:value-of select="incr:GetelementIdMatchRule()"/>
            </xsl:attribute>
            <xsl:attribute name="Id">
              <xsl:value-of select="concat('ElementIdMatchRule-',incr:GetElementIdMatchRule())"/>
            </xsl:attribute>
            <PropertyName Value="alt" />
            <xsl:element name="Text">
              <xsl:attribute name="Value">
                <xsl:value-of select="concat('Simple|True|(User Culture)|',PlayBack--AdditionalInfo-Web_Alt)"/>
              </xsl:attribute>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>