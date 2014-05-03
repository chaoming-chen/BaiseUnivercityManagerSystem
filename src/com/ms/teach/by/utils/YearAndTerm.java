package com.ms.teach.by.utils;

import java.util.Calendar;

public class YearAndTerm {
	
	/**手工生成学年学期，用于显示*/
	public static String getYearAndTerm(String yearId, String termId){
		String yearAndTerm="";
		String yearName = yearId.substring(0,4)+"-"+yearId.substring(4)+"学年 ";
		String termName = "";
		if("01".equals(termId)) termName = "第一学期";
		else if("02".equals(termId)) termName = "第二学期";
		yearAndTerm = yearName+termName;
		return yearAndTerm;
	}
	
	/**手工生成学年学期编码，用于查询数据*/
	public static String getYearAndTermNumber(String yearId, String termId){
		String yearAndTermNumber="";
		yearAndTermNumber = yearId+termId;
		return yearAndTermNumber;
	}
	
	/**自动生成学年学期，用于显示*/
	public static String getYearAndTerm(){
		String yearAndTerm="";
		String term1="一";
		String term2="二";
		Calendar cal = Calendar.getInstance();
		int year = cal.get (Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);//月
		
		if(month>6){
			//System.out.println(year+"-"+(year+1)+"年 第"+term1+"学期");
			yearAndTerm+=year+"-"+(year+1)+"学年 第一学期";
		}else{
			yearAndTerm+=(year-1)+"-"+year+"学年 第二学期";
		}
		return yearAndTerm;
	}
	
	/**自动生成学年学期编码，用于查询数据*/
	public static String getYearAndTermNumber(){
		String yearAndTermValue="";
		Calendar cal = Calendar.getInstance();
		int year = cal.get (Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);//月
		
		if(month>6){
			yearAndTermValue+=year+""+(year+1)+"02";
		}else{
			yearAndTermValue+=(year-1)+""+year+"01";
		}
		return yearAndTermValue;
	}
	
	public static void main(String[] args){
		System.out.println(getYearAndTerm("20122013", "01"));
		System.out.println(getYearAndTermNumber("20122013", "01"));
	}
}
