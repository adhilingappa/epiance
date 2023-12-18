<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:safe="http://www.esa.int/safe/sentinel-1.0"
	xmlns:utils="urn:my-scripts" exclude-result-prefixes="msxsl utils" extension-element-prefixes="#default"
                >
	<msxsl:script implements-prefix='utils' language='CSharp'>
		<msxsl:using namespace="System.Collections.Generic" />
		<![CDATA[  
    
     int i=1;
     public string getsourceRefID()
     {
        try 
        {
            string Id= "StartEvent_";
            return Id+i++;
        }
        catch(Exception e)
        {
            return "StartEvent_100";
        }
     }
     
     int j=2;
     public string targetRefID()
     {
        try 
        {
            string Id= "StartEvent_";
            return Id+j++;
        }
        catch(Exception e)
        {
            return "Activity_100";
        }
     }
     
     int SId=1;
     public string getsequenceFlowId()
     {
        try 
        {
            string Id= "sequenceFlow_";
            return Id+SId++;
        }
        catch(Exception e)
        {
            return "StartEvent_";
        }
     }
     
     
     int EndId=1;
     public string getEndEventIncomingId()
     {
        try 
        {
            string Id= "sequenceFlow_";
            return Id+EndId++;
        }
        catch(Exception e)
        {
            return "StartEvent_";
        }
     }
     
    
     public string getFinalsequenceFlowId()
     {
        try 
        {
        int tmpid=--SId;
            string Id= "sequenceFlow_";
            return Id+tmpid;
        }
        catch(Exception e)
        {
            return "StartEvent_";
        }
     }
     
     
     
   int k=2;
     public string getscriptTaskID()
     {
        try 
        {
            string Id= "StartEvent_";
            return Id+k++;
        }
        catch(Exception e)
        {
            return "StartEvent_100";
        }
     }
  
  
   int IncomingId=1;
     public string getbpmnIncoming()
     {
        try 
        {
            string Id= "sequenceFlow_";
            return Id+IncomingId++;
        }
        catch(Exception e)
        {
            return "StartEvent_";
        }
     } 
     
     
      int outgoing=2;
     public string getbpmnoutgoing()
     {
        try 
        {
            string Id= "sequenceFlow_";
            return Id+outgoing++;
        }
        catch(Exception e)
        {
            return "StartEvent_";
        }
     }  
     
     int EdgeID=1; 
     public string getBPMNEdgeID()
     {
        try 
        {
            string Id= "EdgeID";
            return Id+EdgeID++;
        }
        catch(Exception e)
        {
            return "StartEvent_";
        }
     } 
     
     
     int ShapeID=1;
     public string getBPMNShapeID()
     {
        try 
        {
            string Id= "ShapeID";
            return Id+ShapeID++;
        }
        catch(Exception e)
        {
            return "StartEvent_";
        }
     }  
     
    /* For BPMNEdge */ 
    int EleId=1;
     public string getbpmnElement()
     {
        try 
        {
            string Id= "sequenceFlow_";
            return Id+EleId++;
        }
        catch(Exception e)
        {
            return "StartEvent_";
        }
     }
     
     
     int bpmnShapeID=1;
     public string getbpmnShapeElement()
     {
        try 
        {
            string Id= "StartEvent_";
            return Id+bpmnShapeID++;
        }
        catch(Exception e)
        {
            return "StartEvent_100";
        }
     }
     
     int Xcordinate=100;
     public int getBPMNEdgeXcoordinate(int xValue=0)
     {
         int tmpXcordinate=100;
         if(xValue==0)
         {
             Xcordinate= Xcordinate+tmpXcordinate;
             return Xcordinate;
         }
         Xcordinate= Xcordinate+xValue;
         return Xcordinate;
     }
     
    int Xcord=100;
     public int getBPMNShapeXcoordinate(int xValue=0)
     {
         int tmpXcordinate=60;
         if(xValue==0)
         {
             Xcord= Xcord+xValue;
             return Xcord;
         }
         Xcord= Xcord+xValue;
         return Xcord;
     }
     
     int index=0;
     public int StepIndex()
     {
        index++;
        return index;
     }
	 
	public string getStepScriptFile(string controlName,string eventName,string Step_ID,string repo_path,string GPSFileName)
	{
      //string repos_path= repo_path.Replace("Capture","Genie").Replace("Images","Scripts");
	  string repos_path=repo_path+"\\Genie\\"+GPSFileName+"_files"+"\\Scripts";
      string Filename=controlName+eventName+Step_ID;			
      //Filename=Regex.Replace(Filename, @"(\s+|@|&|'|\(|\)|<|>|#)", "");
     // Filename =Filename.Replace(".","");
	  Filename=Regex.Replace(Filename, @"\W+", "");
	  
      repos_path=repos_path+"\\"+Filename+".eon";
	  repos_path = Regex.Replace(repos_path, @"\s+", "");
	  repos_path=Regex.Replace(repos_path, @"\\", @"\\");
	  
     return repos_path;
	 string fileData = System.IO.File.ReadAllText(repos_path);
      string beginStr = "ScriptLib.ReportProgress(this.extraParam);";
      string endStr = "this.theObjApp.Wait(this.DebugWait);";
      string defaultStr = "var theObjApp = new App.Application.App(); var DebugWait = 500; var ActiveWindowWait=5000; var Msaa_notepad;";
            
      int pFrom = fileData.IndexOf(beginStr) + beginStr.Length;
      int pTo = fileData.LastIndexOf(endStr);
      String ScriptLine = fileData.Substring(pFrom, pTo - pFrom);
	ScriptLine = ScriptLine.Replace("\t", "").Replace("\n", "").Replace("\"", "\\\"").Replace("this.", "");
	if(eventName.ToLower() == "windowactivate")
	{      
		ScriptLine = defaultStr + ScriptLine;  	
	}
	return ScriptLine;
   // return "\"" + ScriptLine + "\\\"";
      
	}
  
		]]>
	</msxsl:script>
	<xsl:output method="xml" indent="yes"/>
	<!-- VARIABLES LIST-->
	<xsl:variable name="true">true</xsl:variable>
	<xsl:variable name="processID">Process_0dny2jq</xsl:variable>
	<xsl:variable name="startEventID">StartEvent_1</xsl:variable>
	<xsl:variable name="scriptFormat">http://www.java.com/java</xsl:variable>
	<xsl:variable name="sequenceFlow">sequenceFlow_1</xsl:variable>
	<xsl:variable name="height">80</xsl:variable>
	<xsl:variable name="width">100</xsl:variable>
	<!-- VARIABLES LIST ENDS-->
	<xsl:variable name="RepoPath">
		<xsl:value-of select="Document/Meta/RepositoryPath"/>
	</xsl:variable>
	<xsl:variable name="GpsFile">
		<xsl:value-of select="Document/Meta/ExternalBotFileName"/>
	</xsl:variable>
	<xsl:template match="/">
		<bpmn2:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.omg.org/bpmn20" xmlns:bpmn2="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:bpsim="http://www.bpsim.org/schemas/1.0" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:drools="http://www.jboss.org/drools" id="_2KoecIgOEeyIE5Q2MNmQng" xsi:schemaLocation="http://www.omg.org/spec/BPMN/20100524/MODEL BPMN20.xsd http://www.jboss.org/drools drools.xsd http://www.bpsim.org/schemas/1.0 bpsim.xsd http://www.omg.org/spec/DD/20100524/DC DC.xsd http://www.omg.org/spec/DD/20100524/DI DI.xsd " exporter="jBPM Process Modeler" exporterVersion="2.0" targetNamespace="http://www.omg.org/bpmn20">
			<xsl:element name="bpmn2:process">
				<xsl:attribute name="id">
					<xsl:value-of select="$GpsFile"/>
				</xsl:attribute>
				<xsl:attribute name="drools:packageName">
					<xsl:value-of select="'org.jbpm'"/>
				</xsl:attribute>
				<xsl:attribute name="drools:version">
					<xsl:value-of select="'1.0'"/>
				</xsl:attribute>
				<xsl:attribute name="drools:adHoc">
					<xsl:value-of select="'false'"/>
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:value-of select="Document/Meta/ExternalBotFileName"/>
				</xsl:attribute>
				<xsl:attribute name="isExecutable">
					<xsl:value-of select="'true'"/>
				</xsl:attribute>
				<xsl:attribute name="processType">
					<xsl:value-of select="'Public'"/>
				</xsl:attribute>
				<xsl:element name="bpmn2:startEvent">
          <!--bpmn:startEvent -->
          <xsl:attribute name="id">
            <xsl:value-of select="$startEventID"/>
          </xsl:attribute>
          <xsl:element name="bpmn2:outgoing">
            <!--bpmn:outgoing-->
            <xsl:value-of select="$sequenceFlow"/>
          </xsl:element>
        </xsl:element>
        <xsl:for-each select="Document/Process/Step">
					<xsl:variable name="Stepindex">
						<xsl:value-of select="utils:StepIndex()"/>
					</xsl:variable>
					<xsl:element name="bpmn2:sequenceFlow">
						<!-- bpmn:sequenceFlow-->
						<xsl:attribute name="id">
							<xsl:value-of select="utils:getsequenceFlowId()"/>
						</xsl:attribute>
						<xsl:attribute name="sourceRef">
							<xsl:value-of select="utils:getsourceRefID()"/>
						</xsl:attribute>
						<xsl:attribute name="targetRef">
							<xsl:value-of select="utils:targetRefID()"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="bpmn2:scriptTask">
						<!--bpmn:scriptTask-->
						<xsl:attribute name="id">
							<xsl:value-of select="utils:getscriptTaskID()"/>
						</xsl:attribute>
						<xsl:attribute name="name">
							<xsl:value-of select="Sentence_Plain"/>
						</xsl:attribute>
						<xsl:attribute name="scriptFormat">
							<xsl:value-of select="$scriptFormat"/>
						</xsl:attribute>
						<xsl:element name="bpmn2:scriptTask">
							<xsl:element name="drools:metaData">
								<xsl:attribute name="name">
									<xsl:value-of select="'elementname'"/>
								</xsl:attribute>
								<xsl:element name="drools:metaValue">
									<xsl:value-of select="Sentence_Plain"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
						<xsl:element name="bpmn2:incoming">
							<!--bpmn:incoming-->
							<xsl:value-of select="utils:getbpmnIncoming()"/>
						</xsl:element>
						<xsl:element name="bpmn2:outgoing">
							<!--bpmn:outgoing-->
							<xsl:value-of select="utils:getbpmnoutgoing()"/>
						</xsl:element>
						<xsl:element name="bpmn2:script">
							<!--bpmn:script-->
							<xsl:if test="$Stepindex = 1">		              
                  try
                  {  
                      ProcessBuilder processBuilder1 = new ProcessBuilder();
                      processBuilder1.command("cmd.exe", "/c", "InitiateBot.exe p lic1.epp");          
                      Process process1 = processBuilder1.start();
					  Thread.sleep(3000);
                  }
                  catch(Exception ex1)
                  {
                    System.out.println(ex1);
                  }   
              </xsl:if>			
                try
                {  
                    ProcessBuilder processBuilder2 = new ProcessBuilder();
                    processBuilder2.command("cmd.exe", "/c", "InitiateBot.exe e <xsl:value-of select="utils:getStepScriptFile(PlayBack__ControlInfo_ControlName,PlayBack__GeneralInfo_Event,Step_ID,$RepoPath,$GpsFile)"/>");          
                    Process process2 = processBuilder2.start();
					Thread.sleep(3000);
                }
                catch(Exception ex2)
                {
                  System.out.println(ex2);
                }
				
				<xsl:if test="position() = last()" >
				try
                  {  
                      ProcessBuilder processBuilder3 = new ProcessBuilder();
                      processBuilder3.command("cmd.exe", "/c", "InitiateBot.exe s lic1.epp");          
                      Process process3 = processBuilder3.start();
					  Thread.sleep(3000);
                  }
                  catch(Exception ex1)
                  {
                    System.out.println(ex1);
                  } 
				
				</xsl:if>
      
            
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
		    <xsl:element name="bpmn2:sequenceFlow">
          <!-- bpmn:sequenceFlow-->
          <xsl:attribute name="id">
            <xsl:value-of select="utils:getsequenceFlowId()"/>
          </xsl:attribute>
          <xsl:attribute name="sourceRef">
            <xsl:value-of select="utils:getsourceRefID()"/>
          </xsl:attribute>
          <xsl:attribute name="targetRef">
            <xsl:value-of select="utils:targetRefID()"/>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="bpmn2:endEvent">
          <!--bpmn:endEvent -->
          <xsl:attribute name="id">
            <xsl:value-of select="utils:getsourceRefID()"/>
          </xsl:attribute>
          <xsl:element name="bpmn2:incoming">
            <!--bpmn:incoming-->
            <xsl:value-of select="utils:getFinalsequenceFlowId()"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
			<xsl:element name="bpmndi:BPMNDiagram">
				<!--bpmndi:BPMNDiagram-->
				<xsl:attribute name="id">
					<xsl:value-of select="'BPMNDiagram_1'"/>
				</xsl:attribute>
				<xsl:element name="bpmndi:BPMNPlane">
					<!--bpmndi:BPMNPlane-->
					<xsl:attribute name="id">
						<xsl:value-of select="'BPMNPlane_1'"/>
					</xsl:attribute>
					<xsl:attribute name="bpmnElement">
						<xsl:value-of select="$processID"/>
					</xsl:attribute>
					<!--BPMNEdge Loop Starts-->
					<xsl:for-each select="Document/Process/Step">
						<xsl:element name="bpmndi:BPMNEdge">
							<!--bpmndi:BPMNEdge-->
							<xsl:attribute name="id">
								<xsl:value-of select="utils:getBPMNEdgeID()"/>
							</xsl:attribute>
							<xsl:attribute name="bpmnElement">
								<xsl:value-of select="utils:getbpmnElement()"/>
							</xsl:attribute>
							<xsl:element name="di:waypoint">
								<!--di:waypoint-->
								<xsl:attribute name="xsi:type">
									<xsl:value-of select="'dc:Point'"/>
								</xsl:attribute>
								<xsl:attribute name="x">
									<xsl:value-of select="utils:getBPMNEdgeXcoordinate(100)"/>
								</xsl:attribute>
								<xsl:attribute name="y">
									<xsl:value-of select="'157'"/>
								</xsl:attribute>
							</xsl:element>
							<xsl:element name="di:waypoint">
								<!--di:waypoint-->
								<xsl:attribute name="xsi:type">
									<xsl:value-of select="'dc:Point'"/>
								</xsl:attribute>
								<xsl:attribute name="x">
									<xsl:value-of select="utils:getBPMNEdgeXcoordinate(100)"/>
								</xsl:attribute>
								<xsl:attribute name="y">
									<xsl:value-of select="'157'"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
					<!--BPMNEdge Loop Ends-->
					<xsl:element name="bpmndi:BPMNEdge">
						<!--bpmndi:BPMNEdge-->
						<xsl:attribute name="id">
							<xsl:value-of select="utils:getBPMNEdgeID()"/>
						</xsl:attribute>
						<xsl:attribute name="bpmnElement">
							<xsl:value-of select="utils:getbpmnElement()"/>
						</xsl:attribute>
						<xsl:element name="di:waypoint">
							<!--di:waypoint-->
							<xsl:attribute name="xsi:type">
								<xsl:value-of select="'dc:Point'"/>
							</xsl:attribute>
							<xsl:attribute name="x">
								<xsl:value-of select="utils:getBPMNEdgeXcoordinate(100)"/>
							</xsl:attribute>
							<xsl:attribute name="y">
								<xsl:value-of select="'157'"/>
							</xsl:attribute>
						</xsl:element>
						<xsl:element name="di:waypoint">
							<!--di:waypoint-->
							<xsl:attribute name="xsi:type">
								<xsl:value-of select="'dc:Point'"/>
							</xsl:attribute>
							<xsl:attribute name="x">
								<xsl:value-of select="utils:getBPMNEdgeXcoordinate(100)"/>
							</xsl:attribute>
							<xsl:attribute name="y">
								<xsl:value-of select="'157'"/>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:element name="bpmndi:BPMNShape">
						<!--bpmndi:BPMNShape-->
						<xsl:attribute name="id">
							<xsl:value-of select="utils:getBPMNShapeID()"/>
						</xsl:attribute>
						<xsl:attribute name="bpmnElement">
							<xsl:value-of select="utils:getbpmnShapeElement()"/>
						</xsl:attribute>
						<xsl:element name="dc:Bounds">
							<!--dc:Bounds-->
							<xsl:attribute name="x">
								<xsl:value-of select="utils:getBPMNShapeXcoordinate(000)"/>
							</xsl:attribute>
							<xsl:attribute name="y">
								<xsl:value-of select="'117'"/>
							</xsl:attribute>
							<xsl:attribute name="width">
								<xsl:value-of select="$width"/>
							</xsl:attribute>
							<xsl:attribute name="height">
								<xsl:value-of select="$height"/>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<!--BPMNShape Loop Starts-->
					<xsl:for-each select="Document/Process/Step">
						<xsl:element name="bpmndi:BPMNShape">
							<!--bpmndi:BPMNShape-->
							<xsl:attribute name="id">
								<xsl:value-of select="utils:getBPMNShapeID()"/>
							</xsl:attribute>
							<xsl:attribute name="bpmnElement">
								<xsl:value-of select="utils:getbpmnShapeElement()"/>
							</xsl:attribute>
							<xsl:element name="dc:Bounds">
								<!--dc:Bounds-->
								<xsl:attribute name="x">
									<xsl:value-of select="utils:getBPMNShapeXcoordinate(200)"/>
								</xsl:attribute>
								<xsl:attribute name="y">
									<xsl:value-of select="'117'"/>
								</xsl:attribute>
								<xsl:attribute name="width">
									<xsl:value-of select="$width"/>
								</xsl:attribute>
								<xsl:attribute name="height">
									<xsl:value-of select="$height"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
					<!--BPMNShape Loop Ends-->
					<xsl:element name="bpmndi:BPMNShape">
						<!--bpmndi:BPMNShape-->
						<xsl:attribute name="id">
							<xsl:value-of select="utils:getBPMNShapeID()"/>
						</xsl:attribute>
						<xsl:attribute name="bpmnElement">
							<xsl:value-of select="utils:getbpmnShapeElement()"/>
						</xsl:attribute>
						<xsl:element name="dc:Bounds">
							<!--dc:Bounds-->
							<xsl:attribute name="x">
								<xsl:value-of select="utils:getBPMNShapeXcoordinate(200)"/>
							</xsl:attribute>
							<xsl:attribute name="y">
								<xsl:value-of select="'117'"/>
							</xsl:attribute>
							<xsl:attribute name="width">
								<xsl:value-of select="$width"/>
							</xsl:attribute>
							<xsl:attribute name="height">
								<xsl:value-of select="$height"/>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="bpmn2:relationship">
				<!--bpmn2:relationship-->
				<xsl:attribute name="id">
					<xsl:value-of select="'_2KpskIgOEeyIE5Q2MNmQng'"/>
				</xsl:attribute>
				<xsl:attribute name="type">
					<xsl:value-of select="'BPSimData'"/>
				</xsl:attribute>
				<xsl:element name="bpmn2:extensionElements">
					<xsl:element name="bpsim:BPSimData">
						<xsl:element name="bpsim:Scenario">
							<xsl:attribute name="xsi:type">
								<xsl:value-of select="'bpsim:Scenario'"/>
							</xsl:attribute>
							<xsl:attribute name="id">
								<xsl:value-of select="'default'"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="'Simulationscenario'"/>
							</xsl:attribute>
							<xsl:element name="bpsim:ScenarioParameters">
								<xsl:attribute name="xsi:type">
									<xsl:value-of select="'bpsim:ScenarioParameters'"/>
								</xsl:attribute>
							</xsl:element>
							<xsl:for-each select="Document/Process/Step">
								<xsl:element name="bpsim:ElementParameters">
									<xsl:attribute name="xsi:type">
										<xsl:value-of select="'bpsim:ElementParameters'"/>
									</xsl:attribute>
									<xsl:attribute name="elementRef">
										<xsl:value-of select="'elementRef'"/>
									</xsl:attribute>
									<xsl:attribute name="id">
										<xsl:value-of select="'id'"/>
									</xsl:attribute>
									<bpsim:TimeParameters xsi:type="bpsim:TimeParameters">
										<bpsim:ProcessingTime xsi:type="bpsim:Parameter">
											<bpsim:NormalDistribution mean="0.0" standardDeviation="0.0"/>
										</bpsim:ProcessingTime>
									</bpsim:TimeParameters>
									<bpsim:ResourceParameters xsi:type="bpsim:ResourceParameters">
										<bpsim:Availability xsi:type="bpsim:Parameter">
											<bpsim:FloatingParameter value="0.0"/>
										</bpsim:Availability>
										<bpsim:Quantity xsi:type="bpsim:Parameter">
											<bpsim:FloatingParameter value="0.0"/>
										</bpsim:Quantity>
									</bpsim:ResourceParameters>
									<bpsim:CostParameters xsi:type="bpsim:CostParameters">
										<bpsim:UnitCost xsi:type="bpsim:Parameter">
											<bpsim:FloatingParameter value="0.0"/>
										</bpsim:UnitCost>
									</bpsim:CostParameters>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<bpmn2:source>_2KoecIgOEeyIE5Q2MNmQng</bpmn2:source>
				<bpmn2:target>_2KoecIgOEeyIE5Q2MNmQng</bpmn2:target>
			</xsl:element>
		</bpmn2:definitions>
	</xsl:template>
</xsl:stylesheet>