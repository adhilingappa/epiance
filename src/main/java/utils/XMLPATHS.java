package utils;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.custommonkey.xmlunit.DetailedDiff;
import org.custommonkey.xmlunit.Diff;
import org.custommonkey.xmlunit.Difference;
import org.custommonkey.xmlunit.XMLUnit;
import org.xml.sax.SAXException;

/**
 * this class contains all XML paths variable and method to load XML path for
 * offline module and capture module
 * 
 * @author Adhilingappa
 *
 */
public class XMLPATHS {

	public static String epiSimDoc;
	public static String newCapturePreference;
	public static String captureSetting;
	public static String autoSecurityKeys;
	public static String IEAdaptor;
	public static String KeyClubbing;
	public static String ImageSetting;
	public static String DialogRules;
	public static String ClawAdopter;
	public static String AdaptorInfo;
	public static String ExclusionFilter;
	public static String EventLogger;
	public static String UserSettings;
	public static String STTSettings;

	public static List<String> offlineUpgradePaths;
	public static List<String> captureUpgradePaths;
	public static HashMap<String, String> xmls = new HashMap<String, String>();

	private static List<String> loadOfflineUpgradePaths() {
		offlineUpgradePaths.add(newCapturePreference);
		offlineUpgradePaths.add(autoSecurityKeys);
		offlineUpgradePaths.add(epiSimDoc);
		return offlineUpgradePaths;
	}

	public static List<String> loadCaptureUpgradePaths() {
		captureUpgradePaths.add(captureSetting);
		return captureUpgradePaths;

	}

//
//	static {
//		path(newCapturePreference);
//		path(autoSecurityKeys);
//		path(epiSimDoc);
//	}

	public static void main(String[] args) {
		// Replace these file paths with the actual paths of your XML files
		File file1 = new File("D:\\Upgrade_Backups\\Settings_11.2.279\\Common\\NewCapturePreference.xml");
		File file2 = new File("C:\\ProgramData\\Epiplex500\\Settings\\Common\\NewCapturePreference.xml");

		try {
			// Parse XML files into Documents
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
			org.w3c.dom.Document doc1 = documentBuilder.parse(file1);
			org.w3c.dom.Document doc2 = documentBuilder.parse(file2);

			// Set up XMLUnit to ignore whitespace
			XMLUnit.setIgnoreWhitespace(true);

			// Compare XML documents
			Diff diff = new Diff(doc1, doc2);

			// Use DetailedDiff to get a list of detailed differences
			DetailedDiff detailedDiff = new DetailedDiff(diff);
			List<Difference> differences = detailedDiff.getAllDifferences();

			// Capture differences in a table format
			String[][] differencesTable = new String[differences.size()][2];
			int row = 0;

			for (Difference difference : differences) {
				System.out.println(difference.getTestNodeDetail().getNode().getTextContent());
				// Log the difference in the table array
//	                differencesTable[row][0] = difference.getTestNodeDetail().getNode().getNodeName();
//	                differencesTable[row][1] = difference.getTestNodeDetail().getNode().getTextContent();
				// differencesTable[row][1] =
				// difference.getTestNodeDetail().getNode().getAttributes().getNamedItem("name").getNodeName();

				// differencesTable[row][2] = difference.getTestNodeDetail().getValue();
				// differencesTable[row][3] = detailedDiff.toString();

				row++;
			}

			// Print the resulting table
			System.out.println("Differences in Table Format:");
			for (String[] rowData : differencesTable) {
				for (String cell : rowData) {
					System.out.print(cell + "\t");
				}
				System.out.println();
			}

		} catch (ParserConfigurationException | SAXException | IOException e) {
			e.printStackTrace();
		}
	}
}