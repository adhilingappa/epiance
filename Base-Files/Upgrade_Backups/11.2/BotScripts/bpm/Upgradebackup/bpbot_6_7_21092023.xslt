<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:my="my:my"  xmlns:incr="urn:my-scripts" exclude-result-prefixes="msxsl" >
  <msxsl:script implements-prefix='incr' language='CSharp'>
    <![CDATA[
    int a=0;
    int b=0;
    int c=0;
    int i=0;
    int j=0;
    String latGuid = "";
    String latGuid1 = "";
    string latGuid2 = "";
    String[] guids = new String[60] ;
    
    string[] gList = new string[]{"a32afc6f-908f-49fb-9d86-d8295a19c9f2",
"592aa77f-7388-402e-9ffc-7c932359bbf0",
"890ea720-1ccd-4ca8-a56d-8e75b89e9eb6",
"57895db8-cb34-4620-84dd-3c05ec8dfc41",
"e433d622-888d-40c8-94c4-74d67679b7db",
"e6a88625-f824-40f3-a559-2788310262d4",
"77cd52a3-97d2-425c-a08a-7c5d1ff9da60",
"2f46bf2c-adfd-4de8-989b-883963ae0fe7",
"34363e1c-8c3d-414f-b8eb-d6629eb3ad99",
"8d0accc3-6a57-411b-a7bd-a1d9b08a9dbd",
"f6efcd50-7b56-40e6-8165-0d0b2448d91f",
"c58bad15-735a-4d03-9474-0526691384fa",
"a8daa8cc-5ce5-4360-8d9d-c3c2af64da70",
"744b1b64-f27f-40a5-ba59-d547b9f2a3e9",
"4d9cefd3-6d0e-4732-91c2-c54ba313bb68",
"17a2ddbc-7333-4d9f-bd1e-f58d1a9cf216",
"6a316f77-667f-4922-b89d-40e48008567d",
"29dfd56b-37c8-4c80-8875-a7101ae72671",
"5483870e-75b6-447d-af87-4f2609e4e8fc",
"d342ed51-b275-465a-9809-201bb3faf56a",
"20251a1f-dba5-4b9c-8d56-af4c1c05d78f",
"2d298f76-7d81-4d93-b3df-93f33a5d9b3b",
"817e5a21-9a7f-4540-8df4-f32d6cf96ea8",
"2ef4e258-e0bb-4c31-8e75-a9f26527ae52",
"cf9e118e-1166-4484-b023-dafe01c8899e",
"f4e62cab-7717-4585-afb7-b3e76541c32b",
"0ab835d2-20ba-4741-bae4-9f5ad878781a",
"9bd1fcb6-11be-4e0d-ac02-97bb2f6aa759",
"b33a7410-ff8e-4a63-a6b5-efcdfe96832c",
"3601bff9-141a-499d-b94d-54e12a55fe85",
"8ea350cd-5386-4ba6-894c-6f5ebd910446",
"7ae57328-ca27-4c2d-ab05-68eb73940020",
"db770c7f-1416-4835-95c7-c5431f084d59",
"e84b4af5-2a9e-4130-9384-342d8b6a64d8",
"881ce701-d504-413a-ab7f-0320df3d9142",
"0aeda11a-e6ef-4120-847e-dfe92f59bca8",
"126ba4e0-4cd1-46a5-b584-92245364e9a4",
"630e165a-64d8-4f0e-98ee-6bb749e0c54c",
"a4a0e59b-f72b-4d57-877c-9c01b4d909f0",
"6962a449-9185-4ffb-9fe9-1ad2ec8884c5",
"0b948d27-da46-4b0f-9c06-95d588180ad9",
"80fc82fa-6192-4c68-ab46-5be49b100036",
"17bf5b43-ee9e-49e7-980d-1426056a0ccf",
"d9556342-0d4c-4e8c-ab6d-2d6ac88ca12e",
"b865f500-ad7d-4739-92ca-992a1b10edc4",
"2f6a5497-6521-4754-97fe-32b55e77ff47",
"af51b3d9-18e8-4c44-9d1a-e72af27a1c73",
"29924e6a-ba51-45f0-821a-c3cc204ac405",
"1946684b-b0ef-4b9c-b71d-539240f51827",
"376b3bc5-6660-4b1a-b475-ad9e30636565",
"d069568b-57cc-493e-ae3e-ead8cc1b0666",
"e0fef97a-779d-41b7-ae33-c738484f5a7a",
"10f1e910-bc98-4a19-9ce3-64e370f6800c",
"7d06cca7-13cd-4572-a6f8-a0fde63b7865",
"00b92498-7e13-4539-a22b-cd444c4b8337",
"69129851-4a75-4c53-aec2-e8e7794705ac",
"403a579c-dd6e-4d5c-85db-620af3f7ae20",
"b317a3ec-b54b-455a-9cc5-5a0504e18acc",
"5b260028-ca6c-460e-bd45-c613f1d87e70",
"bfcd985d-4ba8-4c6f-951a-3f52513bd281",
"32a9e9b5-33ef-4eb8-b8e6-546310252785",
"4e53fc84-42b7-45d5-87c9-46ed8733e93c",
"8cd4dd1a-3f89-4491-803b-a22fe9db2d74",
"cf44769a-d067-4afd-bb6c-81a00f87ac68",
"5d27da79-8221-49e1-bad4-5295de33d8f5",
"9d19f57b-47b2-46c6-aaf1-7e2256773f7f",
"7afef8af-0693-4879-aa07-5617c8e5159c",
"6faa061c-dbf0-4d19-93fb-983a89689647",
"74cb605c-0e7d-41b8-a69f-98bb4b3bf112",
"0af0e0dc-8a25-4632-8c26-b1d1e7e659bb",
"9cfdaa76-c000-4d1e-a652-edfd289a5f4b",
"f8b467c0-923e-4d09-b021-c797e2dbd798",
"2fc41076-02bb-40ae-a9ac-f234ef5534d3",
"97b58aeb-5dc6-41dc-b372-11ae779a8e34",
"4d2ed75e-7d3d-4218-94d4-f6c2bcbb78b7",
"71d63415-6b35-46ac-8ffc-9675d7032da8",
"5cfcd1b8-a8b4-401b-9b3a-a766fe69b9f3",
"4c0dcb89-61a5-4f7a-9ba8-601b5fd876df",
"ca200e28-66f3-4817-8bcf-b17fe764c40b",
"616baa47-015e-4390-8965-ce04939d6a1b",
"f698d46a-5528-4a46-aaba-f7cdaeff0875",
"ca43a721-f331-4c9f-9ee9-ba334595121e",
"422de545-91c5-47f1-9cda-8d15a8001763",
"3f277fc5-d83c-4608-8f64-302e3757b3b6",
"5807c594-55ef-49b0-93d2-b6ee90aaca12",
"13e15037-2ab6-4824-89e5-503a693ce719",
"b0c3fd7b-9d39-4c40-96f4-e8056f11da21",
"89e91324-b2c2-4e80-86e7-50129b04a5cf",
"388035ff-3046-46c3-96e3-1380f056b392",
"2ea68fc0-51f0-4e9a-b706-d88191c0d78f",
"03e67c01-d7e8-4bcf-869e-6f7c1d89e7df",
"15efada1-534a-4114-a7cb-3d9e4fed7932",
"4f4f8040-a46f-4632-8701-db3bf245f21a"};

string gListLatest1 = "";

public string getGlist(){
       
        String gi = gList[a];
        a++;
       return gi;
  }
  
  
  public string getGlist1(){
       String gi1 = gList[b];
       gListLatest1 = gi1;
       b++;
       return gi1;
  }
  
   public string getGlist2(){
       
        String gi = gList[c];
        c++;
       return gi;
  }
  
  public string getgListLatest1()
  {
    return gListLatest1;   
  }
    
      public string getGuid(){
       String gi = Guid.NewGuid().ToString();
       latGuid = gi;
       return latGuid;
  }
  
  public void init()
  {
  
  for(int z=0;z<=59;z++)
    {
        guids[z] = "";
    }
  
  }
  
  public string getLatestGuid(){
     return latGuid;
  }
  
  public void storeGuids(string guid)
  {
      guids[i] = guid;
      i++;
  }
  
  public String getGuids()
  {   
     latGuid1 = guids[j];
     latGuid2 = guids[j];
     j++;
      return latGuid1;
  }
  public String getLatestGuids1()
  {   
    
      return latGuid2;
    
  }
  
  public string RandomString()  
{  

    int size = 6;
    bool lowerCase = true;
    StringBuilder builder = new StringBuilder();  
    Random random = new Random();  
    char ch;  
    for (int i = 0; i < size; i++)  
    {  
        ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));  
        builder.Append(ch);  
    }  
    if (lowerCase)  
        return builder.ToString().ToLower();  
    return builder.ToString();  
}  
  
       ]]>
  </msxsl:script>
  <xsl:output method="xml" indent="yes"/>
  <xsl:variable name="true">True</xsl:variable>
  <xsl:variable name="text">text</xsl:variable>
  <xsl:variable name="false">False</xsl:variable>
  <xsl:variable name="centerClick">UIAClickCentre</xsl:variable>
  <xsl:variable name="newtext">newtext</xsl:variable>
  <xsl:variable name="id">5ab285c7-408c-4d6b-a622-555035c5c546</xsl:variable>
  <xsl:variable name="linkFirstId">cff3d686-8313-4f5c-b984-0741f7520ab1</xsl:variable>
  <xsl:variable name="one">1</xsl:variable>





  <xsl:template match="/">


    <process name="0demo" version="1.0" bpversion="6.7.0.20116" narrative="" byrefcollection="true" type="object" runmode="Exclusive" preferredid="2ee86266-149e-4e4c-a4eb-7300ca89d1e7">
      <appdef>
        <element name="0demo">
          <xsl:element name="id">
            <xsl:value-of select="$id"/>
          </xsl:element>

          <xsl:value-of select="incr:init()"/>



          <xsl:for-each select="Document/Process/Step">
            <xsl:choose>
              <xsl:when test="Event = 'Click'">
                <xsl:call-template name="elementTemplate"/>
              </xsl:when>

              <xsl:when test="Event = 'TypeText'">
                <xsl:call-template name="elementTemplate"/>
              </xsl:when>

            </xsl:choose>

            <xsl:if test="SubSteps">
              <xsl:for-each select="SubSteps/Step">
                <xsl:choose>
                  <xsl:when test="Event = 'Click'">
                    <xsl:call-template name="elementTemplate"/>

                  </xsl:when>
                </xsl:choose>
              </xsl:for-each>
            </xsl:if>






          </xsl:for-each>



          <type>Application</type>
          <basetype>Application</basetype>
          <datatype>unknown</datatype>
          <diagnose>False</diagnose>
        </element>
        <apptypeinfo>
          <id>Win32Launch</id>
          <parameters>
            <parameter>
              <name>Path</name>
              <value>C:\Windows\notepad.exe</value>
            </parameter>
            <parameter>
              <name>CommandLineParams</name>
              <value>
              </value>
            </parameter>
            <parameter>
              <name>WorkingDirectory</name>
              <value>
              </value>
            </parameter>
            <parameter>
              <name>NonInvasive</name>
              <value>True</value>
            </parameter>
            <parameter>
              <name>ProcessMode</name>
              <value>Internal</value>
            </parameter>
            <parameter>
              <name>ExternalProcessTimeout</name>
              <value>0</value>
            </parameter>
            <parameter>
              <name>Options</name>
              <value>
              </value>
            </parameter>
          </parameters>
        </apptypeinfo>
      </appdef>
      <view>
        <camerax>0</camerax>
        <cameray>0</cameray>
        <zoom version="2">1.25</zoom>
      </view>
      <preconditions />
      <endpoint narrative="" />
      <subsheet subsheetid="7608d98f-dc54-4977-8045-c6760e6ec101" type="CleanUp" published="True">
        <name>Clean Up</name>
        <view>
          <camerax>0</camerax>
          <cameray>0</cameray>
          <zoom version="2">1.25</zoom>
        </view>
      </subsheet>
      <subsheet subsheetid="7eebd8ed-b866-44d2-86b9-62cdc9202ea3" type="Normal" published="False">
        <name>Action 1</name>
        <view>
          <camerax>0</camerax>
          <cameray>0</cameray>
          <zoom version="2">1.25</zoom>
        </view>
      </subsheet>
      <stage stageid="230b4dc4-5ea6-419c-a906-78a27bddc2ec" name="Start" type="Start">
        <loginhibit />
        <display x="15" y="-105" />
        <onsuccess>1f001a2c-3ee5-49ee-bfeb-b11d960e5c59</onsuccess>
      </stage>
      <stage stageid="1f001a2c-3ee5-49ee-bfeb-b11d960e5c59" name="End" type="End">
        <loginhibit />
        <display x="15" y="90" />
      </stage>
      <stage stageid="f280d612-ea58-4131-a54b-eecb42feead1" name="Stage1" type="ProcessInfo">
        <display x="-195" y="-105" w="150" h="90" />
        <references>
          <reference>System.dll</reference>
          <reference>System.Data.dll</reference>
          <reference>System.Xml.dll</reference>
          <reference>System.Drawing.dll</reference>
        </references>
        <imports>
          <import>System</import>
          <import>System.Drawing</import>
          <import>System.Data</import>
        </imports>
        <language>visualbasic</language>

      </stage>
      <stage stageid="16f0c0aa-36d0-4f47-a0b2-0fbe2d178ad0" name="Clean Up" type="SubSheetInfo">
        <subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
        <display x="-195" y="-105" w="150" h="90" />
      </stage>
      <stage stageid="c8929f82-3259-40e8-98df-02472b2f7a45" name="Start" type="Start">
        <subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
        <loginhibit />
        <display x="15" y="-105" />
        <onsuccess>86847ebf-f4e0-47d4-ab94-78ded084e0b9</onsuccess>
      </stage>
      <stage stageid="86847ebf-f4e0-47d4-ab94-78ded084e0b9" name="End" type="End">
        <subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
        <loginhibit />
        <display x="15" y="90" />
      </stage>
      <stage stageid="6c7e9331-b3f5-4cd3-9970-aa0cce06c17d" name="Action 1" type="SubSheetInfo">
        <subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
        <display x="-195" y="-105" w="150" h="90" />
      </stage>
      <stage stageid="ad5d907d-13e8-4923-9db8-d36dc07d9104" name="Start" type="Start">

        <subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
        <loginhibit />
        <display x="15" y="-105" />
        <xsl:element name="onsuccess">
          <xsl:value-of select="incr:getGlist1()"/>
        </xsl:element>

      </stage>

      <stage stageid="cd240663-4801-477e-9b09-3e1521d0d535" name="Note1" type="Note">
        <subsheetid>7608d98f-dc54-4977-8045-c6760e6ec101</subsheetid>
        <narrative>
          Clean Up Page

          This is an optional page where you might choose to perform some finalisation (or "cleanup") tasks as your business object is closed down.

          The cleanup action will be called automatically immediately after closing your business object at the end of a business process.

          You will not be able to call this action from a business process, nor will it be called at any other time than before the disposal of the business object.
        </narrative>
        <display x="-180" y="60" w="180" h="230" />
      </stage>
      <stage stageid="8ba4126b-0eec-4bb4-89ec-0a7fb4a184a1" name="Note2" type="Note">
        <narrative>
          Initialise Page

          This is an optional page where you might choose to perform some initialisation tasks after your business object is loaded.

          The initialise action will be called automatically immediately after loading your business object.

          You will not be able to call this action from a business process, nor will it be called at any other time than after the creation of the object.
        </narrative>
        <display x="-180" y="60" w="180" h="230" />
      </stage>

      <xsl:for-each select="Document/Process/Step">
        <xsl:choose>

          <xsl:when test="Event = 'Click'">

            <xsl:element name="stage">
              <xsl:attribute name="stageid">
                <xsl:value-of select="incr:getgListLatest1()"/>
              </xsl:attribute>
              <xsl:attribute name="name">
                <xsl:value-of select="incr:RandomString()"/>
              </xsl:attribute>
              <xsl:attribute name="type">Navigate</xsl:attribute>


              <subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>

              <loginhibit />
              <display x="15" y="-15" />

              <xsl:element name="onsuccess">
                <xsl:value-of select="incr:getGlist1()"/>
              </xsl:element>

              <xsl:call-template name="stepTemplate"/>




            </xsl:element>


            <xsl:if test="SubSteps/Step">

              <xsl:element name="stage">
                <xsl:attribute name="stageid">
                  <xsl:value-of select="incr:getgListLatest1()"/>
                </xsl:attribute>
                <xsl:attribute name="name">
                  <xsl:value-of select="incr:RandomString()"/>
                </xsl:attribute>
                <xsl:attribute name="type">Navigate</xsl:attribute>


                <subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
                <loginhibit />
                <display x="15" y="-15" />

                <xsl:element name="onsuccess">
                  <xsl:value-of select="incr:getGlist1()"/>
                </xsl:element>

                <xsl:call-template name="stepTemplate"/>




              </xsl:element>

            </xsl:if>

          </xsl:when>

          <xsl:when test="Event = 'TypeText'">

            <xsl:element name="stage">
              <xsl:attribute name="stageid">
                <xsl:value-of select="incr:getgListLatest1()"/>
              </xsl:attribute>
              <xsl:attribute name="name">
                <xsl:value-of select="incr:RandomString()"/>
              </xsl:attribute>
              <xsl:attribute name="type">Write</xsl:attribute>


              <subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
              <loginhibit />
              <display x="15" y="-15" />

              <xsl:element name="onsuccess">
                <xsl:value-of select="incr:getGlist1()"/>
              </xsl:element>

              <xsl:call-template name="stepTemplate1"/>


              <xsl:if test="SubSteps/Step">
                <xsl:call-template name="stepTemplate1"/>
              </xsl:if>

            </xsl:element>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>


      <xsl:element name="stage">
        <xsl:attribute name="stageid">
          <xsl:value-of select="incr:getgListLatest1()"/>
        </xsl:attribute>
        <xsl:attribute name="name">
          <xsl:value-of select="incr:RandomString()"/>
        </xsl:attribute>
        <xsl:attribute name="type">End</xsl:attribute>
        <subsheetid>7eebd8ed-b866-44d2-86b9-62cdc9202ea3</subsheetid>
        <loginhibit />
        <display x="15" y="-15" />
      </xsl:element>



    </process>
  </xsl:template>

  <xsl:template  name="elementTemplate">
    <xsl:element name="element">
      <xsl:attribute name="name">
        <xsl:value-of select="concat(ControlName,Role)"/>
      </xsl:attribute>
      <xsl:element name="id">
        <xsl:value-of select="incr:getGlist()"/>

      </xsl:element>



      <xsl:value-of select="incr:storeGuids(id)"/>



      <xsl:element name="type">
        <xsl:call-template name="matchDictionaryTemplate1"/>
      </xsl:element>

      <xsl:element name="basetype">
        <xsl:call-template name="matchDictionaryTemplate1"/>
      </xsl:element>

      <xsl:element name="datatype">
        <xsl:value-of select="$text"/>
      </xsl:element>

      <xsl:element name="diagnose">
        <xsl:value-of select="$false"/>
      </xsl:element>

      <xsl:element name="attributes">


        <xsl:element name="attribute">
          <xsl:attribute name="name">uAutomationId</xsl:attribute>
          <xsl:attribute name="inuse">
            <xsl:value-of select="$false"/>
          </xsl:attribute>
          <xsl:element name="ProcessValue">
            <xsl:attribute name="datatype">
              <xsl:value-of select="$text"/>
            </xsl:attribute>
            <xsl:attribute name="value">
            </xsl:attribute>
          </xsl:element>
        </xsl:element>

        <xsl:element name="attribute">
          <xsl:attribute name="name">uControlType</xsl:attribute>
          <xsl:attribute name="inuse">
            <xsl:value-of select="$true"/>
          </xsl:attribute>
          <xsl:element name="ProcessValue">
            <xsl:attribute name="datatype">
              <xsl:value-of select="$text"/>
            </xsl:attribute>
            <xsl:attribute name="value">
              <xsl:call-template name="matchDictionaryTemplate"/>
            </xsl:attribute>
          </xsl:element>
        </xsl:element>


        <xsl:element name="attribute">
          <xsl:attribute name="name">uName</xsl:attribute>
          <xsl:attribute name="inuse">
            <xsl:value-of select="$true"/>
          </xsl:attribute>
          <xsl:element name="ProcessValue">
            <xsl:attribute name="datatype">
            </xsl:attribute>
            <xsl:attribute name="datatype">
              <xsl:value-of select="$text"/>
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="Role = 'list'">
                <xsl:attribute name="value">
                  <xsl:value-of select="ControlData"/>
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>

                <xsl:attribute name="value">
                  <xsl:value-of select="ControlName"/>
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>

          </xsl:element>
        </xsl:element>



        <xsl:element name="attribute">
          <xsl:attribute name="name">MatchIndex</xsl:attribute>
          <xsl:attribute name="inuse">
            <xsl:value-of select="$true"/>
          </xsl:attribute>
          <xsl:element name="ProcessValue">
            <xsl:attribute name="datatype">
              <xsl:value-of select="$text"/>
            </xsl:attribute>
            <xsl:attribute name="value">
              <xsl:value-of select="$one"/>
            </xsl:attribute>
          </xsl:element>
        </xsl:element>



      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="attributeTemplate">

    <xsl:element name="ProcessValue">
      <xsl:attribute name="datatype">
        <xsl:value-of select="$text"/>
      </xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select="$true"/>
      </xsl:attribute>
    </xsl:element>

  </xsl:template>

  <xsl:template name="stepTemplate">
    <xsl:element name="step">
      <xsl:element name="element">
        <xsl:attribute name="id">

          <xsl:value-of select="incr:getGlist2()"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="action">
        <xsl:element name="id">

          <xsl:value-of select="$centerClick"/>
        </xsl:element>
        <xsl:element name="arguments">

          <xsl:element name="argument">
            <xsl:element name="id">
              <xsl:value-of select="$newtext"/>
            </xsl:element>
            <xsl:element name="value"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="stepTemplate1">
    <xsl:element name="step">
      <xsl:attribute name="expr">
        "<xsl:value-of select="ControlData"/>"
      </xsl:attribute>
      <xsl:element name="element">
        <xsl:attribute name="id">
          <xsl:value-of select="incr:getGlist2()"/>
        </xsl:attribute>
      </xsl:element>
    </xsl:element>
  </xsl:template>


  <xsl:template name="matchDictionaryTemplate">
    <xsl:choose>
      <xsl:when test="Role = 'menu item'">MenuItem</xsl:when>
      <xsl:when test="(Role = 'push button') or (Role = 'grid drop down button')">Button</xsl:when>
      <xsl:when test="Role = 'check box'">CheckBox</xsl:when>
      <xsl:when test="Role = 'radio button'">RadioButton</xsl:when>
      <xsl:when test="Role = 'editable text'">Edit</xsl:when>
      <xsl:when test="Role = 'list item'">ListItem</xsl:when>
      <xsl:when test="Role = 'combo box'">ComboBox</xsl:when>
      <xsl:when test="Role = 'grid drop down button'">B</xsl:when>
      <xsl:when test="Role = 'page tab'">TabItem</xsl:when>
      <xsl:when test="Role = 'drop down button'">SplitButton</xsl:when>

    </xsl:choose>
  </xsl:template>

  <xsl:template name="matchDictionaryTemplate1">
    <xsl:choose>
      <xsl:when test="Role = 'menu item'">UIAMenuItem</xsl:when>
      <xsl:when test="(Role = 'push button') or (Role = 'grid drop down button')">UIAButton</xsl:when>
      <xsl:when test="Role = 'check box'">UIACheckBox</xsl:when>
      <xsl:when test="Role = 'radio button'">UIARadio</xsl:when>
      <xsl:when test="Role = 'editable text'">UIAEdit</xsl:when>
      <xsl:when test="Role = 'list item'">UIAListItem</xsl:when>
      <xsl:when test="Role = 'combo box'">UIAComboBox</xsl:when>
      <xsl:when test="Role = 'page tab'">UIATabItem</xsl:when>
      <xsl:when test="Role = 'drop down button'">UIAButton</xsl:when>



    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
