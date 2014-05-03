package com.ms.teach.by.pojo;

/**
 * 	@author zongwei
 */

public class Students implements java.io.Serializable {

	private Integer sid;
	private NativeSpecialtys nativeSpecialtys;
	private Classes classes;
	private Systems systems;
	private String studentNumber;
	private String studentName;
	private String studentSex;
	private String studentPhone;
	private String studentEmail;
	private String studentQq;
	private String studentExplain;

	/** default constructor */
	public Students() {
	}

	/** minimal constructor */
	public Students(NativeSpecialtys nativeSpecialtys, Classes classes,
			Systems systems, String studentNumber, String studentName) {
		this.nativeSpecialtys = nativeSpecialtys;
		this.classes = classes;
		this.systems = systems;
		this.studentNumber = studentNumber;
		this.studentName = studentName;
	}

	/** full constructor */
	public Students(NativeSpecialtys nativeSpecialtys, Classes classes,
			Systems systems, String studentNumber, String studentName,
			String studentSex, String studentPhone, String studentEmail,
			String studentQq, String studentExplain) {
		this.nativeSpecialtys = nativeSpecialtys;
		this.classes = classes;
		this.systems = systems;
		this.studentNumber = studentNumber;
		this.studentName = studentName;
		this.studentSex = studentSex;
		this.studentPhone = studentPhone;
		this.studentEmail = studentEmail;
		this.studentQq = studentQq;
		this.studentExplain = studentExplain;
	}

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public NativeSpecialtys getNativeSpecialtys() {
		return this.nativeSpecialtys;
	}

	public void setNativeSpecialtys(NativeSpecialtys nativeSpecialtys) {
		this.nativeSpecialtys = nativeSpecialtys;
	}

	public Classes getClasses() {
		return this.classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public Systems getSystems() {
		return this.systems;
	}

	public void setSystems(Systems systems) {
		this.systems = systems;
	}

	public String getStudentNumber() {
		return this.studentNumber;
	}

	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}

	public String getStudentName() {
		return this.studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentSex() {
		return this.studentSex;
	}

	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}

	public String getStudentPhone() {
		return this.studentPhone;
	}

	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}

	public String getStudentEmail() {
		return this.studentEmail;
	}

	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}

	public String getStudentQq() {
		return this.studentQq;
	}

	public void setStudentQq(String studentQq) {
		this.studentQq = studentQq;
	}

	public String getStudentExplain() {
		return this.studentExplain;
	}

	public void setStudentExplain(String studentExplain) {
		this.studentExplain = studentExplain;
	}

}