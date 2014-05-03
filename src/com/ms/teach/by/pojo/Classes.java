package com.ms.teach.by.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * 	@author zongwei
 */

public class Classes implements java.io.Serializable {


	private String classId;
	private NativeSpecialtys nativeSpecialtys;
	private Systems systems;
	private String classNumber;
	private String className;
	private String classGradeNumber;
	private String classGrade;
	private String classTeacher;
	private String classPhone;
	private String classEmail;
	private String classQq;
	private String classExplain;
	
	private Set nativeCourses = new HashSet(0);
	private Set studentses = new HashSet(0);


	/** default constructor */
	public Classes() {
	}

	/** minimal constructor */
	public Classes(NativeSpecialtys nativeSpecialtys, Systems systems,
			String classNumber, String className) {
		this.nativeSpecialtys = nativeSpecialtys;
		this.systems = systems;
		this.classNumber = classNumber;
		this.className = className;
	}

	/** full constructor */
	public Classes(NativeSpecialtys nativeSpecialtys, Systems systems,
			String classNumber, String className, String classTeacher,
			String classPhone, String classEmail, String classQq,
			String classExplain, Set studentses) {
		this.nativeSpecialtys = nativeSpecialtys;
		this.systems = systems;
		this.classNumber = classNumber;
		this.className = className;
		this.classTeacher = classTeacher;
		this.classPhone = classPhone;
		this.classEmail = classEmail;
		this.classQq = classQq;
		this.classExplain = classExplain;
		this.studentses = studentses;
	}


	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public NativeSpecialtys getNativeSpecialtys() {
		return this.nativeSpecialtys;
	}

	public void setNativeSpecialtys(NativeSpecialtys nativeSpecialtys) {
		this.nativeSpecialtys = nativeSpecialtys;
	}

	public Systems getSystems() {
		return this.systems;
	}

	public void setSystems(Systems systems) {
		this.systems = systems;
	}

	public String getClassNumber() {
		return this.classNumber;
	}

	public void setClassNumber(String classNumber) {
		this.classNumber = classNumber;
	}

	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassGradeNumber() {
		return classGradeNumber;
	}

	public void setClassGradeNumber(String classGradeNumber) {
		this.classGradeNumber = classGradeNumber;
	}

	public String getClassGrade() {
		return classGrade;
	}

	public void setClassGrade(String classGrade) {
		this.classGrade = classGrade;
	}

	public String getClassTeacher() {
		return this.classTeacher;
	}

	public void setClassTeacher(String classTeacher) {
		this.classTeacher = classTeacher;
	}

	public String getClassPhone() {
		return this.classPhone;
	}

	public void setClassPhone(String classPhone) {
		this.classPhone = classPhone;
	}

	public String getClassEmail() {
		return this.classEmail;
	}

	public void setClassEmail(String classEmail) {
		this.classEmail = classEmail;
	}

	public String getClassQq() {
		return this.classQq;
	}

	public void setClassQq(String classQq) {
		this.classQq = classQq;
	}

	public String getClassExplain() {
		return this.classExplain;
	}

	public void setClassExplain(String classExplain) {
		this.classExplain = classExplain;
	}

	public Set getStudentses() {
		return this.studentses;
	}

	public Set getNativeCourses() {
		return nativeCourses;
	}

	public void setNativeCourses(Set nativeCourses) {
		this.nativeCourses = nativeCourses;
	}

	public void setStudentses(Set studentses) {
		this.studentses = studentses;
	}

}