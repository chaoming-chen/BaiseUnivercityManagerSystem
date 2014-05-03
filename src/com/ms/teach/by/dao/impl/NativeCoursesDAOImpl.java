package com.ms.teach.by.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.NativeCourses;

/**
 * @author zongwei
 */

public class NativeCoursesDAOImpl extends HibernateDaoSupport{
	public static final String COURSE_PROPERTY = "courseProperty";
	public static final String COURSE_NUMBER = "courseNumber";
	public static final String COURSE_NAME = "courseName";
	//public static final String COURSE_TEACHER = "courseTeacher";
	public static final String SYSTEMS = "systems";
	public static final String COURSE_THEORY_CREDIT = "courseTheoryCredit";
	public static final String COURSE_PRACTICE_CREDIT = "coursePracticeCredit";
	public static final String COURSE_THEORY_PERIOD = "courseTheoryPeriod";
	public static final String COURSE_PRACTICE_PERIOD = "coursePracticePeriod";
	public static final String COURSE_TERM_NUMBER = "courseTermNumber";
	public static final String COURSE_TERM = "courseTerm";
	public static final String COURSE_WEEK_PERIOD = "courseWeekPeriod";
	public static final String COURSE_EXAM = "courseExam";
	public static final String COURSE_OPEN_DEPARTMENT = "courseOpenDepartment";
	public static final String COURSE_SPECIALTY_NUMBER = "courseSpecialtyNumber";
	public static final String COURSE_SPECIALTY = "courseSpecialty";
	public static final String COURSE_GRADE_NUMBER = "courseGradeNumber";
	public static final String COURSE_GRADE = "courseGrade";
	public static final String COURSE_EXPLAIN = "courseExplain";


	public void save(NativeCourses nativeCourse) {
		getHibernateTemplate().save(nativeCourse);
	}
	public void update(NativeCourses nativeCourse) {
		getHibernateTemplate().update(nativeCourse);
	}

	public void delete(NativeCourses nativeCourse) {
		nativeCourse = this.findById(nativeCourse.getCid());
		getHibernateTemplate().delete(nativeCourse);
	}
	
	/*	public void deleteAll(){
		List list = this.findAll();
		if(list.size()>=0)
			getHibernateTemplate().deleteAll(list);
	}*/

	public List findAll() {
		String queryString = "from NativeCourses";
		return getHibernateTemplate().find(queryString);
	}
	public NativeCourses findById(java.lang.String id) {
		NativeCourses nativeCourse = (NativeCourses) getHibernateTemplate().get(
				"com.ms.teach.by.pojo.NativeCourses", id);
		return nativeCourse;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from NativeCourses as model where model."
				+ propertyName + "= ? ";
		return getHibernateTemplate().find(queryString, value);
	}
	
	public List findByCourseSpecialtyAndProperty(Object courseSpecialty, Object courseProperty) {
		String queryString = "from NativeCourses as model where model."
				+ COURSE_SPECIALTY + "= ? and model."+COURSE_PROPERTY+"= ?  order by model.employees.eid asc";
		return this.getHibernateTemplate().find(queryString,courseSpecialty,courseProperty);
	}
	public List findByCourseSpecialtyAndGradeAndTerm(Object courseSpecialtyNumber, Object courseGradeNumber, Object courseTeamNumber) {
		String queryString = "from NativeCourses as model where model."
				+ COURSE_SPECIALTY_NUMBER + "= ? and model." 
				+ COURSE_GRADE_NUMBER + "= ? and model."
				+COURSE_TERM_NUMBER  +"= ? order by model.employees.eid asc";
		return this.getHibernateTemplate().find(queryString,courseSpecialtyNumber,courseGradeNumber,courseTeamNumber);
	}
	
	public List findByCourseSpecialtyAndGrade(Object courseSpecialtyNumber, Object courseGradeNumber) {
		String queryString = "from NativeCourses as model where model."
				+ COURSE_SPECIALTY_NUMBER + "= ? and model." 
				+ COURSE_GRADE_NUMBER + "= ?  order by model.courseTermNumber desc";
		return this.getHibernateTemplate().find(queryString,courseSpecialtyNumber,courseGradeNumber);
	}
	
