package com.ms.teach.by.action;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.ms.teach.by.dao.impl.StandardCoursesDAOImpl;
import com.ms.teach.by.pojo.StandardCourses;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author zongwei
 */
public class StandardCoursesAction extends ActionSupport implements ServletRequestAware{
	
	private HttpServletRequest request;
	private StandardCoursesDAOImpl standardCoursesDAO;
	private StandardCourses standardCourse;
	private File file;
	private String teacherId;
	
	/**上传拟开设课程*/
	public String uploadStandardCourses(){
	    try {
	    	//利用JXL(Java Excel API)开源框架来动态读写 Excel 文件
			Workbook book = Workbook.getWorkbook(file);
			int bookNum = book.getNumberOfSheets();
			//publicCourseDAO.deleteAll();
			for (int j = 0; j < bookNum; j++) {
				Sheet sheet = book.getSheet(j);
				//System.out.println(sheet.getRows()+" rows");
				for (int i = 2; i < sheet.getRows(); i++) {
					List list = standardCoursesDAO.findByCourseNumber(sheet.getCell(0, i).getContents().trim());
					
					if(list.size()==0){
						StandardCourses c = new StandardCourses();
						c.setCourseNumber(sheet.getCell(0, i).getContents().trim());
						c.setCourseName(sheet.getCell(1, i).getContents().trim());
						c.setCourseTheoryCredit(Float.parseFloat(sheet.getCell(2, i).getContents().trim()));
						c.setCoursePracticeCredit(Float.parseFloat(sheet.getCell(3, i).getContents().trim()));
						c.setCourseTheoryPeriod(Integer.parseInt(sheet.getCell(4, i).getContents().trim()));
						c.setCoursePracticePeriod(Integer.parseInt(sheet.getCell(5, i).getContents().trim()));
						c.setCourseTerm(sheet.getCell(6, i).getContents().trim());
						c.setCourseWeekPeriod(Integer.parseInt(sheet.getCell(7, i).getContents().trim()));
						c.setCourseExam(sheet.getCell(8, i).getContents().trim());
						c.setCourseOpenDepartment(sheet.getCell(9, i).getContents().trim());
						c.setCourseSpecialtyNumber(sheet.getCell(10, i).getContents().trim());
						c.setCourseSpecialty(sheet.getCell(11, i).getContents().trim());
						c.setCourseExplain(sheet.getCell(12, i).getContents().trim());
						c.setCourseProperty(sheet.getCell(13, i).getContents().trim());
						standardCoursesDAO.save(c);
					}
				}
			}
			book.close();
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SUCCESS;
    }
	
	/*
	public String selectCourses(){
		this.listPublicCourses();
		this.listSubjectBaseCourses();
		this.listSpecialtyBaseCourses();
		this.listSpecialtyDevelopCourses();
		//request.setAttribute("teacherId", this.getTeacherId());
		return SUCCESS;
	}
	*/
	
	/*
	public String listPublicCourses(){
		List mustList, chooseList;
		if(standardCourse!=null && standardCourse.getCourseSpecialty()!=null && !"".equals(standardCourse.getCourseSpecialty().trim())){
			 mustList = standardCoursesDAO.findByCourseSpecialtyAndProperty(standardCourse.getCourseSpecialty().trim(),"通识教育必修模块课程");
			 chooseList = standardCoursesDAO.findByCourseSpecialtyAndProperty(standardCourse.getCourseSpecialty().trim(),"通识教育选修模块课程");
		}else{
			mustList = standardCoursesDAO.findByCourseProperty("通识教育必修模块课程");
			//mustList = count(mustList);
			chooseList = standardCoursesDAO.findByCourseProperty("通识教育选修模块课程");
		}
		request.setAttribute("mustPublicCourse", mustList);
		request.setAttribute("choosePublicCourse", chooseList);
		return SUCCESS;
	}
	
	public String listSubjectBaseCourses(){
		List subjectBaseList;
		if(standardCourse!=null && standardCourse.getCourseSpecialty()!=null && !"".equals(standardCourse.getCourseSpecialty().trim())){
			subjectBaseList = standardCoursesDAO.findByCourseSpecialtyAndProperty(standardCourse.getCourseSpecialty().trim(),"学科基础课程平台教学计划课程");
		
		}else{
			subjectBaseList = standardCoursesDAO.findByCourseProperty("学科基础课程平台教学计划课程");
		}
		request.setAttribute("subjectBaseCourse", subjectBaseList);
		return SUCCESS;
	}
	public String listSpecialtyBaseCourses(){
		List specialtyBaseList;
		if(standardCourse!=null && standardCourse.getCourseSpecialty()!=null && !"".equals(standardCourse.getCourseSpecialty().trim())){
			specialtyBaseList = standardCoursesDAO.findByCourseSpecialtyAndProperty(standardCourse.getCourseSpecialty().trim(),"专业基础课程平台教学计划课程");
		}else{
			specialtyBaseList = standardCoursesDAO.findByCourseProperty("专业基础课程平台教学计划课程");
		}
		request.setAttribute("specialtyBaseCourse", specialtyBaseList);
		return SUCCESS;
	}
	public String listSpecialtyDevelopCourses(){
		List specialtyDevelopList;
		if(standardCourse!=null && standardCourse.getCourseSpecialty()!=null && !"".equals(standardCourse.getCourseSpecialty().trim())){
			specialtyDevelopList = standardCoursesDAO.findByCourseSpecialtyAndProperty(standardCourse.getCourseSpecialty().trim(),"专业发展课程平台教学计划课程");
		}else{
			specialtyDevelopList = standardCoursesDAO.findByCourseProperty("专业发展课程平台教学计划课程");
		}
		request.setAttribute("specialtyDevelopCourse", specialtyDevelopList);
		return SUCCESS;
	}
	*/
	
	public StandardCoursesDAOImpl getStandardCoursesDAO() {
		return standardCoursesDAO;
	}

	public void setStandardCoursesDAO(StandardCoursesDAOImpl standardCoursesDAO) {
		this.standardCoursesDAO = standardCoursesDAO;
	}

	public StandardCourses getStandardCourse() {
		return standardCourse;
	}

	public void setStandardCourse(StandardCourses standardCourse) {
		this.standardCourse = standardCourse;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
}
