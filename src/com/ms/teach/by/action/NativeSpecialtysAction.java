package com.ms.teach.by.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.jruby.RubyProcess.Sys;
import org.springframework.beans.BeanUtils;

import com.ms.teach.by.dao.impl.NativeSpecialtysDAOImpl;
import com.ms.teach.by.dao.impl.StandardSpecialtysDAOImpl;
import com.ms.teach.by.pojo.NativeSpecialtys;
import com.ms.teach.by.pojo.StandardSpecialtys;
import com.ms.teach.by.pojo.Users;
import com.ms.teach.by.utils.JSONUtils;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author zongwei
 */
public class NativeSpecialtysAction extends ActionSupport implements ServletRequestAware, SessionAware{
	private HttpServletRequest request;
	private Map session;
	private NativeSpecialtysDAOImpl nativeSpecialtysDAO;
	private StandardSpecialtysDAOImpl standardSpecialtysDAO;
	private String name;
	private StandardSpecialtys standardSpecialty;
	private NativeSpecialtys nativeSpecialty;
	
	/**专业列表，转到listNativeSpecialtys.jsp*/
	public String listNativeSpecialtys(){	
		if(session.get("user")!=null){
			Users user = (Users)session.get("user");
			List list = nativeSpecialtysDAO.findBySpecialtySystem(user.getSystems());
			request.setAttribute("specialtys", list);
		}
		return "toListNativeSpecialtys";
	}

	/**保存专业，转到listNativeSpecialtys.jsp*/
	public String confirmNativeSpecialty(){
		if(standardSpecialty!=null && standardSpecialty.getSid()!=null){
			StandardSpecialtys s = standardSpecialtysDAO.findById(standardSpecialty.getSid());
			if(s!=null){
				List  list = nativeSpecialtysDAO.findBySpecialtyNumber(s.getSpecialtyNumber().trim());
				//判断要添加的专业是否已经存在
				if(list.size()==0){
					//添加专业
					if(session.get("user")!=null){
						Users user = (Users)session.get("user");
						NativeSpecialtys ns = new NativeSpecialtys();
						ns.setSystems(user.getSystems());
						ns.setSpecialtyNumber(s.getSpecialtyNumber().trim());
						ns.setSpecialtyName(s.getSpecialtyName().trim());
						ns.setSpecialtyClassNumber(s.getSpecialtyClassNumber().trim());
						ns.setSpecialtyClassName(s.getSpecialtyClassName().trim());
						ns.setSpecialtySubjectNumber(s.getSpecialtySubjectNumber().trim());
						ns.setSpecialtySubjectName(s.getSpecialtySubjectName().trim());
						ns.setSpecialtyLevel(s.getSpecialtyLevel().trim());
						ns.setSpecialtyBeginning(s.getSpecialtyBeginning().trim());
						ns.setSpecialtyExplain(s.getSpecialtyExplain().trim());
						nativeSpecialtysDAO.save(ns);
				    	request.setAttribute("confirm", "您已经添加了专业："+ns.getSpecialtyName());
					}else{
						//对于错误页面的处理
					}
				}else{
					//此专业已经存在于本地专业库中
					request.setAttribute("confirm", "此专业已经存在！");
				}
			}else{
				//...
			}
		}
		return listNativeSpecialtys();
	}
	
	/**更新专业，转到listNativeSpecialtys.jsp*/
	public String modifyNativeSpecialty(){
		if(session.get("user")!=null && nativeSpecialty!=null && nativeSpecialty.getSid()!=null){
			NativeSpecialtys target = nativeSpecialtysDAO.findById(nativeSpecialty.getSid());
			BeanUtils.copyProperties(nativeSpecialty, target, new String[]{"sid","systems","classeses","studentses","userses"});
			nativeSpecialtysDAO.update(target);
			request.setAttribute("confirm", "您已经更新了专业："+nativeSpecialty.getSpecialtyName());
		}else{
			request.setAttribute("confirm", "更新专业失败！");
		}
		return listNativeSpecialtys();
	}
	
	public NativeSpecialtys findById(){
		return nativeSpecialtysDAO.findById(nativeSpecialty.getSid());
	}
	
	/**专业详情，转到showNativeSpecialty.jsp*/
	public String showNativeSpecialty(){
		request.setAttribute("specialty", this.findById());
		return SUCCESS;
	}
	
	/**删除专业，利用jquery,无跳转*/
	public void deleteNativeSpecialty(){
		nativeSpecialtysDAO.delete(nativeSpecialty);
	}

	/**编辑专业，转到editNativeSpecialty.jsp*/
	public String editNativeSpecialty(){
		request.setAttribute("specialty", this.findById());
		return SUCCESS;
	}
	
	/**通过系别主键查找并发送专业主键及专业名称*/
	public void getNativeSpecialtysByJSON(){
		if(session.get("user")!=null){
			Users u = (Users)session.get("user");
			List list = nativeSpecialtysDAO.findSpecialtyNameBySpecialtySystem(u.getSystems());
			JSONUtils.sendOfJSON(list);
		}
	}
	
	/**通过系别主键查找并发送专业编号专业名称*/
	public void getNativeSpecialtysNumberByJSON(){
		if(session.get("user")!=null){
			Users u = (Users)session.get("user");
			List list = nativeSpecialtysDAO.findSpecialtyNumberBySpecialtySystem(u.getSystems());
			JSONUtils.sendOfJSON(list);
		}
	}

	public NativeSpecialtys getNativeSpecialty() {
		return nativeSpecialty;
	}

	public void setNativeSpecialty(NativeSpecialtys nativeSpecialty) {
		this.nativeSpecialty = nativeSpecialty;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public StandardSpecialtysDAOImpl getStandardSpecialtysDAO() {
		return standardSpecialtysDAO;
	}


	public void setStandardSpecialtysDAO(
			StandardSpecialtysDAOImpl standardSpecialtysDAO) {
		this.standardSpecialtysDAO = standardSpecialtysDAO;
	}


	public NativeSpecialtysDAOImpl getNativeSpecialtysDAO() {
		return nativeSpecialtysDAO;
	}

	public void setNativeSpecialtysDAO(NativeSpecialtysDAOImpl nativeSpecialtysDAO) {
		this.nativeSpecialtysDAO = nativeSpecialtysDAO;
	}

	public StandardSpecialtys getStandardSpecialty() {
		return standardSpecialty;
	}

	public void setStandardSpecialty(StandardSpecialtys standardSpecialty) {
		this.standardSpecialty = standardSpecialty;
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
