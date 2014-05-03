package com.ms.teach.by.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * 	@author zongwei
 */

public class Roles implements java.io.Serializable {


	private Integer rid;
	private Integer roleNumber;
	private String roleName;
	private Set userses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Roles() {
	}

	/** minimal constructor */
	public Roles(Integer roleNumber, String roleName) {
		this.roleNumber = roleNumber;
		this.roleName = roleName;
	}

	/** full constructor */
	public Roles(Integer roleNumber, String roleName, Set userses) {
		this.roleNumber = roleNumber;
		this.roleName = roleName;
		this.userses = userses;
	}


	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public Integer getRoleNumber() {
		return this.roleNumber;
	}

	public void setRoleNumber(Integer roleNumber) {
		this.roleNumber = roleNumber;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

}