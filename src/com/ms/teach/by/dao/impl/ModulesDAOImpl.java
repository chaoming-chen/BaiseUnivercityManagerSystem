package com.ms.teach.by.dao.impl;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.Modules;

/**
 * @author zongwei
 */

public class ModulesDAOImpl extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ModulesDAOImpl.class);

	public static final String MODULE_NAME = "moduleName";
	public static final String MODULE_EN_NAME = "moduleEnName";
	public static final String MODULE_ROLE = "moduleRole";


	public void save(Modules transientInstance) {
		log.debug("saving Modules instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Modules persistentInstance) {
		log.debug("deleting Modules instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Modules findById(java.lang.Integer id) {
		log.debug("getting Modules instance with id: " + id);
		try {
			Modules instance = (Modules) getHibernateTemplate().get(
					"com.ms.teach.by.pojo.Modules", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Modules instance) {
		log.debug("finding Modules instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Modules instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Modules as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByModuleName(Object moduleName) {
		return findByProperty(MODULE_NAME, moduleName);
	}
	
	public List findByModuleEnName(Object moduleName) {
		return findByProperty(MODULE_EN_NAME, moduleName);
	}

	public List findByModuleRole(Object moduleRole) {
		return findByProperty(MODULE_ROLE, moduleRole);
	}

	public List findAll() {
		log.debug("finding all Modules instances");
		try {
			String queryString = "from Modules";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Modules merge(Modules detachedInstance) {
		log.debug("merging Modules instance");
		try {
			Modules result = (Modules) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Modules instance) {
		log.debug("attaching dirty Modules instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Modules instance) {
		log.debug("attaching clean Modules instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
}