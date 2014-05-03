package com.ms.teach.by.dao.impl;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.dao.IUsersDAO;
import com.ms.teach.by.pojo.Users;

/**
 * @author zongwei
 */
public class UsersDAOImpl extends HibernateDaoSupport implements IUsersDAO{
	private static final Logger log = LoggerFactory.getLogger(UsersDAOImpl.class);

	public static final String USER_NUMBER = "userNumber";
	public static final String USER_PASSWORD = "userPassword";
	public static final String USER_ROLE = "userRole";


	public void save(Users user) {
		getHibernateTemplate().save(user);
	}
	
	public void update(Users user) {
		getHibernateTemplate().update(user);
	}

	public void delete(Users user) {
		getHibernateTemplate().delete(user);
	}

	public List findAll() {
		String queryString = "from Users";
		return getHibernateTemplate().find(queryString);
	}
	
	public Users findById(java.lang.Integer id) {
		Users instance = (Users) getHibernateTemplate().get("com.ms.teach.by.pojo.Users", id);
		return instance;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Users as model where model."
			+ propertyName + "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findByUserNumber(Object userNumber) {
		return findByProperty(USER_NUMBER, userNumber);
	}

	public List findByUserPassword(Object userPassword) {
		return findByProperty(USER_PASSWORD, userPassword);
	}

	public List findByUserRole(Object userRole) {
		return findByProperty(USER_ROLE, userRole);
	}

	public Users merge(Users user) {
			Users result = (Users) getHibernateTemplate().merge(user);
			return result;
	}

	public void attachDirty(Users user) {
		getHibernateTemplate().saveOrUpdate(user);
	}

	public void attachClean(Users user) {
		getHibernateTemplate().lock(user, LockMode.NONE);
	}

	public static UsersDAOImpl getFromApplicationContext(ApplicationContext ctx) {
		return (UsersDAOImpl) ctx.getBean("UsersDAO");
	}
}