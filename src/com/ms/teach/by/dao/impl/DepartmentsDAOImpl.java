package com.ms.teach.by.dao.impl;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.Departments;

/**
 * @author zongwei
*/

public class DepartmentsDAOImpl extends HibernateDaoSupport {
	public static final String DEPARTMENT_NUMBER = "departmentNumber";
	public static final String DEPARTMENT_NAME = "departmentName";
	public static final String DEPARTMENT_CATEGORY = "departmentCategory";
	public static final String DEPARTMENT_PHONE = "departmentPhone";
	public static final String DEPARTMENT_EMAIL = "departmentEmail";
	public static final String DEPARTMENT_EXPLAIN = "departmentExplain";
	
	public void save(Departments department) {
			getHibernateTemplate().save(department);
	}
	
	public void update(Departments department) {
			getHibernateTemplate().update(department);
	}

	public void delete(Departments department) {
		department = this.findById(department.getDid());
		getHibernateTemplate().delete(department);
	}

	public Departments findById(java.lang.Integer id) {
			Departments department = (Departments) getHibernateTemplate().get("com.ms.teach.by.pojo.Departments", id);
			return department;
	}

	public List findByExample(Departments department) {
			List results = getHibernateTemplate().findByExample(department);
			return results;
	}

	public List findByProperty(String propertyName, Object value) {
			String queryString = "from Departments as model where model."+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
	}

	public List findByDepartmentNumber(Object departmentNumber) {
		return findByProperty(DEPARTMENT_NUMBER, departmentNumber);
	}

	public List findByDepartmentName(Object departmentName) {
		return findByProperty(DEPARTMENT_NAME, departmentName);
	}

	public List findByDepartmentCategory(Object departmentCategory) {
		return findByProperty(DEPARTMENT_CATEGORY, departmentCategory);
	}

	public List findByDepartmentPhone(Object departmentPhone) {
		return findByProperty(DEPARTMENT_PHONE, departmentPhone);
	}

	public List findByDepartmentEmail(Object departmentEmail) {
		return findByProperty(DEPARTMENT_EMAIL, departmentEmail);
	}
	
	public List findByDepartmentExplain(Object departmentEmail) {
		return findByProperty(DEPARTMENT_EXPLAIN, departmentEmail);
	}
	
	public List findAll() {
			String queryString = "from Departments";
			return getHibernateTemplate().find(queryString);
	}
}