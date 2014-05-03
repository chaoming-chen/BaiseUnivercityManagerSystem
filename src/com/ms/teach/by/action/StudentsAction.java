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
public class StudentsAction extends ActionSupport implements ServletRequestAware, SessionAware{
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
	
	/**班级学生列表，转到listClassStudents.jsp*/
	public String listClassStudents() {
		if(this.findClassStudents()!=null)
			request.setAttribute("students", this.findClassStudents());
		return "toListClassStudents";
	}
	private List findClassStudents() {
		List list = null;
		if(this.getUser()!=null){
			if(student!=null && student.getClasses()!=null){
				list = studentsDAO.findByStudentClass(student.getClasses());
				request.setAttribute("studentsClass", student.getClasses());
			}else{
				list = studentsDAO.findByStudentSystem(this.getUser().getSystems());
			}
		}
		return list;
	}
	
	/**保存学生，转到listClassStudents.jsp*/
	public String saveStudent() {
		if(this.getUser()!=null){
			//判断要添加的学生是否已经存在
			if(this.existStudent()>0){
				request.setAttribute("confirm","此学生已经存在！");
			}else{
				student.setSystems(this.getUser().getSystems());
				studentsDAO.save(student);
				request.setAttribute("confirm","您已经添加了学生：" + student.getStudentName());
			}
		}
		return listClassStudents();
	}

	/**更新学生，转到listClassStudents.jsp*/
	public String modifyStudent() {
		if(this.getUser()!=null && student!=null && student.getSid()!=null){
		Students target = studentsDAO.findById(student.getSid());
		BeanUtils.copyProperties(student, target, new String[]{"sid","systems","studentNumber"});
		studentsDAO.update(target);
		request.setAttribute("confirm","您已经更新了学生：" + student.getStudentName());
		}else{
			request.setAttribute("confirm","更新学生失败！");
		}
		return listClassStudents();
	}
	
	/**学生详请，转到showStudent.jsp*/
	public String showStudent() {
		request.setAttribute("student", this.findById());
		return SUCCESS;
	}
	
	/**删除学生，利用jquery,无跳转*/
	public void deleteStudent() {
		studentsDAO.delete(student);
	}
	
	/**编辑学生，转到editStudent.jsp*/
	public String editStudent() {
		request.setAttribute("student", this.findById());
		return SUCCESS;
	}
	
	private int existStudent(){
		if(student!=null && student.getStudentNumber()!=null){
			List list = studentsDAO.findByStudentNumber(student.getStudentNumber().trim());
			return list.size();
		}else{
			return -1;
		}
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