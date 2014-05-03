package com.ms.teach.by.action;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.BeanUtils;

import com.ms.teach.by.dao.impl.SystemsDAOImpl;
import com.ms.teach.by.pojo.Systems;
import com.ms.teach.by.utils.JSONUtils;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author zongwei
 */
public class SystemsAction extends ActionSupport implements ServletRequestAware, SessionAware{
	private HttpServletRequest request;
	private Map session;
	private SystemsDAOImpl systemsDAO;
	private Systems system;
   
	/**系别列表，转到listSystems.jsp*/
	public String listSystems(){	
		List list = systemsDAO.findAll();
		request.setAttribute("systems", list);
		return "toListSystems";
	}
	
	/**保存系别，转到listSystems.jsp*/
	public String saveSystem(){
		if(session.get("user")!=null && system!=null && system.getSystemNumber()!=null){
			//判断要添加的系别是否已经存在
			List list = systemsDAO.findBySystemNumber(system.getSystemNumber().trim());
			if(list.size()>0){
				request.setAttribute("confirm", "此系别已经存在！");
			}else{
				systemsDAO.save(system);
				request.setAttribute("confirm", "您已经添加了系别："+system.getSystemName());
			}
		}
		return listSystems();
	}
	
	/**更新系别，转到listSystems.jsp*/
	public String modifySystem(){
		if(session.get("user")!=null && system!=null && system.getSid()!=null){
			Systems target = systemsDAO.findById(system.getSid());
			BeanUtils.copyProperties(system, target, new String[]{"sid","systemNumber","nativeSpecialtyses","studentses","userses","employeeses","classeses"});
			systemsDAO.update(target);
			request.setAttribute("confirm", "您已经更新了系别："+system.getSystemName());
		}
		return listSystems();
	}
	
	
	/**系别详情，转到showSystem.jsp*/
	public String showSystem(){
		request.setAttribute("system", this.findById());
		return SUCCESS;
	}
	
	/**删除系别，利用jquery,无跳转*/
	public void deleteSystem(){
		systemsDAO.delete(system);
	}
	
	/**编辑系别，转到editSystem.jsp*/
	public String editSystem(){
		request.setAttribute("system", this.findById());
		return SUCCESS;
	}
	
	public Systems findById(){
		return systemsDAO.findById(system.getSid());
	}

	public void getSystemsByJSON() {
		List list = systemsDAO.findSystems();
		JSONUtils.sendOfJSON(list);
	}
	
	public SystemsDAOImpl getSystemsDAO() {
		return systemsDAO;
	}

	public void setSystemsDAO(SystemsDAOImpl systemsDAO) {
		this.systemsDAO = systemsDAO;
	}

	public Systems getSystem() {
		return system;
	}

	public void setSystem(Systems system) {
		this.system = system;
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
