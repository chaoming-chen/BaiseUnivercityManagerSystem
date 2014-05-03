package com.ms.teach.by.action;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.BeanUtils;

import com.ms.teach.by.dao.impl.ClassesDAOImpl;
import com.ms.teach.by.dao.impl.NativeSpecialtysDAOImpl;
import com.ms.teach.by.pojo.Classes;
import com.ms.teach.by.pojo.Users;
import com.ms.teach.by.utils.ExcelOperUtils;
import com.ms.teach.by.utils.JSONUtils;
import com.ms.teach.by.utils.MySession;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author zongwei
 */
public class ClasssAction extends ActionSupport implements ServletRequestAware, SessionAware{
	private HttpServletRequest request;
	private Map session;
	private ClassesDAOImpl classesDAO;
	private Classes classes;

	/**下载班级信息（Excel格式），利用jquery+JSON,无跳转*/
	public void outputClassesByExcel(){
		if(this.findClasses()!=null){
			//实现以Excel格式下载文件
			ExcelOperUtils.outputClassesOfExcel(((Classes)this.findClasses().get(0))
					.getNativeSpecialtys().getSpecialtyName(),this.findClasses());
		}
	}

	/**班级列表，转到listClasss.jsp*/
	public String listClasss() {
		if(this.findClasses()!=null)
			request.setAttribute("classes", this.findClasses());
		return "toListClasses";
	}
	private List findClasses() {
		List list = null;
		if(session.get("user")!=null){
			if(classes!=null && classes.getNativeSpecialtys()!=null){
				list = classesDAO.findByClassSpecialty(classes.getNativeSpecialtys());
				request.setAttribute("classesNativeSpecialty", classes.getNativeSpecialtys());
			}else{
				Users u = (Users)session.get("user");
				list = classesDAO.findByClassSystem(u.getSystems());
			}
		}
		return list;
	}
	public void getClassesByJSON(){
		if(classes!=null && classes.getNativeSpecialtys()!=null && classes.getNativeSpecialtys().getSid()!=null){
			List list = classesDAO.findClassNameByClassSpecialty(classes.getNativeSpecialtys());
			JSONUtils.sendOfJSON(list);
		}
	}
	
	/**班级课程列表*/
	public String listClassCourses(){
		if(this.findClasses()!=null){
			request.setAttribute("classes", this.findClasses());
		}
		return SUCCESS;
	}
	
	/**保存班级，转到listClasss.jsp*/
	public String saveClass() {
		if(this.getUser()!=null){
			//判断要添加的班级是否已经存在
			if(this.existClass()>0){
				request.setAttribute("confirm","此班级已经存在！" + classes.getClassName());
			}else{
				classes.setClassGrade(classes.getClassGradeNumber()+" 级");
				classes.setSystems(this.getUser().getSystems());
				classesDAO.save(classes);
				request.setAttribute("confirm","您已经添加了班级：" + classes.getClassName());
			}
		}
		return listClasss();
	}
	
	/**更新班级，转到listClasss.jsp*/
	public String modifyClass() {
		if(this.getUser()!=null && classes!=null && classes.getClassId()!=null){
			Classes target = classesDAO.findById(classes.getClassId());
			BeanUtils.copyProperties(classes, target, new String[]{"cid","systems","classNumber","studentses"});
			target.setClassGrade(target.getClassGradeNumber()+" 级");
			classesDAO.update(target);
			request.setAttribute("confirm","您已经更新了班级：" + classes.getClassName());
		}else{
			request.setAttribute("confirm","更新班级失败!");
		}
		return listClasss();
	}

	/**班级详情，转到showClass.jsp*/
	public String showClass() {
		request.setAttribute("class", this.findById());
		return SUCCESS;
	}
	
	/**删除班级，利用jquery,无跳转*/
	public void deleteClass() {
		classesDAO.delete(classes);
	}
	
	/**编辑班级，转到editClass.jsp*/
	public String editClass() {
		request.setAttribute("class", this.findById());
		return SUCCESS;
	}

	private Users getUser(){
		if(session.get("user")!=null){
			return (Users)session.get("user");
		}else{
			return null;
		}
	}
	
	/**...*/
	private int existClass(){
		if(classes!=null && classes.getClassNumber()!=null){
			List list = classesDAO.findByClassNumber(classes.getClassNumber().trim());
			return list.size();
		}else{
			return -1;
		}
	}
	
	public Classes findById() {
		return classesDAO.findById(classes.getClassId());
	}
	
	
	public ClassesDAOImpl getClassesDAO() {
		return classesDAO;
	}

	public void setClassesDAO(ClassesDAOImpl classesDAO) {
		this.classesDAO = classesDAO;
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
