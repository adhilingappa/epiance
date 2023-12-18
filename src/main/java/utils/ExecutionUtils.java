package utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import core.Application;

public class ExecutionUtils {

	private static final Logger log = LogManager.getLogger(ExecutionUtils.class);
	private static List<Sheet> sheets = new ArrayList<Sheet>();
	private ExcelLibrary excelLibrary = new ExcelLibrary();

	private List<Method> methods = new ArrayList<>();
	private List<Object[]> arguments = new ArrayList<>();

	/**
	 * This method will return workbooks paths which need to execute
	 * 
	 * @return
	 */
	public List<String> getExecutionWorkbooks() {
		log.info("Get execution sheets started");
		List<String> workbookPaths = new ArrayList<>();
		String excelHolderPath = ProjectConfiguration.excelHolder.getAbsolutePath();
		String mainWorkbookPath = excelHolderPath + "\\main.xlsx";
		Workbook mainWorkbook = ExcelLibrary.getWorkbook(mainWorkbookPath);
		Sheet workbooksSheet = mainWorkbook.getSheet("workbooks");
		int max_rows = workbooksSheet.getPhysicalNumberOfRows();
		for (int row = 1; row < max_rows; row++) {
			String path = ExcelLibrary.readCell(workbooksSheet, row, 0);
			path = Settings.FINALIZE_PATH + "\\" + path;

			if (path == null & row < max_rows - 1) {
				System.err.println("workbookPath is null");
				workbookPaths = null;
				return workbookPaths;
			} else
				workbookPaths.add(path);
		}
		log.info("Get execution sheets completed");

		return workbookPaths;
	}

	/**
	 * This method will load application paths to a list
	 * 
	 * @param workbook
	 * @return
	 */
	public boolean loadApps(Workbook workbook) {
		boolean status = true;
		Sheet appSheet = workbook.getSheet("Apps");
		int max_rows = appSheet.getLastRowNum();
		for (int row = 1; row <= max_rows; row++) {
			String appName = ExcelLibrary.readCell(appSheet, row, 0);
			String path = ExcelLibrary.readCell(appSheet, row, 1);
			if (appName == null | path == null & row < max_rows - 1) {
				System.err.println(appName + " - " + path + " Has issue");
				log.error(appName + " - " + path + " Has issue");
				status = false;
			} else {
				Application.apps.put(appName.toUpperCase(), path);
			}
		}
		System.err.println(Settings.PRODUCT_BIN_PATH);
		Application.apps.put("PROCESS EDITOR", Settings.PRODUCT_BIN_PATH + "\\ProcessEditor.exe");
		Application.apps.put("EPIPLEX".toUpperCase(), Settings.PRODUCT_BIN_PATH + "\\epiplex.exe");
		Application.apps.put("EPISIMDOC", Settings.PRODUCT_BIN_PATH + "\\epiSimDoc_Editor.exe");
		Application.apps.put("PROJECT EDITOR", Settings.PRODUCT_BIN_PATH + "\\ProjectEditorLauncher.exe");
		Application.apps.put("PRESENTATION EDITOR", Settings.PRODUCT_BIN_PATH + "\\epiplexPresentationEditor.exe");
		Application.apps.put("WORKFLOW", Settings.PRODUCT_BIN_PATH + "\\WorkflowLauncher.exe");
		Application.apps.put("ASSESSMENT", Settings.PRODUCT_BIN_PATH + "\\epiAssessment.exe");
		Application.apps.put("CONTEXTMAP", Settings.PRODUCT_BIN_PATH + "\\IDTDeveloper.exe");

		return status;
	}

