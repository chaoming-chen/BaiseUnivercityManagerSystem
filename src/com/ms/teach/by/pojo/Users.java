package com.ms.teach.by.pojo;

/**
 * 	@author zongwei
 */
public class Users implements java.io.Serializable {

	private Integer uid;
	private Systems systems;
	private NativeSpecialtys nativeSpecialtys;
	private Departments departments;
	private Roles roles;
	private String userNumber;
	private String userPassword;
	private Integer userOffice;
	private Integer userClass;
	private Integer userEmployeeNumber;
	private Integer userStudentNumber;

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(Roles roles, String userNumber, String userPassword) {
		this.roles = roles;
		this.userNumber = userNumber;
		this.userPassword = userPassword;
	}

	/** full constructor */
	public Users(Systems systems, NativeSpecialtys nativeSpecialtys,
			Departments departments, Roles roles, String userNumber,
			String userPassword, Integer userOffice, Integer userClass,
			Integer userEmployeeNumber, Integer userStudentNumber) {
		this.systems = systems;
		this.nativeSpecialtys = nativeSpecialtys;
		this.departments = departments;
		this.roles = roles;
		this.userNumber = userNumber;
		this.userPassword = userPassword;
		this.userOffice = userOffice;
		this.userClass = userClass;
		this.userEmployeeNumber = userEmployeeNumber;
		this.userStudentNumber = userStudentNumber;
	}

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Systems getSystems() {
		return this.systems;
	}

	public void setSystems(Systems systems) {
		this.systems = systems;
	}

	public NativeSpecialtys getNativeSpecialtys() {
		return this.nativeSpecialtys;
	}

	public void setNativeSpecialtys(NativeSpecialtys nativeSpecialtys) {
		this.nativeSpecialtys = nativeSpecialtys;
	}

	public Departments getDepartments() {
		return this.departments;
	}

	public void setDepartments(Departments departments) {
		this.departments = departments;
	}

	public Roles getRoles() {
		return this.roles;
	}

	public void setRoles(Roles roles) {
		this.roles = roles;
	}

	public String getUserNumber() {
		return this.userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Integer getUserOffice() {
		return this.userOffice;
	}

	public void setUserOffice(Integer userOffice) {
		this.userOffice = userOffice;
	}

	public Integer getUserClass() {
		return this.userClass;
	}

	public void setUserClass(Integer userClass) {
		this.userClass = userClass;
	}

	public Integer getUserEmployeeNumber() {
		return this.userEmployeeNumber;
	}

	public void setUserEmployeeNumber(Integer userEmployeeNumber) {
		this.userEmployeeNumber = userEmployeeNumber;
	}

	public Integer getUserStudentNumber() {
		return this.userStudentNumber;
	}

	public void setUserStudentNumber(Integer userStudentNumber) {
		this.userStudentNumber = userStudentNumber;
	}

}