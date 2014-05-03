package com.ms.teach.by.utils;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class SessionFilterInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("user") == null){
			HttpServletResponse response = ServletActionContext.getResponse();
			ServletActionContext.getResponse().sendRedirect(Action.INPUT);
			session.invalidate();
			response.setContentType("text/html;charset=gb2312");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript' type='text/javascript'>");
			out.println("alert('请重新登录!');window.location.href='/login.jsp'");
			out.println("</script>");
			return "toLogin";
		}else{
			return invocation.invoke();
		}
	}

}