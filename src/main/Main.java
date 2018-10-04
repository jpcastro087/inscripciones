package main;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

public class Main {
	
	
	public static void main(String[] args) throws EncryptedDocumentException, InvalidFormatException, IOException {
		Workbook workbook = WorkbookFactory.create(new File("C:/Users/admin/Desktop/municipios.xlsx"));
		
			Sheet sheet = workbook.getSheetAt(0);
			
			// Create a DataFormatter to format and get each cell's value as String
	        DataFormatter dataFormatter = new DataFormatter();

	        // 1. You can obtain a rowIterator and columnIterator and iterate over them
	        System.out.println("\n\nIterating over Rows and Columns using Iterator\n");
	        Iterator<Row> rowIterator = sheet.rowIterator();
	        while (rowIterator.hasNext()) {
	            Row row = rowIterator.next();

	            // Now let's iterate over the columns of the current row
	            Iterator<Cell> cellIterator = row.cellIterator();

	            while (cellIterator.hasNext()) {
	            	
	            	Cell cell0 = cellIterator.next();
	                String provincia = dataFormatter.formatCellValue(cell0);
	                
	                Cell cell = cellIterator.next();
	                String municipio = dataFormatter.formatCellValue(cell);
	                
	                
	                
	               String a = "INSERT INTO REGION(ID, PROVINCIA_ID, USUARIO_ALTA_ID, USUARIO_MODI_ID, USUARIO_BAJA_ID, NOMBRE, FECHAALTA, FECHAMODI, FECHABAJA, DISCR) VALUES(REGION_ID_SEQ.nextval, (select id from provincia pr where pr.nombre = '"+provincia+"' and pr.pais_id = (select id from pais pa where pa.nombre = 'MÉXICO') ), NULL, NULL, NULL, '"+municipio+"', NULL, NULL, NULL, 'municipio');";
	               
	               write(a);
	                
	                
	                
	            }
	        }
	        writer.close();
		
		
		
		
	}
	
	
	private static BufferedWriter writer = null;
	private static void write(String linea) throws IOException{
		
		if(writer == null){
			writer = new BufferedWriter(new FileWriter("c:/Users/admin/Desktop/municipios.sql"));
		}
	    
	    writer.write(linea);
	    writer.newLine();
//	    writer.close();
	    
	}

}