	/**
	 * This method will load settings to a list
	 * 
	 * @return
	 */
	public boolean loadSettings() {
		boolean status = true;
		log.info("loadSettings started");
		File mainExcel = new File(ProjectConfiguration.mainWorkbookPath);
		if (!mainExcel.exists())
			createMainExcel(ProjectConfiguration.mainWorkbookPath);
		Timer.waitTime(1000);
		Workbook mainWorkbook = ExcelLibrary.getWorkbook(ProjectConfiguration.mainWorkbookPath);
		Sheet settingsSheet = mainWorkbook.getSheet("settings");
		int max_rows = settingsSheet.getLastRowNum();
		for (int row = 1; row <= max_rows; row++) {
			String key = ExcelLibrary.readCell(settingsSheet, row, 0);
			String value = ExcelLibrary.readCell(settingsSheet, row, 1);
			if (key == null | value == null & row < max_rows - 1) {
				System.err.println(key + " - " + value + " Has issue");
				log.error(key + " - " + value + " Has issue");
				status = false;
			} else
				switch (key.toUpperCase()) {
				case "MAIL_ID":
					Settings.MAIL_ID = value;
					break;

				case "MAIL_PASSWORD":
					Settings.MAIL_PASSWORD = value;
					break;

				case "BUILD_NO":
					Settings.BUILD_NO = value;
					break;

				case "HOTFIX_ID":
					Settings.HOTFIX_ID = value;
					break;

				case "PATCH_INFO":
					Settings.PATCH_INFO = value;
					break;

				case "UPGRADE_FROM":
					Settings.UPGRADE_FROM = value;
					break;

				case "BUILD_BY":
					Settings.BUILD_BY = value;
					break;

				case "REPORT_TITLE":
					Settings.REPORT_TITLE = value;
					break;

				case "REPORT_NAME":
					Settings.REPORT_NAME = value;
					break;

				case "REPO_PATH":
					Settings.REPO_PATH = value;
					break;

				case "EPIPLEX500_PATH":
					Settings.EPIPLEX500_PATH = value;
					break;

				case "FIND_WAIT":
					Settings.FIND_WAIT = Long.parseLong(value);
					break;

				case "MAX_WAIT":
					Settings.MAX_WAIT = Long.parseLong(value);
					break;

				case "SCALE":
					Settings.SCALE = Integer.parseInt(value);
					break;

				case "PROGRAM_DATA_PATH":
					Settings.PROGRAM_DATA_PATH = value;
					break;

				case "PRODUCT_BIN_PATH":
					Settings.PRODUCT_BIN_PATH = value;
					break;

				default: {
					System.err.println(key + " - is invalid");
					log.error(key + " - is invalid");
					status = false;
				}
					break;
				}
		}
		status = loadApps(mainWorkbook);
		if (!status)
			return status;
		log.info("loadSettings completed");
		return status;
	}

