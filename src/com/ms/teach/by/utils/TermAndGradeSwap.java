package com.ms.teach.by.utils;

import java.util.Calendar;

public class TermAndGradeSwap {
	
	/**
	 年级编号：2012
	 学年学期：2012201301 一
			2012201302 二
			2013201401 三
			2013201402 四
			2014201501 五
			2014201502 六
			2015201601 七
			2015201602 八
	   计算：学期 =（学年的开始年份-年级编号）x 2 + 年份的学期编号值
	    （如： 第3学期 = （2013-2012）x 2 + 1 = 3 ） 

	 */
	public static String getTermByGradeAndYearTerm(String gradeNumber,String yearTermNumber){
		String num = "";
		int gradeNum = Integer.parseInt(gradeNumber.trim());
		int yearNum = Integer.parseInt(yearTermNumber.trim().substring(0,4));
		int termNum = Integer.parseInt(yearTermNumber.trim().substring(9,10));
		num += String.valueOf((yearNum-gradeNum)*2 + termNum);
		/*x = (y-g)*2+t;
		2y-2g+t = x;
		y = (2g+x-t)/2=g+(x-t)/2*/
		return num;
	}
	public static String getYearTermByGradeAndTerm(String gradeNumber,String termNumber){
		int num = 0;
		String ytNumber="";
		int gradeNum = Integer.parseInt(gradeNumber.trim());
		int termNum = Integer.parseInt(termNumber.trim());
		if(termNum%2==0){
			num = 2;
		}else{
			num = 1;
		}
		int ytNum  = gradeNum+(termNum-num)/2;
	    ytNumber = ytNum+""+(ytNum+1)+"0"+num;
		return ytNumber;
	}
	
	public static void main(String[] args) {
		System.out.println(getTermByGradeAndYearTerm("2012","2013201402"));
		System.out.println(getYearTermByGradeAndTerm("2012","3"));
	}
}
