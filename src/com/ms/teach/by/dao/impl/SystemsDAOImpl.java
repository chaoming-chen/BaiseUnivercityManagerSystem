package com.ms.teach.by.dao.impl;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.Systems;

/**
 * @author zongwei
 */

public class SystemsDAOImpl extends HibernateDaoSupport {
	public static final String SID = "sid";
	public static final String SYSTEM_NUMBER = "systemNumber";
	public static final String SYSTEM_NAME = "systemName";
	public static final String SYSTEM_SIMPLE = "systemSimple";
	public static final String SYSTEM_PHONE = "systemPhone";
	public static final String SYSTEM_EMAIL = "systemEail";
	public static final String SYSTEM_EXPLAIN = "systemExplain";

	public void save(Systems system) {
		getHibernateTemplate().save(system);
	}
	
	public void update(Systems system) {
		getHibernateTemplate().update(system);
	}

	public void delete(Systems system) {
		system = this.findById(system.getSid());
		getHibernateTemplate().delete(system);
	}

	public Systems findById(java.lang.Integer id) {
		Systems system = (Systems) getHibernateTemplate().get(
				"com.ms.teach.by.pojo.Systems", id);
		return system;
	}

	public List findByExample(Systems system) {
		List results = getHibernateTemplate().findByExample(system);
		return results;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Systems as model where model."
				+ propertyName + "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findBySystemNumber(Object systemNumber) {
		return findByProperty(SYSTEM_NUMBER, systemNumber);
	}

	public List findBySystemName(Object systemName) {
		return findByProperty(SYSTEM_NAME, systemName);
	}

	public List findBySystemSimple(Object systemSimple) {
		return findByProperty(SYSTEM_SIMPLE, systemSimple);
	}

	public List findBySystemPhone(Object systemPhone) {
		return findByProperty(SYSTEM_PHONE, systemPhone);
	}
	
	public List findBySystemEmail(Object systemEmail) {
		return findByProperty(SYSTEM_EMAIL, systemEmail);
	}

	public List findBySystemExplain(Object systemExplain) {
		return findByProperty(SYSTEM_EXPLAIN, systemExplain);
	}

	public List findSystems(){
		String queryString = "select model."+SID+", model."+SYSTEM_NAME+" from Systems as model";
		return getHibernateTemplate().find(queryString);
	}
	
	public List findAll() {
		String queryString = "from Systems";
		return getHibernateTemplate().find(queryString);
	}

}