	/**
	 * this method will load the all xml paths
	 * 
	 * @author Adhilingappa
	 */
	public static void loadXmlPaths() {
		log.info("Load XML paths started..");
		Workbook mainWorkbook = ExcelLibrary.getWorkbook(ProjectConfiguration.mainWorkbookPath);
		Sheet xmlPathSheet = mainWorkbook.getSheet("XMLPATHS");
		int maxRows = xmlPathSheet.getLastRowNum();
		for (int row = 1; row <= maxRows; row++) {
			String key = ExcelLibrary.readCell(xmlPathSheet, row, 0);
			String value = ExcelLibrary.readCell(xmlPathSheet, row, 1);
			if (key == null | value == null & row < maxRows - 1) {
				System.err.println(key + " - " + value + " has issue");
				log.error(key + " - " + value + " has issue");
				return;
			} else
				XMLPATHS.xmls.put(key, value);

			String[] paths = value.split("_");
			int dash = value.indexOf('_');
			paths[1] = value.substring(dash + 1);

			if (paths[0].toUpperCase().startsWith("PROGRAMDATA")) {
				value = Settings.PROGRAM_DATA_PATH + "\\" + paths[1];
			} else if (paths[0].toUpperCase().startsWith("REPOPATH")) {
				value = Settings.REPO_PATH + "\\" + paths[1];
			}
			switch (key.toUpperCase()) {
			case "EPISIMDOC_EDITOR":
				XMLPATHS.epiSimDoc = value;
				break;
			case "NEWCAPTUREPREFERENCE":
				XMLPATHS.newCapturePreference = value;
				break;
			case "AUTOSECURITYKEYS":
				XMLPATHS.autoSecurityKeys = value;
				break;
			case "CAPTURESETTINGS":
				XMLPATHS.captureSetting = value;
				break;
			case "IEADAPTOR":
				XMLPATHS.IEAdaptor = value;
				break;
			case "IMAGESETTINGS":
				XMLPATHS.ImageSetting = value;
				break;
			case "KEYCLUBBING":
				XMLPATHS.KeyClubbing = value;
				break;
			case "ADAPTORINFO":
				XMLPATHS.AdaptorInfo = value;
				break;
			case "CLAW_ADAPTOR":
				XMLPATHS.ClawAdopter = value;
				break;
			case "DIALOGRULES":
				XMLPATHS.DialogRules = value;
				break;
			case "EXCLUSIONFILTERPREFERENCES":
				XMLPATHS.ExclusionFilter = value;
				break;
			case "EVENTLOGGER":
				XMLPATHS.EventLogger = value;
				break;
			case "USERSETTINGS":
				XMLPATHS.UserSettings = value;
				break;
			case "STTSETTINGS":
				XMLPATHS.STTSettings = value;
				break;
			default:
				System.err.println(key + "is invalid");
				log.error(key + " is invalid");
				return;

			}

		}
		log.info("Load XML paths Completed..");

	}

	public static void loadBackupXMLPaths(String media) {
		// BackupXMLPaths paths = new BackupXMLPaths();
		log.info("Load backup setting xml paths started");
		String mainPath = ProjectConfiguration.base_Files.getAbsolutePath() + "\\Upgrade_Backups\\" + media;
		System.err.println(mainPath);
		BackupXMLPaths.newCapturePreference = mainPath + "\\Common\\NewCapturePreference.xml";
		System.out.println(BackupXMLPaths.newCapturePreference);
		BackupXMLPaths.autoSecurityKeys = mainPath + "\\ProcessEditor\\AutoSecurityKeys.xml";
		BackupXMLPaths.captureSettings = mainPath + "\\Capture\\CaptureSettings.xml";
		BackupXMLPaths.epiSimDoc = mainPath + "\\SimdocEditor\\epiSimDoc_Editor.xml";
		BackupXMLPaths.IEAdaptor = mainPath + "\\Capture\\IEAdaptor.xml";
		BackupXMLPaths.ImageSetting = mainPath + "\\Capture\\ImageSettings.xml";
		BackupXMLPaths.KeyClubbing = mainPath + "\\Capture\\KeyClubbing.xml";
		BackupXMLPaths.AdaptorInfo = mainPath + "\\Capture\\AdaptorInfo.xml";
		BackupXMLPaths.ClawAdopter = mainPath + "\\Capture\\Claw_Adaptor.xml";
		BackupXMLPaths.DialogRules = mainPath + "\\Capture\\DialogRules.xml";
		BackupXMLPaths.exclusionFilterPreference = mainPath + "\\ProcessEditor\\ExclusionFilterPreferences.xml";
		BackupXMLPaths.EventLogger = mainPath + "\\Capture\\EventLogger.config";
		BackupXMLPaths.UserSettings = mainPath + "\\UserSettings.xml";
		BackupXMLPaths.STTSettings = mainPath + "\\SpeechToText\\STTSettings.xml";

		log.info("Load backup settings paths completed");
	}

