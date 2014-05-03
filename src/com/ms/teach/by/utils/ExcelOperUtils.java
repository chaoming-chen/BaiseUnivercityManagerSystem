package com.ms.teach.by.utils;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.apache.struts2.ServletActionContext;

import com.ms.teach.by.pojo.Classes;
import com.ms.teach.by.pojo.Students;

/**
 * @author zongwei
 */
public class ExcelOperUtils {
	
	/**下载学生详细信息（Excel格式）*/
	public static void outputClassStusentsDetailOfExcel(String className, List<Students> list){
		try {
			ServletOutputStream os = getOutputStream(className);
			WritableWorkbook wwb = Workbook.createWorkbook(os);
			WritableSheet ws = wwb.createSheet(className, 0);
			ws.setRowView(0, 500);
			ws.setRowView(1, 500);
			WritableCellFormat wcf = setFormatSheet();
			ws.setColumnView(0, 20);
			ws.setColumnView(1, 20);
			ws.setColumnView(2, 6);
			ws.setColumnView(3, 20);
			ws.setColumnView(4, 20);
			ws.setColumnView(5, 24);
			ws.setColumnView(6, 20);
			ws.setColumnView(7, 20);
			ws.setColumnView(8, 20);
			ws.setColumnView(9, 10);
			
			Label title = new Label(0, 0, className + " 学生详细信息", wcf);
			Label number = new Label(0, 1,"学号", wcf);
			Label name = new Label(1, 1, "姓名", wcf);
			Label sex = new Label(2, 1, "性别", wcf);
			Label stuClass = new Label(3, 1, "所属班级", wcf);
			Label specialty = new Label(4, 1, "所属专业", wcf);
			Label system = new Label(5, 1, "所属系别", wcf);
			Label phone = new Label(6, 1, "联系电话", wcf);
			Label email = new Label(7, 1, "Email", wcf);
			Label qq = new Label(8, 1, "QQ", wcf);
			Label explain = new Label(9, 1, "备注", wcf);
			ws.addCell(title);
			ws.addCell(number);
			ws.addCell(name);
			ws.addCell(sex);
			ws.addCell(stuClass);
			ws.addCell(specialty);
			ws.addCell(system);
			ws.addCell(phone);
			ws.addCell(email);
			ws.addCell(qq);
			ws.addCell(explain);
			
			for (int i = 0; i < list.size(); i++) {
				Students s = list.get(i);
				number = new Label(0, i + 2, s.getStudentNumber());
				name = new Label(1, i + 2, s.getStudentName());
				sex = new Label(2, i + 2, s.getStudentSex());
				stuClass = new Label(3, i + 2, s.getClasses().getClassName());
				specialty = new Label(4, i + 2, s.getNativeSpecialtys().getSpecialtyName());
				system = new Label(5, i + 2, s.getSystems().getSystemName());
				phone = new Label(6, i + 2, s.getStudentPhone());
				email = new Label(7, i + 2, s.getStudentEmail());
				qq = new Label(8, i + 2, s.getStudentQq());
				explain = new Label(9, i + 2, s.getStudentExplain());
				ws.addCell(number);
				ws.addCell(name);
				ws.addCell(sex);
				ws.addCell(stuClass);
				ws.addCell(specialty);
				ws.addCell(system);
				ws.addCell(phone);
				ws.addCell(email);
				ws.addCell(qq);
				ws.addCell(explain);
			}
			ws.mergeCells(0, 0, 9, 0);
			wwb.write();
			os.flush();
			wwb.close();
			os.close();
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**下载学生简易信息（Excel格式）*/
	public static void outputClassStusentsOfExcel(String className, List<Students> list){
		try {
			ServletOutputStream os = getOutputStream(className);
			WritableWorkbook wwb = Workbook.createWorkbook(os);
			WritableSheet ws = wwb.createSheet(className, 0);
			ws.setRowView(0, 500);
			ws.setRowView(1, 500);
			WritableCellFormat wcf = setFormatSheet();

			Label title = new Label(0, 0, "学生 "+className + " 简易信息", wcf);
			Label number = new Label(0, 1, "学号", wcf);
			Label name = new Label(1, 1, "姓名", wcf);
			Label sex = new Label(2, 1, "性别", wcf);
			Label phone = new Label(3, 1, "联系电话", wcf);
			Label explain = new Label(4, 1, "备注", wcf);
			ws.setColumnView(0, 30);
			ws.setColumnView(1, 30);
			ws.setColumnView(2, 10);
			ws.setColumnView(3, 30);
			ws.setColumnView(4, 30);
			ws.addCell(title);
			ws.addCell(number);
			ws.addCell(name);
			ws.addCell(sex);
			ws.addCell(phone);
			ws.addCell(explain);

			for (int i = 0; i < list.size(); i++) {
				Students s = list.get(i);
				number = new Label(0, i + 2, s.getStudentNumber());
				name = new Label(1, i + 2, s.getStudentName());
				sex = new Label(2, i + 2, s.getStudentSex());
				phone = new Label(3, i + 2, s.getStudentPhone());
				explain = new Label(4, i + 2, s.getStudentExplain());
				ws.addCell(number);
				ws.addCell(name);
				ws.addCell(sex);
				ws.addCell(phone);
				ws.addCell(explain);
			}
			ws.mergeCells(0, 0, 4, 0);
			wwb.write();
			os.flush();
			wwb.close();
			os.close();
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**下载班级信息（Excel格式）*/
	public static void outputClassesOfExcel(String specialtyName, List<Classes> list) {
		try {
			ServletOutputStream os = getOutputStream(specialtyName);
			WritableWorkbook wwb = Workbook.createWorkbook(os);
			WritableSheet ws = wwb.createSheet(specialtyName, 0);
	        ws.setRowView(0, 500);
	        ws.setRowView(1, 500);
			WritableCellFormat wcf = setFormatSheet();
			Label title = new Label(0, 0, specialtyName+"专业班级列表", wcf);
			Label label0 = new Label(0, 1, "班级名称",wcf);
			Label label1 = new Label(1, 1, "辅导员",wcf);
			Label label2 = new Label(2, 1, "班级电话",wcf);
			Label label3 = new Label(3, 1, "所属专业",wcf);
			Label label4 = new Label(4, 1, "所属系别",wcf);
			ws.setColumnView(0,30);
			ws.setColumnView(1,30);
			ws.setColumnView(2,30);
			ws.setColumnView(3,30);
			ws.setColumnView(4,30);
			ws.addCell(title);
			ws.addCell(label0);
			ws.addCell(label1);
			ws.addCell(label2);
			ws.addCell(label3);
			ws.addCell(label4);
			for (int i = 0; i < list.size(); i++) {
				Classes c = list.get(i);
				label0 = new Label(0, i+2, c.getClassName());
				label1 = new Label(1, i+2, c.getClassTeacher());
				label2 = new Label(2, i+2, c.getClassPhone());
				label3 = new Label(3, i+2, c.getNativeSpecialtys().getSpecialtyName());
				label4 = new Label(4, i+2, c.getSystems().getSystemName());
				ws.addCell(label0);
				ws.addCell(label1);
				ws.addCell(label2);
				ws.addCell(label3);
				ws.addCell(label4);
			}
			ws.mergeCells(0, 0, 4, 0);
			wwb.write();
			os.flush();
			wwb.close();
			os.close();
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static  ServletOutputStream getOutputStream(String name) throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		ServletOutputStream  os = response.getOutputStream();
		response.reset();
        response.setHeader("Content-disposition", "attachment; filename="+new String(name.getBytes("GBK"),"ISO8859-1")+".xls");
        response.setContentType("application/ms-Excel");
        return os;
	}
	
	public static WritableCellFormat setFormatSheet() throws Exception{
		
        WritableFont wf = new WritableFont(WritableFont.ARIAL,12,WritableFont.BOLD,false,
                UnderlineStyle.NO_UNDERLINE,Colour.BLUE);
        WritableCellFormat wcf = new WritableCellFormat(wf);
        wcf.setVerticalAlignment(VerticalAlignment.CENTRE); 
        wcf.setAlignment(Alignment.CENTRE); 
        return wcf;
	}
	
	
}
