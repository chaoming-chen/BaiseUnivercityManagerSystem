package com.ms.teach.by.dao.impl;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.StandardCourses;

/**
 * @author zongwei
 */

public class StandardCoursesDAOImpl extends HibernateDaoSupport {
	public static final String COURSE_PROPERTY = "courseProperty";
	public static final String COURSE_NUMBER = "courseNumber";
	public static final String COURSE_NAME = "courseName";
	public static final String COURSE_THEORY_CREDIT = "courseTheoryCredit";
	public static final String COURSE_PRACTICE_CREDIT = "coursePracticeCredit";
	public static final String COURSE_THEORY_PERIOD = "courseTheoryPeriod";
	public static final String COURSE_PRACTICE_PERIOD = "coursePracticePeriod";
	public static final String COURSE_TERM = "courseTerm";
	public static final String COURSE_WEEK_PERIOD = "courseWeekPeriod";
	public static final String COURSE_EXAM = "courseExam";
	public static final String COURSE_OPEN_DEPARTMENT = "courseOpenDepartment";
	public static final String COURSE_SPECIALTY_NUMBER = "courseSpecialtyNumber";
	public static final String COURSE_SPECIALTY = "courseSpecialty";
	public static final String COURSE_EXPLAIN = "courseExplain";
	public static final String COURSE_ADD_TO_NATIVE_SIGN = "courseAddToNativeSign";

	public void save(StandardCourses standardCourse) {
		getHibernateTemplate().save(standardCourse);
	}
	public void update(StandardCourses standardCourse) {
		getHibernateTemplate().update(standardCourse);
	}

	public void delete(StandardCourses standardCourse) {
		standardCourse = this.findById(standardCourse.getCid());
		getHibernateTemplate().delete(standardCourse);
	}
	
	/*public void deleteAll(){
		List list = this.findAll();
		if(list.size()>=0)
			getHibernateTemplate().deleteAll(list);
	}*/


	public List findAll() {
		String queryString = "from StandardCourses";
		return getHibernateTemplate().find(queryString);
	}
	
	public StandardCourses findById(java.lang.Integer id) {
		StandardCourses standardCourse = (StandardCourses) getHibernateTemplate().get(
				"com.ms.teach.by.pojo.StandardCourses", id);
		return standardCourse;
	}

	public List findByExample(StandardCourses publicCourse) {
		List results = getHibernateTemplate().findByExample(publicCourse);
		return results;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from StandardCourses as model where model."
				+ propertyName + "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findByCourseSpecialtyAndProperty(Object courseSpecialty, Object courseProperty) {
		String queryString = "from StandardCourses as model where model."
				+ COURSE_SPECIALTY_NUMBER + "= ? and model."+COURSE_PROPERTY+"= ? ";
		return this.getHibernateTemplate().find(queryString,courseSpecialty,courseProperty);
	}
	
	public List findByCourseSpecialtyAndTeam(Object courseSpecialtyNumber, Object courseTeam) {
		String queryString = "from StandardCourses as model where model."
				+ COURSE_SPECIALTY_NUMBER + "= ? and model." + COURSE_TERM + "= ? order by model.courseAddToNativeSign asc";
		return this.getHibernateTemplate().find(queryString,courseSpecialtyNumber,courseTeam);
	}
	
	public List findOPenCourceBySpecialtyNumber(Object courseSpecialtyNumber) {
		String queryString = "from StandardCourses as model where model."
				+ COURSE_SPECIALTY_NUMBER + "= ? order by model.courseAddToNativeSign asc";
		return this.getHibernateTemplate().find(queryString,courseSpecialtyNumber);
	}
	
	public List findByCourseSpecialtyAndTeamAndProperty(Object courseSpecialty, Object courseTeam, Object courseProperty) {
		String queryString = "from StandardCourses as model where model."
				+ COURSE_SPECIALTY_NUMBER + "= ? and model."+COURSE_TERM+"= ? and model."+COURSE_PROPERTY+"= ? ";
		return this.getHibernateTemplate().find(queryString,courseSpecialty,courseTeam,courseProperty);
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

	public List findByCourseTerm(Object courseTerm) {
		return findByProperty(COURSE_TERM, courseTerm);
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
	
	public List findByCourseSpecialty(Object courseSpecialty) {
		return findByProperty(COURSE_SPECIALTY, courseSpecialty);
	}

	public List findByCourseExplain(Object courseExplain) {
		return findByProperty(COURSE_EXPLAIN, courseExplain);
	}
	public List findByCourseAddToNativeSign(Object courseAddToNativeSign) {
		return findByProperty(COURSE_ADD_TO_NATIVE_SIGN, courseAddToNativeSign);
	}
}