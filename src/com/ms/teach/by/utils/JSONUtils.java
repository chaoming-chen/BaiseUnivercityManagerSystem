package com.ms.teach.by.utils;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

/**
 * @author zongwei
 */
public class JSONUtils{

	/**以JSON格式传递数据到客户端*/
	public static void sendOfJSON(List list) {
		if(list!=null && list.size()>0){
			JSONArray jr = JSONArray.fromObject(list);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setHeader("cache-control", "no-cache");
			response.setContentType("text/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				String jsonUser = jr.toString();
				//System.out.println(jsonUser);
				out.print(jsonUser);
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	/**以JSON格式传递数据到客户端*/
	public static void sendOfJSON(Set set) {
		JSONArray jr = JSONArray.fromObject(set);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setHeader("cache-control", "no-cache");
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			String jsonUser = jr.toString();
			//System.out.println(jsonUser);
			out.print(jsonUser);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
