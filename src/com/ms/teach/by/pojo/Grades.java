package com.ms.teach.by.pojo;

/**
 *  @author zongwei
 */

public class Grades implements java.io.Serializable {


	private Integer gradeId;
	private String gradeNumber;
	private String gradeName;


	/** default constructor */
	public Grades() {
	}

	/** minimal constructor */
	public Grades(String gradeNumber) {
		this.gradeNumber = gradeNumber;
	}

	/** full constructor */
	public Grades(String gradeNumber, String gradeName) {
		this.gradeNumber = gradeNumber;
		this.gradeName = gradeName;
	}

	public Integer getGradeId() {
		return this.gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public String getGradeNumber() {
		return this.gradeNumber;
	}

	public void setGradeNumber(String gradeNumber) {
		this.gradeNumber = gradeNumber;
	}

	public String getGradeName() {
		return this.gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

}