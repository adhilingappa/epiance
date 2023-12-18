package utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.custommonkey.xmlunit.DetailedDiff;
import org.custommonkey.xmlunit.Diff;
import org.custommonkey.xmlunit.Difference;
import org.custommonkey.xmlunit.XMLUnit;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.Status;
import com.aventstack.extentreports.markuputils.MarkupHelper;

public class XML_Library {

	private static final Logger log = LogManager.getLogger(XML_Library.class);
	static ProjectConfiguration config;
	ReadConfig property;

	public XML_Library() {
		config = new ProjectConfiguration();
		property = new ReadConfig();
	}

	/**
	 * This method will format the capture GPS to required format for comparison
	 * 
	 * @param fileName
	 * @param filePath
	 * @return
	 */
	private String transformGPS(String fileName, String filePath) {
		log.info("transformGPS started");
		property = new ReadConfig();

		if (!config.transformedGPS.exists())
			config.transformedGPS.mkdir();

		String transformedGPSPath = null;
		Source input = null;
		Source xslt = null;
		try {
			input = new StreamSource(new FileInputStream(filePath));
			xslt = new StreamSource(new FileInputStream(Settings.XLS_PATH));
		} catch (FileNotFoundException e) {
			log.error("Transform-GPS File Not found " + e.getMessage());
		}

		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = null;
		try {
			transformer = transformerFactory.newTransformer(xslt);
		} catch (TransformerConfigurationException e) {
			log.error("Transform-GPS TransformerConfigurationException " + e.getMessage());
		}
		transformedGPSPath = config.transformedGPS.getAbsolutePath() + "\\" + fileName + ".xml";
		Result result = null;
		try {
			result = new StreamResult(new FileOutputStream(transformedGPSPath));
		} catch (FileNotFoundException e) {
			log.error("Transform-GPS File Not found " + e.getMessage());
		}
		try {
			transformer.transform(input, result);
		} catch (TransformerException e) {
			log.error("Transform-GPS TransformerException " + e.getMessage());
		}

		log.info("transform-GPS completed");
		return transformedGPSPath;
	}

	/**
	 * This method will format the XML to required format for comparison for upgrade
	 * 
	 * @param fileName
	 * @param filePath
	 * @param xslPath
	 * @param testName
	 * @return
	 * @author Adhilingappa
	 */
	public String transformUpgradeXSL(String fileName, String filePath, String xslPath, String testName) {
		log.info("transform Upgrde GPS started for-" + testName + "-" + xslPath);
		if (filePath == null && xslPath == null) {
			log.error("file path or xsl path is null");
			return null;
		}
		System.err.println(filePath);

		if (!config.transformedGPS.exists())
			config.transformedGPS.mkdir();

		String transformedGPSPath = null;
		Source input = null;
		Source xslt = null;
		try {
			input = new StreamSource(new FileInputStream(filePath));
			xslt = new StreamSource(new FileInputStream(xslPath));
		} catch (FileNotFoundException e) {
			log.error("Transform-GPS File Not found " + e.getMessage());
		}

		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = null;
		try {
			transformer = transformerFactory.newTransformer(xslt);
		} catch (TransformerConfigurationException e) {
			log.error("Transform-GPS TransformerConfigurationException " + e.getMessage());
		}
		transformedGPSPath = config.transformedGPS.getAbsolutePath() + "\\" + fileName + ".xml";
		Result result = null;
		try {
			result = new StreamResult(new FileOutputStream(transformedGPSPath));
		} catch (FileNotFoundException e) {
			log.error("Transform-GPS File Not found " + e.getMessage());
		}
		try {
			transformer.transform(input, result);
		} catch (TransformerException e) {
			log.error("Transform-GPS TransformerException " + e.getMessage());
		}

		log.info("transform Upgrde GPS Completed-" + testName + "-" + xslPath);
		return transformedGPSPath;
	}

	public static boolean actual;

	/**
	 * this method do upgrade check for all offline settings XMLs
	 * 
	 * @param reportLogger
	 * @author Adhilingappa
	 */
	public void OfflineUpgradeCheck(ExtentTest reportLogger) {
		log.info("Offline Upgrade check started...");
		reportLogger.info(config.getPassMarkUp("Offline upgrade check started..."));
		upgradeCheck(BackupXMLPaths.newCapturePreference, XMLPATHS.newCapturePreference, Settings.NewCapturePref_XLS,
				"NewCapturePrefernce.xml", "HomeCaptureSettings");
		upgradeCheck(BackupXMLPaths.newCapturePreference, XMLPATHS.newCapturePreference, Settings.NewCapturePref_XLS,
				"NewCapturePreference.xml", "ProcessEditor");
		upgradeCheck(BackupXMLPaths.autoSecurityKeys, XMLPATHS.autoSecurityKeys, Settings.OfflineUpgrade_XSL,
				"AutoSecurityKeys.xml", "CaptureHomeSettings");
		upgradeCheck(BackupXMLPaths.exclusionFilterPreference, XMLPATHS.ExclusionFilter, Settings.OfflineUpgrade_XSL,
				"ExclusionFilter.xml", "CaptureHomeSettings");
		upgradeCheck(BackupXMLPaths.epiSimDoc, XMLPATHS.epiSimDoc, Settings.epiSim_XLS, "epiSimDoc.xml",
				"DeveloperSettings");
		upgradeCheck(BackupXMLPaths.epiSimDoc, XMLPATHS.epiSimDoc, Settings.epiSim_XLS, "epiSimDoc.xml",
				"FinalizeSettings");
		upgradeCheck(BackupXMLPaths.UserSettings, XMLPATHS.UserSettings, Settings.CaptureUpgradeAll_XSL,
				"UserSettings.xml", "ProcessEditor");
		upgradeCheck(BackupXMLPaths.STTSettings, XMLPATHS.STTSettings, Settings.OfflineUpgrade_XSL, "STTSettings",
				"ProcessEditor");

		log.info("Offline Upgrade check completed...");
		reportLogger.info(config.getPassMarkUp("Offline upgrade check completed"));

	}

