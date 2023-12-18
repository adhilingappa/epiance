package epiplex;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.sikuli.script.FindFailed;

import actions.ActionMethods;
import actions.ElementFinder;
import core.Application;
import core.Driver;
import utils.ProjectConfiguration;
import utils.Settings;
import utils.Timer;
import utils.XML_Library;

public class PerformanceUtils {

	private static final Logger log = LogManager.getLogger(PerformanceUtils.class);
	static long waitTime = Settings.FIND_WAIT;
	static long maxTime = Settings.MAX_WAIT;
	static Driver driver = new Driver();
	static ElementFinder finder = new ElementFinder(driver);
	static ActionMethods action = new ActionMethods(driver);
	static String epiplexPath = "Epiplex";
	public static String performaceReportExcelPath = ProjectConfiguration.reportFolder.getAbsolutePath()
			+ "\\Performance_Report.xlsx";

	/**
	 * This method will start capture with default settings and it will log data on
	 * that time
	 * 
	 * @param fileName
	 */
	public static void startCapture(String fileName) {
		new XML_Library().updateSettings(false);
		log.info(fileName + " Capture - initializing...");
		try {
			Timer.startTimer();
			Application.launchApplication(epiplexPath);
			action.focusWindow("Epiplex500");
			Timer.stopTimer("Launch Epiplex500");
			finder.getElement("name", "EDIT", "Enter a new file name or select from the list", waitTime).click();
			finder.getElement("name", "EDIT", "Enter a new file name or select from the list", waitTime)
					.write(fileName);
			finder.getElement("name", "BUTTON", "Start Capture", waitTime).click();

			boolean fileOverWritePopup = finder.waitToDisplay("name", "Text",
					"File already exists. Do you want to overwrite?", 3);
			if (fileOverWritePopup) {
				finder.getElement("name", "BUTTON", "Yes", waitTime).click();
			} else {
				boolean pending = finder.waitToDisplay("name", "Text",
						"File Name specified is pending to recover and save." + " Do you want to overwrite the file?",
						3);
				if (pending)
					finder.getElement("name", "BUTTON", "Yes", waitTime).click();
			}

			boolean security = finder.waitToDisplay("partialName", "Text", "Data Security Confirmation...", 3);
			if (security)
				finder.getElement("name", "BUTTON", "Yes", waitTime).click();

			Timer.startTimer();
			boolean popUp = finder.waitToDisplay("name", "Window", "Epiplex500 Capture", waitTime);
			Timer.stopTimer("Start to Message");
			if (popUp) {
				finder.getElement("name", "BUTTON", "OK", waitTime).click();
			}

			Timer.startTimer();
			boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
			while (!status) {
				status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
			}

			Timer.stopTimer("Message to System Tray");
			System.out.println("Capture Started");

		} catch (Exception e) {
			log.error(fileName + " Capture - error. " + e.getMessage());
			throw new RuntimeException(e);
		}
		log.info(fileName + " Capture - started...");
	}

