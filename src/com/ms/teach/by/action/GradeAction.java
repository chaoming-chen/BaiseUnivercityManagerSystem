package com.ms.teach.by.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ms.teach.by.dao.impl.GradesDAOImpl;
import com.ms.teach.by.dao.impl.YearTermDAOImpl;
import com.ms.teach.by.pojo.Grades;
import com.ms.teach.by.pojo.YearTerm;
import com.ms.teach.by.utils.JSONUtils;
import com.ms.teach.by.utils.YearAndTerm;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author zongwei
 */
public class GradeAction extends ActionSupport implements ServletRequestAware, SessionAware{
	private HttpServletRequest request;
	private Map session;
	private GradesDAOImpl gradesDAO;
	private Grades grade;
	
	public String addGrade(){
		if(grade!=null && grade.getGradeNumber()!=null){
			String gradeNumber = grade.getGradeNumber();
			List temp = gradesDAO.findByGradeNumber(gradeNumber);
			if(temp.size()==0){
				String gradeName = gradeNumber+" 级";
				grade.setGradeName(gradeName);
				gradesDAO.save(grade);
			}else{
				//...
			}
		}
		request.setAttribute("grades", this.findAll());
		return SUCCESS;
	}
	
	public List findAll(){
		List list = gradesDAO.findAll();
		if(list!=null && list.size()!=0){
			return list;
		}else{
			return null;
		}
	}

	public void getGradesByJSON(){
		List list = this.findAll();
		JSONUtils.sendOfJSON(list);
	}
	
	public void deleteGrade(){
		if(grade!=null && grade.getGradeId()!=null){
			gradesDAO.delete(grade);
		}
	}
	

	public GradesDAOImpl getGradesDAO() {
		return gradesDAO;
	}

	public void setGradesDAO(GradesDAOImpl gradesDAO) {
		this.gradesDAO = gradesDAO;
	}

	public Grades getGrade() {
		return grade;
	}

	public void setGrade(Grades grade) {
		this.grade = grade;
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
