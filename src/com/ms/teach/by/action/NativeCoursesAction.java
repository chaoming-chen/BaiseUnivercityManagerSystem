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
import com.ms.teach.by.dao.impl.GradesDAOImpl;
import com.ms.teach.by.dao.impl.NativeCoursesDAOImpl;
import com.ms.teach.by.dao.impl.NativeSpecialtysDAOImpl;
import com.ms.teach.by.dao.impl.StandardCoursesDAOImpl;
import com.ms.teach.by.dao.impl.YearTermDAOImpl;
import com.ms.teach.by.pojo.Classes;
import com.ms.teach.by.pojo.Employees;
import com.ms.teach.by.pojo.Grades;
import com.ms.teach.by.pojo.NativeCourses;
import com.ms.teach.by.pojo.NativeSpecialtys;
import com.ms.teach.by.pojo.StandardCourses;
import com.ms.teach.by.pojo.Users;
import com.ms.teach.by.pojo.YearTerm;
import com.ms.teach.by.utils.Count;
import com.ms.teach.by.utils.JSONUtils;
import com.ms.teach.by.utils.YearAndTerm;
import com.ms.teach.by.utils.TermAndGradeSwap;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author zongwei
 */
public class NativeCoursesAction extends ActionSupport implements ServletRequestAware, SessionAware{

	private HttpServletRequest request;
	private Map session;
	private StandardCoursesDAOImpl standardCoursesDAO;
	private NativeCoursesDAOImpl nativeCoursesDAO;
	private NativeSpecialtysDAOImpl nativeSpecialtysDAO;
	private ClassesDAOImpl classesDAO;
	private EmployeesDAOImpl employeesDAO;
	private NativeCourses nativeCourse;
	private NativeSpecialtys nativeSpecialty;

	private StandardCourses standardCourse;
	private Employees employee;
	private Classes classes;
	private String selectCourses;
	private YearTermDAOImpl yearTermDAO;
	private YearTerm yearTerm;
	private GradesDAOImpl gradesDAO;
	private Grades grade;
	
	/**统计课程*/
	public void countCourses(){
		//利用自定义方法对课程门数，总课时等一些信息进行统计
		Map countCoursesMap = null;
		if(this.findUser()!=null && this.findUser().getSystems()!=null){
			List<YearTerm> ytList = yearTermDAO.findAll();
			if(ytList.size()>0){
				List countCourses = nativeCoursesDAO.findCourseBySystemAndTerm(this.findUser().getSystems().getSid(), ytList.get(0).getYtNumber());
				//获得教师人数
				List countTeacher = employeesDAO.findTeacherCountBySystem(this.findUser().getSystems());
				countCoursesMap = Count.countCourses(countCourses,Integer.parseInt(countTeacher.get(0).toString()));
				request.setAttribute("YearAndTerm", ytList.get(0).getYtName());
			}
		}else{
			//countCoursesMap = Count.countCourses(nativeCoursesDAO.findByCourseTermNumber(YearAndTerm.getYearAndTermNumber()));
		}
		request.setAttribute("countCourses", countCoursesMap);
	}
	
	/**专业课程列表，转到listSpecialtysCourses。jsp*/
	public String listSpecialtysCourses(){
		this.findCoursesBySpecialtyAndGrade();
		return SUCCESS;
	}
	