	/**
	 * this method will do upgrade check for all capture settings XMLs
	 * 
	 * @param reportLogger
	 * @author Adhilingappa
	 */
	public void captureUpgradeCheck(ExtentTest reportLogger) {
		log.info("Capture Upgrade check started....");
		reportLogger.info(config.getPassMarkUp("Capture upgrade check started..."));
		upgradeCheck(BackupXMLPaths.captureSettings, XMLPATHS.captureSetting, Settings.CaptureSettings_XSL,
				"CaptureSetting.xml", "CaptureSettings");
		upgradeCheck(BackupXMLPaths.DialogRules, XMLPATHS.DialogRules, Settings.CaptureUpgradeAll_XSL,
				"DialogRules.xml", "CaptureSettings");
		upgradeCheck(BackupXMLPaths.AdaptorInfo, XMLPATHS.AdaptorInfo, Settings.CaptureUpgradeAll_XSL,
				"AdaptorInfo.xml", "CaptureSettings");
		upgradeCheck(BackupXMLPaths.ClawAdopter, XMLPATHS.ClawAdopter, Settings.CaptureUpgradeAll_XSL,
				"ClawAdaptor.xml", "CaptureSettings");
		upgradeCheck(BackupXMLPaths.ImageSetting, XMLPATHS.ImageSetting, Settings.CaptureUpgradeAll_XSL,
				"ImageSettings.xml", "CaptureSettings");
		upgradeCheck(BackupXMLPaths.KeyClubbing, XMLPATHS.KeyClubbing, Settings.CaptureUpgradeAll_XSL,
				"KeyClubbing.xml", "CaptureSettings");
		upgradeCheck(BackupXMLPaths.IEAdaptor, XMLPATHS.IEAdaptor, Settings.IEAdopter_XLS, "IEAdaptor.xml",
				"CaptureSettings");

//		upgradeCheck(BackupXMLPaths.EventLogger, XMLPATHS.EventLogger, Settings.exclsuiom, "EventLogger",
//				"CaptureSettings");
		reportLogger.info(config.getPassMarkUp("Capture Upgrade Check completed"));
		log.info("Capture upgrade check completed...");

	}

	/**
	 * this method will do transform the XML and compare the two XML for upgrade
	 * 
	 * @param baseXML
	 * @param curentXML
	 * @param xlsPath
	 * @param xmlName
	 * @param nodeName
	 * @return
	 * @author Adhilingappa
	 */
	public boolean upgradeCheck(String baseXML, String curentXML, String xlsPath, String xmlName, String nodeName) {
		log.info(xmlName + " -upgrade check started...");
		actual = true;
		String baseXMLPath = transformUpgradeXSL("Base" + xmlName, baseXML, xlsPath, "BaseXML");
		String currentXMLPAth = transformUpgradeXSL("Current" + xmlName, curentXML, xlsPath, "CurrentXMl");

		DocumentBuilderFactory docFactory;
		DocumentBuilder docBuilder = null;

		try {
			docFactory = DocumentBuilderFactory.newInstance();
			docBuilder = docFactory.newDocumentBuilder();
		} catch (ParserConfigurationException e) {

			e.printStackTrace();
		}

		Document baseDocument = null;
		Document currentDocument = null;

		try {
			baseDocument = docBuilder.parse(baseXMLPath);
			currentDocument = docBuilder.parse(currentXMLPAth);
		} catch (SAXException | IOException e) {
			e.printStackTrace();
		}

		if (baseDocument == null && currentDocument == null) {
			log.info("Documents are null or missing");
			return false;
		}
		if (baseDocument != null && currentDocument != null) {
			baseDocument.normalizeDocument();
			currentDocument.normalizeDocument();
		}

		upgradeNodesCheck(baseDocument, currentDocument, nodeName, xmlName);
		log.info(xmlName + " -upgrade check completed...");
		return actual;

	}

