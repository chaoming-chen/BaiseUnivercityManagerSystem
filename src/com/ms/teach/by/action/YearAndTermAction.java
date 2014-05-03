package com.ms.teach.by.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ms.teach.by.dao.impl.YearTermDAOImpl;
import com.ms.teach.by.pojo.YearTerm;
import com.ms.teach.by.utils.JSONUtils;
import com.ms.teach.by.utils.YearAndTerm;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author zongwei
 */
public class YearAndTermAction extends ActionSupport implements ServletRequestAware, SessionAware{
	private HttpServletRequest request;
	private Map session;
	private YearTermDAOImpl yearTermDAO;
	private YearTerm yearTerm;
	
	public String addYearAndTerm(){
		if(yearTerm!=null && yearTerm.getYtStart()!=null && yearTerm.getYtEnd()!=null){
			String yearId = request.getParameter("yearId");
			String termId = request.getParameter("termId");
			if(yearId!=null && termId!=null){
				List temp = yearTermDAO.findByYtNumber(YearAndTerm.getYearAndTermNumber(yearId, termId));
				if(temp.size()==0){
					yearTerm.setYtNumber(YearAndTerm.getYearAndTermNumber(yearId, termId));
					yearTerm.setYtName(YearAndTerm.getYearAndTerm(yearId, termId));
					yearTermDAO.save(yearTerm);
				}else{
					//...
				}
			}
		}
		request.setAttribute("allYearAndTerm", this.findAll());
		return SUCCESS;
	}
	
	public List findAll(){
		List list = yearTermDAO.findAll();
		if(list!=null && list.size()!=0){
			return list;
		}else{
			return null;
		}
	}

	public void getYearAndTermByJSON(){
		List list = this.findAll();
		JSONUtils.sendOfJSON(list);
	}
	
	public void deleteYearAndTerm(){
		if(yearTerm!=null && yearTerm.getYearTermId()!=null){
			yearTermDAO.delete(yearTerm);
		}
	}
	
	public YearTermDAOImpl getYearTermDAO() {
		return yearTermDAO;
	}

	public void setYearTermDAO(YearTermDAOImpl yearTermDAO) {
		this.yearTermDAO = yearTermDAO;
	}

	public YearTerm getYearTerm() {
		return yearTerm;
	}

	public void setYearTerm(YearTerm yearTerm) {
		this.yearTerm = yearTerm;
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