	private void findCoursesBySpecialtyAndGrade(){
		List<NativeCourses> nativeCoursesList=null;
		if(nativeCourse!=null && nativeCourse.getCourseSpecialtyNumber()!=null 
				&& nativeCourse.getCourseGradeNumber() != null && nativeCourse.getCourseTermNumber()!=null){
			
			// 判断是否在本年级这个学期已经把本课程添加到本系本地库中
		    List<NativeSpecialtys> specialtyList = nativeSpecialtysDAO.findBySpecialtyNumber(nativeCourse.getCourseSpecialtyNumber().trim());
		    List<Grades> gradeList = gradesDAO.findByGradeNumber(nativeCourse.getCourseGradeNumber().trim());
			if(specialtyList.size()>0 && gradeList.size()>0){
				NativeSpecialtys ns =  specialtyList.get(0);
				Grades g = gradeList.get(0);
				if("all".equals(nativeCourse.getCourseTermNumber().trim())){
					nativeCoursesList = nativeCoursesDAO.findByCourseSpecialtyAndGrade(
							ns.getSpecialtyNumber().trim(),g.getGradeNumber().trim());
					
					if(nativeCoursesList!=null && nativeCoursesList.size()>0){
						//给课程作分类（按学期）
						this.setCoursesSign(nativeCoursesList);
					}
				}else{
					List<YearTerm> ytList = yearTermDAO.findByYtNumber(nativeCourse.getCourseTermNumber().trim());
					if(ytList!=null && ytList.size()>0){
						YearTerm yt = ytList.get(0);
						nativeCoursesList = nativeCoursesDAO.findByCourseSpecialtyAndGradeAndTerm(
								ns.getSpecialtyNumber().trim(),g.getGradeNumber().trim(),yt.getYtNumber().trim());
						//传递学年学期
						request.setAttribute("yearTerm",yt);
					}
				}
				//传递专业
				request.setAttribute("specialty",ns);
				//传递年级
				request.setAttribute("grade",g);
				//课程
			    request.setAttribute("nativeCourses", nativeCoursesList);
			    //对应上一个年级课程
			    this.findPreviousGradeCourses(ns.getSpecialtyNumber().trim(),g.getGradeNumber());
			}else{
				
			}
		}else{
			//nativeCoursesList = nativeCoursesDAO.findAll();
		}
	}
	
	/**给课程作个分类标记，此标记说明按课程的开课学期分类*/
	private void setCoursesSign(List<NativeCourses> courses){
		if(courses!=null && courses.size()>0){
			NativeCourses nc = courses.get(0);
			String term = TermAndGradeSwap.getTermByGradeAndYearTerm(nc.getCourseGradeNumber(), nc.getCourseTermNumber());
			nc.setSign(term); 
			for (int i=0; i<courses.size()-1; i++) {
				if(!(courses.get(i).getCourseTermNumber().equals(courses.get(i+1).getCourseTermNumber()))){
					nc = courses.get(i+1);
					term = TermAndGradeSwap.getTermByGradeAndYearTerm(nc.getCourseGradeNumber(), nc.getCourseTermNumber());
					nc.setSign(term);
				}
			}
		}
	}
	/**课程列表，转到listNativeCourses.jsp*/
	public String listNativeCourses(){
		this.findBySpecialtyAndGradeAndTeam();
		this.findEmployee();
		this.countCourses();
		return SUCCESS;
	}
	
	/**通过专业,年级，学年学期条件查找课程*/
	private void findBySpecialtyAndGradeAndTeam(){
		List nativeCoursesList=null, standardCoursesList=null, employeesList=null;
		if(nativeCourse!=null && nativeCourse.getCourseSpecialtyNumber()!=null 
				&& nativeCourse.getCourseTermNumber() != null && nativeCourse.getCourseGradeNumber()!=null){
			nativeCoursesList = nativeCoursesDAO.findByCourseSpecialtyAndGradeAndTerm(
				nativeCourse.getCourseSpecialtyNumber().trim(),
				nativeCourse.getCourseGradeNumber().trim(),nativeCourse.getCourseTermNumber().trim());
			request.setAttribute("nativeCourses", nativeCoursesList);
		}else{
			//nativeCoursesList = nativeCoursesDAO.findAll();
		}
		
	   if(standardCourse!=null && standardCourse.getCourseSpecialtyNumber()!=null 
			   && !"".equals(standardCourse.getCourseSpecialtyNumber().trim())){
		   if("000000".equals(standardCourse.getCourseSpecialtyNumber())){
			   standardCoursesList = standardCoursesDAO.findOPenCourceBySpecialtyNumber(standardCourse.getCourseSpecialtyNumber());
		   }else if(standardCourse.getCourseTerm()!=null){
			   standardCoursesList = standardCoursesDAO.findByCourseSpecialtyAndTeam(standardCourse.getCourseSpecialtyNumber().trim(), standardCourse.getCourseTerm().trim());
		   }
		   request.setAttribute("standardCourses", standardCoursesList);
		}
	}
	
