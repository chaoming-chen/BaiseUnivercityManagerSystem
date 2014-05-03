package com.ms.teach.by.pojo;

/**
 * 	@author zongwei
 */

public class StandardCourses implements java.io.Serializable {

	private Integer cid;
	private String courseNumber;
	private String courseName;
	private String courseAddToNativeSign;
	private Float courseTheoryCredit;
	private Float coursePracticeCredit;
	private Integer courseTheoryPeriod;
	private Integer coursePracticePeriod;
	private Integer courseWeekPeriod;
	private String courseTerm;
	private String courseExam;
	private String courseOpenDepartment;
	private String courseSpecialtyNumber;
	private String courseSpecialty;
	private String courseExplain;
	private String courseProperty;


	/** default constructor */
	public StandardCourses() {
	}

	/** full constructor */
	public StandardCourses(String courseNumber, String courseName,
			String courseAddToNativeSign, Float courseTheoryCredit,
			Float coursePracticeCredit, Integer courseTheoryPeriod,
			Integer coursePracticePeriod, String courseTerm,
			Integer courseWeekPeriod, String courseExam,
			String courseOpenDepartment, String courseSpecialtyNumber, String courseSpecialty,
			String courseExplain, String courseProperty) {
		this.courseNumber = courseNumber;
		this.courseName = courseName;
		this.courseAddToNativeSign = courseAddToNativeSign;
		this.courseTheoryCredit = courseTheoryCredit;
		this.coursePracticeCredit = coursePracticeCredit;
		this.courseTheoryPeriod = courseTheoryPeriod;
		this.coursePracticePeriod = coursePracticePeriod;
		this.courseTerm = courseTerm;
		this.courseWeekPeriod = courseWeekPeriod;
		this.courseExam = courseExam;
		this.courseOpenDepartment = courseOpenDepartment;
		this.courseSpecialtyNumber = courseSpecialtyNumber;
		this.courseSpecialty = courseSpecialty;
		this.courseExplain = courseExplain;
		this.courseProperty = courseProperty;
	}


	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
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

	public String getCourseAddToNativeSign() {
		return this.courseAddToNativeSign;
	}

	public void setCourseAddToNativeSign(String courseAddToNativeSign) {
		this.courseAddToNativeSign = courseAddToNativeSign;
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

	public String getCourseTerm() {
		return this.courseTerm;
	}

	public void setCourseTerm(String courseTerm) {
		this.courseTerm = courseTerm;
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

	public String getCourseSpecialty() {
		return this.courseSpecialty;
	}

	public String getCourseSpecialtyNumber() {
		return courseSpecialtyNumber;
	}

	public void setCourseSpecialtyNumber(String courseSpecialtyNumber) {
		this.courseSpecialtyNumber = courseSpecialtyNumber;
	}

	public void setCourseSpecialty(String courseSpecialty) {
		this.courseSpecialty = courseSpecialty;
	}

	public String getCourseExplain() {
		return this.courseExplain;
	}

	public void setCourseExplain(String courseExplain) {
		this.courseExplain = courseExplain;
	}

	public String getCourseProperty() {
		return this.courseProperty;
	}

	public void setCourseProperty(String courseProperty) {
		this.courseProperty = courseProperty;
	}

}