package com.ms.teach.by.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.BeanUtils;

import com.ms.teach.by.dao.impl.DepartmentsDAOImpl;
import com.ms.teach.by.pojo.Departments;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author zongwei
 */
public class DepartmentsAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private DepartmentsDAOImpl departmentsDAO;
	private Departments department;
   
	/**部门列表，转到listDepartments.jsp*/
	public String listDepartments(){	
		List list = departmentsDAO.findAll();
		request.setAttribute("departments", list);
		return "toListDepartments";
	}
	
	/**保存部门，转到listDepartments.jsp*/
	public String saveDepartment(){
		if(department!=null && department.getDepartmentNumber()!=null){
			//判断要添加的部门是否已经存在
			List list = departmentsDAO.findByDepartmentNumber(department.getDepartmentNumber().trim());
			if(list.size()>0){
				request.setAttribute("confirm", "此部门已经存在!");
			}else{
				departmentsDAO.save(department);
				request.setAttribute("confirm", "您已经添加了部门："+department.getDepartmentName());
			}
		}
		return listDepartments();
	}
	
	/**更新部门，转到listDepartments.jsp*/
	public String modifyDepartment(){
		if(department!=null && department.getDid()!=null){
			//用Spring的工具类：BeanUtils.copyProperties ，可以拷贝Form里字段的值，并且可设置哪些不需要拷贝的值
			//这个系统凡用到此Spring的工具类的作用都是如此
			Departments target = departmentsDAO.findById(department.getDid());
			BeanUtils.copyProperties(department, target, new String[]{"did","departmentNumber","userses"});
			departmentsDAO.update(target);
			request.setAttribute("confirm", "您已经更新了部门："+department.getDepartmentName());
		}else{
			request.setAttribute("confirm", "更新部门失败！");
		}
		return listDepartments();
	}

	/**部门详情，转到showDepartment.jsp*/
	public String showDepartment(){
		request.setAttribute("department", this.findById());
		return SUCCESS;
	}
	
	/**删除部门，利用jquery,无跳转*/
	public void deleteDepartment(){
		departmentsDAO.delete(department);
	}
	
	/**编辑部门，转到editDepartment.jsp*/
	public String editDepartment(){
		request.setAttribute("department", this.findById());
		return SUCCESS;
	}
	
	public Departments findById(){
		return departmentsDAO.findById(department.getDid());
		
	}
	
	public DepartmentsDAOImpl getDepartmentsDAO() {
		return departmentsDAO;
	}
	public void setDepartmentsDAO(DepartmentsDAOImpl departmentsDAO) {
		this.departmentsDAO = departmentsDAO;
	}
	public Departments getDepartment() {
		return department;
	}
	public void setDepartment(Departments department) {
		this.department = department;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
