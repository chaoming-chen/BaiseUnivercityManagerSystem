package com.ms.teach.by.dao.impl;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.Grades;

/**
 * @author zongwei
 */

public class GradesDAOImpl extends HibernateDaoSupport {

	public static final String GRADE_NUMBER = "gradeNumber";
	public static final String GRADE_NAME = "gradeName";

	protected void initDao() {
		// do nothing
	}

	public void save(Grades grade) {
		getHibernateTemplate().save(grade);
	}

	public void delete(Grades grade) {
		grade = this.findById(grade.getGradeId());
		getHibernateTemplate().delete(grade);
	}

	public Grades findById(java.lang.Integer id) {
		Grades instance = (Grades) getHibernateTemplate().get(
				"com.ms.teach.by.pojo.Grades", id);
		return instance;
	}

	public List findByExample(Grades grade) {
		List results = getHibernateTemplate().findByExample(grade);
		return results;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Grades as model where model."
				+ propertyName + "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findByGradeNumber(Object gradeNumber) {
		return findByProperty(GRADE_NUMBER, gradeNumber);
	}

	public List findByGradeName(Object gradeName) {
		return findByProperty(GRADE_NAME, gradeName);
	}

	public List findAll() {
		String queryString = "from Grades";
		return getHibernateTemplate().find(queryString);
	}

	public static GradesDAOImpl getFromApplicationContext(ApplicationContext ctx) {
		return (GradesDAOImpl) ctx.getBean("GradesDAO");
	}
}