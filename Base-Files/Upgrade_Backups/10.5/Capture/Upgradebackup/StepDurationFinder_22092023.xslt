<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				        xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:utils="urn:myExtension"
                xmlns:data="http://example.com/data" exclude-result-prefixes="msxsl data">
  <xsl:output method="xml" indent="yes"/>
  <data:Events xmlns="">
    <value>Collapse Popup</value>
    <value>CaptionChange</value>
    <value>ActiveTab</value>
    <value>DRAG</value>
    <value>WindowActivate</value>
    <value>CaptionDestroy</value>
    <value>Menu Popup</value>
  </data:Events>
  <xsl:variable name="EventsExcluded" select="document('')/xsl:stylesheet/data:Events/value"/>
  <msxsl:script implements-prefix="utils" language="C#">
     <![CDATA[
     
            public static int stepCount=0,excldedStepCount=0;
            public static void IncrementCounter()
            {
              stepCount++;
            }
            public int GetCounter()
            {
              return stepCount - excldedStepCount;
            }
             
            public static void IncrementExcludedStepCounter()
            {
              stepCount++;excldedStepCount++;
            }            
            public string GetDuration(string start, string end,string isHeaderTimeStamp)
            {
                try{                
                      if(start == "" || end == "") return "0";
                      var stDate = DateTime.Now.ToUniversalTime().GetDateTimeFormats();
                      //start=start.Substring(0,start.LastIndexOf("."));
                      //end=end.Substring(0,end.LastIndexOf("."));
                
                      bool IsHeaderTimeStamp= Convert.ToBoolean(isHeaderTimeStamp);
                      var startTime=DateTime.Now;
                      var endTime =DateTime.Now;
                      //2016-06-22 T 03:18:35.7987750
                
                      if(IsHeaderTimeStamp)
                      {
                        startTime = Convert.ToDateTime(start);
                        endTime = Convert.ToDateTime(end);
                       //startTime = DateTime.ParseExact(start, "yyyy-M-d T H:m:s", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.AdjustToUniversal);
                       //endTime = DateTime.ParseExact(end, "yyyy-M-d T H:m:s", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.AdjustToUniversal);          
                      }
                      else
                      {
                        //startTime = Convert.ToDateTime(start);
                        //endTime = Convert.ToDateTime(end);
                        startTime = DateTime.ParseExact(start, "M/d/yyyy T H:m:s.fff", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.AdjustToUniversal);
                        endTime = DateTime.ParseExact(end, "M/d/yyyy T H:m:s.fff", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.AdjustToUniversal);          
                      }
                      TimeSpan span = endTime.Subtract(startTime);
                      string duration = string.Format("{0:0.000}",span.TotalSeconds);//span.TotalSeconds.ToString();
                      return duration;
                  }
                  catch{
                  return "0";
                  }
            }       
            
            public string GetTime(string time)
            {
              if(time == "") return "";
              string start=time.Substring(0,time.LastIndexOf("."));
              var startTime = DateTime.ParseExact(start, "M/d/yyyy T H:m:s", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.AdjustToUniversal);                
              return startTime.ToLocalTime().ToString();
            }
            
            public bool IsStepHaveTimeStamp(string startTime,string endTime)
            {
              if(string.IsNullOrEmpty(startTime) || string.IsNullOrEmpty(endTime)) return false;              
              return true;
            }
            
            public int GetNumber(string val)
            {
              return Convert.ToInt32(val);
            }            
     
     ]]>
  </msxsl:script>  
  
  <xsl:template match="WorkFlow">
    <!--<xsl:value-of select="concat('/* ',@Version,' | ',Header/Summary/ProcessName,' | ',@Author,' | ',Header/Summary/TimeStamp/@CaptureStart,' | ',Header/OSSettings/OSVersionInfo/@OS,' */&#xa;&#xa;')"/>-->
    <xsl:variable name="StartTime">
      <xsl:value-of select="Header/Summary/TimeStamp/@CaptureStart"/>   
    </xsl:variable>
    <xsl:variable name="EndTime">
      <xsl:value-of select="Header/Summary/TimeStamp/@CaptureEnd"/>   
    </xsl:variable>
    
    <xsl:element name="GPS">
      <xsl:attribute name="Name">
        <xsl:value-of select="Header/Summary/ProcessName"/>
      </xsl:attribute>
      <xsl:attribute name="StartTime">
        <xsl:value-of select="$StartTime"/>      
      </xsl:attribute>
      <xsl:attribute name="EndTime">
        <xsl:value-of select="$EndTime"/>      
      </xsl:attribute>
      <xsl:attribute name="Duration">
        <xsl:value-of select="utils:GetDuration($StartTime,$EndTime,'true')"/>      
      </xsl:attribute>
      <xsl:apply-templates select="GroupStep|Step|NoteStep"/>
    </xsl:element>
  </xsl:template>  
  
  <xsl:template match="Step">    
    <xsl:choose>
      <xsl:when test="MSAA/Control/@Event = $EventsExcluded or not(utils:IsStepHaveTimeStamp(Info/TimeStamp/@StartTime,Info/TimeStamp/@EndTime))">
        <xsl:value-of select="utils:IncrementExcludedStepCounter"/>
      </xsl:when>
      <xsl:otherwise>        
        <xsl:variable name="stepCount">
          <xsl:value-of select="concat(utils:IncrementCounter(),utils:GetCounter())"/>
        </xsl:variable>
        <xsl:call-template name="ApplyStepAction">
          <xsl:with-param name="stepCount" select="$stepCount"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="ApplyStepAction">
    <xsl:param name="stepCount"/>
    <xsl:element name="Step">
      
      <xsl:variable name="StartTime">               
        <xsl:value-of select="Info/TimeStamp/@StartTime"/>        
      </xsl:variable>

      <xsl:variable name="EndTime">        
        <xsl:value-of select="Info/TimeStamp/@EndTime"/>
      </xsl:variable>     

      <xsl:variable name="Type">
        <xsl:value-of select="name()"/>
      </xsl:variable>

      <xsl:variable name="EventIncludedCount">
         <xsl:value-of select="count(preceding-sibling::Step/PlayBack/GeneralInfo[not(@Event = $EventsExcluded)])"/>
      </xsl:variable>
        
      <xsl:variable name="StepStartTime">
        <xsl:choose>
          <xsl:when test="$EventIncludedCount > 0">
            <xsl:value-of select="preceding-sibling::Step[not(PlayBack/GeneralInfo/@Event = $EventsExcluded) and utils:IsStepHaveTimeStamp(Info/TimeStamp/@StartTime,Info/TimeStamp/@EndTime)][1]/Info/TimeStamp/@EndTime"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="Info/TimeStamp/@StartTime"/>
          </xsl:otherwise>
        </xsl:choose> 
      </xsl:variable>
      
      

      <xsl:variable name="Duration">
        <xsl:value-of select="utils:GetDuration($StepStartTime,$EndTime,'false')"/>
      </xsl:variable>
      
      <xsl:variable name="IsInputControlStep">
        <xsl:choose>
          <xsl:when test="PlayBack/GeneralInfo/@Event='TYPETEXT'">
            <xsl:value-of select="1"/>          
          </xsl:when>
          <xsl:when test="PlayBack/GeneralInfo/@Event='Select' and ControlInfo/@Role='combo box'">
            <xsl:value-of select="1"/>          
          </xsl:when>
          <xsl:when test="ControlInfo/@Role='check box' or ControlInfo/@Role='radio button'">
            <xsl:value-of select="1"/>          
          </xsl:when>
          <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      
      <xsl:variable name="IsKeyStep">
        <xsl:choose>
          <xsl:when test="@isKeyStep">
            <xsl:value-of select="@isKeyStep"/>          
          </xsl:when>
          <xsl:otherwise>False</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      
       <xsl:variable name="KeyInfo">
        <xsl:choose>
          <xsl:when test="@KeyInformation">
            <xsl:value-of select="@KeyInformation"/>          
          </xsl:when>
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      
      <xsl:variable name="KeyStepDuration">
        <xsl:choose>
          <xsl:when test="$IsKeyStep = 'True'">            
            <xsl:variable name="KeyStepStartTime">
              <xsl:value-of select="Info/TimeStamp/@StartTime"/>        
            </xsl:variable>

            <xsl:variable name="KeyStepEndTime">
              <xsl:choose>
                <xsl:when test="count(following-sibling::*[name()='Step'][@isKeyStep='True']) > 0">
                  <xsl:value-of select="following-sibling::*[name()='Step'][@isKeyStep='True']/Info/TimeStamp/@EndTime"/>                
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="following-sibling::*[name()='Step'][last()]/Info/TimeStamp/@EndTime"/>                
                </xsl:otherwise>              
              </xsl:choose>                
            </xsl:variable>
            
           <xsl:value-of select="utils:GetDuration($KeyStepStartTime,$KeyStepEndTime,'false')"/>   
          </xsl:when>
          <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
        

      <xsl:element name="StepNumber">
        <xsl:value-of select="$stepCount"/>
      </xsl:element>
      <xsl:element name="NodeType">
        <xsl:value-of select="$Type"/>
      </xsl:element>
      <xsl:element name="EXEName">
        <xsl:value-of select="Info/TAP/@EXEName"/>
      </xsl:element>
      <xsl:element name="Description">
        <xsl:value-of select="Sentence/@Plain"/>
      </xsl:element>  
      
      <xsl:element name="ControlType">
        <xsl:value-of select="MSAA/Control/@Role"/>
      </xsl:element>
      
      <xsl:element name="ControlTypeID">
        <xsl:value-of select="MSAA/Control/@RoleID"/>
      </xsl:element>
      
      <xsl:element name="Event">
        <xsl:value-of select="MSAA/Control/@Event"/>
      </xsl:element> 
      
      <xsl:element name="ControlName">
        <xsl:value-of select="MSAA/Control/@Name"/>
      </xsl:element>
      
      <xsl:element name="HashCode">
        <xsl:value-of select="@HashCode"/>
      </xsl:element>
      
      <xsl:element name="ControlValue">
        <xsl:value-of select="MSAA/Control/@Value"/>
      </xsl:element>
      
      <xsl:element name="ControlDataValue">
        <xsl:value-of select="MSAA/Control/ControlData/Value"/>
      </xsl:element>
      
      <xsl:element name="ControlLocation">
        <xsl:value-of select="concat(MSAA/Control/Location/@Left,',',MSAA/Control/Location/@Top,',',MSAA/Control/Location/@Right,',',MSAA/Control/Location/@Bottom)"/>
      </xsl:element>
      
      <xsl:element name="ControlClientLocation">
        <xsl:value-of select="concat(MSAA/Control/ClientLocation/@Left,',',MSAA/Control/Location/@Top)"/>
      </xsl:element>
      
      <xsl:element name="UniqueControlID">
        <xsl:value-of select="MSAA/Control/@UniqueControlID"/>
      </xsl:element>
      
      <xsl:element name="DialogName">
        <xsl:value-of select="Standard/Control/@DialogName"/>
      </xsl:element>
      
      <xsl:element name="SAPScreenNumber">
        <xsl:if test="AddIn/SAP/Info/@ScreenNumber">
          <xsl:value-of select="AddIn/SAP/Info/@ScreenNumber"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="STDControlID">
        <xsl:if test="Standard/Control/@ControlID">
          <xsl:value-of select="Standard/Control/@ControlID"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="ActiveChannelID">
        <xsl:value-of select="@ActiveChannelID"/>
      </xsl:element> 
      
      <xsl:element name="AdaptorID">
        <xsl:value-of select="@AdaptorID"/>
      </xsl:element> 
      
      <xsl:element name="IEDocURL">
        <xsl:if test="IE/@DocURL">
          <xsl:value-of select="IE/@DocURL"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="IEEleType">
        <xsl:if test="IE/Element/@ElemType">
          <xsl:value-of select="IE/Element/@ElemType"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="IEEleValue">
        <xsl:if test="IE/Playback/Element/@Value">
          <xsl:value-of select="IE/Playback/Element/@Value"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="IEParentEleSelect">
        <xsl:if test="IE/ParentElement/@Select">
          <xsl:value-of select="IE/ParentElement/@Select"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="IEPlayBackEleSelect">
        <xsl:if test="IE/Playback/Element/@Select">
          <xsl:value-of select="IE/Playback/Element/@Select"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="IEPlayBackParentEleSelect">
        <xsl:if test="IE/Playback/ParentElement/@Select">
          <xsl:value-of select="IE/Playback/ParentElement/@Select"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="MaskData">
        <xsl:if test="SecurityInfo/@MaskData">
          <xsl:value-of select="SecurityInfo/@MaskData"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="IsPassword">
        <xsl:if test="SecurityInfo/@IsPassword">
          <xsl:value-of select="SecurityInfo/@IsPassword"/>
        </xsl:if>
      </xsl:element>
      
      <xsl:element name="StartTime">
        <xsl:value-of select="$StartTime"/>
      </xsl:element>
      <xsl:element name="EndTime">
        <xsl:value-of select="$EndTime"/>
      </xsl:element>
      <xsl:element name="Duration">
        <xsl:value-of select="$Duration"/>
      </xsl:element>
      <xsl:element name="IsKeyStep">
        <xsl:value-of select="$IsKeyStep"/>
      </xsl:element>
      <xsl:element name="IsInputControlStep">
        <xsl:value-of select="$IsInputControlStep"/>
      </xsl:element>
      <xsl:element name="KeyInformation">
        <xsl:value-of select="$KeyInfo"/>
      </xsl:element>
      <xsl:element name="KeyStepDuration">
        <xsl:value-of select="$KeyStepDuration"/>
      </xsl:element>
    </xsl:element>
    <!--<xsl:value-of select="concat('&#xa;',$stepCount,'.&#x9; Step Description:',Sentence/@Plain,'&#x9;&#x9;Start Time :',$StartTime,'&#x9;&#x9;End Time :',$EndTime,'&#x9;&#x9;Duration :',utils:GetDuration($StartTime,$EndTime))"/>-->

  </xsl:template>  
  
  <xsl:template match="GroupStep">    
    
     <xsl:variable name="ID">
          <xsl:value-of select="@ID"/>
    </xsl:variable>
      
    <xsl:variable name="noofsteps">        
        <xsl:value-of select="count((following-sibling::Step[not(PlayBack/GeneralInfo/@Event = $EventsExcluded) and utils:IsStepHaveTimeStamp(Info/TimeStamp/@StartTime,Info/TimeStamp/@EndTime)][@ParentID=$ID]))"/>
    </xsl:variable>  
      
    <xsl:choose>
      <xsl:when test="following-sibling::*[position()='1'][name()='GroupStep'] or $noofsteps=0"></xsl:when>     
      <xsl:otherwise>
        <xsl:variable name="stepCount">
          <xsl:value-of select="concat(utils:IncrementCounter(),utils:GetCounter())"/>
        </xsl:variable>
        <xsl:call-template name="ApplyGroupAction">
            <xsl:with-param name="stepCount" select="$stepCount"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>    
     <!--<xsl:value-of select="concat('&#xa;',$stepCount,'.&#x9; Step Description:',Sentence/@Plain,'&#x9;&#x9;Start Time :',$StartTime,'&#x9;&#x9;End Time :',$EndTime,'&#x9;&#x9;Duration :',utils:GetDuration($StartTime,$EndTime))"/>-->
  </xsl:template>
  
  <xsl:template name="ApplyGroupAction">
    <xsl:param name="stepCount"/>
     <xsl:element name="GroupStep">      
      <xsl:variable name="ID">
        <xsl:value-of select="@ID"/>
      </xsl:variable>
      <xsl:variable name="noofsteps">        
        <xsl:value-of select="count((following-sibling::Step[not(PlayBack/GeneralInfo/@Event = $EventsExcluded) and utils:IsStepHaveTimeStamp(Info/TimeStamp/@StartTime,Info/TimeStamp/@EndTime)][@ParentID=$ID]))"/>
      </xsl:variable>
      
      <xsl:variable name="StartTime">
        <xsl:choose>
          <xsl:when test="count(preceding-sibling::Step) = 0">
            <xsl:value-of select="(following-sibling::Step[not(PlayBack/GeneralInfo/@Event = $EventsExcluded) and utils:IsStepHaveTimeStamp(Info/TimeStamp/@StartTime,Info/TimeStamp/@EndTime)][position()='1']/Info/TimeStamp/@StartTime)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="(preceding-sibling::Step[not(PlayBack/GeneralInfo/@Event = $EventsExcluded) and utils:IsStepHaveTimeStamp(Info/TimeStamp/@StartTime,Info/TimeStamp/@EndTime)][position()='1']/Info/TimeStamp/@EndTime)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

       <!---->
         
      <xsl:variable name="EndTime">
        <!--<xsl:value-of select="(following-sibling::*[name()='Step'][position()= utils:GetNumber($noofsteps)]/Info/TimeStamp/@EndTime)"/>-->
        <xsl:value-of select="following-sibling::Step[not(PlayBack/GeneralInfo/@Event = $EventsExcluded) and utils:IsStepHaveTimeStamp(Info/TimeStamp/@StartTime,Info/TimeStamp/@EndTime) and (@ParentID=$ID)][last()]/Info/TimeStamp/@EndTime"/>
      </xsl:variable>

      <xsl:variable name="Description">
        <xsl:value-of select="name()"/>
      </xsl:variable>

       <xsl:variable name="Type">
         <xsl:value-of select="name()"/>
       </xsl:variable>
       
       <xsl:variable name="EXEName">
         <xsl:value-of select="following-sibling::Step[not(PlayBack/GeneralInfo/@Event = $EventsExcluded) and utils:IsStepHaveTimeStamp(Info/TimeStamp/@StartTime,Info/TimeStamp/@EndTime)][position()='1']/Info/TAP/@EXEName"/>
       </xsl:variable>

      <xsl:element name="StepNumber">
        <xsl:value-of select="$stepCount"/>
      </xsl:element>
       <xsl:element name="NodeType">
         <xsl:value-of select="$Type"/>
       </xsl:element>
       <xsl:element name="EXEName">
         <xsl:value-of select="$EXEName"/>
       </xsl:element>
      <xsl:element name="Description">
        <xsl:value-of select="$Description"/>
      </xsl:element>
      <xsl:element name="StartTime">
        <xsl:value-of select="$StartTime"/>
      </xsl:element>
      <xsl:element name="EndTime">
        <xsl:value-of select="$EndTime"/>
      </xsl:element>
      <xsl:variable name="Duration">
        <xsl:value-of select="utils:GetDuration($StartTime,$EndTime,'false')"/>
      </xsl:variable>
      <xsl:element name="Duration">
        <xsl:value-of select="$Duration"/>
      </xsl:element>
    </xsl:element>
  
  </xsl:template>  
  
  <xsl:template match="NoteStep">
     <xsl:variable name="stepCount">
       <xsl:value-of select="concat(utils:IncrementCounter(),utils:GetCounter())"/>
     </xsl:variable>
     <xsl:element name="NoteStep">      
      <xsl:variable name="ID">
        <xsl:value-of select="@ID"/>
      </xsl:variable>
      <xsl:variable name="noofsteps">
        <xsl:choose>
          <xsl:when test="count(following-sibling::*[name()='NoteStep']) > 0">
            <xsl:value-of select="count(following-sibling::*[name()='NoteStep'][1]/preceding-sibling::*[name()!='NoteStep']) - position()"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="count(following-sibling::*[name()!='NoteStep'])"/>
          </xsl:otherwise>
        </xsl:choose>
        </xsl:variable>
      
      <xsl:variable name="StartTime">
        <xsl:choose>
          <xsl:when test="count(preceding-sibling::Step) = 0">
            <xsl:value-of select="(following-sibling::*[name()='Step'][position()='1']/Info/TimeStamp/@StartTime)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="(preceding-sibling::*[name()='Step'][position()='1']/Info/TimeStamp/@EndTime)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:variable name="EndTime">
        <xsl:choose>
          <xsl:when test="$noofsteps > 0">
            <xsl:value-of select="(following-sibling::*[position()= utils:GetNumber($noofsteps)]/Info/TimeStamp/@EndTime)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$StartTime"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
       <xsl:variable name="Type">
         <xsl:value-of select="name()"/>
       </xsl:variable>
      <xsl:variable name="Description">
        <xsl:value-of select="@Desc"/>
      </xsl:variable>

       <xsl:variable name="EXEName">
         <xsl:value-of select="following-sibling::*[name()='Step'][position()='1']/Info/TAP/@EXEName"/>
       </xsl:variable>

      <xsl:element name="StepNumber">
        <xsl:value-of select="$stepCount"/>
      </xsl:element>
       <xsl:element name="NodeType">
         <xsl:value-of select="$Type"/>
       </xsl:element>
       <xsl:element name="EXEName">
         <xsl:value-of select="$EXEName"/>
       </xsl:element>
      <xsl:element name="Description">
        <xsl:value-of select="$Description"/>
      </xsl:element>
      <xsl:element name="StartTime">
        <xsl:value-of select="$StartTime"/>
      </xsl:element>
      <xsl:element name="EndTime">
        <xsl:value-of select="$EndTime"/>
      </xsl:element>
      <xsl:variable name="Duration">
        <xsl:value-of select="utils:GetDuration($StartTime,$EndTime,'false')"/>
      </xsl:variable>
      <xsl:element name="Duration">
        <xsl:value-of select="$Duration"/>
        <!--utils:GetNumber($noofsteps)-->
      </xsl:element>
    </xsl:element>
  
  </xsl:template>  
  
</xsl:stylesheet>
