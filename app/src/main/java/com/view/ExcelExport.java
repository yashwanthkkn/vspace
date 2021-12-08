package com.view;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.entities.Submission;
public class ExcelExport extends AbstractXlsxView {

    @Override
    protected void buildExcelDocument(
           Map<String, Object> model,
           Workbook workbook, 
           HttpServletRequest request,
           HttpServletResponse response) throws Exception {

       // define excel file name to be exported
       response.addHeader("Content-Disposition", "attachment;fileName=SubmissionData.xlsx");

       // read data provided by controller
       @SuppressWarnings("unchecked")
       List<Submission> list = (List<Submission>) model.get("list");

       // create one sheet 
       Sheet sheet = workbook.createSheet("Submission");

       // create row0 as a header
       Row row0 = sheet.createRow(0);
       row0.createCell(0).setCellValue("TEST_ID");
       row0.createCell(1).setCellValue("QUESTION_ID");
       row0.createCell(2).setCellValue("USER_ID");
       row0.createCell(3).setCellValue("CHOICE");
       row0.createCell(4).setCellValue("MARK");
       row0.createCell(5).setCellValue("RIGHTANSWER");
       row0.createCell(6).setCellValue("STATE");

       // create row1 onwards from List<T>
       int rowNum = 1;
       for(Submission spec : list) {
           Row row = sheet.createRow(rowNum++);
           row.createCell(0).setCellValue(spec.getCompkey().getTid());
           row.createCell(1).setCellValue(spec.getCompkey().getQid());
           row.createCell(2).setCellValue(spec.getCompkey().getUid());
           row.createCell(3).setCellValue(spec.getChoice());
           row.createCell(4).setCellValue(spec.getMark());
           row.createCell(5).setCellValue(spec.getRightanswer());
           row.createCell(6).setCellValue(spec.getState());
       }
    }
}

