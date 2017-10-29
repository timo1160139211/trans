package trans;

import java.io.FileInputStream;
import java.io.InputStream;

import org.junit.Test;

public class AppTest {
    
	@Test
    public void test01() {
    	System.out.println("1");
    }
	
	@Test
	public void testOutput() {
		
//	    InputStream inp = new FileInputStream("workbook.xls");
//	    //InputStream inp = new FileInputStream("workbook.xlsx");
//
//	    Workbook wb = WorkbookFactory.create(inp);
//	    Sheet sheet = wb.getSheetAt(0);
//	    Row row = sheet.getRow(2);
//	    Cell cell = row.getCell(3);
//	    if (cell == null)
//	        cell = row.createCell(3);
//	    cell.setCellType(CellType.STRING);
//	    cell.setCellValue("a test");
//
//	    // Write the output to a file
//	    FileOutputStream fileOut = new FileOutputStream("workbook.xls");
//	    wb.write(fileOut);
//	    fileOut.close();
	    
	}
}