	/**查找上一年级所有学期课程*/
	private void findPreviousGradeCourses(String specialtyNumber,String gradeNumber) {
		List<NativeCourses> nativeCoursesList = null;
		if(specialtyNumber!=null && gradeNumber!=null && (!("".equals(gradeNumber)))){
			gradeNumber = String.valueOf((Integer.parseInt(gradeNumber)-1));
			List<Grades> gList = gradesDAO.findByGradeNumber(gradeNumber);
			if(gList.size()>0){
				nativeCoursesList = nativeCoursesDAO.findByCourseSpecialtyAndGrade(specialtyNumber,gradeNumber);
				//给课程作分类（按学期）
				this.setCoursesSign(nativeCoursesList);
				request.setAttribute("previousGrade", gList.get(0));
				request.setAttribute("previousGradeCourses", nativeCoursesList);
			}
		}
	}
	
	/**查找上一年级某一学期课程*/
	private void findPreviousGradeCourses(String specialtyNumber,String gradeNumber, String termNumber) {
		List nativeCoursesList = null;
		if(specialtyNumber!=null && gradeNumber!=null && (!("".equals(gradeNumber)))){
			gradeNumber = String.valueOf((Integer.parseInt(gradeNumber)-1));
			List<Grades> gList = gradesDAO.findByGradeNumber(gradeNumber);
			if(gList.size()>0){
				String ytNumber = TermAndGradeSwap.getYearTermByGradeAndTerm(gradeNumber, termNumber);
				nativeCoursesList = nativeCoursesDAO.findByCourseSpecialtyAndGradeAndTerm(specialtyNumber,gradeNumber,ytNumber);
				request.setAttribute("previousGrade", gList.get(0));
				request.setAttribute("previousGradeCourses", nativeCoursesList);
			}
		}
	}
	
	/**添加课程，转到addNativeCourse.jsp*/
	public String addNativeCourse(){
		List<StandardCourses> standardCoursesList = null;
		List<NativeCourses> nativeCoursesList = null;
		String termNum = "";
		if(standardCourse!=null && standardCourse.getCourseSpecialtyNumber()!=null 
				&& grade!=null && grade.getGradeNumber()!=null && yearTerm!=null 
				&& yearTerm.getYtNumber()!=null && this.findUser()!=null){
				//查找拟开设课程
		    if("000000".equals(standardCourse.getCourseSpecialtyNumber())){
			    standardCoursesList = standardCoursesDAO.findOPenCourceBySpecialtyNumber(standardCourse.getCourseSpecialtyNumber());
		    }else{
		    	termNum = TermAndGradeSwap.getTermByGradeAndYearTerm(grade.getGradeNumber(), yearTerm.getYtNumber());
			    standardCoursesList = standardCoursesDAO.findByCourseSpecialtyAndTeam(standardCourse.getCourseSpecialtyNumber().trim(), termNum);
		    }
		    
			// 判断是否在本年级这个学期已经把本课程添加到本系本地库中
		    List<NativeSpecialtys> specialtyList = nativeSpecialtysDAO.findBySpecialtyNumber(standardCourse.getCourseSpecialtyNumber().trim());
		    List<Grades> gradeList = gradesDAO.findByGradeNumber(grade.getGradeNumber());
			List<YearTerm> ytList = yearTermDAO.findByYtNumber(yearTerm.getYtNumber());
			if(specialtyList.size()>0 && gradeList.size()>0 && ytList.size()>0 && standardCoursesList.size()>0){
				NativeSpecialtys ns =  specialtyList.get(0);
				Grades g = gradeList.get(0);
				YearTerm yt = ytList.get(0);
				
				for (StandardCourses s : standardCoursesList) {
					List<NativeCourses> list = nativeCoursesDAO.findByCourseNumberAndSystem(s.getCourseNumber(),this.findUser().getSystems());
					// 如果存在于本系本地课程库中
					if (list.size()>0) {
						NativeCourses nc = list.get(0);
						// 如果本年级本学期已经添加了此课程，则作临时标记,以便页面显示为"本年级本学期已添加此课程";
						if (nc.getCourseGradeNumber().equals(g.getGradeNumber())
								 && nc.getCourseTermNumber().equals(yt.getYtNumber())) {
							s.setCourseAddToNativeSign("1");
						}
					}
				}
				//传递专业
				request.setAttribute("specialty",ns);
				//传递年级
				request.setAttribute("grade",g);
				//传递学年学期
				request.setAttribute("yearTerm", yt);
				//传递学期
				request.setAttribute("term", termNum);
			 }
			 findPreviousGradeCourses(standardCourse.getCourseSpecialtyNumber().trim(),grade.getGradeNumber().trim(),termNum.trim());
	   	 }
		
		 request.setAttribute("standardCourses", standardCoursesList);
		 
		 nativeCoursesList = nativeCoursesDAO.findByCourseSpecialtyAndGradeAndTerm(
				 standardCourse.getCourseSpecialtyNumber().trim(),grade.getGradeNumber().trim(),
				 yearTerm.getYtNumber().trim());
		 
		request.setAttribute("nativeCourses", nativeCoursesList);
		 
		 return SUCCESS;
	}
	
