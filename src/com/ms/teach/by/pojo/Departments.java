package com.ms.teach.by.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * 	@author zongwei
 */

public class Departments implements java.io.Serializable {

	private Integer did;
	private String departmentNumber;
	private String departmentName;
	private String departmentCategory;
	private String departmentPhone;
	private String departmentEmail;
	private String departmentExplain;
	private Integer userRole;
	private Set userses = new HashSet(0);


	/** default constructor */
	public Departments() {
	}

	/** minimal constructor */
	public Departments(String departmentNumber, String departmentName) {
		this.departmentNumber = departmentNumber;
		this.departmentName = departmentName;
	}

	/** full constructor */
	public Departments(String departmentNumber, String departmentName,
			String departmentCategory, String departmentPhone,
			String departmentEmail, String departmentExplain, Integer userRole,
			Set userses) {
		this.departmentNumber = departmentNumber;
		this.departmentName = departmentName;
		this.departmentCategory = departmentCategory;
		this.departmentPhone = departmentPhone;
		this.departmentEmail = departmentEmail;
		this.departmentExplain = departmentExplain;
		this.userRole = userRole;
		this.userses = userses;
	}


	public Integer getDid() {
		return this.did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public String getDepartmentNumber() {
		return this.departmentNumber;
	}

	public void setDepartmentNumber(String departmentNumber) {
		this.departmentNumber = departmentNumber;
	}

	public String getDepartmentName() {
		return this.departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDepartmentCategory() {
		return this.departmentCategory;
	}

	public void setDepartmentCategory(String departmentCategory) {
		this.departmentCategory = departmentCategory;
	}

	public String getDepartmentPhone() {
		return this.departmentPhone;
	}

	public void setDepartmentPhone(String departmentPhone) {
		this.departmentPhone = departmentPhone;
	}

	public String getDepartmentEmail() {
		return this.departmentEmail;
	}

	public void setDepartmentEmail(String departmentEmail) {
		this.departmentEmail = departmentEmail;
	}

	public String getDepartmentExplain() {
		return this.departmentExplain;
	}

	public void setDepartmentExplain(String departmentExplain) {
		this.departmentExplain = departmentExplain;
	}

	public Integer getUserRole() {
		return this.userRole;
	}

	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

}