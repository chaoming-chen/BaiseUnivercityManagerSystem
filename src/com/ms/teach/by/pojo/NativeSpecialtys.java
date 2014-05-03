package com.ms.teach.by.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * 	@author zongwei
 */

public class NativeSpecialtys implements java.io.Serializable {


	private Integer sid;
	private Systems systems;
	private String specialtyNumber;
	private String specialtyName;
	private String specialtyClassNumber;
	private String specialtyClassName;
	private String specialtySubjectNumber;
	private String specialtySubjectName;
	private String specialtyLevel;
	private String specialtyBeginning;
	private String specialtyExplain;
	private Set classeses = new HashSet(0);
	private Set studentses = new HashSet(0);
	private Set userses = new HashSet(0);


	/** default constructor */
	public NativeSpecialtys() {
	}

	/** minimal constructor */
	public NativeSpecialtys(String specialtyNumber, String specialtyName) {
		this.specialtyNumber = specialtyNumber;
		this.specialtyName = specialtyName;
	}

	/** full constructor */
	public NativeSpecialtys(Systems systems, String specialtyNumber,
			String specialtyName, String specialtyClassNumber,
			String specialtyClassName, String specialtySubjectNumber,
			String specialtySubjectName, String specialtyLevel,
			String specialtyBeginning, String specialtyExplain, Set classeses,
			Set studentses, Set userses) {
		this.systems = systems;
		this.specialtyNumber = specialtyNumber;
		this.specialtyName = specialtyName;
		this.specialtyClassNumber = specialtyClassNumber;
		this.specialtyClassName = specialtyClassName;
		this.specialtySubjectNumber = specialtySubjectNumber;
		this.specialtySubjectName = specialtySubjectName;
		this.specialtyLevel = specialtyLevel;
		this.specialtyBeginning = specialtyBeginning;
		this.specialtyExplain = specialtyExplain;
		this.classeses = classeses;
		this.studentses = studentses;
		this.userses = userses;
	}


	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Systems getSystems() {
		return this.systems;
	}

	public void setSystems(Systems systems) {
		this.systems = systems;
	}

	public String getSpecialtyNumber() {
		return this.specialtyNumber;
	}

	public void setSpecialtyNumber(String specialtyNumber) {
		this.specialtyNumber = specialtyNumber;
	}

	public String getSpecialtyName() {
		return this.specialtyName;
	}

	public void setSpecialtyName(String specialtyName) {
		this.specialtyName = specialtyName;
	}

	public String getSpecialtyClassNumber() {
		return this.specialtyClassNumber;
	}

	public void setSpecialtyClassNumber(String specialtyClassNumber) {
		this.specialtyClassNumber = specialtyClassNumber;
	}

	public String getSpecialtyClassName() {
		return this.specialtyClassName;
	}

	public void setSpecialtyClassName(String specialtyClassName) {
		this.specialtyClassName = specialtyClassName;
	}

	public String getSpecialtySubjectNumber() {
		return this.specialtySubjectNumber;
	}

	public void setSpecialtySubjectNumber(String specialtySubjectNumber) {
		this.specialtySubjectNumber = specialtySubjectNumber;
	}

	public String getSpecialtySubjectName() {
		return this.specialtySubjectName;
	}

	public void setSpecialtySubjectName(String specialtySubjectName) {
		this.specialtySubjectName = specialtySubjectName;
	}

	public String getSpecialtyLevel() {
		return this.specialtyLevel;
	}

	public void setSpecialtyLevel(String specialtyLevel) {
		this.specialtyLevel = specialtyLevel;
	}

	public String getSpecialtyBeginning() {
		return this.specialtyBeginning;
	}

	public void setSpecialtyBeginning(String specialtyBeginning) {
		this.specialtyBeginning = specialtyBeginning;
	}

	public String getSpecialtyExplain() {
		return this.specialtyExplain;
	}

	public void setSpecialtyExplain(String specialtyExplain) {
		this.specialtyExplain = specialtyExplain;
	}

	public Set getClasseses() {
		return this.classeses;
	}

	public void setClasseses(Set classeses) {
		this.classeses = classeses;
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

}