	/**
	 * This method will cancel the capture and it will log data on that time
	 * 
	 * @throws FindFailed
	 */
	public static void cancelCapture() throws FindFailed {
		log.info("Capture cancel initializing...");
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).click();
			finder.getElement("name", "MENUITEM", "Cancel", waitTime).click();
			Timer.startTimer();
			finder.getElement("name", "BUTTON", "Yes", waitTime).click();
			finder.waitToDisplay("name", "window", "Epiplex500", waitTime);
			action.focusWindow("Epiplex500");
			Timer.stopTimer("Cancel Capture");
		}
		log.info("Capture cancel completed.");
	}

	/**
	 * this method will add info step
	 * 
	 * @author Adhilingappa
	 * @param stepNo
	 * @param stepNoImage
	 */
	public static void insertInfoStep(String stepNo, String stepNoImage) {
		action.setRootSearch("false");
		action.focusWindow("Developer Editor - [");
		log.info("info step adding for " + stepNo + " step");

		// insert info step
		action.shortcut("F4");
		finder.getElement("image", "screen", stepNoImage, 10).clickCenter();
		action.shortcut("SHIFT", "INSERT");
		action.focusWindow("Insert Step");
		action.shortcut("up");
		finder.getElement("image", "screen", "DropDown.png", 20).clickCenter();
		Timer.waitTime(500);
		finder.getElement("image", "Screen", "infoStep.png", 10).click();
		Timer.waitTime(500);
		action.shortcut("ENTER");
		Timer.waitTime(500);
		action.setRootSearch("true");
		log.info("info step added succesfully for " + stepNo + " step");

	}

	public static void insertProcessVariation(String stepNo, String stepNoImage) {

		action.setRootSearch("false");
		action.focusWindow("Developer Editor - [");
		log.info("process variation is adding for " + stepNo + "step");

		finder.getElement("image", "screen", stepNoImage, maxTime).click();
		action.shortcut("SHIFT", "INSERT");
		finder.waitToDisplay("name", "Window", "Insert Step", maxTime);
		action.shortcut("up");
		finder.getElement("image", "screen", "DropDown.png", 10).clickCenter();
		Timer.waitTime(500);
		finder.getElement("image", "screen", "ProcessVariation.png", 5).click();
		Timer.waitTime(500);
		action.shortcut("ENTER");
		// action.shortcut("down");
		log.info("process variation is  successfully added for " + stepNo + "step");

		action.setRootSearch("true");

	}

	public static void setJumpStep(String defaultStepNoimage, String newOptionStepNoImage) {
		action.setRootSearch("false");
		action.focusWindow("Developer Editor - [");
		log.info("Adding jump step for process variation");
		finder.getElement("image", "screen", "variation_icon.png", maxTime).click();
		Timer.waitTime(500);
		action.shortcut("F4");
		Timer.waitTime(500);
		action.focusWindow("Step Properties [ Process Variation ]");
		finder.getElement("id", "Button", "23", maxTime).click();
		// finder.waitToDisplay("name", "window", "Set Block", maxTime);
		action.maximizeWindow("Set Steps");
		action.focusWindow("Set Steps");
		Timer.waitTime(500);
		finder.getElement("image", "screen", "18.png", maxTime).click();
		for (int i = 0; i <= 8; i++) {
			action.shortcut("down");
		}
		Timer.waitTime(1000);
		finder.getElement("image", "screen", defaultStepNoimage, maxTime).click();
		finder.getElement("name", "button", "Set Jump", maxTime).click();
		finder.getElement("name", "Button", "OK", maxTime).click();
		Timer.waitTime(1500);
		finder.waitToDisplay("name", "window", "Step Properties [ Process Variation ]", 10);
		action.focusWindow("Step Properties [ Process Variation ]");
		finder.getElement("name", "listItem", "New Option", maxTime).click();
		finder.getElement("id", "Button", "23", maxTime).click();
		action.maximizeWindow("Set Steps");
		action.focusWindow("Set Steps");
		Timer.waitTime(500);
		finder.getElement("image", "screen", "18.png", maxTime).click();
		for (int i = 0; i <= 15; i++) {
			action.shortcut("down");
		}
		Timer.waitTime(1000);
		finder.getElement("image", "screen", newOptionStepNoImage, maxTime).click();
		finder.getElement("name", "button", "Set Jump", maxTime).click();
		finder.getElement("name", "Button", "OK", maxTime).click();

		log.info("successfully Added jump step for process variation");
		// action.shortcut("F4");
		action.setRootSearch("true");

	}

	public static void setBlockStep(String defaultStepNoImage, String newOptionStepNoImage) {
		action.setRootSearch("false");
		action.focusWindow("Developer Editor - [");
		log.info("Adding block step for process variation");
		// action.shortcut("F4");
		Timer.waitTime(500);
		action.focusWindow("Step Properties [ Process Variation ]");
		finder.getElement("id", "Button", "23", maxTime).click();
		// finder.waitToDisplay("name", "Window", "Set Steps", maxTime);
		action.maximizeWindow("Set Steps");
		action.focusWindow("Set Steps");
		Timer.waitTime(500);
		finder.getElement("image", "screen", defaultStepNoImage, maxTime).click();
		finder.getElement("name", "button", "Set Block", maxTime).click();
		Timer.waitTime(500);
		;
		finder.getElement("name", "Button", "OK", maxTime).click();
		Timer.waitTime(500);
		finder.waitToDisplay("name", "window", "Step Properties [ Process Variation ]", 10);
		action.focusWindow("Step Properties [ Process Variation ]");
		finder.getElement("name", "listItem", "New Option", maxTime).click();
		finder.getElement("id", "Button", "23", maxTime).click();
		// finder.waitToDisplay("name", "Window", "Set Steps", maxTime);
		action.maximizeWindow("Set Steps");
		action.focusWindow("Set Steps");
		Timer.waitTime(500);
		finder.getElement("image", "screen", "18.png", maxTime).click();
		for (int i = 0; i <= 10; i++) {
			action.shortcut("down");
		}
		Timer.waitTime(1000);
		finder.getElement("image", "screen", newOptionStepNoImage, maxTime).click();
		finder.getElement("name", "button", "Set Block", maxTime).click();
		finder.getElement("name", "Button", "OK", maxTime).click();

		log.info("block step added successfuly");
		action.shortcut("F4");

		action.setRootSearch("true");
	}

	public static void insertWorkflow(String stepNo, String stepNoImage)

	{
		action.setRootSearch("false");
		action.focusWindow("Developer Editor - [");
		log.info("workFlow is adding for " + stepNo + " Step");
		Timer.waitTime(1000);
		finder.getElement("image", "screen", stepNoImage, maxTime).click();
		action.shortcut("SHIFT", "INSERT");
		// finder.waitToDisplay("name", "Window", "Insert Step", maxTime);
		action.focusWindow("Insert Step");
		action.shortcut("up");
		finder.getElement("image", "screen", "DropDown.png", 10).clickCenter();
		Timer.waitTime(500);
		finder.getElement("image", "screen", "Workflow.png", 10).click();
		finder.getElement("id", "Button", "22", maxTime).click();
		boolean enable = finder.waitToEnable("name", "button", "OK", maxTime);
		while (!enable) {
			enable = finder.waitToEnable("name", "button", "OK", maxTime);
		}
		finder.getElement("name", "button", "OK", maxTime).click();
		log.info("workFlow is successfuly added for " + stepNo + " Step");

		finder.getElement("name", "button", "Save", maxTime).click();
		Timer.waitTime(1000);

		action.setRootSearch("true");

	}

	public static void insertSection(String stepNo, String stepNoImage) {
		action.setRootSearch("false");

		action.focusWindow("Developer Editor - [");
		log.info("section is adding for " + stepNo + " step");
		// insert Section steps
		Timer.waitTime(1000);
		finder.getElement("image", "screen", stepNoImage, maxTime).clickCenter();
		action.shortcut("SHIFT", "INSERT");
		// finder.waitToDisplay("name", "window", "Insert Step", maxTime);
		action.focusWindow("Insert Step");
		action.shortcut("up");
		finder.getElement("image", "screen", "DropDown.png", 10).click();
		Timer.waitTime(500);
		finder.getElement("image", "screen", "Section.png", 10).click();
		Timer.waitTime(500);
		action.shortcut("ENTER");
		Timer.waitTime(500);
		log.info("section is successfully added for " + stepNo + " step");
		action.setRootSearch("true");

	}

	/***
	 * Save the running Capture and it will log data on that time
	 */
	public static void saveCapture() {
		log.info("Capture save initializing...");
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).click();
			finder.getElement("name", "MENUITEM", "Save", waitTime).click();
			boolean popUp = finder.waitToDisplay("name", "Window", "Properties", waitTime);
			System.out.println(popUp);
			if (popUp) {
				finder.getElement("name", "BUTTON", "Save", waitTime).click();
			}
			String start = Timer.startTimer();
			System.err.println(start);
			status = false;
			finder.waitToDisplay("name", "Window", "Saving capture file", 3);
			while (!status) {
				status = finder.waitToVanish("name", "Window", "Saving capture file", 3);
			}
			String stop = Timer.stopTimer("Save Capture");
			System.err.println(stop);

			finder.getElement("name", "BUTTON", "OK", waitTime).click();
			finder.getElement("name", "BUTTON", "No", waitTime).click();
			Application.closeApplication(epiplexPath);
		}
		log.info("Capture save completed.");
	}

	/**
	 * This method will finalize the capture from home and it will log data on that
	 * time
	 * 
	 * @param fileName
	 */
	public static void finalizeFromHome(String fileName) {
		log.info("Finalize capture file " + fileName + " from home initializing...");
		Application.launchApplication(epiplexPath);
		driver.setRootSearch(true);
		finder.getUIElement("name", "Window", "Epiplex500", waitTime).setFocus();
		finder.getUIElement("id", "PANE", "picBxRefresh", waitTime).click();
		finder.getUIElement("id", "Edit", "txtBxSearch", waitTime).click();
		finder.getUIElement("id", "Edit", "txtBxSearch", waitTime).write(fileName);
		action.shortcut("Enter");
		finder.getUIElement("name", "TEXT", fileName, waitTime).rightClick();
		finder.getUIElement("name", "MENUITEM", "Finalize", waitTime).click();
		finder.waitToDisplay("name", "Window", "Finalize Settings", waitTime);
		finder.getUIElement("name", "BUTTON", "OK", waitTime).click();
		boolean status = finder.waitToDisplay("name", "Button", "Yes", 1);
		if (status)
			finder.getUIElement("name", "Button", "Yes", waitTime).click();
		Timer.startTimer();
		finder.waitToEnable("id", "Pane", "picBxDelete", maxTime);
		Timer.stopTimer("Finalize from Home");
		Timer.waitTime(2000);
		action.focusWindow("Epiplex500");
		Timer.waitTime(2000);
		action.shortcut("Enter");
		Timer.startTimer();
		boolean statusWin = finder.waitToDisplay("partialName", "Window", "Developer Editor - [", 5);
		while (!statusWin)
			statusWin = finder.waitToDisplay("partialName", "Window", "Developer Editor - [", 5);
		Timer.stopTimer("open Developer editor file from home");
		action.focusWindow("Developer Editor - [");
		driver.setRootSearch(true);
		log.info("Finalize capture file " + fileName + " from home completed");
	}

	public static void openCaptureFileFromeHome(String fileName) {

		log.info("open capture file " + fileName + " from home initializing...");
		Application.launchApplication(epiplexPath);
		driver.setRootSearch(true);
		finder.getUIElement("name", "Window", "Epiplex500", waitTime).setFocus();
		finder.getUIElement("id", "PANE", "picBxRefresh", waitTime).click();
		finder.getUIElement("id", "Edit", "txtBxSearch", waitTime).click();
		finder.getUIElement("id", "Edit", "txtBxSearch", waitTime).write(fileName);

		action.shortcut("Enter");
		Timer.waitTime(1000);

		finder.getUIElement("name", "TEXT", fileName, waitTime).rightClick();
		finder.getUIElement("name", "MENUITEM", "Edit", waitTime).click();
		Timer.startTimer();
		boolean statusWin = finder.waitToDisplay("partialName", "Window", "Process Editor - [", 2);
		while (!statusWin)
			statusWin = finder.waitToDisplay("partialName", "Window", "Process Editor - [", 2);
		Timer.stopTimer("Open Capture File Frome Home");
		action.focusWindow("Process Editor - [");
		log.info("open capture file " + fileName + " from home completed");
	}

	/**
	 * This method will first focus on the opened processEditor and log the time for
	 * save and save As
	 * 
	 * @param fileName
	 * @author Adhilingappa
	 */
	public static void saveAndSaveAsProcessEditorFile(String fileName, String newFileName) {
		action.focusWindow("Process Editor - [");
		log.info("save and saveAs process editor started");
		finder.getUIElement("partialName", "Text", "On the menu click About Notepad or press a.", maxTime).click();
		finder.getUIElement("id", "Button", "tlbCopy", maxTime).click();

		finder.getUIElement("name", "Button", "Save", maxTime).click();
		Timer.startTimer();
		boolean win = finder.waitToDisplay("partialName", "Window", ".gps", maxTime);
		Timer.stopTimer("save process editor ");
		log.info("process Editor file " + fileName + " Save is completed");
		action.focusWindow("Process Editor - [");
		finder.getUIElement("name", "MENUITEM", "File", maxTime).click();
		finder.getUIElement("partialName", "MENUITEM", "Save As", maxTime).click();
		action.focusWindow("Save");
		finder.getUIElement("name", "Edit", "File name:", maxTime).write(newFileName);
		finder.getUIElement("name", "Button", "btnSave", maxTime).click();
		Timer.startTimer();
		finder.waitToDisplay("partialName", "Window", newFileName + ".gps", maxTime);
		Timer.stopTimer("Save As process editor");
		log.info("process editor file " + fileName + "save As is  completed");
		Timer.waitTime(1000);
		action.shortcut("Control", "Q");
		Timer.startTimer();
		boolean homeWin = finder.waitToDisplay("partialName", "Window", "Epiplex500", 2);
		while (!homeWin)
			homeWin = finder.waitToDisplay("partialName", "Window", "Epiplex500", 2);
		Timer.stopTimer("Exit process Editor");
		log.info("process Editor closed succesfully");
		Application.closeApplication(epiplexPath);
		log.info("epiplex Application closed successfuly");
	}

	public static void saveProcessEditorFile(String fileName) {

		// opening gps file and waiting for process editor
		log.info("open capture file " + fileName + " from home initializing...");
		Application.launchApplication(epiplexPath);
		driver.setRootSearch(true);
		finder.getUIElement("name", "Window", "Epiplex500", waitTime).setFocus();
		finder.getUIElement("id", "PANE", "picBxRefresh", waitTime).click();
		finder.getUIElement("id", "Edit", "txtBxSearch", waitTime).click();
		finder.getUIElement("id", "Edit", "txtBxSearch", waitTime).write(fileName);

		action.shortcut("Enter");
		Timer.waitTime(1000);

		finder.getUIElement("name", "TEXT", fileName, waitTime).rightClick();
		finder.getUIElement("name", "MENUITEM", "Edit", waitTime).click();
		boolean statusWin = finder.waitToDisplay("partialName", "Window", "Process Editor - [", 2);
		while (!statusWin)
			statusWin = finder.waitToDisplay("partialName", "Window", "Process Editor - [", 2);
		action.focusWindow("Process Editor - [");
		log.info("open capture file " + fileName + " from home completed");

		// checking time if file edit

		boolean win = finder.waitToDisplay("partialName", "Window", ".gps*", maxTime);
		while (!win)
			win = finder.waitToDisplay("partialName", "Window", ".gps*", 2);
		if (win) {
			Timer.startTimer();
			finder.getUIElement("name", "Button", "Save", maxTime).click();
			Timer.stopTimer("Save process Editor");
		} else {
			finder.getUIElement("name", "Button", "Save", maxTime).click();
			Timer.waitTime(1000);
		}
		action.shortcut("Control", "Q");
		boolean homeWin = finder.waitToDisplay("partialName", "Window", "Epiplex500", 2);
		while (!homeWin)
			homeWin = finder.waitToDisplay("partialName", "Window", "Epiplex500", 2);
		log.info("process Editor file" + fileName + " Save is completed");
		Application.closeApplication(epiplexPath);
		log.info("epiplex Application closed successfuly");

	}

	/**
	 * This method will generate different documents in developer editor and it will
	 * log data on that time
	 * 
	 * @param fileName
	 * @param testCaseName
	 */
	public static void generateDocument(String fileName, String testCaseName) {
		log.info(testCaseName + " started");
		driver.setRootSearch(false);
		action.focusWindow("Developer Editor - [");
		finder.getUIElement("name", "MENUITEM", "File", waitTime).click();
		finder.getUIElement("name", "MENUITEM", "Generate Document...", waitTime).click();
		action.focusWindow("Generate Document");
		finder.getUIElement("name", "BUTTON", "Settings", waitTime).click();
		finder.getUIElement("name", "MENUITEM", "Load Settings...", waitTime).click();
		action.focusWindow("Open");
		finder.getUIElement("name", "EDIT", "File name:", waitTime).click();
		finder.getUIElement("name", "EDIT", "File name:", waitTime).write(fileName);
		action.shortcut("Enter");
		action.focusWindow("Generate Document");
		finder.getUIElement("name", "BUTTON", "Generate", waitTime).click();
		boolean status = finder.waitToDisplay("partialName", "Text",
				"The following file already exists do you want to replace it?", waitTime);
		if (status) {
			action.focusWindow("Developer Editor");
			finder.getUIElement("name", "BUTTON", "Yes", waitTime).click();
		}
		Timer.waitTime(2000);
		boolean popupA4 = finder.waitToDisplay("IMAGE", "SCREEN", "A4", waitTime);
		if (popupA4) {
			action.focusWindow("Developer Editor");
			finder.getUIElement("name", "BUTTON", "Yes", waitTime).click();
			;
		}
		Timer.startTimer();
		action.focusWindow("Developer Editor");
		// boolean launch = finder.waitToDisplay("IMAGE", "SCREEN", "launchDocument",
		// maxTime);
		boolean launch = finder.waitToDisplay("partialName", "Text", "Do you want to launch the generated document?",
				waitTime);
		while (!launch) {
			launch = finder.waitToDisplay("IMAGE", "SCREEN", "launchDocument", waitTime);
			// launch = finder.waitToDisplay("partialName", "Text", "Do you want to launch
			// the generated document?",waitTime);
		}
		System.out.println(launch);
		Timer.stopTimer(testCaseName);
		action.focusWindow("Developer Editor");
		finder.getUIElement("name", "Button", "No", maxTime).click();
		driver.setRootSearch(true);
		log.info(testCaseName + " completed");
	}

	/**
	 * This method will generate simulations in developer editor and it will log
	 * data on that time
	 * 
	 * @param fileName
	 * @param testCaseName
	 */
	public static void generateSimulation(String fileName, String testCaseName) {
		log.info(testCaseName + " started...");
		driver.setRootSearch(false);
		action.focusWindow("Developer Editor - [");
		finder.getUIElement("name", "MENUITEM", "File", waitTime).click();
		finder.getUIElement("name", "MENUITEM", "Generate Simulation...", waitTime).click();
		action.focusWindow("Simulation Wizard");
		finder.getUIElement("name", "BUTTON", "Settings", waitTime).click();
		finder.getUIElement("name", "MENUITEM", "Load Settings...", waitTime).click();
		action.focusWindow("Open");
		finder.getUIElement("name", "EDIT", "File name:", waitTime).click();
		finder.getUIElement("name", "EDIT", "File name:", waitTime).write(fileName);
		action.shortcut("Enter");
		action.focusWindow("Simulation Wizard");
		finder.getUIElement("name", "BUTTON", "Generate", waitTime).click();
		boolean status = finder.waitToDisplay("partialName", "Text",
				"The following file already exists do you want to replace it?", 5);
		if (status) {
			action.focusWindow("Developer Editor");
			finder.getUIElement("name", "BUTTON", "Yes", waitTime).click();
		}
		Timer.startTimer();
		finder.waitToDisplay("IMAGE", "SCREEN", "launchSimulation", maxTime);
		Timer.stopTimer(testCaseName);
		action.focusWindow("Developer Editor");
		boolean win = finder.waitToDisplay("name", "TEXT",
				"Simulation Generated successfully. Would you like to launch it?", maxTime);
		while (!win) {
			win = finder.waitToDisplay("name", "TEXT",
					"Simulation Generated successfully. Would you like to launch it?", maxTime);
		}
		finder.getUIElement("name", "BUTTON", "No", waitTime).click();
		driver.setRootSearch(true);
		log.info(testCaseName + " completed");
	}

	/**
	 * This method will generate cue card in developer editor and it will log data
	 * on that time
	 * 
	 * @param fileName
	 * @param testCaseName
	 */
	public static void generateCueCard(String fileName, String testCaseName) {
		log.info(testCaseName + " started");
		driver.setRootSearch(false);
		action.focusWindow("Developer Editor - [");
		finder.getUIElement("name", "MENUITEM", "File", waitTime).click();
		finder.getUIElement("name", "MENUITEM", "Generate Cue card...", waitTime).click();
		action.focusWindow("Cue card Wizard");
		finder.getUIElement("name", "BUTTON", "Settings", waitTime).click();
		finder.getUIElement("name", "MENUITEM", "Load Settings...", waitTime).click();
		action.focusWindow("Open");
		finder.getUIElement("name", "EDIT", "File name:", waitTime).click();
		finder.getUIElement("name", "EDIT", "File name:", waitTime).write(fileName);
		action.shortcut("Enter");
		action.focusWindow("Cue card Wizard");
		finder.getUIElement("name", "BUTTON", "Generate", waitTime).click();
		boolean status = finder.waitToDisplay("partialName", "Text",
				"The following file already exists do you want to replace it?", 5);
		if (status) {
			action.focusWindow("Developer Editor");
			finder.getUIElement("name", "BUTTON", "Yes", waitTime).click();
		}
		Timer.startTimer();
		finder.waitToDisplay("IMAGE", "SCREEN", "launchCueCard", maxTime);
		Timer.stopTimer(testCaseName);
		action.focusWindow("Developer Editor");
		boolean okButton = finder.waitToDisplay("name", "Text", "Live Cuecard generated successfully.", maxTime);
		while (!okButton) {
			okButton = finder.waitToDisplay("name", "Text", "Live Cuecard generated successfully.", maxTime);
		}

		finder.getUIElement("name", "BUTTON", "OK", waitTime).click();
		driver.setRootSearch(true);
		log.info(testCaseName + " completed");
	}

	public static void generateDocumentPerformance(String DocName) {
		DocName = DocName.toLowerCase();
		switch (DocName) {
		case "html_brd":
			generateDocument("HTML_BRD.dws", "Generate HTML_BRD");
			break;
		case "html_4img":
			generateDocument("HTML_4img.dws", "Generate HTML_4img");
			break;
		case "word_brd":
			generateDocument("Word_BRD.dws", "Generate Word_BRD");
			break;
		case "word_4img":
			generateDocument("Word_4img.dws", "Generate Word_4img");
			break;
		case "excel_brd":
			generateDocument("Excel_BRD.dws", "Generate Excel_BRD");
			break;
		case "excel_dump":
			generateDocument("Excel_Dump.dws", "Generate Excel_Dump");
			break;
		case "simulation_mb1":
			generateSimulation("Simulation_MB1.ews", "Generate Simulation_MB1");
			break;
		case "live_cuecard":
			generateCueCard("Live_cuecard.cws", "Generate Live_cuecard");
			break;

		default:
			System.err.println("you passed invalid doc name");
			log.info("you passed invalid doc name");
			break;
		}
		action.focusWindow("Developer Editor");
//		String developerEditorPath = Settings.EPIPLEX500_PATH.replace("epiplex.exe", "epiSimDoc_Editor.exe");
//		Timer.startTimer();
//		Application.closeApplication(developerEditorPath);
//		Timer.stopTimer("Exit developer editor");
//		Application.closeApplication(epiplexPath);
		log.info("PerformanceTest completed");

	}

	/**
	 * This method will do document files performance Testing
	 * 
	 * @param captureFileName
	 */
	public static  void performanceTestDoc(String captureFileName) {
		log.info("PerformanceTest started on " + captureFileName);
		finalizeFromHome(captureFileName);
		generateDocument("HTML_BRD.dws", "Generate HTML_BRD");
		generateDocument("HTML_4img.dws", "Generate HTML_4img");
		generateDocument("Word_BRD.dws", "Generate Word_BRD");
		generateDocument("Word_4img.dws", "Generate Word_4img");
		generateDocument("Excel_BRD.dws", "Generate Excel_BRD");
		generateDocument("Excel_Dump.dws", "Generate Excel_Dump");
		generateSimulation("Simulation_MB1.ews", "Generate Simulation_MB1");
		generateCueCard("Live_cuecard.cws", "Generate Live_cuecard");
		action.focusWindow("Developer Editor");
		String developerEditorPath = Settings.EPIPLEX500_PATH.replace("epiplex.exe", "epiSimDoc_Editor.exe");
		Timer.startTimer();
		Application.closeApplication(developerEditorPath);
		Timer.stopTimer("Exit developer editor");
		Application.closeApplication(epiplexPath);
		log.info("PerformanceTest completed on " + captureFileName);
	}
}
