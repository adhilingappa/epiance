package utils;

import java.awt.Toolkit;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.markuputils.ExtentColor;
import com.aventstack.extentreports.markuputils.Markup;
import com.aventstack.extentreports.markuputils.MarkupHelper;
import com.aventstack.extentreports.reporter.ExtentHtmlReporter;
import com.aventstack.extentreports.reporter.configuration.Theme;

import core.UIElement;

/**
 * ProjectConfiguration class with provide folder configuration and Report
 * Configuration methods
 * 
 * @author Dhanush
 *
 */
public class ProjectConfiguration {

	public static ExtentReports extentReporter;
	public static ExtentHtmlReporter htmlReporter;
	public static File CaptureImages = new File("Capture Images");
	public static File reportFolder = new File("Report");
	public static File sikuliImages = new File("Sikuli-Images");
	private File screenshotFolder = new File("Screenshots");
	public static File excelHolder = new File("ExcelHolder");
	public File transformedGPS = new File("TransformedGPS");
	public static File base_Files = new File("Base-Files");
	public static File finalize_path = new File("Finalized");
	private File logs = new File("Logs");
	public File config = new File("config");
	public static String reportPath = reportFolder.getAbsolutePath();
	public static String sikuliImageBasePath = sikuliImages.getAbsolutePath();
	public static String mainWorkbookPath = excelHolder.getAbsolutePath() + "\\main.xlsx";
	private static final Logger log = LogManager.getLogger(ProjectConfiguration.class);

	/**
	 * create folder if not exists
	 * 
	 * @param folder
	 * @return
	 */
	private boolean createFolder(File folder) {
		if (!folder.exists()) {
			folder.mkdir();
			log.info(folder.getName() + " Folder Created Successfully");
			return true;
		} else {
			log.info(folder.getName() + " Folder Already exists...!");
			return false;
		}
	}

	/**
	 * Clean the the folder contents
	 * 
	 * @param folder
	 * @return
	 */
	private boolean cleanFolder(File folder) {
		if (folder.exists()) {
			try {
				FileUtils.cleanDirectory(folder);
			} catch (IOException e) {
				log.error("Exception in cleanFolder :- " + e.getMessage());
			}
			log.info(folder.getName() + " Folder Cleaned Successfully");
			return true;
		} else {
			log.info(folder.getName() + " Folder Doesn't exists...!");
			return false;
		}
	}

//	private List<String> loadXLSPaths() {
//		List<String> xlsPaths = new ArrayList<>();
//		File[] configFiles;
//		if (config.isDirectory()) {
//			configFiles = config.listFiles();
//			for (File file : configFiles) {
//				xlsPaths.add(file.getName());
//			}
//		}
//		return xlsPaths;
//	}

	public Boolean copyPasteFile(String srcPath, String destPath) {
		log.info("Copy Paste File started");
		boolean res = true;
		File source = new File(srcPath);
		File dest = new File(destPath);
		try {
			FileUtils.copyDirectory(source, dest);
		} catch (IOException e) {
			e.printStackTrace();
			res = false;
		}
		log.info("file is copied from" + srcPath + " to " + destPath);
		return res;

	}

	public void renameFile() {
		log.info("Rename report File started");
		String filePath;
		String newFileName;
		try {
			filePath = reportPath + "\\Automation_Report.html";
			newFileName = reportPath + "\\" + System.currentTimeMillis() / 60000 + "_Report.html";
			File oldFile = new File(filePath);
			File newFile = new File(newFileName);
			oldFile.renameTo(newFile);
		} catch (Exception e) {
			log.error("Error in Rename File");
			throw e;
		}
		log.info("Rename report File Completed");

	}

	public void getScreenResolution() {

		Toolkit toolkit = Toolkit.getDefaultToolkit();
		double screenResolution = toolkit.getScreenResolution() / 96.0;
		int scale = (int) (screenResolution * 100.0);
		UIElement.scale = scale;

	}

	/**
	 * Creates Required folder for project
	 */
	public void folderConfig() {
		createFolder(logs);
		log.info("CleanFolders Started");
		cleanFolder(screenshotFolder);
		cleanFolder(transformedGPS);
		log.info("CleanFolders Completed");

		log.info("Folders Creation Started");
		createFolder(reportFolder);
		createFolder(CaptureImages);
		createFolder(screenshotFolder);
		createFolder(sikuliImages);
		createFolder(excelHolder);
		createFolder(transformedGPS);
		createFolder(base_Files);
		createFolder(config);

		log.info("Folders Creation Completed");

	}

	/**
	 * This method will check if any missing files in project
	 */
	public void checkFiles() {
		File[] files = { excelHolder, base_Files, config };
		for (File file : files) {
			if (file.listFiles().length == 0)
				throw new RuntimeException(file.getName() + " Files missing");
		}
	}

	/**
	 * Report Configuration
	 */
	public void reportConfig() {
		folderConfig();
		log.info("Report Setup Started");
		htmlReporter = new ExtentHtmlReporter(reportPath + "\\Automation_Report.html");
		extentReporter = new ExtentReports();
		extentReporter.attachReporter(htmlReporter);
		htmlReporter.config().setEncoding("utf-8");
		htmlReporter.config().setDocumentTitle(Settings.REPORT_TITLE);
		htmlReporter.config().setReportName(Settings.REPORT_NAME);
		htmlReporter.config().setTheme(Theme.STANDARD);
		extentReporter.setSystemInfo("Organization", "Epiance Software");
		extentReporter.setSystemInfo("Build No", Settings.BUILD_NO);
		extentReporter.setSystemInfo("Hotfix Id", Settings.HOTFIX_ID);
		extentReporter.setSystemInfo("Patch Info", Settings.PATCH_INFO);
		extentReporter.setSystemInfo("UPGRADE_FROM", Settings.UPGRADE_FROM);
		extentReporter.setSystemInfo("Build By", Settings.BUILD_BY);
		extentReporter.setSystemInfo("Automation Tester", "Adhilingappa M");
		log.info("Report Setup Completed");
	}

	/**
	 * This method return pass Mark up
	 * 
	 * @param log
	 * @return
	 */
	public Markup getPassMarkUp(String log) {
		return MarkupHelper.createLabel(log, ExtentColor.GREEN);
	}

	/**
	 * This method return fail Mark up
	 * 
	 * @param log
	 * @return
	 */
	public Markup getFailMarkUp(String log) {
		return MarkupHelper.createLabel(log, ExtentColor.RED);
	}

	/**
	 * This method return retry Mark up
	 * 
	 * @param log
	 * @return
	 */
	public Markup getRetryMarkUp(String log) {
		return MarkupHelper.createLabel(log, ExtentColor.ORANGE);
	}

	/**
	 * Close Report Object creates HTML Report
	 */
	public void reportFlush() {
		extentReporter.flush();
		log.info("Report Logging Closed");
	}
}
