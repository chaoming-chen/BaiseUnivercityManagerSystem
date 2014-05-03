package com.ms.teach.by.pojo;

/**
 * @author zongwei
 */

public class YearTerm implements java.io.Serializable {


	private Integer yearTermId;
	private String ytNumber;
	private String ytName;
	private String ytStart;
	private String ytEnd;

	public YearTerm() {
	}

	public YearTerm(String ytNumber) {
		this.ytNumber = ytNumber;
	}
	
	public YearTerm(String ytNumber, String ytName, String ytStart, String ytEnd) {
		this.ytNumber = ytNumber;
		this.ytName = ytName;
		this.ytStart = ytStart;
		this.ytEnd = ytEnd;
	}


	public Integer getYearTermId() {
		return this.yearTermId;
	}

	public void setYearTermId(Integer yearTermId) {
		this.yearTermId = yearTermId;
	}

	public String getYtNumber() {
		return this.ytNumber;
	}

	public void setYtNumber(String ytNumber) {
		this.ytNumber = ytNumber;
	}

	public String getYtName() {
		return this.ytName;
	}

	public void setYtName(String ytName) {
		this.ytName = ytName;
	}

	public String getYtStart() {
		return this.ytStart;
	}

	public void setYtStart(String ytStart) {
		this.ytStart = ytStart;
	}

	public String getYtEnd() {
		return this.ytEnd;
	}

	public void setYtEnd(String ytEnd) {
		this.ytEnd = ytEnd;
	}

}