	public void newCapturePreferenceUpgrade(String baseFilePath, String currentFilePath, ExtentTest reportLogger) {

		log.info("NewCapturePreferences.xml upgrade check started....");

		String BaseXMLPath = transformUpgradeXSL("BaseNewCapturePref", BackupXMLPaths.newCapturePreference,
				Settings.NewCapturePref_XLS, "BaseXML");
		String currentXMLPath = transformUpgradeXSL("CurrentNewCapturePref", XMLPATHS.newCapturePreference,
				Settings.NewCapturePref_XLS, "CurrentXML");

		DocumentBuilder docBuilder = null;
		DocumentBuilderFactory docBuilderFactory;
		try {
			docBuilderFactory = DocumentBuilderFactory.newInstance();
			docBuilder = docBuilderFactory.newDocumentBuilder();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		Document currentDocument = null;
		Document baseDocument = null;
		try {
			currentDocument = docBuilder.parse(currentXMLPath);
			baseDocument = docBuilder.parse(BaseXMLPath);
		} catch (SAXException | IOException e) {
			log.error("error while parsing the document" + e.getMessage());
		}

		if (baseDocument == null) {
			log.error("NewCapturePreferences Base Documents are null or missing...");
			return;
		}
		if (currentDocument == null) {
			log.error("NewCapturePreferences current Document is null or missing....");
			return;
		}

		if (currentDocument != null && baseDocument != null) {
			baseDocument.normalize();
			currentDocument.normalize();
		}

		String testName = baseDocument.getElementsByTagName("NewCapturePreference").item(0).getNodeName();

		upgradeNodesCheck(baseDocument, currentDocument, "CaptureSettings", "HomeCaptureSettings --" + testName);

		upgradeNodesCheck(baseDocument, currentDocument, "ProcessEditor", "ProcessEditorSettings --" + testName);

		log.info("NewCapturePreferences.xml upgrade check completed....");

	}

	/**
	 * this method will compare the two document nodes and log the report.
	 * 
	 * @param baseDoc
	 * @param currentDoc
	 * @param elementName
	 * @param xmlName
	 * @author Adhilingappa
	 */
	private void upgradeNodesCheck(Document baseDoc, Document currentDoc, String elementName, String xmlName) {
		Node baseNode = baseDoc.getElementsByTagName(elementName).item(0);
		Node currentNode = currentDoc.getElementsByTagName(elementName).item(0);

		if (baseNode.getAttributes().getLength() == baseNode.getAttributes().getLength()) {
			NamedNodeMap baseMap = baseNode.getAttributes();
			NamedNodeMap testMap = currentNode.getAttributes();
			for (int i = 0; i < baseMap.getLength(); i++) {
				Node base = baseMap.item(i);
				Node test = testMap.item(i);
				String baseName = base.getNodeName();
				String testName = test.getNodeName();
				ExtentTest reportLogger = ProjectConfiguration.extentReporter.createTest(xmlName + " - " + baseName);
				table = new String[2][4];
				actual = true;
				row = 1;
				table[0][0] = "<b>" + "SI NO";
				table[0][1] = "<b>" + "Property";
				table[0][2] = "<b>" + "Expected";
				table[0][3] = "<b>" + "Actual";

				if (baseName.equals(testName)) {
					String baseValue = base.getNodeValue();
					String testValue = test.getNodeValue();

					if (baseValue.equals(testValue)) {
						table[row][0] = "" + row;
						table[row][1] = "<b>" + baseName;
						table[row][2] = "<b style=\"color:LimeGreen;\">" + baseValue;
						table[row][3] = "<b style=\"color:LimeGreen;\">" + testValue;
					} else {
						table[row][0] = "<b>" + row;
						table[row][1] = "<b>" + baseName;
						table[row][2] = "<b style=\"color:red;\">" + baseValue;
						table[row][3] = "<b style=\"color:red;\">" + testValue;
						actual = false;
					}
				}
				if (actual)
					reportLogger.log(Status.PASS, MarkupHelper.createTable(table));
				else
					reportLogger.log(Status.FAIL, MarkupHelper.createTable(table));

			}
		}

		// getAttributesUpgrade(base, current, xmlName);
	}

	/**
	 * this method will check the new node
	 * 
	 * @param xmlName
	 * @param elementName
	 * @param reportLogger
	 * @return if node present it will return true else false
	 * @author Adhilingappa
	 */
	public boolean newNodeCheck(String xmlName, String elementName, ExtentTest reportLogger) {
		log.info("New node check started...");

		boolean actual = true;

		String xmlPath = XMLPATHS.xmls.get(xmlName);
		if (xmlPath == null) {
			log.error("XML not exist in sheet or incorrect XML name");
			return false;
		}
		xmlPath = parseDocPath(xmlPath);
		String currentXmlPath = xmlPath;
		log.info(currentXmlPath);
		DocumentBuilderFactory builderFactory;
		DocumentBuilder docBuilder = null;
		try {
			builderFactory = DocumentBuilderFactory.newInstance();
			docBuilder = builderFactory.newDocumentBuilder();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}

		Document currentDocument = null;
		try {
			currentDocument = docBuilder.parse(new File(currentXmlPath));
		} catch (SAXException | IOException e) {
			e.printStackTrace();
		}
		currentDocument.normalizeDocument();

		String[][] nodeTable = null;
		reportLogger = ProjectConfiguration.extentReporter.createTest(elementName + " - Node check");
		Node node = currentDocument.getElementsByTagName(elementName).item(0);
		if (node != null && currentDocument.getElementsByTagName(elementName).getLength() <= 1) {

			NamedNodeMap attributes = node.getAttributes();
			if (attributes.getLength() != 0) {
				nodeTable = new String[attributes.getLength() + 1][4];
				nodeTable[0][0] = "<b>" + "Element Name";
				nodeTable[0][1] = "<b>" + "Node Text";
				nodeTable[0][2] = "<b>" + "Attribute Name";
				nodeTable[0][3] = "<b>" + "Attribute Value";
				int index = 1;
				for (int i = 0; i < attributes.getLength(); i++) {
					elementName = node.getNodeName();
					String nodeName = attributes.item(i).getNodeName();
					String nodevalue = attributes.item(i).getNodeValue();

					nodeTable[index][0] = "<b style=\"color:green;\">" + elementName;
					nodeTable[index][2] = "<b style=\"color:green;\">" + nodeName;
					nodeTable[index][3] = "<b style=\"color:green;\">" + nodevalue;

					String nodeText = node.getNodeValue();
					if (nodeText != null)
						nodeTable[index][1] = "<b style=\"color:green;\">" + nodeText;
					else
						nodeTable[index][1] = "---";

					index++;
				}

				reportLogger.log(Status.PASS, MarkupHelper.createTable(nodeTable));
			}

			else {
				log.info("There is no attributes in-" + elementName + " node");
				reportLogger.info(config.getPassMarkUp("No attributes in " + elementName + " node"));
				nodeTable[0][0] = "<b>" + "Node Name";
				nodeTable[0][1] = "<b>" + "Node Text";
				nodeTable[0][2] = "<b>" + "Attribute Name";
				nodeTable[0][3] = "<b>" + "Attribute Value";
				nodeTable[1][0] = elementName;
				nodeTable[1][1] = "<b>" + node.getNodeValue();
				nodeTable[1][2] = "--";
				nodeTable[1][3] = "--";
				reportLogger.log(Status.PASS, MarkupHelper.createTable(nodeTable));
				return actual;

			}
		} else {
			log.error("Node is not exist or node have duplicates");
			reportLogger.log(Status.FAIL, elementName + " - Node is not exist or Node have duplicates");
			return actual = false;
		}

		log.info("new node check comppleted");

		return actual;
	}

	private String parseDocPath(String xmlPath) {
		String[] path = xmlPath.split("_");
		int dash = xmlPath.indexOf('_');
		path[1] = xmlPath.substring(dash + 1);
		if (xmlPath.toUpperCase().startsWith("PROGRAMDATA")) {
			xmlPath = Settings.PROGRAM_DATA_PATH + "\\" + path[1];
			return xmlPath;
		} else if (xmlPath.toUpperCase().startsWith("REPOPATH")) {
			xmlPath = Settings.REPO_PATH + "\\" + path[1];
			return xmlPath;
		}
		return xmlPath;

	}

	/**
	 * delete the file from given path
	 * 
	 * @param docPath
	 * @return
	 */
	public String deleteFile(String docPath) {
		String[] path = docPath.split("_");
		int dash = docPath.indexOf('_');
		path[1] = docPath.substring(dash + 1);

		if (path[0].toUpperCase().startsWith("PROGRAMDATA"))
			docPath = Settings.PROGRAM_DATA_PATH + "\\" + path[1];
		else if (path[0].toUpperCase().startsWith("REPOPATH"))
			docPath = Settings.REPO_PATH + "\\" + path[1];

		System.out.println(docPath);

		File file = new File(docPath);
		while (file.exists()) {
			if (file.delete())
				;
			{
				return docPath;
			}
		}
		Timer.waitTime(2000);
		return docPath;
	}

	/**
	 * This method will check is text is present in given file if Yes return true
	 * 
	 * @param docPath
	 * @param verifyString
	 * @return
	 */
	@SuppressWarnings("resource")
	public boolean isTextInFile(String docPath, String verifyString) {
		String[] path = docPath.split("_");
		int dash = docPath.indexOf('_');
		path[1] = docPath.substring(dash + 1);

		if (path[0].toUpperCase().startsWith("PROGRAMDATA"))
			docPath = Settings.PROGRAM_DATA_PATH + "\\" + path[1];
		else if (path[0].toUpperCase().startsWith("REPOPATH"))
			docPath = Settings.REPO_PATH + "\\" + path[1];

		System.out.println(docPath);
		boolean status = false;
		String str;
		if (docPath.contains("epiSimDoc_Editor")) {
			str = convertDocumentToStringProgram(new File(docPath));
		} else {
			str = convertDocumentToString(new File(docPath));
		}

		try {
			if (str.trim().contains(verifyString.trim()))
				status = true;
		} catch (Exception e) {
		}
		return status;
	}

	/**
	 * This method will check is text is present in given xml file if Yes return
	 * true
	 * 
	 * @param docPath
	 * @param verifyString
	 * @return
	 */
	@SuppressWarnings("resource")
	public boolean isInXML(String docPath, String verifyString) {
		boolean status = false;
		try {
			String str = convertDocumentToString(new File(docPath));

			if (str.trim().contains(verifyString.trim()))
				status = true;
		} catch (Exception e) {
		}
		return status;
	}

	/**
	 * this method will convert doc to string for specific only for UTF16LE xml
	 * file.
	 * 
	 * @author Adhilingappa
	 * @param doc
	 * @return
	 */
	private String convertDocumentToStringProgram(File doc) {

		try {
			InputStreamReader streamReader = new InputStreamReader(new FileInputStream(doc), StandardCharsets.UTF_16LE);
			BufferedReader bufferReader = new BufferedReader(streamReader);
			String line;
			StringBuilder builder = new StringBuilder();
			while ((line = bufferReader.readLine()) != null) {
				builder.append(line.trim());
				builder.append("\n");

			}
			bufferReader.close();
			return builder.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * This method will convert Document to String
	 * 
	 * @param doc
	 * @return
	 */
	private String convertDocumentToString(File doc) {

		try {

			BufferedReader bufferReader = new BufferedReader(new FileReader(doc));
			String line;
			StringBuilder stringBuilder = new StringBuilder();

			while ((line = bufferReader.readLine()) != null) {

				stringBuilder.append(line.trim());
				stringBuilder.append("\n");
			}
			bufferReader.close();
			return stringBuilder.toString();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * This method will check for a attribute value and return true if matches
	 * 
	 * @param docPath
	 * @param tagName
	 * @param attribute
	 * @param expectedValue
	 * @return
	 */
	public boolean getAttribute(String docPath, String tagName, String attribute, String expectedValue) {
		boolean actual = false;
		log.info("getAttribute node exist check started...");
		String[] path = docPath.split("_");
		int dash = docPath.indexOf('_');
		path[1] = docPath.substring(dash + 1);

		if (path[0].toUpperCase().startsWith("PROGRAMDATA"))
			docPath = Settings.PROGRAM_DATA_PATH + "\\" + path[1];
		else if (path[0].toUpperCase().startsWith("REPOPATH"))
			docPath = Settings.REPO_PATH + "\\" + path[1];

		System.out.println(docPath);

		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder;
		String attributeValue = "";
		try {
			docBuilder = docFactory.newDocumentBuilder();
			Document Doc = docBuilder.parse(docPath);
			Doc.normalize();

			NodeList searchNodes = Doc.getElementsByTagName(tagName);

			System.out.println(searchNodes.getLength());

			for (int i = 0; i < searchNodes.getLength(); i++) {
				Element element = (Element) searchNodes.item(i);
				if (attribute.toUpperCase().equals("TEXT"))
					attributeValue = element.getTextContent();
				else
					attributeValue = element.getAttribute(attribute);
				if (attributeValue.equals(expectedValue)) {
					actual = true;
					break;
				}

			}
		} catch (Exception e) {
			log.error("Failed to get a attribute--" + attribute);
		}
		System.err.println(actual);
		log.info("getAttribute node exist check completed");
		return actual;
	}

	static boolean updateScreenVd = true;

	/**
	 * This method will update the changes in xml and save the file
	 * 
	 * @param filePath
	 * @param node
	 * @param attribute
	 * @param value
	 */
	private void update(String filePath, String node, String attribute, String value) {
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder;
		try {
			System.err.println(filePath + "-" + node + "-" + attribute + "-" + value);
			docBuilder = docFactory.newDocumentBuilder();
			Document document = docBuilder.parse(filePath);

			/**
			 * Get the param from xml and set value
			 */
			Node search = document.getElementsByTagName(node).item(0);
			NamedNodeMap attr = search.getAttributes();
			Node nodeAttr = attr.getNamedItem(attribute);
			nodeAttr.setTextContent(value);
			/**
			 * Save file
			 */
			saveXMLContent(document, filePath);

		} catch (ParserConfigurationException | SAXException | IOException e) {
			System.err.println(filePath + "-" + node + "-" + attribute + "-" + value);
			e.printStackTrace();
		}
	}

	/**
	 * This method will update the changes in xml and save the file
	 * 
	 * @param filePath
	 * @param node
	 * @param value
	 */
	private void update(String filePath, String node, String value) {
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder;
		try {
			System.err.println(filePath + "-" + node + "-" + value);

			docBuilder = docFactory.newDocumentBuilder();
			Document document = docBuilder.parse(filePath);

			/**
			 * Get the param from xml and set value
			 */
			Node search = document.getElementsByTagName(node).item(0);
			search.setTextContent(value);

			/**
			 * Save file
			 */
			saveXMLContent(document, filePath);

		} catch (ParserConfigurationException | SAXException | IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * This method will update settings to select capture window mode
	 * 
	 * @param mode
	 */
	public void selectWindow(String mode) {
		mode = mode.toUpperCase();

		if (mode.equals("DESKTOP"))
			mode = "3";
		else if (mode.equals("ACTIVE WINDOW"))
			mode = "0";
		else if (mode.equals("FULL SCREEN"))
			mode = "2";
		else if (mode.equals("DOCUMENT AREA"))
			mode = "5";
		else if (mode.equals("CUSTOM SIZE"))
			mode = "4";

		String newCapturePref = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\Common\\NewCapturePreference.xml";
//		String processSettings = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\Capture\\ProcessSettings.xml";
		update(newCapturePref, "ScreenImage", "Mode", mode);
	}

	/**
	 * This method will update settings to enable screen video
	 */
	private void enableScreenVideo() {
		String newCapturePref = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\Common\\NewCapturePreference.xml";
		update(newCapturePref, "ScreenCapture", "Allow", "1");
		update(newCapturePref, "AudioVideo", "Allow", "0");
	}

	/**
	 * This method will update settings to enable capture audio
	 */
	private void enableCaptureAudio() {
		String newCapturePref = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\Common\\NewCapturePreference.xml";
		update(newCapturePref, "ScreenCapture", "Allow", "0");
		update(newCapturePref, "AudioVideo", "Allow", "1");
		update(newCapturePref, "AudioVideo", "CapturePreference", "1");

	}

	/**
	 * This method will update settings to enable capture audio video
	 */
	private void enableCaptureAudioVideo() {
		String newCapturePref = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\Common\\NewCapturePreference.xml";
		update(newCapturePref, "ScreenCapture", "Allow", "0");
		update(newCapturePref, "AudioVideo", "Allow", "1");
		update(newCapturePref, "AudioVideo", "CapturePreference", "0");

	}

	/**
	 * This method will update setting according to requested i.e SCREEN VIDEO,
	 * CAPTURE AUDIO or AUDIO VIDEO
	 * 
	 * @param setting
	 */
	public void updateCaptureSetting(String setting) {
		switch (setting.toUpperCase()) {
		case "SCREEN VIDEO":
			enableScreenVideo();
			break;
		case "CAPTURE AUDIO":
			enableCaptureAudio();
			break;
		case "AUDIO VIDEO":
			enableCaptureAudioVideo();
			break;

		default:
			break;
		}
	}

	/**
	 * This method will update capture settings as per capture automation need
	 * 
	 * @param updateFlag
	 */
	public void updateSettings(boolean updateFlag) {
		try {
			String captureSettings = Settings.PROGRAM_DATA_PATH
					+ "\\Epiplex500\\Settings\\Capture\\CaptureSettings.xml";
			String newCapturePref = Settings.PROGRAM_DATA_PATH
					+ "\\Epiplex500\\Settings\\Common\\NewCapturePreference.xml";
			String buildSettings = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\OEM\\Settings\\BuildSettings.xml";
			String sttSetting = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\SpeechToText\\STTSettings.xml";
			String tttSetting = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\SpeechToText\\TTTSettings.xml";
			String clawAdopter = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\Capture\\Claw_Adaptor.xml";
//			String processSettings = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\Capture\\ProcessSettings.xml";

			log.info("Automation settings updation started");

			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder;
			docBuilder = docFactory.newDocumentBuilder();
			Document clawAdopterDoc = docBuilder.parse(clawAdopter);
			Document newCapturePrefDoc = docBuilder.parse(newCapturePref);

			if (updateFlag)
				update(captureSettings, "Settings", "GPSEncryption", "false");
			else
				update(captureSettings, "Settings", "GPSEncryption", "true");

			if (updateFlag)
				update(captureSettings, "Settings", "GpsCabEnabled", "false");
			else
				update(captureSettings, "Settings", "GpsCabEnabled", "true");

			if (updateFlag)
				update(captureSettings, "Settings", "ImageEncryptionEnabled", "false");
			else
				update(captureSettings, "Settings", "ImageEncryptionEnabled", "true");

			update(captureSettings, "LowLevelCapture", "Enable", "0");

			update(newCapturePref, "Sentence", "UseCtrlImage", "0");
			update(newCapturePref, "UIACapture", "Enabled", "1");
			update(buildSettings, "Epiplex", "GDPR", "1");
			update(sttSetting, "CredentialsFile", ProjectConfiguration.base_Files.getAbsolutePath() + "\\License.json");
			update(sttSetting, "LicenseKey", "6159d0f608ca4ebc95e2c2890b8b422e");
			update(sttSetting, "Region", "centralindia");

			update(tttSetting, "SubscriptionKey", "b5b54cb063e3451aa0664b82824b1401");
			update(tttSetting, "EndPoint", "https://api.cognitive.microsofttranslator.com/");
			update(tttSetting, "Location", "centralindia");
			update(tttSetting, "LicenseFilePath", ProjectConfiguration.base_Files.getAbsolutePath() + "\\License.json");

			status = isInXML(clawAdopter, "<Info AppName=\"EPIPLEX500ERP.EXE\"");
			if (!status) {
				Node search = clawAdopterDoc.getElementsByTagName("AppBased").item(0);
				Element info = clawAdopterDoc.createElement("Info");
				info.setAttribute("AppName", "EPIPLEX500ERP.EXE");
				info.setAttribute("ClassName", "*");
				info.setAttribute("Logic", "Both");
				info.setAttribute("Sequence", "10|~|1");
				info.setAttribute("Sync", "1");
				info.setAttribute("Sync_Time", "500");
				search.appendChild(info);
			}

			if (updateFlag == false) {
				status = isInXML(newCapturePref, "<Applications>explorer.exe|notepad.exe</Applications>");
				if (status) {
					Element search = (Element) newCapturePrefDoc.getElementsByTagName("Applications").item(0);
					search.setTextContent("explorer.exe");
					search = (Element) newCapturePrefDoc.getElementsByTagName("SelectedApps").item(0);
					search.setTextContent("explorer.exe");
				}
			}

			/**
			 * write it back to the xml
			 */
			saveXMLContent(clawAdopterDoc, clawAdopter);
			saveXMLContent(newCapturePrefDoc, newCapturePref);

		} catch (Exception e) {
			log.error("Exception in updateSettings :- " + e.getMessage());
			e.printStackTrace();
		}
		log.info("Automation settings updation completed");

	}

	/**
	 * this method will update the Audio STT settings
	 * 
	 * @author adhilingappa
	 * @param status
	 */
	public void updateAudioSetting(boolean status) {
		String sttSetting = Settings.PROGRAM_DATA_PATH + "\\Epiplex500\\Settings\\SpeechToText\\STTSettings.xml";
		if (status == true) {
			update(sttSetting, "CredentialsFile", ProjectConfiguration.base_Files.getAbsolutePath() + "\\License.json");
		}
		if (status == false) {
			update(sttSetting, "CredentialsFile", ProjectConfiguration.base_Files.getAbsolutePath());
		}
	}

	/**
	 * This method will save the xml file
	 * 
	 * @param document
	 * @param xmlFile
	 */
	private void saveXMLContent(Document document, String xmlFile) {
		try {
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "no");
			DOMSource domSource = new DOMSource(document);
			StreamResult streamResult = new StreamResult(xmlFile);
			transformer.transform(domSource, streamResult);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	static int row = 1;
	static String[][] table = null;
	static boolean status = false;

	/**
	 * This method will check GPS similarity and log report on that
	 * 
	 * @param doc1
	 * @param doc2
	 * @param reportLogger
	 */
	@SuppressWarnings("null")
	private void check(Document doc1, Document doc2, ExtentTest reportLogger) {
		NodeList doc1Nodes = doc1.getElementsByTagName("Step");
		NodeList doc2Nodes = doc2.getElementsByTagName("Step");

		if (doc1Nodes.getLength() == doc2Nodes.getLength()) {
			for (int i = 0; i < doc1Nodes.getLength(); i++) {
				Node node = doc1Nodes.item(i);
				String value = node.getAttributes().getNamedItem("StepSentence").getNodeValue();
				reportLogger = ProjectConfiguration.extentReporter.createTest(value);

				NodeList doc1Gen = doc1.getElementsByTagName("GeneralDetails");
				NodeList doc2Gen = doc2.getElementsByTagName("GeneralDetails");

				NodeList doc1Con = doc1.getElementsByTagName("ControlDetails");
				NodeList doc2Con = doc2.getElementsByTagName("ControlDetails");

				NodeList doc1Aut = doc1.getElementsByTagName("AutomationDetails");
				NodeList doc2Aut = doc2.getElementsByTagName("AutomationDetails");

				int tableLength = doc1Gen.item(0).getAttributes().getLength()
						+ doc1Con.item(0).getAttributes().getLength() + doc1Aut.item(0).getAttributes().getLength() + 1;
				table = new String[tableLength][4];
				row = 1;
				table[0][0] = "<b>" + "SI NO";
				table[0][1] = "<b>" + "Property";
				table[0][2] = "<b>" + "Expected";
				table[0][3] = "<b>" + "Actual";
				// table[0][3] = "<b>" + "Status";
				status = true;

				getAttributes(doc1Gen.item(i), doc2Gen.item(i));
				getAttributes(doc1Con.item(i), doc2Con.item(i));
				getAttributes(doc1Aut.item(i), doc2Aut.item(i));
				if (status)
					reportLogger.log(Status.PASS, MarkupHelper.createTable(table));
				else
					reportLogger.log(Status.FAIL, MarkupHelper.createTable(table));

			}

		}
	}

	/**
	 * This method will comapre base node and test node and og report
	 * 
	 * @param baseNode
	 * @param testNode
	 * @return
	 */
	private boolean getAttributes(Node baseNode, Node testNode) {
		if (baseNode.getAttributes().getLength() == testNode.getAttributes().getLength()) {
			NamedNodeMap baseMap = baseNode.getAttributes();
			NamedNodeMap testMap = testNode.getAttributes();
			for (int i = 0; i < baseMap.getLength(); i++) {
				Node base = baseMap.item(i);
				Node test = testMap.item(i);
				String baseName = base.getNodeName();
				String testName = test.getNodeName();
				if (baseName.equals(testName)) {
					String baseValue = base.getNodeValue();
					String testValue = test.getNodeValue();

					if (baseValue.equals(testValue)) {
						table[row][0] = "" + row;
						table[row][1] = "<b>" + baseName;
						table[row][2] = "<b style=\"color:LimeGreen;\">" + baseValue;
						table[row][3] = "<b style=\"color:LimeGreen;\">" + testValue;
					} else {
						table[row][0] = "<b>" + row;
						table[row][1] = "<b>" + baseName;
						table[row][2] = "<b style=\"color:red;\">" + baseValue;
						table[row][3] = "<b style=\"color:red;\">" + testValue;
						status = false;
					}
				}
				row++;
			}
		}
		return status;
	}

	/**
	 * This method will compare base GPS file with Test GPS and log report
	 * accordingly
	 * 
	 * @param baseFileName
	 * @param currentFileName
	 * @param reportLogger
	 */
	@SuppressWarnings("unchecked")
	public void compareGPSFiles(String baseFileName, String currentFileName, ExtentTest reportLogger) {
		String baseFilePath = ProjectConfiguration.base_Files.getAbsolutePath() + "\\GPS Files\\" + baseFileName
				+ ".gps";
		String currentFilePath = Settings.REPO_PATH + "\\Capture\\" + currentFileName + ".gps";
		String baseXML = transformGPS(baseFileName, baseFilePath);
		String currentXML = transformGPS(currentFileName, currentFilePath);
		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
		builderFactory.setNamespaceAware(true);
		builderFactory.setCoalescing(true);
		builderFactory.setIgnoringElementContentWhitespace(true);
		builderFactory.setIgnoringComments(true);
		XMLUnit.setIgnoreAttributeOrder(true);
		XMLUnit.setIgnoreComments(true);
		XMLUnit.setIgnoreWhitespace(true);

		Document baseDocument = null;
		Document currentDocument = null;
		DocumentBuilder builder = null;

		try {
			builder = builderFactory.newDocumentBuilder();
		} catch (ParserConfigurationException e1) {
			log.error("Exception in compareGPSFiles" + e1.getMessage());
		}

		try {
			baseDocument = builder.parse(baseXML);
			currentDocument = builder.parse(currentXML);
		} catch (SAXException | IOException e) {
			System.out.println("Exception in compareGPSFiles Parsing error" + e.getMessage());
		}
		if (baseDocument == null) {
			log.error(baseFileName + " is null");
			reportLogger.fail(config.getFailMarkUp(baseFileName + " is Missing or Encrypted"));
			return;
		}
		if (currentDocument == null) {
			log.error(currentFilePath + " is null");
			reportLogger.fail(config.getFailMarkUp(currentFilePath + " is Missing or Encrypted"));
			return;
		}
		if (baseDocument != null & currentDocument != null) {
			baseDocument.normalizeDocument();
			currentDocument.normalizeDocument();

			int baseDocumentLength = baseDocument.getElementsByTagName("Step").getLength();
			int currentDocumentLength = currentDocument.getElementsByTagName("Step").getLength();
			if (baseDocumentLength != currentDocumentLength)
				reportLogger.fail(
						config.getFailMarkUp(baseFileName + " and " + currentFileName + " Step count not matching"));
			else {
				Diff diff = new Diff(baseDocument, currentDocument);
				DetailedDiff detailedDiff = new DetailedDiff(diff);
				List<Difference> differences = detailedDiff.getAllDifferences();
				int diffSize = differences.size();
				if (diffSize == 0) {
					reportLogger.pass(config
							.getPassMarkUp(baseFileName + " and " + currentFileName + " Both files are matching."));
					check(baseDocument, currentDocument, reportLogger);
				} else {
					String[][] diffLogTable = logDifference(differences);
					reportLogger.log(Status.FAIL, MarkupHelper.createTable(diffLogTable));
					check(baseDocument, currentDocument, reportLogger);
				}
			}
		}
	}

	/**
	 * This method will log difference in GPS
	 * 
	 * @param differences
	 * @return
	 */
	private String[][] logDifference(List<Difference> differences) {
		int row = 1;
		String[][] table = null;
		{
			table = new String[differences.size() + 1][4];
			for (Difference difference : differences) {
				Node baseNode = difference.getControlNodeDetail().getNode();
				Node testNode = difference.getTestNodeDetail().getNode();
				if (baseNode.getNodeName().equals(testNode.getNodeName())) {
					String baseNodeName = baseNode.getNodeName();
					String baseNodeValue = baseNode.getNodeValue();
					String testNodeValue = testNode.getNodeValue();
					if (!baseNodeValue.equals(testNodeValue)) {
						table[0][0] = "<b style=\"font-size:1vw\">" + "SI No";
						table[0][1] = "<b>" + "Property";
						table[0][2] = "<b>" + "Expected Value";
						table[0][3] = "<b>" + "Actual Value";

						table[row][0] = "<b>" + row;
						table[row][1] = "<b style=\"color:red;\">" + baseNodeName;
						table[row][2] = "<b style=\"color:red;\">" + baseNodeValue;
						table[row][3] = "<b style=\"color:red;\">" + testNodeValue;
						row++;
					}
				}
			}
		}
		return table;
	}
}
