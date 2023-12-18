package core;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.sikuli.script.App;
import mmarquee.automation.AutomationException;
import mmarquee.automation.Element;
import mmarquee.automation.UIAutomation;
import mmarquee.automation.pattern.PatternNotFoundException;
import mmarquee.automation.pattern.Window;
import utils.Timer;

/**
 * This class consists of application launch and close methods
 * 
 * @author Dhanush
 *
 */
public class Application {

	public static List<String> applicationPaths = new ArrayList<>();
	public static HashMap<String, String> apps = new HashMap<>();
	static Driver driver = new Driver();

	private static final Logger log = LogManager.getLogger(Application.class);

	/***
	 * Launch application with given app name
	 * 
	 * @param applicationPath
	 * @throws AutomationException
	 * @throws PatternNotFoundException
	 */
	public static void launchApplication(String applicationPath) {
		try {
			applicationPath = apps.get(applicationPath.toUpperCase());
			log.info(applicationPath + " is launching...");

			App application = new App(applicationPath);
			if (applicationPath.contains("msedge"))
				open(applicationPath);
			if (!application.isRunning())
				application.open();
			Timer.waitTime(2000);
			application.focus();
			String title = application.getTitle().trim();
			maximize(title);
			applicationPaths.add(applicationPath);
			log.info(applicationPath + " is launched");
		} catch (Exception e) {
		}
	}

	/***
	 * Close application with given app name.
	 * 
	 * @param applicationPath
	 */
	public static void closeApplication(String applicationPath) {
		log.info(applicationPath + " is closing...");

		applicationPath = apps.get(applicationPath.toUpperCase());

		App application = new App(applicationPath);
		application.close();
		if (!applicationPath.contains("exe"))
			close(applicationPath);

		if (application.isClosing()) {
			Timer.waitTime(1000);
		}

		log.info(applicationPath + " is closed.");
	}

	public static void closeAllApps() {
		log.info("closeAllApps is started...");
		for (String path : applicationPaths) {
			App.close(path);
		}
		log.info("closeAllApps is completed...");
	}

	/**
	 * This method will check is this application closed or not
	 * 
	 * @param applicationPath
	 * @return
	 */
	public static boolean isClosed(String applicationPath) {
		applicationPath = apps.get(applicationPath.toUpperCase());
		App application = new App(applicationPath);
		return !application.isRunning();
	}

	private static void open(String cmd) {
		cmd = cmd.trim();
		System.err.println(cmd);
		try {
			Desktop.getDesktop().open(new File(cmd));
		} catch (IOException e) {
			log.error(cmd + " got error in exec");
		}
	}

	private static void maximize(String title) {
		title = title.trim();
		Element element = driver.getWindow(title);
		{
			try {
				Window win = new Window(element);
				if (win.getCanMaximize())
					win.maximize();
			} catch (AutomationException | NullPointerException e) {
				try {
					UIAutomation.getInstance().getDesktopObject(title).getButton("Maximize").click();
				} catch (AutomationException e1) {
				}
			}
		}
	}

	private static void close(String applicationPath) {
		App application = new App(applicationPath);
		{
			String title = application.getTitle().trim();
			System.err.println(title);
			Element element = driver.getWindow(title);
			try {
				Window win = new Window(element);
				if (win.getCanMaximize())
					win.close();
			} catch (AutomationException | NullPointerException e) {
			}
		}
	}
}
