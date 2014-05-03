package com.ms.teach.by.dao.impl;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.Employees;

/**
 * @author zongwei
 */

public class EmployeesDAOImpl extends HibernateDaoSupport {
	public static final String EMPLOYEE_NUMBER = "employeeNumber";
	public static final String EMPLOYEE_NAME = "employeeName";
	public static final String EMPLOYEE_SEX = "employeeSex";
	public static final String EMPLOYEE_BIRTHPLACE = "employeeBirthplace";
	public static final String EMPLOYEE_SPECIALTY = "employeeSpecialty";
	public static final String EMPLOYEE_SKILL = "employeeSkill";
	public static final String EMPLOYEE_EDUCATION_BACKGROUND = "employeeEducationBackground";
	public static final String EMPLOYEE_DEGREE = "employeeDegree";
	public static final String EMPLOYEE_PROFESSIONAL_TITLE = "employeeProfessionalTitle";
	public static final String SYSTEMS = "systems";
	public static final String EMPLOYEE_OFFICE = "employeeOffice";
	public static final String EMPLOYEE_ROLE = "employeeRole";
	public static final String EMPLOYEE_JOB = "employeeJob";
	public static final String EMPLOYEE_PHONE = "employeePhone";
	public static final String EMPLOYEE_QQ = "employeeQq";
	public static final String EMPLOYEE_EMAIL = "employeeEmail";
	public static final String EMPLOYEE_RESUME = "employeeResume";
	public static final String EMPLOYEE_EXPLAIN= "employeeExplain";


	public void save(Employees employee) {
			getHibernateTemplate().save(employee);
	}
	
	public void update(Employees employee) {
		getHibernateTemplate().update(employee);
	}

	public void delete(Employees employee) {
		employee = this.findById(employee.getEid());
		getHibernateTemplate().delete(employee);
	}

	public Employees findById(java.lang.Integer id) {
		Employees employee = (Employees) getHibernateTemplate().get(
				"com.ms.teach.by.pojo.Employees", id);
		return employee;
	}

	public List findAll() {
		String queryString = "from Employees";
		return getHibernateTemplate().find(queryString);
	}
	public List findTeacherCountBySystem(Object system) {
		String queryString = "select count(model."+EMPLOYEE_NUMBER+") " +
				"from Employees as model where model."+SYSTEMS+"= ?";
		return getHibernateTemplate().find(queryString,system);
	}
	
	public List findByExample(Employees employee) {
		List results = getHibernateTemplate().findByExample(employee);
		return results;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Employees as model where model."
				+ propertyName + "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findByEmployeeNumber(Object employeeNumber) {
		return findByProperty(EMPLOYEE_NUMBER, employeeNumber);
	}

	public List findByEmployeeName(Object employeeName) {
		return findByProperty(EMPLOYEE_NAME, employeeName);
	}
	
	public List findByEmployeeSex(Object employeeSex) {
		return findByProperty(EMPLOYEE_SEX, employeeSex);
	}

	public List findByEmployeeBirthplace(Object employeeBirthplace) {
		return findByProperty(EMPLOYEE_BIRTHPLACE, employeeBirthplace);
	}

	public List findByEmployeeSpecialty(Object employeeSpecialty) {
		return findByProperty(EMPLOYEE_SPECIALTY, employeeSpecialty);
	}

	public List findByEmployeeSkill(Object employeeSkill) {
		return findByProperty(EMPLOYEE_SKILL, employeeSkill);
	}

	public List findByEmployeeEducationBackground(
			Object employeeEducationBackground) {
		return findByProperty(EMPLOYEE_EDUCATION_BACKGROUND,
				employeeEducationBackground);
	}

	public List findByEmployeeDegree(Object employeeDegree) {
		return findByProperty(EMPLOYEE_DEGREE, employeeDegree);
	}

	public List findByEmployeeProfessionalTitle(Object employeeProfessionalTitle) {
		return findByProperty(EMPLOYEE_PROFESSIONAL_TITLE,
				employeeProfessionalTitle);
	}

	public List findByEmployeeSystem(Object employeeSystem) {
		return findByProperty(SYSTEMS, employeeSystem);
	}

	public List findByEmployeeOffice(Object employeeOffice) {
		return findByProperty(EMPLOYEE_OFFICE, employeeOffice);
	}

	public List findByEmployeeRole(Object employeeRole) {
		return findByProperty(EMPLOYEE_ROLE, employeeRole);
	}

	public List findByEmployeeJob(Object employeeJob) {
		return findByProperty(EMPLOYEE_JOB, employeeJob);
	}

	public List findByEmployeePhone(Object employeePhone) {
		return findByProperty(EMPLOYEE_PHONE, employeePhone);
	}

	public List findByEmployeeQq(Object employeeQq) {
		return findByProperty(EMPLOYEE_QQ, employeeQq);
	}

	public List findByEmployeeEmail(Object employeeEmail) {
		return findByProperty(EMPLOYEE_EMAIL, employeeEmail);
	}

	public List findByEmployeeResume(Object employeeResume) {
		return findByProperty(EMPLOYEE_RESUME, employeeResume);
	}
	public List findByEmployeeExplain(Object employeeExplain) {
		return findByProperty(EMPLOYEE_EXPLAIN, employeeExplain);
	}

	public Employees merge(Employees detachedInstance) {
		Employees result = (Employees) getHibernateTemplate().merge(detachedInstance);
		return result;
	}

	public void attachDirty(Employees employee) {
		getHibernateTemplate().saveOrUpdate(employee);
	}

	public void attachClean(Employees instance) {
			getHibernateTemplate().lock(instance, LockMode.NONE);
	}

	public static EmployeesDAOImpl getFromApplicationContext(ApplicationContext ctx) {
		return (EmployeesDAOImpl) ctx.getBean("EmployeesDAO");
	}
}