	/**确认添加课程，转到confirmAddNativeCourses.jsp*/
	public String confirmAddNativeCourses() {
		List coursesList = new ArrayList();
		if (this.getSelectCourses() != null && this.findUser() != null 
				&& yearTerm!=null && yearTerm.getYtNumber() != null
				&& grade!=null && grade.getGradeNumber()!=null) {
			String[] cNumbers = this.getSelectCourses().trim().split(",");
			
			List<NativeSpecialtys> nsList = nativeSpecialtysDAO.findBySpecialtyNumber(nativeSpecialty.getSpecialtyNumber());
			List<Grades> gradeList = gradesDAO.findByGradeNumber(grade.getGradeNumber());
			List<YearTerm> ytList = yearTermDAO.findByYtNumber(yearTerm.getYtNumber());
			if (gradeList.size()>0 && ytList.size() > 0) {
				Grades g = gradeList.get(0);
				YearTerm yt = ytList.get(0);
				NativeSpecialtys ns = nsList.get(0);
				// 循环提交上来的多选框的数据
				for (String cNumber : cNumbers) {
					//System.out.println(cNumber);
					if (cNumber != null && !"".equals(cNumber.trim())) {
						// 查询此课程是否存在
						List<StandardCourses> sc = standardCoursesDAO.findByCourseNumber(cNumber.trim());
						if (sc != null && sc.size()>0) {
							// 判断要添加的课程是否在本年级本学期已经已经添加,这步必须做，防止刷新。 
							List<NativeCourses> list = nativeCoursesDAO.findByCourseNumber(cNumber);
							// 如果不在本系本地课程库中
							boolean exist = false;
							if (list!=null && list.size()>0) {
								NativeCourses nc = list.get(0);
								// 如果本年级本学期已经添加了此课程;
								if (nc.getCourseSpecialtyNumber().equals(ns.getSpecialtyNumber()) 
										&& nc.getCourseGradeNumber().equals(g.getGradeNumber())
										&& nc.getCourseTermNumber().equals(yt.getYtNumber())) {
									exist = false;
								}else{
									exist = true;
								}
							}else{
								exist = true;
							}
							if(exist==true){
								StandardCourses p = sc.get(0);
								NativeCourses np = new NativeCourses();
								np.setSystems(this.findUser().getSystems());
								
								//设置年级
								np.setCourseGradeNumber(g.getGradeNumber());
								np.setCourseGrade(g.getGradeName());
								
								// 设置学年学期信息
								np.setCourseTermNumber(yt.getYtNumber());
								np.setCourseTerm(yt.getYtName());

								np.setCourseProperty(p.getCourseProperty().trim());
								np.setCourseNumber(p.getCourseNumber().trim());
								np.setCourseName(p.getCourseName().trim());
								np.setCourseTheoryCredit(p.getCourseTheoryCredit());
								np.setCoursePracticeCredit(p.getCoursePracticeCredit());
								np.setCourseTheoryPeriod(p.getCourseTheoryPeriod());
								np.setCoursePracticePeriod(p.getCoursePracticePeriod());

								np.setCourseWeekPeriod(p.getCourseWeekPeriod());
								np.setCourseExam(p.getCourseExam().trim());
								np.setCourseOpenDepartment(p.getCourseOpenDepartment().trim());
								np.setCourseSpecialtyNumber(p.getCourseSpecialtyNumber().trim());
								np.setCourseSpecialty(p.getCourseSpecialty().trim());
								np.setCourseExplain(p.getCourseExplain().trim());
								nativeCoursesDAO.save(np);
								coursesList.add(np);
							}
						}
					}
				}
			}
			request.setAttribute("newAddCourses", coursesList);
		} else {
			request.setAttribute("newAddCourses", null);
		}
		return SUCCESS;
	}
	
