package com.ms.teach.by.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 	@author zongwei
 */

public class Employees implements java.io.Serializable {

	private Integer eid;
	private Systems systems;
	private String employeeNumber;
	private String employeeName;
	private String employeeSex;
	private Date employeeBirthday;
	private String employeeBirthplace;
	private String employeeSpecialty;
	private String employeeSkill;
	private String employeeEducationBackground;
	private String employeeDegree;
	private String employeeProfessionalTitle;
	private Integer employeeOffice;
	private Date employeeWorkDate;
	private String employeeRole;
	private String employeeJob;
	private String employeePhone;
	private String employeeQq;
	private String employeeEmail;
	private String employeeResume;
	private String employeeExplain;
	private Set nativeCourseses = new HashSet(0);


	/** default constructor */
	public Employees() {
	}

	/** minimal constructor */
	public Employees(String employeeNumber, String employeeName) {
		this.employeeNumber = employeeNumber;
		this.employeeName = employeeName;
	}

	/** full constructor */
	public Employees(Systems systems, String employeeNumber,
			String employeeName, String employeeSex, Date employeeBirthday,
			String employeeBirthplace, String employeeSpecialty,
			String employeeSkill, String employeeEducationBackground,
			String employeeDegree, String employeeProfessionalTitle,
			Integer employeeOffice, Date employeeWorkDate, String employeeRole,
			String employeeJob, String employeePhone, String employeeQq,
			String employeeEmail, String employeeResume,
			String employeeExplain, Set nativeCourseses) {
		this.systems = systems;
		this.employeeNumber = employeeNumber;
		this.employeeName = employeeName;
		this.employeeSex = employeeSex;
		this.employeeBirthday = employeeBirthday;
		this.employeeBirthplace = employeeBirthplace;
		this.employeeSpecialty = employeeSpecialty;
		this.employeeSkill = employeeSkill;
		this.employeeEducationBackground = employeeEducationBackground;
		this.employeeDegree = employeeDegree;
		this.employeeProfessionalTitle = employeeProfessionalTitle;
		this.employeeOffice = employeeOffice;
		this.employeeWorkDate = employeeWorkDate;
		this.employeeRole = employeeRole;
		this.employeeJob = employeeJob;
		this.employeePhone = employeePhone;
		this.employeeQq = employeeQq;
		this.employeeEmail = employeeEmail;
		this.employeeResume = employeeResume;
		this.employeeExplain = employeeExplain;
		this.nativeCourseses = nativeCourseses;
	}


	public Integer getEid() {
		return this.eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public Systems getSystems() {
		return this.systems;
	}

	public void setSystems(Systems systems) {
		this.systems = systems;
	}

	public String getEmployeeNumber() {
		return this.employeeNumber;
	}

	public void setEmployeeNumber(String employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public String getEmployeeName() {
		return this.employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeSex() {
		return this.employeeSex;
	}

	public void setEmployeeSex(String employeeSex) {
		this.employeeSex = employeeSex;
	}

	public Date getEmployeeBirthday() {
		return this.employeeBirthday;
	}

	public void setEmployeeBirthday(Date employeeBirthday) {
		this.employeeBirthday = employeeBirthday;
	}

	public String getEmployeeBirthplace() {
		return this.employeeBirthplace;
	}

	public void setEmployeeBirthplace(String employeeBirthplace) {
		this.employeeBirthplace = employeeBirthplace;
	}

	public String getEmployeeSpecialty() {
		return this.employeeSpecialty;
	}

	public void setEmployeeSpecialty(String employeeSpecialty) {
		this.employeeSpecialty = employeeSpecialty;
	}

	public String getEmployeeSkill() {
		return this.employeeSkill;
	}

	public void setEmployeeSkill(String employeeSkill) {
		this.employeeSkill = employeeSkill;
	}

	public String getEmployeeEducationBackground() {
		return this.employeeEducationBackground;
	}

	public void setEmployeeEducationBackground(
			String employeeEducationBackground) {
		this.employeeEducationBackground = employeeEducationBackground;
	}

	public String getEmployeeDegree() {
		return this.employeeDegree;
	}

	public void setEmployeeDegree(String employeeDegree) {
		this.employeeDegree = employeeDegree;
	}

	public String getEmployeeProfessionalTitle() {
		return this.employeeProfessionalTitle;
	}

	public void setEmployeeProfessionalTitle(String employeeProfessionalTitle) {
		this.employeeProfessionalTitle = employeeProfessionalTitle;
	}

	public Integer getEmployeeOffice() {
		return this.employeeOffice;
	}

	public void setEmployeeOffice(Integer employeeOffice) {
		this.employeeOffice = employeeOffice;
	}

	public Date getEmployeeWorkDate() {
		return this.employeeWorkDate;
	}

	public void setEmployeeWorkDate(Date employeeWorkDate) {
		this.employeeWorkDate = employeeWorkDate;
	}

	public String getEmployeeRole() {
		return this.employeeRole;
	}

	public void setEmployeeRole(String employeeRole) {
		this.employeeRole = employeeRole;
	}

	public String getEmployeeJob() {
		return this.employeeJob;
	}

	public void setEmployeeJob(String employeeJob) {
		this.employeeJob = employeeJob;
	}

	public String getEmployeePhone() {
		return this.employeePhone;
	}

	public void setEmployeePhone(String employeePhone) {
		this.employeePhone = employeePhone;
	}

	public String getEmployeeQq() {
		return this.employeeQq;
	}

	public void setEmployeeQq(String employeeQq) {
		this.employeeQq = employeeQq;
	}

	public String getEmployeeEmail() {
		return this.employeeEmail;
	}

	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}

	public String getEmployeeResume() {
		return this.employeeResume;
	}

	public void setEmployeeResume(String employeeResume) {
		this.employeeResume = employeeResume;
	}

	public String getEmployeeExplain() {
		return this.employeeExplain;
	}

	public void setEmployeeExplain(String employeeExplain) {
		this.employeeExplain = employeeExplain;
	}

	public Set getNativeCourseses() {
		return this.nativeCourseses;
	}

	public void setNativeCourseses(Set nativeCourseses) {
		this.nativeCourseses = nativeCourseses;
	}

}