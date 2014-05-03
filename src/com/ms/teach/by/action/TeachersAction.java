package com.ms.teach.by.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ms.teach.by.dao.impl.ClassesDAOImpl;
import com.ms.teach.by.dao.impl.EmployeesDAOImpl;
import com.ms.teach.by.dao.impl.NativeCoursesDAOImpl;
import com.ms.teach.by.dao.impl.StandardCoursesDAOImpl;
import com.ms.teach.by.pojo.Classes;
import com.ms.teach.by.pojo.Employees;
import com.ms.teach.by.pojo.NativeCourses;
import com.ms.teach.by.pojo.StandardCourses;
import com.ms.teach.by.pojo.Users;
import com.ms.teach.by.utils.Count;
import com.ms.teach.by.utils.JSONUtils;
import com.ms.teach.by.utils.YearAndTerm;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author zongwei
 */
public class TeachersAction extends ActionSupport implements ServletRequestAware, SessionAware{

	private HttpServletRequest request;
	private Map session;
	private NativeCoursesDAOImpl nativeCoursesDAO;
	private ClassesDAOImpl classesDAO;
	private EmployeesDAOImpl employeesDAO;
	private NativeCourses nativeCourse;
	private Employees employee;
	private Classes classes;
	private String selectCourses;
	
	
	/**已任课程*/
	public String listTeacherSelectedCourses(){
		System.out.println("enter");
		if(findUser()!=null){
			List list = employeesDAO.findByEmployeeNumber(findUser().getUserEmployeeNumber());
			Set selectedCourses = null;
			if(list.size()>0){
				employee = (Employees)list.get(0);
			    selectedCourses = employee.getNativeCourseses();
			}
			request.setAttribute("teacherSelectedCourses", selectedCourses);
			request.setAttribute("employee", employee);
			return SUCCESS;
		}else{
			return null;
		}
	}

	private Users findUser(){
		if(session.get("user")!=null){
			return (Users)session.get("user");
		}else{
			return null;
		}
	}

	public EmployeesDAOImpl getEmployeesDAO() {
		return employeesDAO;
	}
	public void setEmployeesDAO(EmployeesDAOImpl employeesDAO) {
		this.employeesDAO = employeesDAO;
	}
	public Employees getEmployee() {
		return employee;
	}
	public void setEmployee(Employees employee) {
		this.employee = employee;
	}

	public NativeCoursesDAOImpl getNativeCoursesDAO() {
		return nativeCoursesDAO;
	}

	public void setNativeCoursesDAO(NativeCoursesDAOImpl nativeCoursesDAO) {
		this.nativeCoursesDAO = nativeCoursesDAO;
	}

	public ClassesDAOImpl getClassesDAO() {
		return classesDAO;
	}
	public void setClassesDAO(ClassesDAOImpl classesDAO) {
		this.classesDAO = classesDAO;
	}
	public NativeCourses getNativeCourse() {
		return nativeCourse;
	}

	public void setNativeCourse(NativeCourses nativeCourse) {
		this.nativeCourse = nativeCourse;
	}

	public String getSelectCourses() {
		return selectCourses;
	}

	public void setSelectCourses(String selectCourses) {
		this.selectCourses = selectCourses;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
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
