package com.ms.teach.by.dao.impl;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.ms.teach.by.pojo.YearTerm;

/**
 * @author zongwei
 */

public class YearTermDAOImpl extends HibernateDaoSupport {
	public static final String YT_NUMBER = "ytNumber";
	public static final String YT_NAME = "ytName";
	public static final String YT_START = "ytStart";
	public static final String YT_END = "ytEnd";

	public void save(YearTerm yearTerm) {
		getHibernateTemplate().save(yearTerm);
	}

	public void delete(YearTerm yearTerm) {
		yearTerm = this.findById(yearTerm.getYearTermId());
		getHibernateTemplate().delete(yearTerm);
	}

	public YearTerm findById(java.lang.Integer id) {
		YearTerm instance = (YearTerm) getHibernateTemplate().get(
				"com.ms.teach.by.pojo.YearTerm", id);
		return instance;
	}

	public List findByExample(YearTerm instance) {
		List results = getHibernateTemplate().findByExample(instance);
		return results;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from YearTerm as model where model."
				+ propertyName + "= ? order by model."+ YT_NUMBER +" desc";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findByYtNumber(Object ytNumber) {
		return findByProperty(YT_NUMBER, ytNumber);
	}

	public List findByYtName(Object ytName) {
		return findByProperty(YT_NAME, ytName);
	}

	public List findByYtStart(Object ytStart) {
		return findByProperty(YT_START, ytStart);
	}

	public List findByYtEnd(Object ytEnd) {
		return findByProperty(YT_END, ytEnd);
	}

	public List findAll() {
		String queryString = "from YearTerm as model order by model."+ YT_NUMBER +" desc";
		return getHibernateTemplate().find(queryString);
	}

}