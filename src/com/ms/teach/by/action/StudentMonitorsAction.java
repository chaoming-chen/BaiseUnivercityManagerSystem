package com.ms.teach.by.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.BeanUtils;

import com.ms.teach.by.dao.impl.StudentsDAOImpl;
import com.ms.teach.by.pojo.Students;
import com.ms.teach.by.pojo.Systems;
import com.ms.teach.by.pojo.Users;
import com.ms.teach.by.utils.ExcelOperUtils;
import com.ms.teach.by.utils.JSONUtils;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author zongwei
 */
public class StudentMonitorsAction extends ActionSupport implements ServletRequestAware, SessionAware{
	private HttpServletRequest request;
	private StudentsDAOImpl studentsDAO;
	private Students student;
	private Map session;

	/**下载学生简易信息，利用jquery+JSON,无跳转*/
	public void outputClassStudentsByExcel(){
		ExcelOperUtils.outputClassStusentsOfExcel(((Students)this.findClassStudents().get(0)).getClasses().getClassName(),this.findClassStudents());
	}
	
	/**下载学生详细信息，利用jquery+JSON,无跳转*/
	public void outputClassStudentDetailsByExcel(){
		ExcelOperUtils.outputClassStusentsDetailOfExcel(((Students)this.findClassStudents().get(0)).getClasses().getClassName(),this.findClassStudents());
	}
	
	/**班级学生列表，转到listOneClassStudents.jsp*/
	public String listOneClassStudents() {
		this.findClassStudents();
		return SUCCESS;
	}
	
	private List findClassStudents() {
		List students = null;
		if(this.getUser()!=null && this.getUser().getUserStudentNumber()!=null){
			List list = studentsDAO.findByStudentNumber(this.getUser().getUserStudentNumber());
			if(list.size()>0){
				student = (Students)list.get(0);
				students = studentsDAO.findByStudentClass(student.getClasses());
				request.setAttribute("studentsClass", student.getClasses());
				request.setAttribute("oneClassStudents", students);
			}
		}
		
		return students;
	}
	
	/**学生详请，转到showStudent.jsp*/
	public String showStudent() {
		request.setAttribute("student", this.findById());
		return SUCCESS;
	}
	
	private Users getUser(){
		if(session.get("user")!=null){
			return (Users)session.get("user");
		}else{
			return null;
		}
	}

	public Students findById() {
		return studentsDAO.findById(student.getSid());
	}

	public StudentsDAOImpl getStudentsDAO() {
		return studentsDAO;
	}

	public void setStudentsDAO(StudentsDAOImpl studentsDAO) {
		this.studentsDAO = studentsDAO;
	}

	public Students getStudent() {
		return student;
	}

	public void setStudent(Students student) {
		this.student = student;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
}