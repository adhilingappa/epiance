package actions;

import java.awt.AWTException;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import core.Application;
import core.Driver;
import mmarquee.automation.AutomationException;
import utils.ExecutionUtils;
import utils.ProjectConfiguration;
import utils.Settings;
import utils.Timer;

/**
 * This class consists of execution methods
 * 
 * @author Dhanush
 *
 */
public class TestcaseExecutor {

	private static final Logger log = LogManager.getLogger(TestcaseExecutor.class);
	static ProjectConfiguration config = new ProjectConfiguration();
	static ExecutionUtils executionUtil = new ExecutionUtils();
	static ActionMethods action = new ActionMethods(new Driver());
	private static List<String> workbookPaths;
	public static int stepDelay = 300;
	public static boolean retryFlag = true;

	/**
	 * From this point execution starts options has 3 arguments 1.SETUP,
	 * 2.VALIDATE,m 3.EXECUTE
	 * 
	 * @param args
	 * @throws IOException
	 * @throws AWTException
	 * @throws AutomationException
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void main(String[] args) throws IOException, AWTException, AutomationException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {

		String option = "EXECUTE" + "";
		runner(option);

	}

	/**
	 * This method will take 3 arguments 1.SETUP, 2.VALIDATE, 3.EXECUTE and do
	 * actions accordingly
	 * 
	 * @param option
	 * @throws IOException
	 * @throws AutomationException
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void runner(String option) throws IOException, AutomationException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {

		Keyboard.releaseAllKeys();

		switch (option.toUpperCase()) {

		case "SETUP":
			createProjectSetup();
			return;

		case "VALIDATE": {
			if (workbookPaths == null)
				createProjectSetup();

			validateExcelSheets(workbookPaths);
		}
			return;

		case "EXECUTE": {
			if (workbookPaths == null)
				createProjectSetup();

			boolean status = loadMethods(workbookPaths);
			startExecution(status);
			Keyboard.releaseAllKeys();
		}
			return;

		default:
			System.err.println("Invalid argument " + option);
			break;
		}
	}

	/**
	 * This method will create project setup like folder structure, loading
	 * settings, load excel sheet paths, update preference settings
	 * 
	 * @return
	 */
	public static boolean createProjectSetup() {
		log.info("createProjectSetup started...");
		config.folderConfig();
		boolean status = executionUtil.loadSettings();
		if (!status) {
			log.error("Settings has issue please check");
			return status;
		} else {
			config.reportConfig();
			workbookPaths = executionUtil.getExecutionWorkbooks();
			if (workbookPaths == null) {
				status = false;
				log.error("workbooks has issue please check");
				return status;
			}
		}

		String src_pref = ProjectConfiguration.base_Files.getAbsolutePath() + "\\Preferences";
		String dest_pref = Settings.REPO_PATH + "\\Preferences";
		copyPasteFile(src_pref, dest_pref);
		config.getScreenResolution();

		if (status)
			log.info("createProjectSetup completed.");
		else
			log.error("createProjectSetup failed.");
		return status;
	}

	private static void copyPasteFile(String srcPath, String destPath) {
		File source = new File(srcPath);
		File dest = new File(destPath);
		try {
			FileUtils.copyDirectory(source, dest);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * This method will validate excel sheet data, whether its method name and
	 * arguments are correct or not
	 * 
	 * @param workbookPaths
	 * @return
	 * @throws IOException
	 */
	public static boolean validateExcelSheets(List<String> workbookPaths) throws IOException {
		log.info("validateExcelSheets started...");
		boolean executionStatus = true;
		String fullClassName = "actions.ActionMethods";
		Method[] declaredMethods = executionUtil.getDeclaredMethods(fullClassName);
		boolean status = false;
		for (String workbookPath : workbookPaths) {
			status = executionUtil.validateWorkbookSteps(workbookPath, declaredMethods);
			if (!status)
				executionStatus = false;
		}
		log.info("validateExcelSheets completed.");
		return executionStatus;
	}

	/**
	 * This method will load methods and its arguments to a list for further
	 * execution
	 * 
	 * @param workbookPaths
	 * @return
	 * @throws IOException
	 */
	public static boolean loadMethods(List<String> workbookPaths) throws IOException {
		log.info("loadMethods started...");
		boolean executionStatus = true;
		String fullClassName = "actions.ActionMethods";
		Method[] declaredMethods = executionUtil.getDeclaredMethods(fullClassName);
		boolean status = false;
		for (String workbookPath : workbookPaths) {
			status = executionUtil.loadMethodsFromWorkbook(workbookPath, declaredMethods);
			if (!status)
				executionStatus = false;
		}
		log.info("loadMethods completed.");
		return executionStatus;
	}

	/**
	 * This method will validate a single sheet
	 * 
	 * @param workbookPath
	 * @return
	 * @throws IOException
	 */
	public static boolean validateExcelSheet(String workbookPath) throws IOException {
		String fullClassName = "actions.ActionMethods";
		Method[] declaredMethods = executionUtil.getDeclaredMethods(fullClassName);
		System.out.println("Declared Methods :- " + declaredMethods.length);
		boolean status = executionUtil.validateWorkbookSteps(workbookPath, declaredMethods);

		return status;
	}

	/**
	 * This method will update old sheets to new format (No longer needed)
	 * 
	 * @param sheetPath
	 */
	public void updateSheet(String sheetPath) {
		String fullClassName = "utils.KeyWords";
		Method[] declaredMethods = executionUtil.getDeclaredMethods(fullClassName);
		executionUtil.writeNewWorkbook(sheetPath, declaredMethods);
	}

	/**
	 * This method will do execution part like it will check files the gather the
	 * methods and arguments then invoke method with arguments using reflection
	 * 
	 * @param sheetStatus
	 */
	private static void startExecution(boolean sheetStatus) {
		if (sheetStatus) {
			config.checkFiles();
			log.info("startExecution started...");
			List<Method> methods = executionUtil.getMethods();
			List<Object[]> arguments = executionUtil.getArgumentObjects();

			int length = methods.size();
			String logString = "";
			for (int i = 0; i < length; i++) {
				try {

					int len = arguments.get(i).length;
					for (int itr = 0; itr < len; itr++) {
						logString = logString + " - " + arguments.get(i)[itr];
					}

					invoker(methods.get(i), arguments.get(i), logString);
					logString = "";
				} catch (Exception e) {
					action.logResult(false);
					ActionMethods.reportLogger.info(config
							.getFailMarkUp(methods.get(i).getName() + " - " + logString + " action thrown exception."));
					break;
				}
				Timer.waitTime(stepDelay);
			}

			action.closeReportLogger();
			log.info("startExecution completed.");
			action.renameFile();
			log.info("Close all Application started...");
			Application.closeAllApps();
			log.info("Close all Application completed.");
			Application.applicationPaths.clear();
		}
	}

	private static void invoker(Method method, Object[] arguments, String logString) {
		try {
			method.invoke(action, arguments);
			if (retryFlag) {
				retryEvent(method, arguments, logString);
			}
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e1) {
			throw new RuntimeException();
		}
	}

	private static void retryEvent(Method method, Object[] arguments, String logString)
			throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		if (ActionMethods.eventStatus == false) {
			ActionMethods.reportLogger
					.info(config.getRetryMarkUp(method.getName() + " - " + logString + " action retried."));

			long temp = Settings.FIND_WAIT;
			if (Settings.FIND_WAIT > 5) {
				Settings.FIND_WAIT = 5;
			}
			method.invoke(action, arguments);
			Settings.FIND_WAIT = temp;
		}
	}

}
