package com.ms.teach.by.dao;

import java.util.List;

import com.ms.teach.by.pojo.Users;

public interface IUsersDAO {
	public void save(Users user);
	public void update(Users user);
	public void delete(Users user);
	public Users findById(Integer id);
	public List findAll();
}