	/**查找学年学期，如果提交上来的数据没有选择学年学期，则以最新的学年学期为准*/
	private YearTerm findYearAndTermByNumber(YearTerm yt){
		if(yt==null || yt.getYtNumber()==null){
			List<YearTerm> ytList = yearTermDAO.findAll();
			if(ytList.size()>0){
				yt = ytList.get(0);
			}
		}
		List<YearTerm> ytList = yearTermDAO.findByYtNumber(yt.getYtNumber());
		if(ytList.size()>0)
			return ytList.get(0);
		return null;
	}

	/**查找教师*/
	private void findEmployee(){
		if(employee!=null && employee.getEid()!=null){
			employee = employeesDAO.findById(employee.getEid());
			request.setAttribute("employee", employee);
		}
	}
	
	/**查找教师已任课程*/
	public String listTeacherSelectedCourses(){
		if(employee!=null && employee.getEid()!=null){
			List<NativeCourses> selectedCourses = new ArrayList<NativeCourses>();
			employee = employeesDAO.findById(employee.getEid());
			YearTerm yt = this.findYearAndTermByNumber(yearTerm);
			if(employee!=null && yt!=null){
				Set<NativeCourses> ncSet = employee.getNativeCourseses();
				if(ncSet!=null && ncSet.size()>0){
					for (NativeCourses nc : ncSet) {
						if(yt.getYtNumber().equals(nc.getCourseTermNumber())){
							selectedCourses.add(nc);
						}
					}
					request.setAttribute("teacherSelectedCourses", selectedCourses);
				}
				request.setAttribute("employee", employee);
				request.setAttribute("yearTerm", yt);
			}
		}
		return SUCCESS;
	}
	
	/**课程信息(弹框)*/
	public void popCourseMsg(){
		List courseMsg = new ArrayList();
		//System.out.println(request.getParameter("employee_id"));
		if(request.getParameter("course_id")!=null){
			nativeCourse = nativeCoursesDAO.findById(request.getParameter("course_id").trim());
			if(nativeCourse!=null){
				//nativeCourse.getEmployees();
				//System.out.println(nativeCourse.getCourseName());
				//...
				JSONUtils.sendOfJSON(courseMsg);
			}
		}
	}
	
