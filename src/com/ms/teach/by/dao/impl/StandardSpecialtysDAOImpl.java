package com.ms.teach.by.dao.impl;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.StandardSpecialtys;

/**
 * @author zongwei
 */

public class StandardSpecialtysDAOImpl extends HibernateDaoSupport {

	public static final String SPECIALTY_NUMBER = "specialtyNumber";
	public static final String SPECIALTY_NAME = "specialtyName";
	public static final String SPECIALTY_CLASS_NUMBER = "specialtyClassNumber";
	public static final String SPECIALTY_CLASS_NAME = "specialtyClassName";
	public static final String SPECIALTY_SUBJECT_NUMBER = "specialtySubjectNumber";
	public static final String SPECIALTY_SUBJECT_NAME = "specialtySubjectName";
	public static final String SPECIALTY_LEVEL = "specialtyLevel";
	public static final String SPECIALTY_BEGINNING = "specialtyBeginning";
	public static final String SPECIALTY_EXPLAIN = "specialtyExplain";


	public void save(StandardSpecialtys standardSpecialty) {
		getHibernateTemplate().save(standardSpecialty);
	}

	public void delete(StandardSpecialtys standardSpecialty) {
		standardSpecialty = this.findById(standardSpecialty.getSid());
		getHibernateTemplate().delete(standardSpecialty);
	}

	public void deleteAll(){
		List list = this.findAll();
		if(list.size()>0)
			getHibernateTemplate().deleteAll(list);
	}
	
	public StandardSpecialtys findById(java.lang.Integer id) {
			StandardSpecialtys standardSpecialty = (StandardSpecialtys) getHibernateTemplate()
					.get("com.ms.teach.by.pojo.StandardSpecialtys", id);
			return standardSpecialty;
	}

	public List findByExample(StandardSpecialtys standardSpecialty) {
			List results = getHibernateTemplate().findByExample(standardSpecialty);
			return results;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from StandardSpecialtys as model where model."
				+ propertyName + "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findBySpecialtyNumber(Object specialtyNumber) {
		return findByProperty(SPECIALTY_NUMBER, specialtyNumber);
	}

	public List findBySpecialtyName(Object specialtyName) {
		return findByProperty(SPECIALTY_NAME, specialtyName);
	}

	public List findBySpecialtyClassNumber(Object classNumber) {
		return findByProperty(SPECIALTY_CLASS_NUMBER, classNumber);
	}

	public List findBySpecialtySubjectNumber(Object subjectNumber) {
		String queryString = "select distinct model."+SPECIALTY_CLASS_NUMBER+", model."
				+SPECIALTY_CLASS_NAME+" from StandardSpecialtys as model where model."
				+SPECIALTY_SUBJECT_NUMBER+"= ?";
		return getHibernateTemplate().find(queryString,subjectNumber);
	}
	public List findBySpecialtyClassName(Object specialtyClassName) {
		return findByProperty(SPECIALTY_CLASS_NAME, specialtyClassName);
	}


	public List findBySpecialtySubjectName(Object specialtySubjectName) {
		return findByProperty(SPECIALTY_SUBJECT_NAME, specialtySubjectName);
	}

	public List findBySpecialtyLevel(Object specialtyLevel) {
		return findByProperty(SPECIALTY_LEVEL, specialtyLevel);
	}

	public List findSpecialtyBeginning() {
		String queryString = "select distinct model."+SPECIALTY_BEGINNING+" from StandardSpecialtys as model";
		return getHibernateTemplate().find(queryString);
	}
	
	public List findSpecialtySubjectNumber() {
		String queryString = "select distinct model."+SPECIALTY_SUBJECT_NUMBER+", model."
				+SPECIALTY_SUBJECT_NAME+" from StandardSpecialtys as model";
		return getHibernateTemplate().find(queryString);
	}
	
	public List findBySpecialtyBeginning(Object specialtyBeginning) {
		String queryString = "select distinct model."+SPECIALTY_SUBJECT_NUMBER+", model."
				+SPECIALTY_SUBJECT_NAME+" from StandardSpecialtys as model where model."
				+SPECIALTY_BEGINNING+"= ?";
		return getHibernateTemplate().find(queryString, specialtyBeginning);
	}
	
	public List findSpecialtySubject() {
		String queryString = "select distinct model."+SPECIALTY_SUBJECT_NUMBER+", model."
				+SPECIALTY_SUBJECT_NAME+" from StandardSpecialtys as model";
		return getHibernateTemplate().find(queryString);
	}

	public List findBySpecialtyExplain(Object specialtyExplain) {
		return findByProperty(SPECIALTY_EXPLAIN, specialtyExplain);
	}


	public List findAll() {
		String queryString = " from StandardSpecialtys";
		return getHibernateTemplate().find(queryString);
	}

}