	/**
	 * Validate Excel sheet steps
	 * 
	 * @param workbookPath
	 * @param declaredmethods
	 * @return
	 * @throws IOException
	 */
	public boolean validateWorkbookSteps(String workbookPath, Method[] declaredmethods) throws IOException {
		boolean workbookStatus = true;
		log.info(workbookPath + " Excel File check started...");
		Workbook workbook = ExcelLibrary.getWorkbook(workbookPath);
		sheets = ExcelLibrary.getSheetsinWorkbook(workbook);
		for (Sheet sheet : sheets) {
			boolean sheetStatus = true;
			log.info(sheet.getSheetName() + " Sheet Step validation started...");
			int lastRow = ExcelLibrary.getRows(sheet);
			for (int row = 1; row <= lastRow; row++) {
				List<String> stepParameters = loadStepParameters(sheet, row);
				boolean stepStatus = validateStep(declaredmethods, stepParameters);

				markCell(workbook, sheet, row, stepStatus);
				if (!stepStatus)
					workbookStatus = sheetStatus = false;
				stepParameters.clear();
			}
			ExcelLibrary.writeWorkbook(workbook, workbookPath);
			log.info(sheet.getSheetName() + " Sheet Step validation Ended");
			if (!sheetStatus) {
				System.err.println("Excel " + workbookPath + "- Sheet " + sheet.getSheetName() + " - Has issue");
				log.error("Excel " + workbookPath + "- Sheet " + sheet.getSheetName() + " - Has issue");
			}
		}
		log.info(workbookPath + " Excel File Check ended");
		workbook.close();
		return workbookStatus;
	}

	/**
	 * Write workbook sheets
	 * 
	 * @param workbookPath
	 * @param declaredmethods
	 * @return
	 */
	public boolean writeNewWorkbook(String workbookPath, Method[] declaredmethods) {
		boolean workbookStatus = true;
		log.info(workbookPath + " Excel File check started...");
		Workbook workbook = ExcelLibrary.getWorkbook(workbookPath);
		sheets = ExcelLibrary.getSheetsinWorkbook(workbook);
		for (Sheet sheet : sheets) {
			boolean sheetStatus = true;
			log.info(sheet.getSheetName() + " Sheet Step validation started...");
			int lastRow = ExcelLibrary.getRows(sheet);
			for (int row = 1; row <= lastRow; row++) {
				List<String> stepParameters = loadStepParameters(sheet, row);
				boolean stepStatus = validateStep(declaredmethods, stepParameters);
				if (stepStatus)
					writeExcel(sheet, row, stepParameters);
				else
					workbookStatus = sheetStatus = false;
				stepParameters.clear();
			}
			ExcelLibrary.writeWorkbook(workbook, workbookPath);
			log.info(sheet.getSheetName() + " Sheet Step validation Ended");
			if (!sheetStatus) {
				System.err.println("Excel " + workbookPath + "- Sheet " + sheet.getSheetName() + " - Has issue");
				log.error("Excel " + workbookPath + "- Sheet " + sheet.getSheetName() + " - Has issue");
			}
		}
		log.info(workbookPath + " Excel File Check ended");
		return workbookStatus;
	}

	/**
	 * Load methods from workbook path
	 * 
	 * @param workbookPath
	 * @param declaredmethods
	 * @return
	 * @throws IOException
	 */
	public boolean loadMethodsFromWorkbook(String workbookPath, Method[] declaredmethods) throws IOException {
		boolean workbookStatus = true;
		log.info(workbookPath + " Excel File check started...");
		Workbook workbook = ExcelLibrary.getWorkbook(workbookPath);
		sheets = ExcelLibrary.getSheetsinWorkbook(workbook);
		for (Sheet sheet : sheets) {
			boolean sheetStatus = true;
			log.info(sheet.getSheetName() + " Sheet Step validation started...");
			int lastRow = ExcelLibrary.getRows(sheet);
			for (int row = 1; row <= lastRow; row++) {
				List<String> stepParameters = loadStepParameters(sheet, row);
				boolean stepStatus = validateStep(declaredmethods, stepParameters);
				if (stepStatus)
					loadExecutionMethods(declaredmethods, stepParameters);
				else {
					workbookStatus = sheetStatus = false;
					System.err.println(sheet.getRow(row).getCell(0).getStringCellValue() + " method has issue ");
				}
				stepParameters.clear();
			}
			ExcelLibrary.writeWorkbook(workbook, workbookPath);
			log.info(sheet.getSheetName() + " Sheet Step validation Ended");
			if (!sheetStatus) {
				System.err.println("Excel " + workbookPath + "- Sheet " + sheet.getSheetName() + " - Has issue");
				log.error("Excel " + workbookPath + "- Sheet " + sheet.getSheetName() + " - Has issue");
			}
		}
		log.info(workbookPath + " Excel File Check ended");
		workbook.close();
		return workbookStatus;
	}

