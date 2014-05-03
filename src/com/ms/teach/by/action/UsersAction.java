package com.ms.teach.by.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ms.teach.by.dao.impl.ClassesDAOImpl;
import com.ms.teach.by.dao.impl.NativeSpecialtysDAOImpl;
import com.ms.teach.by.dao.impl.StudentsDAOImpl;
import com.ms.teach.by.dao.impl.SystemsDAOImpl;
import com.ms.teach.by.dao.impl.UsersDAOImpl;
import com.ms.teach.by.pojo.UserPassword;
import com.ms.teach.by.pojo.Users;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author zongwei
 */
public class UsersAction extends ActionSupport implements ServletRequestAware, SessionAware{
	private HttpServletRequest request;
	private Map session;
	private UsersDAOImpl usersDAO;
	private SystemsDAOImpl systemsDAO;
	private NativeSpecialtysDAOImpl nativeSpecialtysDAO;
	private ClassesDAOImpl classesDAO;
	private StudentsDAOImpl studentsDAO;
	private Users users;
	private UserPassword userPassword;
	
	
	/**用户登录*/
	public String login(){	
		if (users!=null & users.getUserNumber() != null && users.getUserPassword() != null && users.getRoles().getRoleNumber()!=null) {
			//查询用户名是否存在
			List list = usersDAO.findByUserNumber(users.getUserNumber().trim());
			if (list != null && list.size() != 0) {
				for (int i = 0; i < list.size(); i++) {
					Users u = (Users)list.get(i);
					//查询用户名与密码是否匹配
					if (u.getUserPassword().trim().equals(users.getUserPassword().trim())) {
						//判断身份是否正确
						if(u.getRoles().getRoleNumber().equals(users.getRoles().getRoleNumber())){
							//登录成功，把用户信息放在Session中
							this.userSession(u);
							return "toIndex";
						}else{
							request.setAttribute("confirm", "请正确地选择登录身份");
							return "toLogin";
						}
					}else{
						request.setAttribute("confirm", "用户名或密码不对,请重新输入");
						return "toLogin";
					}
				}
			}else{
				request.setAttribute("confirm", "用户名或密码不对,请重新输入");
			}
		}else{
			return "toLogin";
		}
		return "toLogin";
	}
	
	
	/**把用户放在session中*/
	private void userSession(Users user){
		//List list = modulesDAO.findByModuleRole(user.getUserRole().trim());
		//HttpSession session = ServletActionContext.getRequest().getSession();
		//session.setAttribute("user", user);
		session.put("user", user);
		/*if(user.getSystems()!=null){
			session.put("system", user.getSystems());
		}*/
	}
	
	/**用户退出, 清除Session，返回到登录页*/
	public String logout(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		return "toLogin";
	}
	
	/**用户修改密码*/
	public String confirmModifyPassword(){
		//取得Session中的用户
		Users user =(Users)session.get("user");
		if(user!=null && userPassword!=null){
			//查找并判断所输入的旧密码是否正确
			user = usersDAO.findById(user.getUid());
			if(user!=null && userPassword.getUserOldPassword()!=null 
					&& userPassword.getUserNewPassword()!=null 
					&& user.getUserPassword().trim().equals(userPassword.getUserOldPassword().trim())){
				//设置新密码，并更新
				user.setUserPassword(userPassword.getUserNewPassword().trim());
				usersDAO.update(user);
				request.setAttribute("newPassword", userPassword.getUserNewPassword().trim());
			}else{
				//
			}
		}else{
			//
		}
		return SUCCESS;
	}
	
	public UserPassword getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(UserPassword userPassword) {
		this.userPassword = userPassword;
	}

	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	
	public UsersDAOImpl getUsersDAO() {
		return usersDAO;
	}
	public void setUsersDAO(UsersDAOImpl usersDAO) {
		this.usersDAO = usersDAO;
	}


	public SystemsDAOImpl getSystemsDAO() {
		return systemsDAO;
	}

	public void setSystemsDAO(SystemsDAOImpl systemsDAO) {
		this.systemsDAO = systemsDAO;
	}


	public NativeSpecialtysDAOImpl getNativeSpecialtysDAO() {
		return nativeSpecialtysDAO;
	}

	public void setNativeSpecialtysDAO(NativeSpecialtysDAOImpl nativeSpecialtysDAO) {
		this.nativeSpecialtysDAO = nativeSpecialtysDAO;
	}

	public ClassesDAOImpl getClassesDAO() {
		return classesDAO;
	}

	public void setClassesDAO(ClassesDAOImpl classesDAO) {
		this.classesDAO = classesDAO;
	}

	public StudentsDAOImpl getStudentsDAO() {
		return studentsDAO;
	}

	public void setStudentsDAO(StudentsDAOImpl studentsDAO) {
		this.studentsDAO = studentsDAO;
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
