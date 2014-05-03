package com.ms.teach.by.dao.impl;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ms.teach.by.pojo.Students;

/**
 * @author zongwei
 */

public class StudentsDAOImpl extends HibernateDaoSupport {
	public static final String STUDENT_NUMBER = "studentNumber";
	public static final String STUDENT_NAME = "studentName";
	public static final String STUDENT_SEX = "studentSex";
	public static final String SYSTEMS = "systems";
	public static final String CLASSES = "classes";
	public static final String STUDENT_SPECIALTY = "studentSpecialty";
	public static final String STUDENT_PHONE = "studentPhone";
	public static final String STUDENT_EMAIL = "studentEmail";
	public static final String STUDENT_QQ = "studentQq";
	public static final String STUDENT_EXPLAIN = "studentExplain";


	public void save(Students student) {
		getHibernateTemplate().save(student);
	}
	public void update(Students student) {
		getHibernateTemplate().update(student);
	}

	public void delete(Students student) {
		student = this.findById(student.getSid());
		getHibernateTemplate().delete(student);
	}

	public Students findById(java.lang.Integer id) {
		Students student = (Students) getHibernateTemplate().get(
				"com.ms.teach.by.pojo.Students", id);
		return student;
	}

	public List findByExample(Students student) {
		List results = getHibernateTemplate().findByExample(student);
		return results;
	}

	public List findByProperty(String propertyName, Object value) {
		String queryString = "from Students as model where model."
				+ propertyName + "= ?";
		return getHibernateTemplate().find(queryString, value);
	}

	public List findByStudentNumber(Object studentNumber) {
		return findByProperty(STUDENT_NUMBER, studentNumber);
	}

	public List findByStudentName(Object studentName) {
		return findByProperty(STUDENT_NAME, studentName);
	}

	public List findByStudentSex(Object studentSex) {
		return findByProperty(STUDENT_SEX, studentSex);
	}
	
	public List findByStudentClass(Object studentClass) {
		return findByProperty(CLASSES, studentClass);
	}

	public List findByStudentSpecialty(Object studentSpecialty) {
		return findByProperty(STUDENT_SPECIALTY, studentSpecialty);
	}

	public List findByStudentSystem(Object system) {
		return findByProperty(SYSTEMS, system);
	}

	public List findByStudentPhone(Object studentPhone) {
		return findByProperty(STUDENT_PHONE, studentPhone);
	}

	public List findByStudentEmail(Object studentEmail) {
		return findByProperty(STUDENT_EMAIL, studentEmail);
	}

	public List findByStudentQq(Object studentQq) {
		return findByProperty(STUDENT_QQ, studentQq);
	}
	public List findByStudentExplain(Object studentExplain) {
		return findByProperty(STUDENT_EXPLAIN, studentExplain);
	}

	public List findAll() {
		String queryString = "from Students";
		return getHibernateTemplate().find(queryString);
	}

}