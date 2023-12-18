package actions;

import java.io.File;
import java.io.IOException;

import org.sikuli.script.FindFailed;

import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.MediaEntityBuilder;

import core.Application;
import core.Driver;
import core.EventFailException;
import core.SikuliElement;
import epiplex.Capture;
import epiplex.PerformanceUtils;
import epiplex.RemoteClient;
import mmarquee.automation.AutomationException;
import mmarquee.automation.Element;
import utils.ExecutionUtils;
import utils.ProjectConfiguration;
import utils.Settings;
import utils.TakeScreenshot;
import utils.Timer;
import utils.XML_Library;

/**
 * This class consists of all action methods which will be used to automate from
 * excel
 * 
 * @author Dhanush
 *
 */
public class ActionMethods {

	public static ExtentTest reportLogger;
	private Driver driver;
	private ElementFinder elementFinder;
	private ProjectConfiguration config;
	private XML_Library xmlLib;
	public static boolean eventStatus = true;

	public ActionMethods(Driver driver) {
		this.driver = driver;
		elementFinder = new ElementFinder(driver);
		config = new ProjectConfiguration();
		xmlLib = new XML_Library();
	}

	private static String testcaseName;

	/**
	 * StartTest will create a test in report with given name
	 * 
	 * @return
	 */
	public ExtentTest startTest(String testcaseName) {
		try {
			reportLogger = ProjectConfiguration.extentReporter.createTest(testcaseName);
			ActionMethods.testcaseName = testcaseName;
			reportLogger.info(config.getPassMarkUp("startTest - " + testcaseName + " started successfully"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("startTest - " + testcaseName + " failed to start"));
		}
		return reportLogger;
	}

	/**
	 * this method will do upgrade check for newCapturePreference.XML file
	 * 
	 * @param baseFilePath
	 * @param currentFilePath
	 * @author Adhilingappa
	 */
	public void newCapturePreferenceUpgrade(String baseFilePath, String currentFilePath) {
		try {
			reportLogger.info(config.getPassMarkUp("newCapturePreferenceUpgrade PASSED"));
			xmlLib.newCapturePreferenceUpgrade(baseFilePath, currentFilePath, reportLogger);
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("newCapturePreferenceUpgrade FAILED"));
		}
	}

