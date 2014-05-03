package com.ms.teach.by.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.NativeSpecialtys;
import com.ms.teach.by.pojo.StandardSpecialtys;

/**
 * @author zongwei
 */

public class NativeSpecialtysDAOImpl extends HibernateDaoSupport {

	public static final String SID = "sid";
	public static final String SPECIALTY_NUMBER = "specialtyNumber";
	public static final String SPECIALTY_NAME = "specialtyName";
	public static final String SPECIALTY_CLASS_NUMBER = "specialtyClassNumber";
	public static final String SPECIALTY_CLASS_NAME = "specialtyClassName";
	public static final String SPECIALTY_SUBJECT_NUMBER = "specialtySubjectNumber";
	public static final String SPECIALTY_SUBJECT_NAME = "specialtySubjectName";
	public static final String SPECIALTY_LEVEL = "specialtyLevel";
	public static final String SPECIALTY_BEGINNING = "specialtyBeginning";
	public static final String SPECIALTY_EXPLAIN = "specialtyExplain";
	public static final String SYSTEMS = "systems";


	public void save(NativeSpecialtys nativeSpecialty) {
		getHibernateTemplate().save(nativeSpecialty);
	}
	
	public void update(NativeSpecialtys nativeSpecialty) {
		getHibernateTemplate().update(nativeSpecialty);
	}

	public void delete(NativeSpecialtys nativeSpecialty) {
		nativeSpecialty = this.findById(nativeSpecialty.getSid());
		getHibernateTemplate().delete(nativeSpecialty);
	}

	public NativeSpecialtys findById(java.lang.Integer id) {
		NativeSpecialtys nativeSpecialty = (NativeSpecialtys) getHibernateTemplate()
					.get("com.ms.teach.by.pojo.NativeSpecialtys", id);
			return nativeSpecialty;
	}

	public List findByExample(NativeSpecialtys nativeSpecialty) {
			List results = getHibernateTemplate().findByExample(nativeSpecialty);
			return results;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from NativeSpecialtys as model where model."
				+ propertyName + "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findBySpecialtyNumber(Object specialtyNumber) {
		return findByProperty(SPECIALTY_NUMBER, specialtyNumber);
	}

	public List findBySpecialtyName(Object specialtyName) {
		return findByProperty(SPECIALTY_NAME, specialtyName);
	}

	public List findBySpecialtyClassNumber(Object specialtyClassNumber) {
		return findByProperty(SPECIALTY_CLASS_NUMBER, specialtyClassNumber);
	}

	public List findBySpecialtyClassName(Object specialtyClassName) {
		return findByProperty(SPECIALTY_CLASS_NAME, specialtyClassName);
	}

	public List findBySpecialtySubjectNumber() {
		String queryString = "select distinct "+SPECIALTY_SUBJECT_NUMBER+","+SPECIALTY_SUBJECT_NAME+" from NativeSpecialtys as model";
		return getHibernateTemplate().find(queryString);
	}

	public List findBySpecialtySubjectName(Object specialtySubjectName) {
		return findByProperty(SPECIALTY_SUBJECT_NUMBER, specialtySubjectName);
	}

	public List findBySpecialtyLevel(Object specialtyLevel) {
		return findByProperty(SPECIALTY_LEVEL, specialtyLevel);
	}

	public List findBySpecialtyBeginning(Object specialtyBeginning) {
		return findByProperty(SPECIALTY_BEGINNING, specialtyBeginning);
	}

	public List findBySpecialtyExplain(Object specialtyExplain) {
		return findByProperty(SPECIALTY_EXPLAIN, specialtyExplain);
	}

	public List findSpecialtyNameBySpecialtySystem(Object specialtySystem) {
		String queryString = "select model."+SID+" , model."+SPECIALTY_NAME+" from NativeSpecialtys as model where model."
				+ SYSTEMS + "= ?";
		return getHibernateTemplate().find(queryString, specialtySystem);
	}
	public List findSpecialtyNumberBySpecialtySystem(Object specialtySystem) {
		String queryString = "select model."+SPECIALTY_NUMBER+" , model."+SPECIALTY_NAME+" from NativeSpecialtys as model where model."
				+ SYSTEMS + "= ?";
		return getHibernateTemplate().find(queryString, specialtySystem);
	}
	public List findBySpecialtySystem(Object specialtySystem) {
		return findByProperty(SYSTEMS, specialtySystem);
	}

	public List findAll() {
		String queryString = "from NativeSpecialtys";
		return getHibernateTemplate().find(queryString);
	}

}