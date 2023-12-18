package epiplex;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import actions.ElementFinder;
import core.Application;
import core.Driver;
import utils.ProjectConfiguration;
import utils.XML_Library;

public class RemoteClient {

	static int waitTime = 60;
	static Driver driver = new Driver();
	static XML_Library xml_Lib = new XML_Library();
	static ElementFinder finder = new ElementFinder(driver);
	static ProjectConfiguration config = new ProjectConfiguration();
	private static final Logger log = LogManager.getLogger(RemoteClient.class);

	/**
	 * This method will start the remote capture
	 * 
	 * @param path
	 */
	public static void startRecording(String path) {
		log.info("RC start initiated...");
		Application.launchApplication(path);
		finder.waitToDisplay("name", "BUTTON", "Remote Client", waitTime);
		finder.getElement("name", "BUTTON", "Remote Client", waitTime).rightClick();
		finder.getElement("name", "MENUITEM", "Start Recording", waitTime).click();
		finder.waitToDisplay("partialName", "BUTTON", "Capture in progress", waitTime);
		log.info("RC Started...");
	}

	/**
	 * This method will stop Remote capture
	 */
	public static void stopRecording() {
		log.info("RC Stop initiated...");
		boolean status = finder.waitToDisplay("partialName", "BUTTON", "Capture in progress", waitTime);
		if (status) {
			finder.getElement("partialName", "BUTTON", "Remote Client", waitTime).rightClick();
			finder.getElement("name", "MENUITEM", "Stop Recording", waitTime).click();
			finder.waitToVanish("partialName", "BUTTON", "Capture in progress", waitTime);
			finder.getElement("name", "BUTTON", "Remote Client", waitTime).rightClick();
			finder.getElement("name", "MENUITEM", "Exit", waitTime).click();
		}
		log.info("RC Stop completed...");
	}

}