	/**
	 * To Load the excel workbooks
	 * 
	 * @param excelFolderPath
	 * @return
	 */
	public List<String> loadExcelFiles(String excelFolderPath) {
		List<String> workbookPaths = new ArrayList<String>();
		File folder = new File(excelFolderPath);
		File[] listOfFiles = folder.listFiles();

		for (int i = 0; i < listOfFiles.length; i++) {
			if (listOfFiles[i].isFile()) {
				workbookPaths.add(listOfFiles[i].getAbsolutePath());
			}
		}

		return workbookPaths;
	}

	/**
	 * Get DeclaredMethods in given class
	 * 
	 * @param fullClassName
	 * @return
	 */
	public Method[] getDeclaredMethods(String fullClassName) {
		Class<?> cls = null;
		try {
			cls = Class.forName(fullClassName);
		} catch (ClassNotFoundException e) {
			log.error("Exception executeReflector :- " + e.getMessage());
		}
		return cls.getMethods();
	}

	/**
	 * Load Step parameters to List
	 * 
	 * @param sheet
	 * @param rowNo
	 * @return
	 */
	private List<String> loadStepParameters(Sheet sheet, int rowNo) {
		Row row = sheet.getRow(rowNo);
		int cellCount = row.getPhysicalNumberOfCells();
		List<String> stepParameters = new ArrayList<>();

		for (int col = 0; col < cellCount; col++) {
			Cell cell = row.getCell(col);
			DataFormatter dataFormatter = new DataFormatter();
			String data = dataFormatter.formatCellValue(cell);
			data = data.trim();
			if (!data.isEmpty())
				stepParameters.add(data);
		}

		return stepParameters;
	}

	/**
	 * Mark the sheets after checking
	 * 
	 * @param workbook
	 * @param sheet
	 * @param row
	 * @param methodStatus
	 */
	private void markCell(Workbook workbook, Sheet sheet, int row, boolean methodStatus) {
		Cell cell = sheet.getRow(row).getCell(0);
		cell.removeCellComment();
		if (!methodStatus) {
			System.err.println(sheet.getSheetName() + " - " + cell.getStringCellValue() + " has issue");
			cell.setCellStyle(excelLibrary.getCellStyle(workbook, IndexedColors.RED.index));
		}
	}

	/**
	 * validateStep in a sheet return true if its a valid method call
	 * 
	 * @param declaredmethods
	 * @param stepParameters
	 * @return
	 */
	private boolean validateStep(Method[] declaredmethods, List<String> stepParameters) {
		boolean status = false;
		if (stepParameters.size() != 0) {
			int argumentLength = 0;
			int parameterLength = 0;
			argumentLength = stepParameters.size() - 1;
			Method method = null;
			try {
				method = findMethods(stepParameters.get(0), declaredmethods, argumentLength);
				parameterLength = method.getParameterCount();
			} catch (NullPointerException e) {
				return false;
			}
			if (parameterLength == argumentLength)
				status = true;
		}
		return status;
	}

	private void loadExecutionMethods(Method[] declaredmethods, List<String> stepParameters) {
		int argumentLength = stepParameters.size() - 1;
		Method method = findMethods(stepParameters.get(0), declaredmethods, argumentLength);
		stepParameters.remove(0);
		methods.add(method);
		arguments.add(stepParameters.toArray());
	}

	/**
	 * return methods list
	 * 
	 * @return
	 */
	public List<Method> getMethods() {
		return methods;
	}

