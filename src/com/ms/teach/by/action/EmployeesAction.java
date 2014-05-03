package com.ms.teach.by.action;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.BeanUtils;

import com.ms.teach.by.dao.impl.EmployeesDAOImpl;
import com.ms.teach.by.pojo.Employees;
import com.ms.teach.by.pojo.NativeCourses;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author zongwei
 */
public class EmployeesAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private EmployeesDAOImpl employeesDAO;
	private Employees employee;
	
	/**职工列表，转到listEmployees.jsp*/
	public String listEmployees(){	
		this.findEmployees();
		return "toListEmployees";
	}

	/**保存职工，转到listEmployees.jsp*/
	public String saveEmployee(){
		if(employee!=null && employee.getEmployeeNumber()!=null){
			//判断要添加的员工是否已经存在
			List list = employeesDAO.findByEmployeeNumber(employee.getEmployeeNumber().trim());
			if(list.size()>0){
				request.setAttribute("confirm", "此员工已经存在！");
			}else{
				if(employee.getSystems().getSid()==null)
					employee.setSystems(null);
				employeesDAO.save(employee);
				request.setAttribute("confirm", "您已经添加了员工："+employee.getEmployeeName());
			}
		}
		return listEmployees();
	}
	
	/**更新职工，转到listEmployees.jsp*/
	public String modifyEmployee(){
		if(employee!=null && employee.getEid()!=null){
			if(employee.getSystems().getSid()==null)
				employee.setSystems(null);
			Employees target = employeesDAO.findById(employee.getEid());
			BeanUtils.copyProperties(employee, target, new String[]{"eid","systems","employeeNumber","nativeCourseses"});
			employeesDAO.update(target);
			request.setAttribute("confirm", "您已经更新了员工："+employee.getEmployeeName());
		}else{
			request.setAttribute("confirm", "更新员工失败！");
		}
		return listEmployees();
	}
	
	/**职工详情，转到showEmployee.jsp*/
	public String showEmployee(){
		request.setAttribute("employee", this.findById());
		return SUCCESS;
	}
	
	/**删除职工，利用jquery,无跳转*/
	public void deleteEmployee(){
		employeesDAO.delete(employee);
	}
	
	
	/**编辑职工，转到editEmployee.jsp*/
	public String editEmployee(){
		request.setAttribute("employee", this.findById());
		return SUCCESS;
	}

	/**分配课程给教师，转到selectEmployees.jsp*/
	public String selectEmployees(){
		this.findEmployees();
		return SUCCESS;
	}
	
	/**查询教师课程，转到listTeacherCourses.jsp*/
	public String listTeacherCourses(){
		this.findEmployees();
		return SUCCESS;
	}
	
	private void findEmployees(){
		List employeeList = null;
		if(employee!=null && employee.getSystems()!=null){
			employeeList = employeesDAO.findByEmployeeSystem(employee.getSystems());
		}else{
			employeeList = employeesDAO.findAll();
		}
		request.setAttribute("employees", employeeList);
	}
	
	public Employees findById(){
		return employeesDAO.findById(employee.getEid());
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

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
