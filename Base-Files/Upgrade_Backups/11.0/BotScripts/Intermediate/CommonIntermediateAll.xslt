<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:utils="urn:my-scripts" version="1.0" exclude-result-prefixes="msxsl">
	<!--Intermediate UiPath 2-->
	<!--Jun-12-2020-V2m-->
	<xsl:output method="xml" indent="yes"/>
	<xsl:param name="EXE_NAME"/>
	<xsl:param name="AdopterID"/>
	<xsl:param name="EXE_PATH"/>
	<msxsl:script implements-prefix="utils" language="CSharp">
		<msxsl:using namespace="System.Text.RegularExpressions"/>
		<![CDATA[
	  public string removeTabMsaa(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 return replacedControlName;
		 }
		 
		public string removeSpecailCharsMsaa(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 public string removeSpecailCharsJava(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("&","&amp;");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 public string removeTabIe(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Trim();       //trim to stay consistant with UiPath
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("&","&amp;");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 public string removeTab(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Trim();       //trim to stay consistant with UiPath
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 return replacedControlName;
		 }	 
		 
		 
		 
		 
		 public string removeSpecailCharsIe(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("&","&amp;");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 
		 public string getCssPathFromXpathIe(string XpathStr)
		 {
		 
				if(XpathStr=="")
								return "";
								
				string cssPath = "";
				cssPath = XpathStr;
				
				cssPath = Regex.Replace(cssPath, @"\[[0-9]+\]", string.Empty);
				
				cssPath = cssPath.Remove(0, 1);
				 cssPath = cssPath.Replace('/','>');
				 return cssPath;
		 }
		 
	
	public string removeSpecailCharsChrome(string controlName)
		 {
		     string replacedControlName = "";
				 replacedControlName = controlName;
				 replacedControlName = replacedControlName.Replace("\\t","	");
				 replacedControlName = replacedControlName.Replace("&","&amp;");
				 replacedControlName = replacedControlName.Replace("'","&apos;");
				 return replacedControlName;
		 }
		 
		 public string getCssPathFromXpathChrome(string XpathStr)
		 {
		 
				if(XpathStr=="")
								return "";
								
				XpathStr.Replace("/html","");              
								
				string cssPath = "";
				cssPath = XpathStr;
				
				cssPath = Regex.Replace(cssPath, @"\[[0-9]+\]", string.Empty);
				
				cssPath = cssPath.Remove(0, 1);
				 cssPath = cssPath.Replace('/','>');
				 return cssPath;
		 }
		 
		 public string getTitleforChrome(string completeTitle)
		 {
					string title = ""; 
					title = completeTitle;
					
					if(title=="")
						return title;
						
					title = title.Replace(" - Google Chrome","");
					return title;
					
		 }
		public string replaceSquareBracket(string str)
		{
			
				if(str!="")
				{
					if(str.Contains("[") && str.Contains("]"))
					{
						str= "%"+str;
					}					
				   return str;
				}
				return str;				
			
		}
		
		public string getUrlForIe(string url)
		 {
			url = url.Replace("&","&amp;");
			return url;
		 }
		 
		  public string getCssPathWithIndexFromCss(string cssPath)
		  {
			cssPath = Regex.Replace(cssPath, @"#[^\s]*|\.[^\s]*|'", string.Empty);
			return cssPath;
		  }
		  
		  
		   public string GetXpath(string XpathStr)
      {         
			var charsToCapitalize = new string[] {"a", "abbr", "acronym", "abbr", "address", "applet", "embed", "object", "area", "article", "aside", "audio", "b", "base", "basefont", "bdi", "bdo", "big", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "data", "datalist", "dd", "del", "details", "dfn", "dialog", "dir", "ul", "div", "dl", "dt", "em", "embed", "fieldset", "figcaption", "figure", "font", "footer", "form", "frame", "frameset", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hr", "html", "i", "iframe", "img", "input", "ins", "kbd", "label", "legend", "li", "link", "main", "map", "mark", "meta", "meter", "nav", "noframes", "noscript", "object", "ol", "optgroup", "option", "output", "p", "param", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "script", "section", "select", "small", "source", "span", "strike", "del", "s", "strong", "style", "sub", "summary", "sup", "svg", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "title", "tr", "track", "tt", "u", "ul", "var", "video", "wbr", "nobr"};
			if(XpathStr=="")
				return "";
        
        string finalXpath="";
        String[] XpathArry = XpathStr.Split('/');
        for (int i = 0; i < XpathArry.Length; i++)
        {
            string s = XpathArry[i];
						
             if(!s.Contains("[") && s!="html")
             {
                if(s!="")
					{
						if(i==XpathArry.Length-1)
							{
								s=s+"[1]";  
							}
							else{
								s=s+"[1]/"; 
								}
									
					}
             }
             else
             {
				if(i==XpathArry.Length-1)
					{
                  s=s+""; 
					}
					else{
						s=s+"/";
						}
                
             }
             
            finalXpath =finalXpath+ s;
        }
		
		finalXpath = "/" + finalXpath;
		
		foreach (var c in charsToCapitalize)
				{
						finalXpath = finalXpath.Replace('/'+c+'[', '/'+c.ToUpper()+'[');
				}
				
				finalXpath = finalXpath.Replace("/html","/HTML");
				finalXpath = finalXpath.Replace("/BODY", "/HTML/BODY");
				 finalXpath = finalXpath.Replace('[', '(');
				finalXpath = finalXpath.Replace(']', ')');
				finalXpath = finalXpath.Replace("MAIN", "main");
				return finalXpath;
         
      }
	  
	  
	  public string GetChromeXpath(string XpathStr)
      {         
        
        string finalXpath="";
        String[] XpathArry = XpathStr.Split('/');
        for (int i = 0; i < XpathArry.Length; i++)
        {
            string s = XpathArry[i];
						
             if(!s.Contains("["))
             {
                if(s!="")
								{
								if(i==XpathArry.Length-1)
								{
                  s=s+"[1]";  
									}
									else{
									s=s+"[1]/"; 
									}
									
									}
             }
             else
             {
						 if(i==XpathArry.Length-1)
								{
                  s=s+""; 
									}
									else{
									s=s+"/";
									}
                
             }
             
            finalXpath =finalXpath+ s;
        }
				finalXpath = finalXpath.ToUpper();
				finalXpath = "/" + finalXpath;
       return finalXpath;
         
      }
	  
	  
	  
	  ]]></msxsl:script>
	<xsl:template match="/">
		<Document>
			<!--Copy the Meta node-->
			<xsl:copy-of select="Document/Meta"/>
			<EXE_NAME>
				<xsl:value-of select="$EXE_NAME"/>
			</EXE_NAME>
			<AdopterID>
				<xsl:value-of select="$AdopterID"/>
			</AdopterID>
			<EXE_PATH>
				<xsl:value-of select="$EXE_PATH"/>
			</EXE_PATH>
			<Process>
				<xsl:for-each select="Document/Process/Step">
					<xsl:if test="PlayBack__ControlInfo_Role!='title bar'  and PlayBack__GeneralInfo_Event != 'START TRANSACTION' and  PlayBack__GeneralInfo_Event !='END TRANSACTION'">
            <xsl:if test="'Step_IsStrayStep' or Step_IsStrayStep !='1'">
              <xsl:if test="position() != last()">
							<xsl:choose>
								<xsl:when test="PlayBack__GeneralInfo_AdaptorID='1' or PlayBack__GeneralInfo_AdaptorID='9' or PlayBack__GeneralInfo_AdaptorID='0'">
									<xsl:if test="PlayBack__ControlInfo_Role!='client12'">
										<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT' or PlayBack__GeneralInfo_Event='KEYEVENT' or PlayBack__GeneralInfo_Event='WindowActivate'">
											<xsl:choose>
												<xsl:when test="(PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='list item1' and preceding-sibling::Step[1]/PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE = 'combo box1') or (PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE='list item1' and preceding-sibling::Step[2]/PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE = 'combo box1')"/>
												<xsl:otherwise>
													<Step>
														<!--Copy the step Node-->
														<xsl:if test="*">
															<xsl:for-each select="*">
																<xsl:element name="{name()}">
																	<xsl:choose>
																		<xsl:when test="name()='PlayBack__ControlInfo_ControlName'">
																			<xsl:variable name="tempControlName">
																				<xsl:value-of select="."/>
																			</xsl:variable>
																			<xsl:value-of select="utils:removeSpecailCharsMsaa($tempControlName)"/>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="."/>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:element>
															</xsl:for-each>
															<!--if control is combo box, then get list item from the next step-->
															<xsl:if test="PlayBack__ControlInfo_Role='combo box'">
																<Modified_Item>
																	<!--remove \ when uncommenting
				<xsl:value-of select="following-sibling::Step[PlayBack-\-ControlInfo_Role = 'list item']/PlayBack-\-ControlInfo_ControlData"/>
										-->
																	<xsl:value-of select="following-sibling::Step[1 and PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE = 'list item']/PlayBack__ControlInfo_ControlData"/>
																</Modified_Item>
															</xsl:if>
															<xsl:element name="UIP_PlayBack__ControlInfo_XPath">
																<xsl:variable name="tempXpath1">
																	<xsl:value-of select="PlayBack__ControlInfo_XPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:getCssPathFromXpathIe($tempXpath1)"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__ControlInfo_ControlName">
																<xsl:variable name="tempControlName">
																	<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
																</xsl:variable>
																<xsl:value-of select="utils:removeTabIe($tempControlName)"/>
															</xsl:element>
															<xsl:element name="UIP_CssPathWithIndex">
																<xsl:variable name="tempCssPath">
																	<xsl:value-of select="PlayBack__ControlInfo_CSSPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:getCssPathWithIndexFromCss($tempCssPath)"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__ControlInfo_IEControlClassName">
																<xsl:value-of select="PlayBack__ControlInfo_IEControlClassName"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_Web_Value">
																<xsl:value-of select="PlayBack__AdditionalInfo_Web_Value"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_PARENT_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_NAME"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_NAME"/>
															</xsl:element>
															<xsl:element name="UIP_MSAA_PlayBack__ControlInfo_ControlName">
																<xsl:variable name="tempControlName">
																	<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
																</xsl:variable>
																<xsl:value-of select="utils:removeSpecailCharsMsaa($tempControlName)"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_Web_IFrameFullXPath">
																<xsl:variable name="tempXpath1">
																	<xsl:value-of select="PlayBack__AdditionalInfo_Web_IFrameFullXPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:GetXpath($tempXpath1)"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_NAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_CLASSNAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_CLASSNAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_CLASSNAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_CLASSNAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_ACCESSKEY">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_ACCESSKEY"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__ControlInfo_ControlName">
																<xsl:variable name="tempControlName">
																	<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
																</xsl:variable>
																<xsl:value-of select="utils:removeTab($tempControlName)"/>
															</xsl:element>
														</xsl:if>
													</Step>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</xsl:if>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_AdaptorID='3'">
									<xsl:if test="PlayBack__ControlInfo_Role!='title bar'">
										<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT' or PlayBack__GeneralInfo_Event='KEYEVENT'">
											<xsl:choose>
												<xsl:when test="(PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/PlayBack__ControlInfo_Role = 'combo box') or (PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[2]/PlayBack__ControlInfo_Role = 'combo box')"/>
												<xsl:otherwise>
													<Step>
														<!--Copy the step Node-->
														<xsl:if test="*">
															<xsl:for-each select="*">
																<xsl:element name="{name()}">
																	<xsl:choose>
																		<xsl:when test="name()='PlayBack__ControlInfo_IEControlTitle'">
																			<xsl:value-of select="utils:removeSpecailCharsIe(.)"/>
																		</xsl:when>
																		<xsl:when test="name()='PlayBack__ControlInfo_IEControlInnerText'">
																			<xsl:value-of select="utils:removeSpecailCharsIe(.)"/>
																		</xsl:when>
																		<xsl:when test="name()='PlayBack__AdditionalInfo_Web_Value'">
																			<xsl:value-of select="utils:removeSpecailCharsIe(.)"/>
																		</xsl:when>
																		<xsl:when test="name()='PlayBack__AppInfo_IEDocURL'">
																			<xsl:variable name="tempUrl">
																				<xsl:value-of select="."/>
																			</xsl:variable>
																			<xsl:value-of select="utils:getUrlForIe($tempUrl)"/>
																		</xsl:when>
																		<xsl:when test="name()='PlayBack__ControlInfo_XPath'">
																			<xsl:variable name="tempXpath">
																				<xsl:value-of select="."/>
																			</xsl:variable>
																			<xsl:value-of select="utils:GetXpath($tempXpath)"/>
																		</xsl:when>
																		<xsl:when test="name()='PlayBack__AdditionalInfo_Web_IFrameFullXPath'">
																			<xsl:variable name="tempXpath1">
																				<xsl:value-of select="."/>
																			</xsl:variable>
																			<xsl:value-of select="utils:GetXpath($tempXpath1)"/>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="."/>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:element>
															</xsl:for-each>
															<xsl:element name="UIP_PlayBack__ControlInfo_XPath">
																<xsl:variable name="tempXpath1">
																	<xsl:value-of select="PlayBack__ControlInfo_XPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:getCssPathFromXpathIe($tempXpath1)"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__ControlInfo_ControlName">
																<xsl:variable name="tempControlName">
																	<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
																</xsl:variable>
																<xsl:value-of select="utils:removeTabIe($tempControlName)"/>
															</xsl:element>
															<xsl:element name="UIP_CssPathWithIndex">
																<xsl:variable name="tempCssPath">
																	<xsl:value-of select="PlayBack__ControlInfo_CSSPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:getCssPathWithIndexFromCss($tempCssPath)"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__ControlInfo_IEControlClassName">
																<xsl:value-of select="PlayBack__ControlInfo_IEControlClassName"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_Web_Value">
																<xsl:value-of select="PlayBack__AdditionalInfo_Web_Value"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_PARENT_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_NAME"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_NAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_Web_IFrameFullXPath">
																<xsl:variable name="tempXpath1">
																	<xsl:value-of select="PlayBack__AdditionalInfo_Web_IFrameFullXPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:GetXpath($tempXpath1)"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_NAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_CLASSNAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_CLASSNAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_CLASSNAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_CLASSNAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_ACCESSKEY">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_ACCESSKEY"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__ControlInfo_ControlName">
																<xsl:variable name="tempControlName">
																	<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
																</xsl:variable>
																<xsl:value-of select="utils:removeTab($tempControlName)"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__ControlInfo_IEControlClassName">
																<xsl:value-of select="PlayBack__ControlInfo_IEControlClassName"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_Web_Name">
																<xsl:value-of select="PlayBack__AdditionalInfo_Web_Name"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__ControlInfo_IEControlTitle">
																<xsl:value-of select="PlayBack__ControlInfo_IEControlTitle"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_NAME"/>
															</xsl:element>
															<xsl:if test="PlayBack__ControlInfo_Role='list item'">
																<Modified_Item>
																	<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
																</Modified_Item>
															</xsl:if>
															<!--if control is combo box, then get list item from the next step-->
															<xsl:if test="PlayBack__ControlInfo_Role='combo box'">
																<Modified_Item>
																	<!--remove \ when uncommenting
				<xsl:value-of select="following-sibling::Step[PlayBack-\-ControlInfo_Role = 'list item']/PlayBack-\-ControlInfo_ControlData"/>
										-->
																	<xsl:value-of select="following-sibling::Step[1 and PlayBack__ControlInfo_Role = 'list item']/PlayBack__ControlInfo_ControlData"/>
																</Modified_Item>
															</xsl:if>
														</xsl:if>
													</Step>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</xsl:if>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_AdaptorID='12'">
									<xsl:if test="PlayBack__ControlInfo_Role!='title bar'">
										<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT' or PlayBack__GeneralInfo_Event='KEYEVENT'">
											<xsl:choose>
												<xsl:when test="(PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/PlayBack__ControlInfo_Role = 'combo box') or (PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[2]/PlayBack__ControlInfo_Role = 'combo box')"/>
												<xsl:otherwise>
													<Step>
														<!--Copy the step Node-->
														<xsl:if test="*">
															<xsl:for-each select="*">
																<xsl:element name="{name()}">
																	<xsl:choose>
																		<xsl:when test="name()='PlayBack__ControlInfo_ControlName'">
																			<xsl:variable name="tempControlName">
																				<xsl:value-of select="."/>
																			</xsl:variable>
																			<xsl:value-of select="utils:removeSpecailCharsChrome($tempControlName)"/>
																		</xsl:when>
																		<xsl:when test="name()='PlayBack__AdditionalInfo_Web_Value'">
																			<xsl:value-of select="utils:removeSpecailCharsChrome(.)"/>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="."/>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:element>
															</xsl:for-each>
															<xsl:element name="UIP_PlayBack__ControlInfo_ControlName">
																<xsl:variable name="tempControlName">
																	<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
																</xsl:variable>
																<xsl:value-of select="utils:removeSpecailCharsChrome($tempControlName)"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_Web_Value">
																<xsl:variable name="tempVal">
																	<xsl:value-of select="PlayBack__AdditionalInfo_Web_Value"/>
																</xsl:variable>
																<xsl:value-of select="utils:removeSpecailCharsChrome($tempVal)"/>
															</xsl:element>
															<xsl:element name="UIP_Chrome_CssPath">
																<xsl:variable name="tempXpath1">
																	<xsl:value-of select="PlayBack__ControlInfo_XPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:getCssPathFromXpathChrome($tempXpath1)"/>
															</xsl:element>
															<xsl:if test="PlayBack__ControlInfo_Role='list item'">
																<Modified_Item>
																	<xsl:value-of select="PlayBack__ControlInfo_ControlData"/>
																</Modified_Item>
															</xsl:if>
															<xsl:element name="UIP_Chrome_PlayBack__ControlInfo_ControlName">
																<xsl:variable name="tempControlName">
																	<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
																</xsl:variable>
																<xsl:value-of select="utils:removeTab($tempControlName)"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AppInfo_DialogName">
																<xsl:variable name="tempTitle">
																	<xsl:value-of select="PlayBack__AppInfo_DialogName"/>
																</xsl:variable>
																<xsl:value-of select="utils:getTitleforChrome($tempTitle)"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__ControlInfo_XPath">
																<xsl:variable name="tempXpath1">
																	<xsl:value-of select="PlayBack__ControlInfo_XPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:getCssPathFromXpathChrome($tempXpath1)"/>
															</xsl:element>
															<xsl:element name="UIP_CssPathWithIndex">
																<xsl:variable name="tempCssPath">
																	<xsl:value-of select="PlayBack__ControlInfo_CSSPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:getCssPathWithIndexFromCss($tempCssPath)"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__ControlInfo_IEControlClassName">
																<xsl:value-of select="PlayBack__ControlInfo_IEControlClassName"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_PARENT_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_NAME"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_UIA_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_NAME"/>
															</xsl:element>
															<xsl:element name="UIP_PlayBack__AdditionalInfo_Web_ID">
																<xsl:value-of select="PlayBack__AdditionalInfo_Web_ID"/>
															</xsl:element>
															<xsl:element name="PlayBack__AdditionalInfo_Web_ClassName">
																<xsl:value-of select="PlayBack__AdditionalInfo_Web_ClassName"/>
															</xsl:element>
															<xsl:element name="PlayBack__ControlInfo_CSSPath">
																<xsl:variable name="tempXpath1">
																	<xsl:value-of select="PlayBack__ControlInfo_XPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:getCssPathFromXpathChrome($tempXpath1)"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_Web_IFrameFullXPath">
																<xsl:variable name="tempXpath1">
																	<xsl:value-of select="PlayBack__AdditionalInfo_Web_IFrameFullXPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:GetXpath($tempXpath1)"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_FOREGROUND_WINDOW_TYPE"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_NAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_AUTOMATIONID"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_LOCALIZED_CONTROL_TYPE"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_AUTOMATIONID">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_AUTOMATIONID"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_PARENT_CLASSNAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_PARENT_CLASSNAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_CLASSNAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_CLASSNAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_ACCESSKEY">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_ACCESSKEY"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__ControlInfo_ControlName">
																<xsl:variable name="tempControlName">
																	<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
																</xsl:variable>
																<xsl:value-of select="utils:removeTab($tempControlName)"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__ControlInfo_IEControlClassName">
																<xsl:value-of select="PlayBack__ControlInfo_IEControlClassName"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_Web_Name">
																<xsl:value-of select="PlayBack__AdditionalInfo_Web_Name"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__ControlInfo_IEControlTitle">
																<xsl:value-of select="PlayBack__ControlInfo_IEControlTitle"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_UIA_NAME">
																<xsl:value-of select="PlayBack__AdditionalInfo_UIA_NAME"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__ControlInfo_XPath">
																<xsl:variable name="tempXpath">
																	<xsl:value-of select="PlayBack__ControlInfo_XPath"/>
																</xsl:variable>
																<xsl:value-of select="utils:GetChromeXpath($tempXpath)"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AppInfo_DialogName">
																<xsl:value-of select="PlayBack__AppInfo_DialogName"/>
															</xsl:element>
															<xsl:element name="BP_PlayBack__AdditionalInfo_Web_ID">
																<xsl:value-of select="PlayBack__AdditionalInfo_Web_ID"/>
															</xsl:element>
															<xsl:element name="Modified-Title">
																<xsl:variable name="tempTitle">
																	<xsl:value-of select="PlayBack--AppInfo-DialogName"/>
																</xsl:variable>
																<xsl:value-of select="utils:getTitleforChrome($tempTitle)"/>
															</xsl:element>
															<xsl:if test="PlayBack--ControlInfo-Role='list item'">
																<Modified-Item>
																	<xsl:value-of select="PlayBack--ControlInfo-ControlData"/>
																</Modified-Item>
															</xsl:if>
															<!--if control is combo box, then get list item from the next step-->
															<xsl:if test="PlayBack__ControlInfo_Role='combo box'">
																<xsl:variable name="tmpCombVal" select="following-sibling::Step[1 and PlayBack__ControlInfo_Role = 'list item']/PlayBack__ControlInfo_ControlData"/>
																<xsl:variable name="CombVal" select="utils:replaceSquareBracket($tmpCombVal)"/>
																<Modified_Item>
																	<!--remove \ when uncommenting
				<xsl:value-of select="following-sibling::Step[PlayBack-\-ControlInfo_Role = 'list item']/PlayBack-\-ControlInfo_ControlData"/>
										-->
																	<xsl:value-of select="$CombVal"/>
																	<!--VIKAS -->
																</Modified_Item>
															</xsl:if>
														</xsl:if>
													</Step>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</xsl:if>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_AdaptorID='6'">
									<xsl:if test="PlayBack__GeneralInfo_Event !='WindowActivate' or PlayBack__GeneralInfo_Event !='START TRANSACTION' or                            PlayBack__GeneralInfo_Event !='MESSAGE' or PlayBack__GeneralInfo_Event !='END TRANSACTION' or PlayBack__ControlInfo_Role!='client'            or PlayBack__ControlInfo_Role!='SAPGuiMenubar'">
										<Step>
											<xsl:if test="*">
												<xsl:for-each select="*">
													<xsl:element name="{name()}">
														<xsl:choose>
															<xsl:when test="name()='PlayBack__ControlInfo_ControlName1'">
																<xsl:variable name="tempControlName">
																	<xsl:value-of select="."/>
																</xsl:variable>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="."/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:element>
												</xsl:for-each>
												<xsl:element name="UIP_PlayBack__ControlInfo_UniqueID">
													<xsl:value-of select="PlayBack__ControlInfo_UniqueID"/>
												</xsl:element>
												<xsl:element name="UIP_PlayBack__AppInfo_DialogName">
													<xsl:value-of select="PlayBack__AppInfo_DialogName"/>
												</xsl:element>
												<xsl:if test="PlayBack__ControlInfo_Role='SAPGuiComboBox'">
													<Modified_Item>
														<xsl:value-of select="following-sibling::Step[1 and PlayBack__ControlInfo_Role = 'list item']/PlayBack__ControlInfo_ControlData"/>
													</Modified_Item>
												</xsl:if>
											</xsl:if>
										</Step>
									</xsl:if>
								</xsl:when>
								<xsl:when test="PlayBack__GeneralInfo_AdaptorID='2'">
									<xsl:if test="PlayBack__ControlInfo_Role!='client'">
										<xsl:if test="PlayBack__GeneralInfo_Event='Click' or PlayBack__GeneralInfo_Event='Select' or PlayBack__GeneralInfo_Event='TYPETEXT' or PlayBack__GeneralInfo_Event='KEYEVENT'">
											<xsl:choose>
												<xsl:when test="(PlayBack__ControlInfo_Role='list item' and preceding-sibling::Step[1]/PlayBack__ControlInfo_Role = 'combo box')"/>
												<xsl:otherwise>
													<Step>
														<!--Copy the step Node-->
														<xsl:if test="*">
															<xsl:for-each select="*">
																<xsl:element name="{name()}">
																	<xsl:choose>
																		<xsl:when test="name()='PlayBack__ControlInfo_ControlName'">
																			<xsl:variable name="tempControlName">
																				<xsl:value-of select="."/>
																			</xsl:variable>
																			<xsl:value-of select="utils:removeSpecailCharsJava($tempControlName)"/>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="."/>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:element>
															</xsl:for-each>
															<!--if control is combo box, then get list item from the next step-->
															<xsl:if test="PlayBack__ControlInfo_Role='combo box'">
																<Modified_Item>
																	<!--remove \ when uncommenting
				<xsl:value-of select="following-sibling::Step[PlayBack-\-ControlInfo_Role = 'list item']/PlayBack-\-ControlInfo_ControlData"/>
										-->
																	<xsl:value-of select="following-sibling::Step[1]/PlayBack__ControlInfo_ControlData"/>
																</Modified_Item>
															</xsl:if>
															<xsl:if test="PlayBack__ControlInfo_Role='combo box'">
																<Modified_Item>
																	<xsl:value-of select="PlayBack__ControlInfo_ControlName"/>
																</Modified_Item>
															</xsl:if>
														</xsl:if>
													</Step>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</xsl:if>
								</xsl:when>
							</xsl:choose>
						</xsl:if>
					
            </xsl:if>
            
            
            </xsl:if>
				</xsl:for-each>
			</Process>
		</Document>
	</xsl:template>
</xsl:stylesheet>