	public List findByCourseSpecialtyAndTeamAndProperty(Object courseSpecialty, Object courseTeamNumber, Object coursePropertyNumber) {
		String queryString = "from NativeCourses as model where model."
				+ COURSE_SPECIALTY + "= ? and model."+COURSE_TERM+"= ? and model."+COURSE_PROPERTY
				+"= ?  order by model.employees.eid asc";
		return this.getHibernateTemplate().find(queryString,courseSpecialty,courseTeamNumber,coursePropertyNumber);
	}
	
	public List findCourseBySystemAndTerm(Object systemId, Object courseTermNumber) {
		String queryString = "from NativeCourses as model where model."
				+ SYSTEMS + "= ? and model."+COURSE_TERM_NUMBER+"= ? order by model.employees.eid asc";
		return getHibernateTemplate().find(queryString,systemId,courseTermNumber);
	}
	public List findByCourseNumberAndSystem(Object courseNumber, Object system) {
		String queryString = "from NativeCourses as model where model."
				+ COURSE_NUMBER + "= ? and model."+ SYSTEMS +"= ? ";
		return getHibernateTemplate().find(queryString, courseNumber,system);
	}
	public List findByCourseNumberAndSpecialty(Object courseNumber, Object courseSpecialty) {
		String queryString = "from NativeCourses as model where model."
				+ COURSE_NUMBER + "= ? and model."+ COURSE_SPECIALTY +"= ? ";
		return getHibernateTemplate().find(queryString, courseNumber,courseSpecialty);
	}
	
	/*public List findCoursesByEmployee(Object employee) {
		String queryString = "select model."+COURSE_NUMBER+" , model."+COURSE_NAME+" from NativeCourses as model where model."
				+ SYSTEMS + "= ?";
		return getHibernateTemplate().find(queryString, specialtySystem);
	}*/
	
	/*public List findByCourseTeacher(Object courseTeacher) {
		System.out.println("n"+courseTeacher);
		String queryString = " from NativeCourses as model where model."+ COURSE_TEACHER +"=1 ";
		return this.getHibernateTemplate().find(queryString);
	}*/
	
	public List findByExample(NativeCourses nativeCourse) {
		List results = getHibernateTemplate().findByExample(nativeCourse);
		return results;
	}

	public List findByCourseTermNumber(Object courseTermNumber) {
		return findByProperty(COURSE_TERM_NUMBER, courseTermNumber);
	}
	public List findByCourseTerm(Object courseTerm) {
		return findByProperty(COURSE_TERM, courseTerm);
	}
	
	public List findByCourseProperty(Object courseProperty) {
		return findByProperty(COURSE_PROPERTY, courseProperty);
	}

	public List findByCourseNumber(Object courseNumber) {
		return findByProperty(COURSE_NUMBER, courseNumber);
	}
	

	public List findByCourseName(Object courseName) {
		return findByProperty(COURSE_NAME, courseName);
	}

	public List findByCourseTheoryCredit(Object courseTheoryCredit) {
		return findByProperty(COURSE_THEORY_CREDIT, courseTheoryCredit);
	}

	public List findByCoursePracticeCredit(Object coursePracticeCredit) {
		return findByProperty(COURSE_PRACTICE_CREDIT, coursePracticeCredit);
	}

	public List findByCourseTheoryPeriod(Object courseTheoryPeriod) {
		return findByProperty(COURSE_THEORY_PERIOD, courseTheoryPeriod);
	}

	public List findByCoursePracticePeriod(Object coursePracticePeriod) {
		return findByProperty(COURSE_PRACTICE_PERIOD, coursePracticePeriod);
	}


	public List findByCourseWeekPeriod(Object courseWeekPeriod) {
		return findByProperty(COURSE_WEEK_PERIOD, courseWeekPeriod);
	}

	public List findByCourseExam(Object courseExam) {
		return findByProperty(COURSE_EXAM, courseExam);
	}

	public List findByCourseOpenDepartment(Object courseOpenDepartment) {
		return findByProperty(COURSE_OPEN_DEPARTMENT, courseOpenDepartment);
	}

	public List findByCourseExplain(Object courseExplain) {
		return findByProperty(COURSE_EXPLAIN, courseExplain);
	}
}