	/**
	 * this method will do complete upgrade check for offline settings
	 * 
	 * @author Adhilingappa
	 */
	public void offlineUpgradeCheck() {
		try {
			xmlLib.OfflineUpgradeCheck(reportLogger);
			reportLogger.info(config.getPassMarkUp("offlineUpgradeCheck Completed"));

		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("offlineUpgradeCheck FAILED"));
		}
	}

	/**
	 * this method will do complete upgrade check for capture settings
	 * 
	 * @author Adhilingappa
	 */
	public void captureUpgradeCheck() {
		try {
			xmlLib.captureUpgradeCheck(reportLogger);
			reportLogger.info(config.getPassMarkUp("captureUpgradeCheck Completed"));

		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("captureUpgradeCheck FAILED"));
		}
	}

	/**
	 * this method will load backup settings paths
	 * 
	 * @param mediaVersion
	 * @author Adhilingappa
	 */
	public void loadBackupXMLPaths(String mediaVersion) {

		try {
			ExecutionUtils.loadBackupXMLPaths(mediaVersion);
			reportLogger.info(config.getPassMarkUp("Load  Backup XML Paths Completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Load Backup XML Paths FAILED"));
		}
	}

	/**
	 * this method load the all XML paths from XMLPATHS sheet
	 * 
	 * @author Adhilingappa
	 */
	public void loadXMLPaths() {
		try {
			ExecutionUtils.loadXmlPaths();
			reportLogger.info(config.getPassMarkUp("Load XML Paths Completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Load XML Paths FAILED"));
		}
	}

	/**
	 * this method will check the new node and log the report
	 * 
	 * @param xmlName
	 * @param elementName
	 * @author Adhilingappa
	 */
	public void newNodeCheck(String xmlName, String elementName) {
		try {
			xmlLib.newNodeCheck(xmlName, elementName, reportLogger);
			reportLogger.info(config.getPassMarkUp("new node check for -" + elementName + " Completed"));

		} catch (Exception e) {
			reportLogger.info(config.getPassMarkUp("new node check for -" + elementName + " Failed"));
		}

	}

	/**
	 * this method will check the node is exist or not in the passed xml and also we
	 * should pass element name, attribute name and value
	 * 
	 * @param documentPath
	 * @param tagName
	 * @param attribute
	 * @param value
	 */
	public void NodeExist(String documentPath, String tagName, String attribute, String value) {
		try {
			reportLogger = ProjectConfiguration.extentReporter
					.createTest(tagName + " | " + attribute + "  =  " + value + "   Node Check");
			boolean actualStatus = xmlLib.getAttribute(documentPath, tagName, attribute, value);
			logResult(actualStatus);
			reportLogger.info(config.getPassMarkUp(" assertNodeExist completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(" assertNodeExist got failed"));
		}
	}

	public void renameFile() {
		try {
			config.renameFile();
			reportLogger.info(config.getPassMarkUp("Automation Report renamed Successfully"));

		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Automation Report renamed Failed"));

		}
	}

	/**
	 * Close Report Logger will create a test in report with given name
	 */
	public void closeReportLogger() {
		try {
			config.reportFlush();
			reportLogger.info(config.getPassMarkUp("ReportLogger closed successfully"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("ReportLogger close failed"));
		}
	}

	/**
	 * logResult will log result to report
	 */
	protected void logResult(boolean testStatus) {
		if (testStatus)
			reportLogger.pass(config.getPassMarkUp(testcaseName.toUpperCase() + " PASSED"));
		else {
			try {
				reportLogger.info("Screen shot:- ", MediaEntityBuilder
						.createScreenCaptureFromPath(TakeScreenshot.captureScreenShot(testcaseName)).build());
			} catch (IOException e) {
			}
			reportLogger.fail(config.getFailMarkUp(testcaseName.toUpperCase() + " FAILED"));
		}
	}

	/**
	 * This method will delete file from repository given path
	 * 
	 * @param fileName
	 * @param filePath
	 */
	public void deleteFile(String fileName, String filePath) {
		try {
			File file = new File(utils.Settings.REPO_PATH + "\\" + filePath.trim() + "\\" + fileName.trim());
			while (file.exists())
				if (file.delete())
					reportLogger.info(config.getPassMarkUp(
							utils.Settings.REPO_PATH + "\\" + filePath + "\\" + fileName + " Deleted completed."));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(
					utils.Settings.REPO_PATH + "\\" + filePath + "\\" + fileName + " Deleted got failed"));
		}
	}

	/**
	 * This method will delete document from given path
	 * 
	 * @param fileName
	 * @param filePath
	 */
	public void deleteFile(String docPath) {
		try {
			docPath = xmlLib.deleteFile(docPath);
			reportLogger.info(config.getPassMarkUp(docPath + " Deleted completed."));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(docPath + " Deleted got failed"));
		}
	}

	/**
	 * this method will paste the path as mentioned when we required.
	 * 
	 * @param Docpath
	 * @author Adhilingappa
	 */
	public void pastePath(String Docpath) {
		try {
			String[] path = Docpath.split("_");
			int index = Docpath.indexOf('_');
			path[1] = Docpath.substring(index + 1);
			String pastePath = null;
			if (path[0].toUpperCase().equals("PROGRAMDATA"))
				pastePath = utils.Settings.PROGRAM_DATA_PATH + "\\" + path[1];
			else if (path[0].toUpperCase().equals("REPOPATH"))
				pastePath = utils.Settings.REPO_PATH + "\\" + path[1];
			Keyboard.paste(pastePath);
			reportLogger.info(config.getPassMarkUp(" path paste is completed"));

		} catch (Exception e) {
			reportLogger.info(config.getPassMarkUp(" path paste is failed"));

		}

	}

	/**
	 * This method will check XML file in repository or program data for given
	 * string return true if exists
	 * 
	 * @param documentPath - REPOPATH OR PROGRAMDATA
	 * @param expected
	 */
	public void assertXMLExist(String documentPath, String expected) {
		try {
			boolean actualStatus = xmlLib.isTextInFile(documentPath, expected);
			logResult(actualStatus);
			reportLogger.info(config.getPassMarkUp(" assertXMLExist completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(" assertXMLExist got failed"));
		}
	}

	/**
	 * This method will check XML file in repository or program data for given
	 * string return true if not exists
	 * 
	 * @param documentPath - REPOPATH OR PROGRAMDATA
	 * @param expected
	 */
	public void assertXMLNotExist(String documentPath, String expected) {
		try {
			boolean actualStatus = !xmlLib.isTextInFile(documentPath, expected);
			logResult(actualStatus);
			reportLogger.info(config.getPassMarkUp(" assertXMLNotExist completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(" assertXMLNotExist got failed"));
		}
	}

	/**
	 * This method will check file exists in given path from repository
	 * 
	 * @param fileName
	 * @param filePath
	 */
	public void assertFileExists(String fileName, String filePath) {
		try {

			File file = new File(utils.Settings.REPO_PATH + "\\\\" + filePath + "\\\\" + fileName);
			boolean status = file.exists();
			logResult(status);
			reportLogger.info(config.getPassMarkUp(
					utils.Settings.REPO_PATH + "\\" + filePath + "\\" + fileName + " assertFileExists completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(
					utils.Settings.REPO_PATH + "\\" + filePath + "\\" + fileName + " assertFileExists got failed"));
		}
	}

	/**
	 * This method will check with name attribute
	 * 
	 * @param controlType
	 * @param IDValue
	 * @param expected
	 */
	public void assertName(String controlType, String IDValue, String expected) {
		try {
			String actual = null;
			try {
				actual = elementFinder.getUIElement("id", controlType, IDValue, 3).getName();
			} catch (AutomationException e) {
			}
			logResult(actual.equals(expected));
			reportLogger.info(config.getPassMarkUp(controlType + " - " + IDValue + " assertName completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(controlType + " - " + IDValue + " assertName got failed"));
		}
	}

	/**
	 * This method will check is element exists or not and log report pass or fail
	 * accordingly
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void assertExist(String locatorType, String parameter1, String parameter2) {
		try {
			boolean actualStatus = elementFinder.waitToDisplay(locatorType, parameter1, parameter2, 5);
			logResult(actualStatus);
			reportLogger.info(config
					.getPassMarkUp(locatorType + " - " + parameter1 + " - " + parameter2 + " assertExist completed."));
		} catch (Exception e) {
			reportLogger.fail(config
					.getPassMarkUp(locatorType + " - " + parameter1 + " - " + parameter2 + " assertExist got failed"));
		}
	}

	/**
	 * This method will check is element not-exists or not and log report pass or
	 * fail accordingly
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void assertNotExist(String locatorType, String parameter1, String parameter2) {
		try {
			boolean actualStatus = elementFinder.waitToVanish(locatorType, parameter1, parameter2, 5);
			logResult(actualStatus);
			reportLogger.info(config.getPassMarkUp(
					locatorType + " - " + parameter1 + " - " + parameter2 + " assertNotExist completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(
					locatorType + " - " + parameter1 + " - " + parameter2 + " assertNotExist got failed"));
		}
	}

	/**
	 * This method will check whether the given element is enabled or not and log
	 * report pass or fail accordingly
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void assertEnabled(String locatorType, String parameter1, String parameter2) {
		try {
			boolean actualStatus = elementFinder.waitToEnable(locatorType, parameter1, parameter2, 3);
			logResult(actualStatus);
			reportLogger.info(config
					.getPassMarkUp(locatorType + " - " + parameter1 + " - " + parameter2 + " assertExist completed."));
		} catch (Exception e) {
			reportLogger.fail(config
					.getPassMarkUp(locatorType + " - " + parameter1 + " - " + parameter2 + " assertExist got failed"));
		}
	}

	/**
	 * This method will check whether the given element is disabled or not and log
	 * report pass or fail
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void assertNotEnabled(String locatorType, String parameter1, String parameter2) {
		try {
			boolean actualStatus = !elementFinder.waitToEnable(locatorType, parameter1, parameter2, 3);
			logResult(actualStatus);
			reportLogger.info(config.getPassMarkUp(
					locatorType + " - " + parameter1 + " - " + parameter2 + " assertNotExist completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(
					locatorType + " - " + parameter1 + " - " + parameter2 + " assertNotExist got failed"));
		}
	}

	/**
	 * This method will compare the given GPS file from repository and comapre with
	 * base file present in base files folder
	 * 
	 * @param baseFileName
	 * @param currentFileName
	 */
	public void compareGPS(String baseFileName, String currentFileName) {
		try {
			xmlLib.compareGPSFiles(baseFileName, currentFileName, reportLogger);
			reportLogger.info(config.getPassMarkUp(baseFileName + " - " + currentFileName + " compareGPS completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(baseFileName + " - " + currentFileName + " compareGPS got failed"));
		}
	}

	/**
	 * This method will clear the text field
	 */
	public void clear() {
		try {
			Keyboard.clear();
			reportLogger.info(config.getPassMarkUp(" clear successful."));
			eventStatus = true;
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(" clear failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will do keyboard press simulation it will type the given text
	 * 
	 * @param text
	 */
	public void keyboardType(String text) {
		try {
			Keyboard.type(text);
			reportLogger.info(config.getPassMarkUp("keyboardType " + text + " successful."));
			eventStatus = true;
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("keyboardType " + text + " failed."));
			eventStatus = false;
		}
	}

	/**
	 * This will paste the given text
	 * 
	 * @param text
	 */
	public void paste(String text) {
		try {
			Keyboard.paste(text);
			reportLogger.info(config.getPassMarkUp("paste " + text + " successful."));
			eventStatus = true;
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("paste " + text + " failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will press special characters like Control or Shift or Alt
	 * 
	 * @param Key
	 */
	public void shortcut(String Key) {
		try {
			Keyboard.specialKeyPress(Key);
			reportLogger.info(config.getPassMarkUp("shortcut " + Key + " press successful."));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("shortcut " + Key + " press failed."));
		}
	}

	/**
	 * This will press the special character with other key like Control + a or
	 * Control + c
	 * 
	 * @param Key_1
	 * @param Key_2
	 */
	public void shortcut(String Key_1, String Key_2) {
		try {
			Keyboard.specialKeyPress(Key_1, Key_2);
			reportLogger.info(config.getPassMarkUp("shortcut " + Key_1 + " - " + Key_2 + " press successful."));
		} catch (Exception e) {
			reportLogger.info(config.getPassMarkUp("shortcut " + Key_1 + " - " + Key_2 + " press failed."));
		}
	}

	/**
	 * This will press the special character with other two keys like Control +
	 * Shift + a
	 * 
	 * @param Key_1
	 * @param Key_2
	 * @param Key_3
	 */
	public void shortcut(String Key_1, String Key_2, String Key_3) {
		try {
			Keyboard.specialKeyPress(Key_1, Key_2, Key_3);
			reportLogger.info(
					config.getPassMarkUp("shortcut " + Key_1 + " - " + Key_2 + " - " + Key_3 + " press successful."));
		} catch (Exception e) {
			reportLogger
					.info(config.getFailMarkUp("shortcut " + Key_1 + " - " + Key_2 + " - " + Key_3 + " press failed."));
		}
	}

	/**
	 * This method will do scroll down operation based on number of steps given
	 * 
	 * @param steps
	 */
	public void scrollDown(String steps) {
		try {
			Mouse.scrollDown(steps);
			reportLogger.info(config.getPassMarkUp("scrollDown " + steps + " successful."));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("scrollDown " + steps + " failed."));
		}
	}

	/**
	 * This method will do scroll up operation based on number of steps given
	 * 
	 * @param steps
	 */
	public void scrollUp(String steps) {
		try {
			Mouse.scrollUp(steps);
			reportLogger.info(config.getPassMarkUp("scrollUp " + steps + " successful."));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("scrollUp " + steps + " failed."));
		}
	}

	/**
	 * This method will launch the application by given path
	 * 
	 * @param applicationPath
	 */
	public void launchApplication(String applicationPath) {
		try {
			Application.launchApplication(applicationPath);
			reportLogger.info(config.getPassMarkUp(applicationPath + " Launched successfully."));
			eventStatus = true;
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(applicationPath + " Launch failed."));
			eventStatus = false;
//			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will close the running application by given path
	 * 
	 * @param applicationPath
	 */
	public void closeApplication(String applicationPath) {
		try {
			Application.closeApplication(applicationPath);
			reportLogger.info(config.getPassMarkUp(applicationPath + " Closed successfully."));
			eventStatus = true;
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(applicationPath + " Close failed."));
			eventStatus = false;
//			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will maximize window
	 * 
	 * @param windowTitle
	 * @throws AutomationException
	 */
	public void maximizeWindow(String windowTitle) {
		try {
			elementFinder.maximizeWindow(windowTitle, Settings.FIND_WAIT);
			reportLogger.info(config.getPassMarkUp(windowTitle + " maximized successfully."));
			eventStatus = true;
		} catch (Exception e) {
			reportLogger.info(config.getPassMarkUp(windowTitle + " maximize failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will close the given window
	 * 
	 * @param windowTitle
	 * @throws AutomationException
	 */
	public void closeWindow(String windowTitle) {
		try {
			elementFinder.closeWindow(windowTitle, Settings.FIND_WAIT);
			reportLogger.info(config.getPassMarkUp(windowTitle + " window closed successfully."));
			eventStatus = true;
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(windowTitle + " window close failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will enable or disable search from root. If true it will search
	 * full system if false it will search in given window
	 * 
	 * @param value - it will be TRUE OR FALSE
	 */
	public void setRootSearch(String value) {
		try {
			driver.setRootSearch(Boolean.parseBoolean(value));
			reportLogger.info(config.getPassMarkUp("setRootSearch set to " + value + " successfully"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("setRootSearch set to " + value + " failed"));
		}
	}

	/**
	 * This method will focus on given window
	 * 
	 * @param windowTitle
	 */
	public void focusWindow(String windowTitle) {
		try {
			Element element = elementFinder.getWindow(windowTitle, Settings.FIND_WAIT);
			if (element == null) {
				waitToDisplay("NAME", "WINDOW", windowTitle, "5");
				element = elementFinder.getWindow(windowTitle, Settings.FIND_WAIT);
			}
			Driver.searchContext = element;
			Driver.searchContext.setFocus();
			reportLogger.info(config.getPassMarkUp("focusWindow " + windowTitle + " successfully"));
			eventStatus = true;
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("focusWindow " + windowTitle + " failed"));
			eventStatus = false;
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will focus on given pane
	 * 
	 * @param paneTitle
	 */
	public void focusPane(String paneTitle) {
		try {
			Element element = elementFinder.getPane(paneTitle, Settings.FIND_WAIT);
			Driver.searchContext = element;
			element.setFocus();
			reportLogger.info(config.getPassMarkUp("focusPane " + paneTitle + " successfully"));
			eventStatus = true;
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("focusPane " + paneTitle + " failed"));
			eventStatus = false;
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will open the given URL in new tab
	 * 
	 * @param url
	 */
	public void openURL(String url) {
		try {
			shortcut("CONTROL", "T");
			SikuliElement.screen.paste(url);
			shortcut("ENTER");
			eventStatus = true;
			reportLogger.info(config.getPassMarkUp("openURL " + url + " successful"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("openURL " + url + " failed"));
			eventStatus = false;
		}

	}

	/**
	 * This method will hold the execution for given time period
	 * 
	 * @param milliSeconds
	 */
	public void waitTime(String milliSeconds) {
		try {
			int time = Integer.parseInt(milliSeconds);
			Timer.waitTime(time);
			reportLogger.info(config.getPassMarkUp("waitTime " + milliSeconds + " successfully"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("waitTime " + milliSeconds + " failed"));
		}
	}

	/**
	 * This method will wait up to max duration time to display given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void waitToDisplay(String locatorType, String parameter1, String parameter2) {
		boolean displayStatus = elementFinder.waitToDisplay(locatorType, parameter1, parameter2, Settings.MAX_WAIT);
		if (displayStatus)
			reportLogger.info(config.getPassMarkUp(parameter2 + " successfully displayed."));
		else {
			reportLogger.info(config.getFailMarkUp(parameter2 + " failed to display."));
			throw new RuntimeException(parameter2 + " failed to display.");
		}
	}

	/**
	 * This method will wait up to given duration time to display given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 * @param duration    in seconds
	 */
	public void waitToDisplay(String locatorType, String parameter1, String parameter2, String duration) {
		boolean displayStatus = elementFinder.waitToDisplay(locatorType, parameter1, parameter2,
				Long.parseLong(duration));
		if (displayStatus)
			reportLogger.info(config.getPassMarkUp(parameter2 + " successfully displayed."));
		else {
			reportLogger.info(config.getFailMarkUp(parameter2 + " failed to display."));
			throw new RuntimeException(parameter2 + " failed to display.");
		}

	}

	/**
	 * This method will wait up to max duration time to vanish given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void waitToVanish(String locatorType, String parameter1, String parameter2) {
		boolean vanishStatus = elementFinder.waitToVanish(locatorType, parameter1, parameter2, Settings.MAX_WAIT);
		if (vanishStatus)
			reportLogger.info(config.getPassMarkUp(parameter2 + " successfully Vanished."));
		else {
			reportLogger.info(config.getFailMarkUp(parameter2 + " failed to Vanish."));
			throw new RuntimeException(parameter2 + " failed to Vanish.");
		}
	}

	/**
	 * This method will wait up to given duration time to vanish given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 * @param duration    in seconds
	 */
	public void waitToVanish(String locatorType, String parameter1, String parameter2, String duration) {
		boolean vanishStatus = elementFinder.waitToVanish(locatorType, parameter1, parameter2,
				Long.parseLong(duration));
		if (vanishStatus)
			reportLogger.info(config.getPassMarkUp(parameter2 + " successfully Vanished."));
		else {
			reportLogger.info(config.getFailMarkUp(parameter2 + " failed to Vanish."));
			throw new RuntimeException(parameter2 + " failed to Vanish.");
		}
	}

	/**
	 * his method will wait up to given duration time to enable given element
	 * 
	 * @param locatorType
	 * @param controlType
	 * @param value
	 * @param duration    in seconds
	 */
	public void waitToEnable(String locatorType, String controlType, String value, String duration) {
		boolean enableStatus = elementFinder.waitToEnable(locatorType, controlType, value, Long.parseLong(duration));
		if (enableStatus)
			reportLogger.info(config.getPassMarkUp(value + " successfully Enabled."));
		else {
			reportLogger.info(config.getFailMarkUp(value + " failed to Enable."));
			throw new RuntimeException(value + " failed to Enable.");
		}
	}

	/**
	 * his method will wait up to max duration time to enable given element
	 * 
	 * @param locatorType
	 * @param controlType
	 * @param value
	 */
	public void waitToEnable(String locatorType, String controlType, String value) {
		boolean enableStatus = elementFinder.waitToEnable(locatorType, controlType, value, Settings.MAX_WAIT);
		if (enableStatus)
			reportLogger.info(config.getPassMarkUp(value + " successfully Enabled."));
		else {
			reportLogger.info(config.getFailMarkUp(value + " failed to Enable."));
			throw new RuntimeException(value + " failed to Enable.");
		}
	}

	/**
	 * This method will click on given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 * @throws EventFailException
	 */
	public void click(String locatorType, String parameter1, String parameter2) {
		try {
			System.err.println("Click - " + Settings.FIND_WAIT);
			elementFinder.getElement(locatorType, parameter1, parameter2, Settings.FIND_WAIT).click();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " click successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " click failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will click on given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 * @throws EventFailException
	 * @author Adhilingappa
	 */
	public void clickIndex(String locatorType, String parameter1, String parameter2, String ind) {
		try {
			int index = Integer.parseInt(ind);
			System.err.println("Click - " + Settings.FIND_WAIT);
			elementFinder.getElementIndex(locatorType, parameter1, parameter2, Settings.FIND_WAIT, index).click();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " clickIndex  successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " clickIndex failed."));
			eventStatus = false;
		}
	}

	public void clickIndex1(String locatorType, String parameter1, String parameter2, String ind) {
		try {
			int index = Integer.parseInt(ind);
			System.err.println("Click - " + Settings.FIND_WAIT);
			elementFinder.getElementIndex(locatorType, parameter1, parameter2, Settings.FIND_WAIT, index).click();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " clickIndex  successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " clickIndex failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will click center on given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 * @throws EventFailException
	 */
	public void clickCenter(String locatorType, String parameter1, String parameter2) {
		try {
			elementFinder.getElement(locatorType, parameter1, parameter2, Settings.FIND_WAIT).clickCenter();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " clickCenter successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " clickCenter failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will right click on given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void rightClick(String locatorType, String parameter1, String parameter2) {
		try {
			elementFinder.getElement(locatorType, parameter1, parameter2, Settings.FIND_WAIT).rightClick();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " right click successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " right click failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will double click on given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void doubleClick(String locatorType, String parameter1, String parameter2) {
		try {
			elementFinder.getElement(locatorType, parameter1, parameter2, Settings.FIND_WAIT).doubleClick();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " double click successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " double click failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will hover on given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void hover(String locatorType, String parameter1, String parameter2) {
		try {
			elementFinder.getElement(locatorType, parameter1, parameter2, Settings.FIND_WAIT).hover();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " hover successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " hover failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will write given text on given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 * @throws EventFailException
	 */
	public void write(String locatorType, String parameter1, String parameter2, String text) {
		try {
			click(locatorType, parameter1, parameter2);
			Timer.waitTime(200);
			Keyboard.clear();
			keyboardType(text);
			reportLogger
					.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " write " + text + " successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " write " + text + " failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will select a given check box on given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void check(String locatorType, String parameter1, String parameter2) {
		try {
			elementFinder.getUIElement(locatorType, "CHECKBOX", parameter2, Settings.FIND_WAIT).check();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " checked successfully."));
			eventStatus = true;
		} catch (FindFailed | AutomationException | NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " check failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will deselect a given check box on given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void unCheck(String locatorType, String parameter1, String parameter2) {
		try {
			elementFinder.getUIElement(locatorType, "CHECKBOX", parameter2, Settings.FIND_WAIT).unCheck();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " unchecked successfully."));
			eventStatus = true;
		} catch (FindFailed | AutomationException | NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " uncheck failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will drag the given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void drag(String locatorType, String parameter1, String parameter2) {
		try {
			SikuliElement element = elementFinder.getElement(locatorType, parameter1, parameter2, 2);
			element.drag();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " dragged successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " drag failed."));
			eventStatus = false;
		}
	}

	/**
	 * This method will drop the given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 *                    value
	 */
	public void drop(String locatorType, String parameter1, String parameter2) {
		try {
			SikuliElement element = elementFinder.getElement(locatorType, parameter1, parameter2, 2);
			element.dropAt();
			reportLogger.info(config.getPassMarkUp(parameter1 + " " + parameter2 + " drop successfully."));
			eventStatus = true;
		} catch (NullPointerException e) {
			reportLogger.info(config.getFailMarkUp(parameter1 + " " + parameter2 + " drop failed."));
			eventStatus = false;
		}
	}

	/**
	 * this method will draw the region as given co-ordinates
	 * 
	 * @param startX
	 * @param startY
	 * @param endX
	 * @param endY
	 * @author Adhilingappa
	 * 
	 */
	public void drawRegion(String startX, String startY, String endX, String endY) {
		int xStart = Integer.parseInt(startX);
		int yStart = Integer.parseInt(startY);
		int xEnd = Integer.parseInt(endX);
		int yEnd = Integer.parseInt(endY);
		Mouse mouse = new Mouse();
		mouse.drawRegion(xStart, yStart, xEnd, yEnd);
		reportLogger.info("successfully drawn region");

	}

	/**
	 * This method will start Remote capture by given RC path
	 * 
	 * @param applicationPath
	 */
	public void startRC(String applicationPath) {
		try {
			RemoteClient.startRecording(applicationPath);
			reportLogger.info(config.getPassMarkUp("RC started successfully"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("RC start failed"));
		}
	}

	/**
	 * This method will stop Remote capture
	 */
	public void stopRC() {
		try {
			RemoteClient.stopRecording();
			reportLogger.info(config.getPassMarkUp("RC stop successfully"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("RC stop failed"));
		}
	}

	/**
	 * This method will update Epiplex settings for automation
	 * 
	 * @param status
	 */
	public void updateSetting(String status) {
		try {
			xmlLib.updateSettings(Boolean.parseBoolean(status));
			reportLogger.info(config.getPassMarkUp("updateSetting " + status + "successfully"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(("updateSetting " + status + "failed")));
		}
	}

	/**
	 * This method will update Epiplex settings for automation
	 * 
	 * @param setting - "SCREEN VIDEO" or "CAPTURE AUDIO" or "AUDIO VIDEO"
	 */
	public void updateCaptureSetting(String setting) {
		try {
			xmlLib.updateCaptureSetting(setting);
			reportLogger.info(config.getPassMarkUp("updateCaptureSetting " + setting + "successfully"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(("updateCaptureSetting " + setting + "failed")));
		}
	}

	/**
	 * this method will update the audio STT settings
	 * 
	 * @param status
	 * @author Adhilingappa
	 */
	public void updateAudioSetting(String status) {
		try {
			xmlLib.updateAudioSetting(Boolean.parseBoolean(status));
			reportLogger.info(config.getPassMarkUp("updateAudioSettings " + status + " successfull"));

		} catch (Exception e) {
			reportLogger.info(config.getPassMarkUp("updateAudioSettings " + status + " failed"));
		}
	}

	/**
	 * This method will Assert after verifying node value in xml file
	 * 
	 * @param documentPath - REPOPATH OR PROGRAMDATA
	 * @param tagName
	 * @param attribute    - TEXT OR Attribute can be passed
	 * @param value,       String expectedStatus - attribute value
	 */
	public void assertNodeExist(String documentPath, String tagName, String attribute, String value) {
		try {

			boolean actualStatus = xmlLib.getAttribute(documentPath, tagName, attribute, value);
			logResult(actualStatus);
			reportLogger.info(config.getPassMarkUp(" assertNodeExist completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(" assertNodeExist got failed"));
		}
	}

	/**
	 * This method will Assert after verifying node value in xml file
	 * 
	 * @param documentPath - REPOPATH OR PROGRAMDATA
	 * @param tagName
	 * @param attribute    - TEXT OR Attribute can be passed
	 * @param value,       String expectedStatus - attribute value
	 */
	public void assertNodeNotExist(String documentPath, String tagName, String attribute, String value) {
		try {
			boolean actualStatus = !xmlLib.getAttribute(documentPath, tagName, attribute, value);
			logResult(actualStatus);
			reportLogger.info(config.getPassMarkUp(" assertNodeNotExist completed."));
		} catch (Exception e) {
			reportLogger.fail(config.getFailMarkUp(" assertNodeNotExist got failed"));
		}
	}

	/**
	 * This method will update Window mode settings for automation
	 * 
	 * @param mode
	 */
	public void selectWindow(String mode) {
		try {
			xmlLib.selectWindow(mode);
			reportLogger.info(config.getPassMarkUp("selectWindow " + mode + "successfully"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(("selectWindow " + mode + "failed")));
		}

	}

	/**
	 * This method will start capture with given capture name
	 * 
	 * @param captureFileName
	 */
	public void startCapture(String captureFileName) {
		try {
			Capture.startCapture(captureFileName);
			reportLogger.info(config.getPassMarkUp(captureFileName + " startCapture started..."));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(captureFileName + " startCapture start failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will start capture with given capture name
	 * 
	 * @param captureFileName
	 */
	public void startCaptureManual(String captureFileName) {
		try {
			Capture.startCaptureManual(captureFileName);
			reportLogger.info(config.getPassMarkUp(captureFileName + " startCapture started..."));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(captureFileName + " startCapture start failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will start capture with default capture settings
	 * 
	 * @param captureFileName
	 */
	public void startCapturePerformance(String captureFileName) {
		try {
			PerformanceUtils.startCapture(captureFileName);
			reportLogger.info(config.getPassMarkUp(captureFileName + " startCapturePerformance started..."));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp(captureFileName + " startCapturePerformance start failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will add note while doing capture
	 */
	public void addNote() {
		try {
			Capture.addNote();
			reportLogger.info(config.getPassMarkUp("add note completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("add note failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will add validation while capturing
	 */
	public void addValidations() {
		try {
			Capture.addValidations();
			reportLogger.info(config.getPassMarkUp("add Validations completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("add Validations failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will add Exception while doing capture
	 */
	public void addException() {
		try {
			Capture.addException();
			reportLogger.info(config.getPassMarkUp("add Exception completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("add Exception failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will stop recover exception
	 */
	public void exceptionRecoveryStop() {
		try {
			Capture.exceptionRecoveryStop();
			reportLogger.info(config.getPassMarkUp("Exception recovery stop completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Exception recovery stop failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will add input data while doing capture
	 */
	public void addInputData() {
		try {
			Capture.addInputData();
			reportLogger.info(config.getPassMarkUp("addInputData completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("addInputData got error"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will add Narration while doing capture
	 */
	public void addNarration() {
		try {
			Capture.addNarration();
			reportLogger.info(config.getPassMarkUp("add Narration completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("add Narration failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will record screen video while doing capture
	 */
	public void addScreenVideo() {
		try {
			Capture.addScreenVideo();
			reportLogger.info(config.getPassMarkUp("add Screen Video completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("add Screen Video failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will stop record screen video while doing capture
	 */
	public void stopScreenVideo() {
		try {
			Capture.stopScreenVideo();
			reportLogger.info(config.getPassMarkUp("stop Screen Video completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("stop Screen Video failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will record audio while doing capture
	 */
	public void addAudio() {
		try {
			Capture.addAudio();
			reportLogger.info(config.getPassMarkUp("Add audio completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Add audio failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will stop record Audio while doing capture
	 */
	public void stopAudio() {
		try {
			Capture.stopAudio();
			reportLogger.info(config.getPassMarkUp("stop audio completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("stop audio failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will save capture file
	 */
	public void saveCapture() {
		try {
			Capture.saveCapture();
			reportLogger.info(config.getPassMarkUp("saveCapture save completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("saveCapture save failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will save capture file
	 */
	public void saveCapturePerformance() {
		try {
			PerformanceUtils.saveCapture();
			reportLogger.info(config.getPassMarkUp("saveCapturePerformance save completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("saveCapturePerformance save failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * this method will insert info step for mentioned step
	 * 
	 * 
	 * @param stepNo
	 * @param stepNoImage
	 * @author Adhilingappa
	 */
	public void insertInfoStep(String stepNo, String stepNoImage) {
		try {
			PerformanceUtils.insertInfoStep(stepNo, stepNoImage);
			reportLogger.info(config.getPassMarkUp("Insert info step completed"));

		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Insert Info step failed "));
			throw new RuntimeException();
		}

	}

	/**
	 * this method will insert the section for mentioned step
	 * 
	 * @param stepNo
	 * @param stepNoImage
	 * @author Adhilingappa
	 */

	public void insertSection(String stepNo, String stepNoImage) {

		try {
			PerformanceUtils.insertSection(stepNo, stepNoImage);
			reportLogger.info(config.getPassMarkUp("Insert Section step completed"));

		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Insert Section step failed "));
			throw new RuntimeException();
		}

	}

	/**
	 * this method will insert the process variation for mentioned step
	 * 
	 * @param stepNo
	 * @param stepNoImage
	 * @author Adhilingappa
	 */
	public void insertProcessVariation(String stepNo, String stepNoImage) {
		try {
			PerformanceUtils.insertProcessVariation(stepNo, stepNoImage);
			reportLogger.info(config.getPassMarkUp("Insert Process variation completed"));

		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Insert Process variation failed "));
			throw new RuntimeException();
		}

	}

	/**
	 * this method will set the jump step for default and new option for mentioned
	 * step
	 * 
	 * @param defaultStepNoimage
	 * @param newOptionStepNoImage
	 * @author Adhilingappa
	 */
	public void setJumpStep(String defaultStepNoimage, String newOptionStepNoImage) {
		try {
			PerformanceUtils.setJumpStep(defaultStepNoimage, newOptionStepNoImage);
			reportLogger.info(config.getPassMarkUp("set jump step completed"));

		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("set jump step failed "));
			throw new RuntimeException();
		}

	}

	/**
	 * this method will set the block step for default and new option for mentioned
	 * step
	 * 
	 * @param defaultStepNoimage
	 * @param newOptionStepNoImage
	 * @author Adhilingappa
	 */
	public void setBlockStep(String defaultStepNoimage, String newOptionStepNoImage) {
		try {
			PerformanceUtils.setBlockStep(defaultStepNoimage, newOptionStepNoImage);
			reportLogger.info(config.getPassMarkUp("set Block step completed"));

		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("set Block step failed "));
			throw new RuntimeException();
		}

	}

	/**
	 * this method will insert workflow for mentioned step
	 * 
	 * @param stepNo
	 * @param stepNoImage
	 * @author Adhilingappa
	 */
	public void insertWorkFlow(String stepNo, String stepNoImage) {
		try {
			PerformanceUtils.insertWorkflow(stepNoImage, stepNoImage);
			reportLogger.info(config.getPassMarkUp("Insert WorkFlow completed"));

		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Insert WorkFlow failed"));
			throw new RuntimeException();
		}

	}

	/**
	 * This method will cancel the capture
	 */
	public void cancelCapture() {
		try {
			Capture.cancelCapture();
			reportLogger.info(config.getPassMarkUp("Cancel Capture completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("Cancel Capture failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will cancel the capture
	 */
	public void cancelCapturePerformance() {
		try {
			PerformanceUtils.cancelCapture();
			reportLogger.info(config.getPassMarkUp("cancelCapturePerformance completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("cancelCapturePerformance failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will do performance test on open capture file from home with
	 * given capture file
	 * 
	 * @param captureFileName
	 */
	public void openCaptureFilePeformance(String fileName) {

		try {
			PerformanceUtils.openCaptureFileFromeHome(fileName);
			reportLogger.info(config.getPassMarkUp("openCaptureFileFromeHome completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("openCaptureFileFromeHome failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * this method will do performance test on save and Save As process editor file
	 * 
	 * @param fileName
	 * @param newFileName
	 * @author Adhilingappa
	 */
	public void saveAndSaveAsProcessEditorFile(String fileName, String newFileName) {

		try {
			PerformanceUtils.saveAndSaveAsProcessEditorFile(fileName, newFileName);
			reportLogger.info(config.getPassMarkUp("saveProcessEditorFile completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("saveProcessEditorFile failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * this method will do performance test on document generation for mentioned
	 * document name
	 * 
	 * @param docName
	 * @author Adhilingappa
	 */

	public void docPerformance(String docName) {
		try {
			PerformanceUtils.generateDocumentPerformance(docName);
			reportLogger.info(config.getPassMarkUp("performanceTestDoc completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("performanceTestDoc failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * this method will do performance test on finalize a file from home
	 * 
	 * @param captureFileName
	 * @author Adhilingappa
	 */
	public void finalizeFromHome(String captureFileName) {

		try {
			PerformanceUtils.finalizeFromHome(captureFileName);
			reportLogger.info(config.getPassMarkUp("performanceTestDoc completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("performanceTestDoc failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will do performance test on document generation with given
	 * capture file
	 * 
	 * @param captureFileName
	 */
	public void performanceTestDoc(String captureFileName) {

		try {
			PerformanceUtils.performanceTestDoc(captureFileName);
			reportLogger.info(config.getPassMarkUp("performanceTestDoc completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("performanceTestDoc failed"));
			throw new RuntimeException(e);
		}
	}

	/**
	 * This method will select the display file type in home page.
	 * 
	 * @param fileType
	 * @throws EventFailException
	 */
	public void displayFileType(String fileType) {
		try {
			focusWindow("Epiplex500");
			Timer.waitTime(3000);
			click("Image", "Screen", "ToolBar");
			click("name", "MENUITEM", "Display File Type");
			click("name", "MENUITEM", fileType);
			reportLogger.info(config.getPassMarkUp("displayFileType - " + fileType + " - " + " completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("displayFileType - " + fileType + " - " + " failed"));
		}

	}

	/**
	 * This method will generate all type of documents
	 * 
	 * @param fileType
	 * @param fileName
	 * @param filePath
	 */
	public void generateDocument(String fileType, String fileName, String filePath) {
		try {
			startTest("Generate " + fileName);
			deleteFile(fileName, filePath);
			setRootSearch("false");
			focusWindow("Developer Editor - ");
			click("name", "MENUITEM", "File");
			click("name", "MENUITEM", "Generate Document...");
			focusWindow("Generate Document");
			click("id", "COMBOBOX", "8");
			click("name", "LISTITEM", fileType);

			if (fileName.endsWith("docx"))
				check("name", "CHECKBOX", "Save in .docx format");

			else if (fileName.endsWith("doc"))
				unCheck("name", "CHECKBOX", "Save in .docx format");

			else if (fileName.endsWith("pptx"))
				check("name", "CHECKBOX", "Save in .pptx format");

			else if (fileName.endsWith("ppt"))
				unCheck("name", "CHECKBOX", "Save in .pptx format");

			else if (fileName.endsWith("xls")) {
				unCheck("name", "CHECKBOX", "Use HTML Template");
				unCheck("name", "CHECKBOX", "Save in .xlsx format");
			} else if (fileName.endsWith("xlsx")) {
				unCheck("name", "CHECKBOX", "Use HTML Template");
				check("name", "CHECKBOX", "Save in .xlsx format");
			} else if (fileName.endsWith("pdf"))
				check("name", "CHECKBOX", "Use MS Word Template");

			unCheck("name", "CHECKBOX", "Launch the document after successful generation");
			click("name", "BUTTON", "Generate");
			focusWindow("Developer Editor");
			waitToDisplay("name", "Text", "Do you want to launch the generated document?");
			click("name", "BUTTON", "No");
			waitTime("500");
			assertFileExists(fileName, filePath);
			reportLogger.info(config.getPassMarkUp("GenerateDocument - " + fileType + " - " + fileName + " completed"));
		} catch (Exception e) {
			reportLogger.info(config.getFailMarkUp("GenerateDocument - " + fileType + " - " + fileName + " failed"));
		}
	}
}