	/**
	 * Return argument list
	 * 
	 * @return
	 */
	public List<Object[]> getArgumentObjects() {
		return arguments;
	}

	/**
	 * reset data
	 */
	public void resetData() {
		methods.clear();
		arguments.clear();
	}

	/**
	 * Find corresponding method name in existing methods
	 * 
	 * @param methodName
	 * @param methods
	 * @param argumentLength
	 * @return
	 */
	private static Method findMethods(String methodName, Method[] methods, int argumentLength) {

		for (int i = 0; i < methods.length; i++) {
			if (methodName.equals(methods[i].getName().toString())) {
				if (methods[i].getParameterCount() == argumentLength) {
					return methods[i];
				}
			}
		}
		return null;
	}

	private void writeExcel(Sheet sheet, int row, List<String> stepParameters) {
		String methodName = stepParameters.get(0);
		switch (methodName) {
		case "clickButton": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("BUTTON");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickToolBar": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("TOOLBAR");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickCustom": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("CUSTOM");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "enterTextCustom": {
			sheet.getRow(row).createCell(0).setCellValue("write");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("CUSTOM");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellValue(stepParameters.get(3));
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(6).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickImage": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("IMAGE");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickMenuItem": {
			int size = stepParameters.size();
			if (size == 4) {
				sheet.getRow(row).createCell(0).setCellValue("click");
				sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
				sheet.getRow(row).createCell(2).setCellValue("MENUITEM");
				sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(3));
				sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			} else if (size == 3) {
				sheet.getRow(row).createCell(0).setCellValue("click");
				sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
				sheet.getRow(row).createCell(2).setCellValue("MENUITEM");
				sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
				sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			}
			return;
		}

		case "clickPane": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("PANE");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickComboBox": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("COMBOBOX");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickListItem": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("LISTITEM");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickRadioButton": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("RADIOBUTTON");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickEnterText": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("EDIT");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "enterText": {
			sheet.getRow(row).createCell(0).setCellValue("write");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("EDIT");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellValue(stepParameters.get(3));
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(6).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickCheckBox": {
			String state = stepParameters.get(3);
			if (state.equals("1"))
				sheet.getRow(row).createCell(0).setCellValue("check");
			else
				sheet.getRow(row).createCell(0).setCellValue("unCheck");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("CHECKBOX");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickHyperlink": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("HYPERLINK");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickText": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("TEXT");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickTabItem": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("TABITEM");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickDataItem": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellValue("DATAITEM");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickTreeItem": {
			int size = stepParameters.size();
			if (size == 3) {
				sheet.getRow(row).createCell(0).setCellValue("click");
				sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
				sheet.getRow(row).createCell(2).setCellValue("TREEITEM");
				sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
				sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			}
			return;
		}

		case "closeApp": {
			sheet.getRow(row).createCell(0).setCellValue("closeApplication");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(3).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "launchApp": {
			sheet.getRow(row).createCell(0).setCellValue("launchApplication");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(3).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "clickImg": {
			sheet.getRow(row).createCell(0).setCellValue("click");
			sheet.getRow(row).createCell(1).setCellValue("IMAGE");
			sheet.getRow(row).createCell(2).setCellValue("SCREEN");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "type": {
			sheet.getRow(row).createCell(0).setCellValue("keyboardType");
			sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(2).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(3).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "assertExistImg": {
			sheet.getRow(row).createCell(0).setCellValue("assertExist");
			sheet.getRow(row).createCell(1).setCellValue("IMAGE");
			sheet.getRow(row).createCell(2).setCellValue("SCREEN");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(4).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "assertNotExistImg": {
			sheet.getRow(row).createCell(0).setCellValue("assertNotExist");
			sheet.getRow(row).createCell(1).setCellValue("IMAGE");
			sheet.getRow(row).createCell(2).setCellValue("SCREEN");
			sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(1));
			sheet.getRow(row).createCell(4).setCellValue(stepParameters.get(2));
			sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			return;
		}

		case "assertExist": {
			int size = stepParameters.size();
			if (size == 3) {
				sheet.getRow(row).createCell(0).setCellValue("assertExist");
				sheet.getRow(row).createCell(1).setCellValue("name");
				sheet.getRow(row).createCell(2).setCellValue(stepParameters.get(1));
				sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
				sheet.getRow(row).createCell(4).setCellValue(stepParameters.get(3));
				sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			}
			return;
		}

		case "assertNotExist": {
			int size = stepParameters.size();
			if (size == 3) {
				sheet.getRow(row).createCell(0).setCellValue("assertNotExist");
				sheet.getRow(row).createCell(1).setCellValue("name");
				sheet.getRow(row).createCell(2).setCellValue(stepParameters.get(1));
				sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(2));
				sheet.getRow(row).createCell(4).setCellValue(stepParameters.get(3));
				sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			}
			return;
		}

		case "focus": {
			int size = stepParameters.size();
			if (size == 3) {
				sheet.getRow(row).createCell(0).setCellValue("focusWindow");
				sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(2));
				sheet.getRow(row).createCell(2).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(3).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			}
			return;
		}

		case "focusWindow": {
			int size = stepParameters.size();
			if (size == 4) {
				sheet.getRow(row).createCell(0).setCellValue("focusWindow");
				sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(3));
				sheet.getRow(row).createCell(2).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(3).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			}
			return;
		}

		case "doIfExists": {
			int size = stepParameters.size();
			if (size == 5) {
				sheet.getRow(row).createCell(0).setCellValue(stepParameters.get(4));
				sheet.getRow(row).createCell(1).setCellValue(stepParameters.get(1));
				sheet.getRow(row).createCell(2).setCellValue(stepParameters.get(2));
				sheet.getRow(row).createCell(3).setCellValue(stepParameters.get(3));
				sheet.getRow(row).createCell(4).setCellType(Cell.CELL_TYPE_BLANK);
				sheet.getRow(row).createCell(5).setCellType(Cell.CELL_TYPE_BLANK);
			}
			return;
		}

		default:
			System.err.println("Invalid method name :- " + methodName);
		}
	}

	private static XSSFWorkbook createMainExcel(String filePath) {
		XSSFWorkbook workbook = null;
		ExcelLibrary excelLib = new ExcelLibrary();

		try {
			FileOutputStream fos = new FileOutputStream(filePath);
			workbook = new XSSFWorkbook();
			CellStyle cellstyle = excelLib.getCellStyle(workbook, IndexedColors.BLUE.index);
			XSSFSheet sheet = workbook.createSheet("workbooks");
			Row row = sheet.createRow(0);
			Cell cell = row.createCell(0);
			cell.setCellStyle(cellstyle);
			cell.setCellValue("Workbook Path");
			sheet = workbook.createSheet("Settings");
			String[] headers = { "Key", "Value" };
			row = sheet.createRow(0);
			for (int col = 0; col < headers.length; col++) {
				cell = row.createCell(col);
				cell.setCellStyle(cellstyle);
				cell.setCellValue(headers[col]);
			}

			String[] settings = { "MAIL_ID", "MAIL_PASSWORD", "BUILD_NO", "HOTFIX_ID", "PATCH_INFO", "BUILD_BY",
					"REPORT_TITLE", "REPORT_NAME", "REPO_PATH", "EPIPLEX500_PATH", "FIND_WAIT", "MAX_WAIT",
					"PROGRAM_DATA_PATH" };
			int len = settings.length;
			for (int r = 1; r < len; r++) {
				row = sheet.createRow(r);
				Cell cell1 = row.createCell(0);
				cell1.setCellStyle(cellstyle);
				cell1.setCellValue(settings[r - 1]);

				Cell cell2 = row.createCell(1);
				cell2.setCellStyle(cellstyle);
				cell2.setCellValue("Enter data");
			}

			workbook.write(fos);
			fos.flush();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return workbook;
	}

}
