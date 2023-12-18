package utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import epiplex.PerformanceUtils;

public class Timer {

	static long start;
	static long stop;
	static String startTime;
	static String stopTime;
	static int rowNo = 1;

	/**
	 * This method will wait for given time duration (in Ms)
	 * 
	 * @param time
	 */
	public static void waitTime(int time) {
		try {
			Thread.sleep(time);
		} catch (InterruptedException e) {
		}
	}

	/**
	 * This method will return current time in HH:mm:ss format
	 * 
	 * @return
	 */
	private static String getTimeFormat() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}

	/**
	 * This method will return current time acts as stop watch start button
	 * 
	 * @return
	 */
	public static String startTimer() {
		start = System.currentTimeMillis();
		startTime = getTimeFormat();
		return startTime;
	}

	/**
	 * This method will get current time and logs test name, start time, end time,
	 * and duration
	 * 
	 * @param testName
	 * @return
	 */
	public static String stopTimer(String testName) {
		stop = System.currentTimeMillis();
		stopTime = getTimeFormat();
		long time = (stop - start) / 1000;
		writeExcelPerformance(rowNo, testName, startTime, stopTime, time);
		rowNo++;
		return stopTime;
	}

	/**
	 * This will create a excel sheet for performance report
	 * 
	 * @param filePath
	 * @param sheetName
	 * @return
	 */
	private static XSSFWorkbook createExcel(String filePath, String sheetName) {
		XSSFWorkbook workbook = null;
		ExcelLibrary excelLib = new ExcelLibrary();

		try {
			FileOutputStream fos = new FileOutputStream(filePath);
			workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet(sheetName);
			CellStyle cellstyle = excelLib.getCellStyle(workbook, IndexedColors.BLUE.index);
			String[] headers = { "Document Type", "Start Time", "End Time", "Duration in Seconds" };
			Row row = sheet.createRow(0);
			for (int col = 0; col <= 3; col++) {
				Cell cell = row.createCell(col);
				cell.setCellStyle(cellstyle);
				cell.setCellValue(headers[col]);
			}
			workbook.write(fos);
			fos.flush();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return workbook;
	}

	/**
	 * This method will write data to performance report excel
	 * 
	 * @param rowNo
	 * @param Document
	 * @param start
	 * @param stop
	 * @param time
	 */
	public static void writeExcelPerformance(int rowNo, String Document, String start, String stop, long time) {
		String filePath = PerformanceUtils.performaceReportExcelPath;
		String sheetName = "Performance";
		Workbook workbook = null;
		ExcelLibrary excelLib = new ExcelLibrary();

		try {
			if (!new File(filePath).exists())
				createExcel(filePath, sheetName);
			workbook = ExcelLibrary.getWorkbook(filePath);
			Sheet sheet = null;
			sheet = workbook.getSheet(sheetName);
			Row row = sheet.createRow(rowNo);
			CellStyle cellstyle = excelLib.getCellStyle(workbook, IndexedColors.BLACK.index);
			for (int col = 0; col <= 3; col++) {
				Cell cell = row.createCell(col);
				cell.setCellStyle(cellstyle);
				if (col == 0)
					cell.setCellValue(Document);
				if (col == 1)
					cell.setCellValue(start);
				if (col == 2)
					cell.setCellValue(stop);
				if (col == 3)
					cell.setCellValue(time);
			}

			FileOutputStream fos = new FileOutputStream(filePath);
			workbook.write(fos);
			fos.flush();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
