package com.ms.teach.by.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * 	@author zongwei
 */

public class Systems implements java.io.Serializable {


	private Integer sid;
	private String systemNumber;
	private String systemName;
	private String systemSimple;
	private String systemEmail;
	private String systemPhone;
	private String systemExplain;
	private Set nativeSpecialtyses = new HashSet(0);
	private Set nativeCourseses = new HashSet(0);
	private Set studentses = new HashSet(0);
	private Set userses = new HashSet(0);
	private Set employeeses = new HashSet(0);
	private Set classeses = new HashSet(0);


	/** default constructor */
	public Systems() {
	}

	/** minimal constructor */
	public Systems(String systemNumber, String systemName) {
		this.systemNumber = systemNumber;
		this.systemName = systemName;
	}

	/** full constructor */
	public Systems(String systemNumber, String systemName, String systemSimple,
			String systemEmail, String systemPhone, String systemExplain,
			Set nativeSpecialtyses, Set studentses, Set userses,
			Set employeeses, Set classeses) {
		this.systemNumber = systemNumber;
		this.systemName = systemName;
		this.systemSimple = systemSimple;
		this.systemEmail = systemEmail;
		this.systemPhone = systemPhone;
		this.systemExplain = systemExplain;
		this.nativeSpecialtyses = nativeSpecialtyses;
		this.studentses = studentses;
		this.userses = userses;
		this.employeeses = employeeses;
		this.classeses = classeses;
	}

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSystemNumber() {
		return this.systemNumber;
	}

	public void setSystemNumber(String systemNumber) {
		this.systemNumber = systemNumber;
	}

	public String getSystemName() {
		return this.systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getSystemSimple() {
		return this.systemSimple;
	}

	public void setSystemSimple(String systemSimple) {
		this.systemSimple = systemSimple;
	}

	public String getSystemEmail() {
		return this.systemEmail;
	}

	public void setSystemEmail(String systemEmail) {
		this.systemEmail = systemEmail;
	}

	public String getSystemPhone() {
		return this.systemPhone;
	}

	public void setSystemPhone(String systemPhone) {
		this.systemPhone = systemPhone;
	}

	public String getSystemExplain() {
		return this.systemExplain;
	}

	public void setSystemExplain(String systemExplain) {
		this.systemExplain = systemExplain;
	}

	public Set getNativeSpecialtyses() {
		return this.nativeSpecialtyses;
	}

	public void setNativeSpecialtyses(Set nativeSpecialtyses) {
		this.nativeSpecialtyses = nativeSpecialtyses;
	}

	public Set getStudentses() {
		return this.studentses;
	}

	public void setStudentses(Set studentses) {
		this.studentses = studentses;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

	public Set getEmployeeses() {
		return this.employeeses;
	}

	public void setEmployeeses(Set employeeses) {
		this.employeeses = employeeses;
	}

	public Set getNativeCourseses() {
		return nativeCourseses;
	}

	public void setNativeCourseses(Set nativeCourseses) {
		this.nativeCourseses = nativeCourseses;
	}

	public Set getClasseses() {
		return this.classeses;
	}

	public void setClasseses(Set classeses) {
		this.classeses = classeses;
	}

}