	/**查找教师已任课程(弹框)*/
	public void popTeacherSelectedCourses(){
		List selectedCourses = new ArrayList();
		//System.out.println(request.getParameter("employee_id"));
		if(request.getParameter("employee_id")!=null){
			employee = employeesDAO.findById(Integer.parseInt(request.getParameter("employee_id").trim()));
			if(employee!=null){
				Set<NativeCourses> ncSet = employee.getNativeCourseses();
				if(ncSet!=null && ncSet.size()>0){
					Iterator<NativeCourses> it =ncSet.iterator();
					while(it.hasNext()){
						String classesName = "";
						int num =1;
						NativeCourses n = it.next();
						NativeCourses n2 = new NativeCourses();
						
						List<NativeSpecialtys> specialtyList = nativeSpecialtysDAO.findBySpecialtyNumber(n.getCourseSpecialtyNumber());
						if(specialtyList!=null && specialtyList.size()>0){
							Set<Classes> s = specialtyList.get(0).getClasseses();
							Iterator<Classes> it2 = s.iterator();
							while(it2.hasNext()){
								Classes cs = it2.next();
								if(n.getCourseGradeNumber().equals(cs.getClassGradeNumber())){
									classesName+=cs.getClassName();
									if(num<s.size()&&it2.hasNext()) classesName+="，";
								}
								num++;
							}
						}
						//System.out.println(classesName);
						n2.setCourseNumber(n.getCourseNumber());
						n2.setCourseName(n.getCourseName());
						n2.setCourseTeacherNumber(n.getEmployees().getEmployeeNumber());
						n2.setCourseTeacherName(n.getEmployees().getEmployeeName());
						n2.setCourseClassName(classesName);
						selectedCourses.add(n2);
						
					}
					JSONUtils.sendOfJSON(selectedCourses);
				}
			}
		}
	}
	
	/**确认教师选择课程，转到confirmTeacherSelectCourses*/
	public String confirmTeacherSelectCourses() {
		if (this.getSelectCourses() != null && !"".equals(this.getSelectCourses().trim())) {
			String[] cids = this.getSelectCourses().trim().split(",");
			//循环提交上来的多选框的数据
			for (String cid : cids) {
				if (cid != null && !"".equals(cid.trim())) {
					//判断课程是否已经有教师担任
					NativeCourses p = nativeCoursesDAO.findById(cid.trim());
					if (p != null && employee!=null && employee.getEid()!=null) {
						//更新课程的任课教师字段
						Employees ep = new Employees();
						ep.setEid(employee.getEid());
						p.setEmployees(ep);
						nativeCoursesDAO.update(p);
					}else{
						//request.setAttribute("confirm", "此课程已有教师担任!");
					}
				}
			}
		}
		
		if(employee!=null && employee.getEid()!=null){
			employee = employeesDAO.findById(employee.getEid());
			Set<NativeCourses> selectedCourses = employee.getNativeCourseses();
			request.setAttribute("teacherSelectedCourses", selectedCourses);
			request.setAttribute("employee", employee);
		}
		return SUCCESS;
	}
	
	/**删除某个专业本地课程，利用jquery,无跳转*/
	public void deleteSelectedCourse(){
		if(nativeCourse!=null && nativeCourse.getCid()!=null){
			nativeCoursesDAO.delete(nativeCourse);
		}
	}
	/**取消教师已选择的某课程，利用jquery,无跳转*/
	public void cancelTeacherSelectedCourse(){
		if(nativeCourse!=null && nativeCourse.getCid()!=null){
			nativeCourse = nativeCoursesDAO.findById(nativeCourse.getCid());
			if(nativeCourse!=null){
				nativeCourse.setEmployees(null);
				nativeCoursesDAO.update(nativeCourse);
			}
		}
	}
	
