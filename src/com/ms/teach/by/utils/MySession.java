package com.ms.teach.by.utils;

import java.util.Map;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ms.teach.by.pojo.Users;

public class MySession implements SessionAware{
	private static Map session;
	
	public static String getUser(){
		if(session.get("user")==null){
			return "toLogin";
		}else{
			return null;
		}
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}
}
