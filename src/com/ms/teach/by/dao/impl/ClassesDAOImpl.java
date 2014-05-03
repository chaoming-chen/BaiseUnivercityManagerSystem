package com.ms.teach.by.dao.impl;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.Classes;

/**
 * @author zongwei
 */

public class ClassesDAOImpl extends HibernateDaoSupport {
	
	public static final String CLASSID = "classId";
	public static final String CLASS_NUMBER = "classNumber";
	public static final String CLASS_NAME = "className";
	public static final String NATIVE_SPECIALTYS = "nativeSpecialtys";
	public static final String SYSTEMS = "systems";
	public static final String CLASS_GRADE_NUMBER = "classGradeNumber";
	public static final String CLASS_GRADE = "classGrade";
	public static final String CLASS_TEACHER = "classTeacher";
	public static final String CLASS_PHONE = "classPhone";
	public static final String CLASS_EMAIL = "classEmail";
	public static final String CLASS_QQ = "classQq";
	public static final String CLASS_EXPLAIN = "classExplain";

	public void save(Classes classes) {
		getHibernateTemplate().save(classes);
	}
	
	public void update(Classes classes) {
		getHibernateTemplate().update(classes);
	}
	public void merge(Classes classes) {
		getHibernateTemplate().merge(classes);
	}
	public void saveOrUpdate(Classes classes) {
		getHibernateTemplate().saveOrUpdate(classes);
	}
	
	public void delete(Classes classes) {
		classes = this.findById(classes.getClassId());
		getHibernateTemplate().delete(classes);
	}

	public Classes findById(java.lang.String id) {
		Classes classes = (Classes) getHibernateTemplate().get("com.ms.teach.by.pojo.Classes", id);
		return classes;
	}
	
	public List findAll() {
		String queryString = "from Classes";
		return getHibernateTemplate().find(queryString);
	}
	public List countClassesByCourse() {
		String queryString = "select count(*) from Classes";
		return getHibernateTemplate().find(queryString);
	}
	
	public List findByExample(Classes classes) {
		List results = getHibernateTemplate().findByExample(classes);
		return results;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Classes as model where model."
				+ propertyName + "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findByClassNumber(Object classNumber) {
		return findByProperty(CLASS_NUMBER, classNumber);
	}

	public List findByClassName(Object className) {
		return findByProperty(CLASS_NAME, className);
	}

	public List findByClassSpecialty(Object classSpecialty) {
		return findByProperty(NATIVE_SPECIALTYS, classSpecialty);
	}
	public List findClassNameByClassSpecialty(Object classSpecialty) {
		String queryString = "select model."+CLASSID+", model."+CLASS_NAME+" from Classes as model where model."
				+ NATIVE_SPECIALTYS + "= ?";
		return getHibernateTemplate().find(queryString, classSpecialty);
	}

	public List findByClassSystem(Object systems) {
		return findByProperty(SYSTEMS, systems);
	}

	public List findByClassTeacher(Object classTeacher) {
		return findByProperty(CLASS_TEACHER, classTeacher);
	}

	public List findByClassPhone(Object classPhone) {
		return findByProperty(CLASS_PHONE, classPhone);
	}

	public List findByClassEmail(Object classEmail) {
		return findByProperty(CLASS_EMAIL, classEmail);
	}

	public List findByClassQq(Object classQq) {
		return findByProperty(CLASS_QQ, classQq);
	}

	public List findByClassExplain(Object classExplain) {
		return findByProperty(CLASS_EXPLAIN, classExplain);
	}

}