	/**查找班级*/
	private List findClass(){
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
	
	/**查找班级已选的课程*/
	public String listClassSelectedCourses(){
		if(classes!=null && classes.getClassId()!=null){
			List<NativeCourses> selectedCourses = new ArrayList<NativeCourses>();
			classes = classesDAO.findById(classes.getClassId().trim());
			YearTerm yt = this.findYearAndTermByNumber(yearTerm);
			if(classes!=null && yt!=null){
				Set<NativeCourses> ncSet = classes.getNativeCourses();
				if(ncSet!=null && ncSet.size()>0){
					for (NativeCourses nc : ncSet) {
						if(yt.getYtNumber().equals(nc.getCourseTermNumber())){
							selectedCourses.add(nc);
						}
					}
					request.setAttribute("classSelectedCourses", selectedCourses);
				}
				request.setAttribute("myClass", classes);
				request.setAttribute("yearTerm", yt);
			}
		}
		return SUCCESS;
	}
	
	
	
	/**班级选择课程，转到classSelectNativeCourses.jsp*/
	public String selectClassAndClassCourses(){
		String classId = request.getParameter("classId");
		if(classId!=null){
		    Classes selectedClass = classesDAO.findById(classId.trim());
		    if(selectedClass!=null){
				request.setAttribute("selectedClass", selectedClass);
				List<YearTerm> ytList = yearTermDAO.findAll();
				if(ytList.size()>0){
					//取最新学年学期的课程
					List nativeCourses = new ArrayList(); // 此班级未选择的课程
					List classSelectedNativeCourses = new ArrayList();// 此班级已选择的课程
					
					//提交一个班级信息，就知道它的专业，年级信息。而且只能选择最新课程
					List<NativeCourses> temp = nativeCoursesDAO.findByCourseSpecialtyAndGradeAndTerm(
							selectedClass.getNativeSpecialtys().getSpecialtyNumber(),selectedClass.getClassGradeNumber(),
							ytList.get(0).getYtNumber());
					
					//取出此班级的课程作比较，ID相同且学年学期及年级的编号相同，为已选择课程
					Set ncSet = selectedClass.getNativeCourses();
					for (NativeCourses nc : temp) {
						Iterator it = ncSet.iterator();
						boolean sign = false;
						while (it.hasNext()) {
							NativeCourses ncTemp = (NativeCourses) it.next();
							if (ncTemp.getCid().equals(nc.getCid())
									&& ncTemp.getCourseTermNumber().equals(nc.getCourseTermNumber())
									&& ncTemp.getCourseGradeNumber().equals(nc.getCourseGradeNumber())) {
								sign = true;
								break;
							}
						}
						if (sign == false) {
							nativeCourses.add(nc);
						} else {
							classSelectedNativeCourses.add(nc);
						}
					}
					request.setAttribute("nativeCourses", nativeCourses);
					request.setAttribute("classSelectedNativeCourses",classSelectedNativeCourses);
				}
		    }else{
		    	request.setAttribute("classes", this.findClass());
		    }
		}else{
			request.setAttribute("classes", this.findClass());
		}
		return SUCCESS;
	}
	
	/**确认班级选择课程，转到confirmClassSelectCourses.jsp*/
	public String confirmClassSelectCourses(){
		if (classes!=null && classes.getClassId()!=null && this.getSelectCourses() != null && !"".equals(this.getSelectCourses().trim())) {
			String[] cids = this.getSelectCourses().split(",");
			Classes updateClass = classesDAO.findById(classes.getClassId());
			List<YearTerm> ytList = yearTermDAO.findAll();
			if(updateClass!=null && updateClass.getClassNumber()!=null && ytList.size()>0){
				List<NativeCourses> temp = nativeCoursesDAO.findByCourseSpecialtyAndGradeAndTerm(
						updateClass.getNativeSpecialtys().getSpecialtyNumber(),updateClass.getClassGradeNumber(),
						ytList.get(0).getYtNumber());
				Set ncSet = updateClass.getNativeCourses();
				//循环提交上来的多选框的数据
				for (String cid : cids) {
					if (cid != null && !"".equals(cid.trim())) {
						NativeCourses p = nativeCoursesDAO.findById(cid.trim());
						/**判断班级是否已经选择了此课程，这步必须做，防止刷新*/
						for (NativeCourses nc : temp) {
							Iterator it = ncSet.iterator();
							boolean sign = false;
							while (it.hasNext()) {
								NativeCourses ncTemp = (NativeCourses) it.next();
								if (ncTemp.getCid().equals(nc.getCid())
										&& ncTemp.getCourseTermNumber().equals(nc.getCourseTermNumber())
										&& ncTemp.getCourseGradeNumber().equals(nc.getCourseGradeNumber())) {
									sign = true;
									break;
								}
							}
							if (sign == false) {
								ncSet.add(p);
							} 
						}
					}
				}
				//更新班级的课程字段(多对多关系)
				classesDAO.merge(updateClass);
				
				//传递班级已添加的课程列表
				request.setAttribute("classSelectedCourses", ncSet);
				request.setAttribute("myClass", updateClass);
			}
			
		}
		return SUCCESS;
	}
	
	/**取消某班级已选择的某课程，利用jquery,无跳转*/
	public void cancelClassSelectedCourse(){
		if(classes!=null && classes.getClassId()!=null 
				&& nativeCourse!=null && nativeCourse.getCid()!=null){
			classes = classesDAO.findById(classes.getClassId().trim());
			if(classes!=null){
				Set classCourses = classes.getNativeCourses();
				if(classCourses!=null){
					Iterator<NativeCourses> it = classCourses.iterator();
					while(it.hasNext()){
						NativeCourses nc = it.next();
						if(nc.getCid().equals(nativeCourse.getCid())){
							classCourses.remove(nc);
							classes.setNativeCourses(classCourses);
							classesDAO.update(classes);
							break;
						}
					}
				}
			}
		}
	}
	
	/**删除课程，利用jquery,无跳转*/
	public void deleteNativeCourse(){
		nativeCourse =nativeCoursesDAO.findById(nativeCourse.getCid());
		if(nativeCourse!=null){
			List<StandardCourses> list = standardCoursesDAO.findByCourseName(nativeCourse.getCourseName().trim());
			nativeCoursesDAO.delete(nativeCourse);
			if(list.size()>0){
				for (StandardCourses sc : list) {
					sc.setCourseAddToNativeSign(null);
					standardCoursesDAO.update(sc);
				}
			}
		}
	}
	
	private Users findUser(){
		if(session.get("user")!=null){
			return (Users)session.get("user");
		}else{
			return null;
		}
	}
	
	public String updateNativeCourse(){
		request.setAttribute("confirm", "更新课程成功!");
		return SUCCESS;
	}
	
	/**.......*/
	public String teacherSelectNativeCourses(){
		if(nativeCourse!=null && nativeCourse.getCourseSpecialty()!=null && nativeCourse.getCourseTerm()!=null){
			nativeCoursesDAO.findByCourseSpecialtyAndGradeAndTerm(
					nativeCourse.getCourseSpecialtyNumber().trim(),
					nativeCourse.getCourseGradeNumber().trim(),nativeCourse.getCourseTermNumber().trim());
		}
		return SUCCESS;
	}


	public void selectSubjectBaseCourses(){
		
	}
	public void selectSpecialtyBaseCourses(){
		
	}
	public void selectSpecialtyDevelopCourses(){
		
	}
	
	public String confirmSelectCourses(){
		//this.addTeacherSelectCourses();
		this.selectSubjectBaseCourses();
		this.selectSpecialtyBaseCourses();
		this.selectSpecialtyDevelopCourses();
		return SUCCESS;
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
	public StandardCoursesDAOImpl getStandardCoursesDAO() {
		return standardCoursesDAO;
	}

	public void setStandardCoursesDAO(StandardCoursesDAOImpl standardCoursesDAO) {
		this.standardCoursesDAO = standardCoursesDAO;
	}

	public NativeCoursesDAOImpl getNativeCoursesDAO() {
		return nativeCoursesDAO;
	}

	public void setNativeCoursesDAO(NativeCoursesDAOImpl nativeCoursesDAO) {
		this.nativeCoursesDAO = nativeCoursesDAO;
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


	public StandardCourses getStandardCourse() {
		return standardCourse;
	}

	public void setStandardCourse(StandardCourses standardCourse) {
		this.standardCourse = standardCourse;
	}
	
	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	
	public NativeSpecialtys getNativeSpecialty() {
		return nativeSpecialty;
	}

	public void setNativeSpecialty(NativeSpecialtys nativeSpecialty) {
		this.nativeSpecialty = nativeSpecialty;
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
