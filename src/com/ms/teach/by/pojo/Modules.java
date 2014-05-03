package com.ms.teach.by.pojo;

/**
 * 	@author zongwei
 */
public class Modules implements java.io.Serializable {


	private Integer mid;
	private String moduleName;
	private String moduleEnName;
	private Integer moduleRole;


	/** default constructor */
	public Modules() {
	}

	/** full constructor */
	public Modules(String moduleName, String moduleEnName, Integer moduleRole) {
		this.moduleName = moduleName;
		this.moduleEnName = moduleEnName;
		this.moduleRole = moduleRole;
	}


	public Integer getMid() {
		return this.mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getModuleName() {
		return this.moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleEnName() {
		return this.moduleEnName;
	}

	public void setModuleEnName(String moduleEnName) {
		this.moduleEnName = moduleEnName;
	}

	public Integer getModuleRole() {
		return this.moduleRole;
	}

	public void setModuleRole(Integer moduleRole) {
		this.moduleRole = moduleRole;
	}

}