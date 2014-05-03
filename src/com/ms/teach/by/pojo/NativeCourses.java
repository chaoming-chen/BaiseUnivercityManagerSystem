package com.ms.teach.by.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * 	@author zongwei
 */

public class NativeCourses implements java.io.Serializable {


	private String cid;
	private Employees employees;
	private Systems systems;
	private String courseProperty;
	private String courseNumber;
	private String courseName;
	private Float courseTheoryCredit;
	private Float coursePracticeCredit;
	private Integer courseTheoryPeriod;
	private Integer coursePracticePeriod;
	private Integer courseWeekPeriod;
	private String courseTermNumber;
	private String courseTerm;
	private String courseExam;
	private String courseOpenDepartment;
	private String courseExplain;
	private String courseSpecialtyNumber;
	private String courseSpecialty;
	private String classSelectedSign;
	private String courseGradeNumber; 
	private String courseGrade; 
	private String courseTeacherNumber; 
	private String courseTeacherName; 
	private String courseClassNumber; 
	private String courseClassName; 
	private String sign; 
	
	private Set classes = new HashSet(0);

	public Set getClasses() {
		return classes;
	}

	public void setClasses(Set classes) {
		this.classes = classes;
	}

	/** default constructor */
	public NativeCourses() {
	}

	/** minimal constructor */
	public NativeCourses(String courseProperty) {
		this.courseProperty = courseProperty;
	}

	/** full constructor */
	public NativeCourses(Employees employees, String courseProperty,
			String courseNumber, String courseName, Float courseTheoryCredit,
			Float coursePracticeCredit, Integer courseTheoryPeriod,
			Integer coursePracticePeriod, String courseTermNumber, String courseTerm,
			Integer courseWeekPeriod, String courseExam,
			String courseOpenDepartment, String courseExplain,
			String courseSpecialtyNumber, String courseSpecialty) {
		this.employees = employees;
		this.systems = systems;
		this.courseProperty = courseProperty;
		this.courseNumber = courseNumber;
		this.courseName = courseName;
		this.courseTheoryCredit = courseTheoryCredit;
		this.coursePracticeCredit = coursePracticeCredit;
		this.courseTheoryPeriod = courseTheoryPeriod;
		this.coursePracticePeriod = coursePracticePeriod;
		this.courseTermNumber = courseTermNumber;
		this.courseTerm = courseTerm;
		this.courseWeekPeriod = courseWeekPeriod;
		this.courseExam = courseExam;
		this.courseOpenDepartment = courseOpenDepartment;
		this.courseExplain = courseExplain;
		this.courseSpecialtyNumber = courseSpecialtyNumber;
		this.courseSpecialty = courseSpecialty;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public Employees getEmployees() {
		return this.employees;
	}

	public void setEmployees(Employees employees) {
		this.employees = employees;
	}

	public Systems getSystems() {
		return systems;
	}

	public void setSystems(Systems systems) {
		this.systems = systems;
	}

	public String getCourseTeacherNumber() {
		return courseTeacherNumber;
	}

	public void setCourseTeacherNumber(String courseTeacherNumber) {
		this.courseTeacherNumber = courseTeacherNumber;
	}

	public String getCourseTeacherName() {
		return courseTeacherName;
	}

	public void setCourseTeacherName(String courseTeacherName) {
		this.courseTeacherName = courseTeacherName;
	}

	public String getCourseProperty() {
		return this.courseProperty;
	}

	public void setCourseProperty(String courseProperty) {
		this.courseProperty = courseProperty;
	}

	public String getCourseNumber() {
		return this.courseNumber;
	}

	public void setCourseNumber(String courseNumber) {
		this.courseNumber = courseNumber;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public Float getCourseTheoryCredit() {
		return this.courseTheoryCredit;
	}

	public void setCourseTheoryCredit(Float courseTheoryCredit) {
		this.courseTheoryCredit = courseTheoryCredit;
	}

	public Float getCoursePracticeCredit() {
		return this.coursePracticeCredit;
	}

	public void setCoursePracticeCredit(Float coursePracticeCredit) {
		this.coursePracticeCredit = coursePracticeCredit;
	}

	public String getCourseTermNumber() {
		return courseTermNumber;
	}

	public void setCourseTermNumber(String courseTermNumber) {
		this.courseTermNumber = courseTermNumber;
	}


	public String getCourseTerm() {
		return this.courseTerm;
	}

	public void setCourseTerm(String courseTerm) {
		this.courseTerm = courseTerm;
	}

	public String getCourseExam() {
		return this.courseExam;
	}

	public void setCourseExam(String courseExam) {
		this.courseExam = courseExam;
	}

	public String getCourseOpenDepartment() {
		return this.courseOpenDepartment;
	}

	public void setCourseOpenDepartment(String courseOpenDepartment) {
		this.courseOpenDepartment = courseOpenDepartment;
	}

	public String getCourseExplain() {
		return this.courseExplain;
	}

	public void setCourseExplain(String courseExplain) {
		this.courseExplain = courseExplain;
	}

	public String getCourseSpecialty() {
		return this.courseSpecialty;
	}

	public String getCourseSpecialtyNumber() {
		return courseSpecialtyNumber;
	}

	public void setCourseSpecialtyNumber(String courseSpecialtyNumber) {
		this.courseSpecialtyNumber = courseSpecialtyNumber;
	}

	public Integer getCourseTheoryPeriod() {
		return courseTheoryPeriod;
	}

	public void setCourseTheoryPeriod(Integer courseTheoryPeriod) {
		this.courseTheoryPeriod = courseTheoryPeriod;
	}

	public Integer getCoursePracticePeriod() {
		return coursePracticePeriod;
	}

	public void setCoursePracticePeriod(Integer coursePracticePeriod) {
		this.coursePracticePeriod = coursePracticePeriod;
	}

	public Integer getCourseWeekPeriod() {
		return courseWeekPeriod;
	}

	public void setCourseWeekPeriod(Integer courseWeekPeriod) {
		this.courseWeekPeriod = courseWeekPeriod;
	}

	public String getClassSelectedSign() {
		return classSelectedSign;
	}

	public void setClassSelectedSign(String classSelectedSign) {
		this.classSelectedSign = classSelectedSign;
	}

	public void setCourseSpecialty(String courseSpecialty) {
		this.courseSpecialty = courseSpecialty;
	}

	public String getCourseGradeNumber() {
		return courseGradeNumber;
	}

	public void setCourseGradeNumber(String courseGradeNumber) {
		this.courseGradeNumber = courseGradeNumber;
	}

	public String getCourseGrade() {
		return courseGrade;
	}

	public void setCourseGrade(String courseGrade) {
		this.courseGrade = courseGrade;
	}

	public String getCourseClassNumber() {
		return courseClassNumber;
	}

	public void setCourseClassNumber(String courseClassNumber) {
		this.courseClassNumber = courseClassNumber;
	}

	public String getCourseClassName() {
		return courseClassName;
	}

	public void setCourseClassName(String courseClassName) {
		this.courseClassName = courseClassName;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

}