package com.ms.teach.by.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import com.ms.teach.by.dao.impl.StandardSpecialtysDAOImpl;
import com.ms.teach.by.pojo.StandardSpecialtys;
import com.ms.teach.by.utils.JSONUtils;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author zongwei
 */
public class StandardSpecialtysAction extends ActionSupport{
	private StandardSpecialtysDAOImpl standardSpecialtysDAO;
	private StandardSpecialtys standardSpecialty;
	private File file; 

	List<StandardSpecialtys> uploadList=new ArrayList<StandardSpecialtys>();
    
	
	/**上传国家标准专业*/
    public String confirmUploadStandardSpecialtys(){
	    try {
	    	//利用JXL(Java Excel API)开源框架来动态读写 Excel 文件
			Workbook book = Workbook.getWorkbook(file);
			int bookNum = book.getNumberOfSheets();
			standardSpecialtysDAO.deleteAll();
			for (int j = 0; j < bookNum; j++) {
				Sheet sheet = book.getSheet(j);
				for (int i = 1; i < sheet.getRows(); i++) {
					if(sheet.getCell(0, i).getContents().trim().equals("")&& sheet.getCell(1, i).getContents().trim().equals(""))
						continue;
					
					StandardSpecialtys s = new StandardSpecialtys();
					s.setSpecialtyNumber(sheet.getCell(0, i).getContents().trim());
					s.setSpecialtyName(sheet.getCell(1, i).getContents().trim());
					s.setSpecialtyClassNumber(sheet.getCell(2, i).getContents().trim());
					s.setSpecialtyClassName(sheet.getCell(3, i).getContents().trim());
					s.setSpecialtySubjectNumber(sheet.getCell(4, i).getContents().trim());
					s.setSpecialtySubjectName(sheet.getCell(5, i).getContents().trim());
					s.setSpecialtyLevel(sheet.getCell(6, i).getContents().trim());
					s.setSpecialtyBeginning(sheet.getCell(7, i).getContents().trim());
					s.setSpecialtyExplain(sheet.getCell(8, i).getContents().trim());
					if(!s.getSpecialtyNumber().equals("") && !s.getSpecialtyName().equals(""))
						standardSpecialtysDAO.save(s);
				}
			}
			book.close();
			/*
			for (int i = 0; i < uploadList.size(); i++) {
				StandardSpecialtys s = (StandardSpecialtys) uploadList.get(i);
				System.out.println(s.getSpecialtyNumber()+"	"+s.getSpecialtyName()+"	"+s.getSpecialtyClassNumber()
						+"	"+s.getSpecialtyClassName()+"	"+s.getSpecialtySubjectNumber()+"	"+s.getSpecialtySubjectName()
						+"	"+s.getSpecialtyLevel()+"	"+s.getSpecialtyBeginning()+"	"+s.getSpecialtyExplain());
			}*/
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SUCCESS;
    }
    
    /**专业发布年度，利用jquery,无跳转*/
    public void getSpecialtyBeginnigsByJSON(){
     	List list = standardSpecialtysDAO.findSpecialtyBeginning();
    	JSONUtils.sendOfJSON(list);
    }
    
    /**专业大类，利用jquery,无跳转*/
	public void getStandardSubjectsByJSON(){
		List list = null;
		if(standardSpecialty!=null && standardSpecialty.getSpecialtyBeginning()!=null){
	     	list = standardSpecialtysDAO.findBySpecialtyBeginning(standardSpecialty.getSpecialtyBeginning().trim());
		}else{
			list = standardSpecialtysDAO.findSpecialtySubject();
		}
		JSONUtils.sendOfJSON(list);
    }
	
	/**专业小类，利用jquery,无跳转*/
	public void getStandardClassesByJSON(){
		if(standardSpecialty!=null && standardSpecialty.getSpecialtySubjectNumber()!=null){
			List list = standardSpecialtysDAO.findBySpecialtySubjectNumber(standardSpecialty.getSpecialtySubjectNumber().trim());
	    	JSONUtils.sendOfJSON(list);
		}
    }
	
	/**通过专业小类代码查找专业，利用jquery,无跳转*/
	public void getStandardSpecialtysByJSON(){
		if(standardSpecialty!=null && standardSpecialty.getSpecialtyClassNumber()!=null){
			List list = standardSpecialtysDAO.findBySpecialtyClassNumber(standardSpecialty.getSpecialtyClassNumber().trim());
			JSONUtils.sendOfJSON(list);
		}
	}
	
	/**通过专业小类代码查找专业详情，利用jquery,无跳转*/
	public void findStandardSpecialtyDetailsByJSON(){
		if(standardSpecialty!=null && standardSpecialty.getSpecialtyNumber()!=null){
			//System.out.println(standardSpecialty.getSpecialtyNumber());
	    	List<StandardSpecialtys> list = standardSpecialtysDAO.findBySpecialtyNumber(standardSpecialty.getSpecialtyNumber().trim());
	    	JSONUtils.sendOfJSON(list);
		}
	}
	
	public StandardSpecialtysDAOImpl getStandardSpecialtysDAO() {
		return standardSpecialtysDAO;
	}

	public void setStandardSpecialtysDAO(
			StandardSpecialtysDAOImpl standardSpecialtysDAO) {
		this.standardSpecialtysDAO = standardSpecialtysDAO;
	}
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public StandardSpecialtys getStandardSpecialty() {
		return standardSpecialty;
	}

	public void setStandardSpecialty(StandardSpecialtys standardSpecialty) {
		this.standardSpecialty = standardSpecialty;
	}
}
