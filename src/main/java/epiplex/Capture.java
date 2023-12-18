package epiplex;

import org.sikuli.script.FindFailed;
import org.sikuli.script.Region;
import org.sikuli.script.Screen;

import actions.ElementFinder;
import actions.Keyboard;
import core.Application;
import core.Driver;
import utils.ProjectConfiguration;
import utils.Settings;
import utils.Timer;
import utils.XML_Library;

public class Capture {

	static String epiplexPath = "Epiplex";
	static long waitTime = Settings.FIND_WAIT;
	static Driver driver = new Driver();
	static XML_Library xml_Lib = new XML_Library();
	static ElementFinder finder = new ElementFinder(driver);

	/**
	 * This method will start capture with given capture file name
	 * 
	 * @param fileName
	 */
	public static void startCapture(String fileName) {
		try {
			new XML_Library().updateSettings(true);
			Application.launchApplication(epiplexPath);
			finder.waitToDisplay("name", "WINDOW", "Epiplex500", waitTime);
			Timer.waitTime(1500);
			finder.getWindow("Epiplex500", waitTime).setFocus();
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

			boolean popUp = finder.waitToDisplay("name", "Window", "Epiplex500 Capture", waitTime);
			if (popUp) {
				finder.getElement("name", "BUTTON", "OK", waitTime).click();
			}

			boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
			while (!status) {
				status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
			}

			System.out.println("Capture Started");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * This method will start capture with given mode in manual capture mode
	 * 
	 * @param fileName
	 */
	public static void startCaptureManual(String fileName) {
		try {
			new XML_Library().updateSettings(true);
			Application.launchApplication(epiplexPath);
			finder.waitToDisplay("name", "WINDOW", "Epiplex500", waitTime);
			Timer.waitTime(1500);
			finder.getWindow("Epiplex500", waitTime).setFocus();
			finder.getElement("name", "EDIT", "Enter a new file name or select from the list", waitTime).click();
			finder.getElement("name", "EDIT", "Enter a new file name or select from the list", waitTime)
					.write(fileName);
			finder.getElement("name", "BUTTON", "Start Capture", waitTime).click();
		} catch (Exception e) {
			e.printStackTrace();
		}

		boolean fileOverWritePopup = finder.waitToDisplay("name", "Text",
				"File already exists. Do you want to overwrite?", 3);
		if (fileOverWritePopup) {
			finder.getElement("name", "BUTTON", "Yes", waitTime).click();
		} else {
			boolean pending = finder.waitToDisplay("name", "Text",
					"File Name specified is pending to recover and save." + " Do you want to overwrite the file?", 3);
			if (pending)
				finder.getElement("name", "BUTTON", "Yes", waitTime).click();
		}

		boolean security = finder.waitToDisplay("partialName", "Text", "Data Security Confirmation...", 3);
		if (security)
			finder.getElement("name", "BUTTON", "Yes", waitTime).click();

		boolean popUp = finder.waitToDisplay("name", "Window", "Epiplex500 Capture", waitTime);
		if (popUp) {
			finder.getElement("name", "BUTTON", "OK", waitTime).click();
		}

		boolean status = finder.waitToDisplay("partialName", "Button", "start manual capture", waitTime);
		while (!status) {
			status = finder.waitToDisplay("partialName", "Button", "start manual capture", waitTime);
		}
		System.out.println("Capture Started");
	}

	/**
	 * This method will cancel capture
	 */
	public static void cancelCapture() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			finder.getElement("name", "MENUITEM", "Cancel", waitTime).clickCenter();
			finder.getElement("name", "BUTTON", "Yes", waitTime).click();
		}
	}

	/***
	 * Save the running Capture.
	 */
	public static void saveCapture() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Save", waitTime).clickCenter();

			boolean popUp = finder.waitToDisplay("name", "Window", "Properties", waitTime);
			System.out.println(popUp);
			if (popUp) {
				finder.getElement("name", "BUTTON", "Save", waitTime).clickCenter();
			}

			status = false;
			while (!status) {
				status = finder.waitToVanish("name", "Window", "Saving capture file", 5);
			}

