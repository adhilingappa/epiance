package utils;

/**
 * The ExcelLibrary class is used to read the data from the excel sheet
 *
 * @author Shilpashree_V
 * @version 1.0
 * @since February 2015
 * 
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Comment;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

/**
 * ExcelLibrary class with provide Excel file Handling methods
 * 
 * @author Dhanush
 *
 */
public class ExcelLibrary {

	private static final Logger log = LogManager.getLogger(ExcelLibrary.class);

	/**
	 * Get CellStyle for workbook
	 * 
	 * @param workbook
	 * @param indexedColor
	 * @return
	 */
	public CellStyle getCellStyle(Workbook workbook, short indexedColor) {
		Font font = workbook.createFont();
		font.setColor(indexedColor);
		font.setBold(true);
		font.setItalic(true);
		CellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setBorderBottom((short) 1);
		cellStyle.setBorderTop((short) 1);
		cellStyle.setBorderLeft((short) 1);
		cellStyle.setBorderRight((short) 1);
		cellStyle.setFont(font);
		return cellStyle;
	}

	/**
	 * Create comment for workbook
	 * 
	 * @param workbook
	 * @param sheet
	 * @param row
	 * @param commentText
	 * @return
	 */
	public Comment createComent(Workbook workbook, Sheet sheet, int row, String commentText) {
		CreationHelper factory = workbook.getCreationHelper();
		Drawing drawing = sheet.createDrawingPatriarch();
		ClientAnchor anchor = factory.createClientAnchor();
		anchor.setCol1(sheet.getRow(row).getCell(0).getColumnIndex());
		anchor.setCol2(sheet.getRow(row).getCell(0).getColumnIndex() + 3);
		anchor.setRow1(sheet.getRow(row).getRowNum());
		anchor.setRow2(sheet.getRow(row).getRowNum() + 3);
		Comment comment = drawing.createCellComment(anchor);
		RichTextString str = factory.createRichTextString(commentText);
		comment.setString(str);
		return comment;
	}

	/**
	 * Read the content of the cell
	 * 
	 * @param sheet
	 * @param rowNum
	 * @param colNum
	 * @return
	 */
	public static String readCell(Sheet sheet, int rowNum, int colNum) {
		String cellValue = null;

		Row row = sheet.getRow(rowNum);
		if (row != null) {
			Cell cell = row.getCell(colNum);
			if (cell != null) {
				DataFormatter dataFormatter = new DataFormatter();
				String data = dataFormatter.formatCellValue(cell);
				if (data != "")
					cellValue = data.trim();
			}
		}
		return cellValue;
	}

	/**
	 * Get the total columns inside excel sheet
	 * 
	 * @param sheet
	 * @param rowNo
	 * @return
	 */
	public static int getColumns(Sheet sheet, int rowNo) {

		Row row = sheet.getRow(rowNo);
		return row.getLastCellNum();
	}

	/**
	 * Get the total rows present in excel sheet
	 * 
	 * @param sheet
	 * @return
	 */
	public static int getRows(Sheet sheet) {

		return sheet.getLastRowNum();
	}

	/**
	 * To get the number of sheets in excel workbook
	 * 
	 * @param workbook
	 * @return
	 */
	public static List<Sheet> getSheetsinWorkbook(Workbook workbook) {
		List<Sheet> sheets = new ArrayList<Sheet>();
		Sheet indexSheet = workbook.getSheet("Index");
		int rowCount = indexSheet.getPhysicalNumberOfRows();
		for (int rowNo = 1; rowNo < rowCount; rowNo++) {
			String sheetStatus = indexSheet.getRow(rowNo).getCell(1).getStringCellValue();
			if (sheetStatus.toUpperCase().equals("YES")) {
				String sheetName = indexSheet.getRow(rowNo).getCell(0).getStringCellValue();
				sheets.add(workbook.getSheet(sheetName));
			}
		}

		return sheets;
	}

	/**
	 * This method will return workbook from given path
	 * 
	 * @param workbookPath
	 * @return
	 */
	public static Workbook getWorkbook(String workbookPath) {
		Workbook workbook = null;
		File excelFile = new File(workbookPath);
		FileInputStream fis;
		try {
			fis = new FileInputStream(excelFile);
			workbook = WorkbookFactory.create(fis);
		} catch (IOException | InvalidFormatException e1) {
			log.error("Exception in getWorkbook :- " + e1.getMessage());
		}
		return workbook;
	}

	/**
	 * Write Workbook and close Workbook
	 * 
	 * @param workbook
	 * @param workbookPath
	 */
	public static void writeWorkbook(Workbook workbook, String workbookPath) {
		try {
			FileOutputStream fos = new FileOutputStream(workbookPath);
			workbook.write(fos);
			fos.close();
			workbook.close();
		} catch (IOException e) {
			log.error("Exception in writeWorkbook :- " + e.getMessage());
		}
	}
}