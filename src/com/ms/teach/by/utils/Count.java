package com.ms.teach.by.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ms.teach.by.pojo.NativeCourses;

public class Count {
	
	/**统计课程*/
	public static Map countCourses(List<NativeCourses> list, int teacherTotal){
		int theoryPeriod=0, practicePeriod=0,weekPeriod = 0;
		int courseNumber = list.size();
		Map m = new HashMap();
		for (NativeCourses nc : list) {
			theoryPeriod += nc.getCourseTheoryPeriod();
			practicePeriod += nc.getCoursePracticePeriod();
			weekPeriod += nc.getCourseWeekPeriod();
		}
		int teacherPeriod = (theoryPeriod+practicePeriod)/teacherTotal;
		/*if((theoryPeriod+practicePeriod)%teacherTotal != 0)
			teacherPeriod += 1;*/
		int teacherWeekPeriod = weekPeriod/teacherTotal;
		/*if(weekPeriod/teacherTotal!=0)
			teacherPeriod += 1;*/
		m.put("courseNumber", courseNumber);
		m.put("theoryPeriod", theoryPeriod);
		m.put("practicePeriod", practicePeriod);
		m.put("weekPeriod", weekPeriod);
		m.put("teacherPeriod", teacherPeriod);
		m.put("teacherWeekPeriod", teacherWeekPeriod);
		
		return m;
	}
	
	/**利用JAVA反射机制统计数据*/
	public static List count(List list){
		float theoryCredit=0,practiceCredit=0,theoryPeriod=0,practicePeriod=0,allCredit=0,allPeriod=0;
		for (Object obj : list) {
			try {
				Method m = obj.getClass().getMethod("getCourseTheoryCredit", null);
				theoryCredit+=(Float)m.invoke(obj, null);
				m = obj.getClass().getMethod("getCoursePracticeCredit", null);
				practiceCredit+=(Float)m.invoke(obj, null);
				m = obj.getClass().getMethod("getCourseTheoryPeriod", null);
				theoryPeriod+=(Float)m.invoke(obj, null);
				m = obj.getClass().getMethod("getCoursePracticePeriod", null);
				practicePeriod+=(Float)m.invoke(obj, null);
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		allCredit=theoryCredit+practiceCredit;
		allPeriod=theoryPeriod+practicePeriod;
		List countList = new ArrayList();
		countList.add(allCredit);
		countList.add(theoryCredit);
		countList.add(practiceCredit);
		countList.add(allPeriod);
		countList.add(theoryPeriod);
		countList.add(practicePeriod);
		return countList;
	}

}