			finder.waitToDisplay("name", "Window", "Epiplex500", waitTime);
			finder.getWindow("Epiplex500", waitTime).setFocus();
			finder.getElement("name", "BUTTON", "OK", waitTime).clickCenter();
			finder.getElement("name", "BUTTON", "No", waitTime).clickCenter();
			Application.closeApplication(epiplexPath);
		}
	}

	/**
	 * This method will add note while doing capture
	 */
	public static void addNote() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Add Note", waitTime).clickCenter();
			finder.waitToDisplay("name", "Window", "Epiplex500 Capture  - Add Note", waitTime);
			finder.getWindow("Epiplex500 Capture  - Add Note", waitTime).setFocus();
			Keyboard.type("Step Note added while capturing");
			finder.getElement("id", "Button", "tsmiAttach", waitTime).clickCenter();
			finder.getWindow("Select The Audio File", waitTime).setFocus();
			finder.getElement("name", "SplitButton", "All locations", waitTime).clickCenter();
			Keyboard.paste(ProjectConfiguration.base_Files.getAbsolutePath());
			Keyboard.specialKeyPress("ENTER");
			finder.getElement("name", "Edit", "File name:", waitTime).write("Step.mp3");
			Keyboard.specialKeyPress("ENTER");
			finder.getElement("name", "Button", "OK", waitTime).clickCenter();
		}
	}

	/**
	 * This method will add validation while doing capture
	 */
	public static void addValidations() {
		String condition = "Alphabets Only";// Numeric Only
		String attachTo = "Current Step";
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Add Validations & Prerequisites", waitTime).clickCenter();
			finder.getWindow("Validations and Prerequisites", waitTime).setFocus();
			finder.getElement("id", "COMBOBOX", "cmb_condition", waitTime).clickCenter();
			Keyboard.type(condition);
			finder.getElement("name", "TEXT", condition, waitTime).clickCenter();
			finder.getElement("id", "COMBOBOX", "cmd_attch_to", waitTime).clickCenter();
			Keyboard.type(attachTo);
			finder.getElement("name", "TEXT", attachTo, waitTime).clickCenter();
			finder.getElement("name", "BUTTON", "Resume Capture", waitTime).clickCenter();
		}
	}

	/**
	 * This method will add exception while doing capture
	 */
	public static void addException() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Add Exception", waitTime).clickCenter();
			finder.getElement("name", "TEXT", "Enter the exception description here.", waitTime)
					.write("Exception Added");
			finder.getElement("name", "BUTTON", "Recover Exception", waitTime).clickCenter();
		}
	}

	/**
	 * This method will stop recovery when we started exception
	 */
	public static void exceptionRecoveryStop() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Recovery Stop", waitTime).clickCenter();
		}
	}

	/**
	 * This method will add input data while doing capture
	 */
	public static void addInputData() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Add Input Data", waitTime).clickCenter();
			finder.getWindow("Input Data Points", waitTime).setFocus();
			finder.getElement("name", "TEXT", "Datapoint_1", waitTime).write("Test Data_1");
			finder.getElement("name", "BUTTON", "Resume Capture", waitTime).clickCenter();
		}
	}

	/**
	 * This method will add screen video while doing capture
	 */
	public static void addScreenVideo() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Start Screen Video", waitTime).clickCenter();
			status = finder.waitToDisplay("partialName", "Button", "Screen Video on", waitTime);
			if (status)
				System.out.println("screen video stated");
			else
				Timer.waitTime(1000);
		}
	}

	/**
	 * This method will add audio while doing capture
	 */
	public static void addAudio() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Start Audio", waitTime).clickCenter();
			status = finder.waitToDisplay("partialName", "Button", "Audio on", waitTime);
			if (status)
				System.out.println("Audio Record stated");
			else
				Timer.waitTime(1000);
		}
	}

	/**
	 * This method will stop screen video while doing capture
	 */
	public static void stopScreenVideo() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Screen Video on", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Screen Video on", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Stop Screen Video", waitTime).clickCenter();
			new Screen().getCenter().click();
			status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
			if (status)
				System.out.println("screen video ended");
			else
				Timer.waitTime(1000);
		}
	}

	/**
	 * This method will stop audio while doing capture
	 */
	public static void stopAudio() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Audio on", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Audio on", waitTime).clickCenter();
			Timer.waitTime(1000);
			Region region = finder.getElement("name", "ToolBar", "DropDown", waitTime).getRegion();
			try {
				region.findT("Stop Audio").click();
			} catch (FindFailed e) {
				e.printStackTrace();
			}
			new Screen().getCenter().click();
			status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
			if (status)
				System.out.println("screen video ended");
			else
				Timer.waitTime(1000);
		}
	}

	/**
	 * This method will add narration while doing capture
	 */
	public static void addNarration() {
		boolean status = finder.waitToDisplay("partialName", "Button", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "Button", "Capture in progress", waitTime).clickCenter();
			Timer.waitTime(1000);
			finder.getElement("name", "MENUITEM", "Add Narration", waitTime).clickCenter();
			finder.getElement("id", "BUTTON", "BtnAutoRegions", waitTime).clickCenter();
			finder.getElement("name", "EDIT", "Partner Name", waitTime).clickCenter();
			finder.getElement("name", "EDIT", "Partner Name", waitTime).doubleClick();
			Keyboard.type("Narration added");
			finder.getElement("id", "BUTTON", "BtnResumeCapture", waitTime).clickCenter();
			finder.getElement("id", "BUTTON", "BtnResumeCapture", waitTime).clickCenter();
		}
	}
}
