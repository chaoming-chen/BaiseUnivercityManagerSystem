<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function submitForm(teacherId,confirm){
	  	document.getElementById('myform').submit();
	  //window.location.href=
	  	//window.location.replace("NativeCourses_listTeacherSelectedCourses");
	}
</script>
</head>

<body>
<form id="myform" action="NativeCourses_addNativeCourses" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="30" width="100%">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" width="100%" background="../images/nav04.gif" >
        </td>
      </tr>
    </table>
    </td>
  </tr>
   <s:if test="#request.comfirm!=null">
		<script language="javascript">alert('${comfirm}')</script>
    		<tr><td bgcolor="#e3e3e3"><span style="color='red';font-size='20px'"><b>${comfirm}</b></span></td></tr>
    	</s:if>
    <tr>
    <td>
    <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          
          <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
			
			 <tr>
               <td height="20" colspan="13"  bgcolor="#EEEEEE">
               		<span style="color:blue;font-size:18px;font-weight:bold">请从下面的课程中选择给教师分配课程（至少选择一项）：</span>
                    <input type="hidden" name="teacherId" value="${teacherId}"/>
                 	<input type="button" class="button" value="提交" onclick="submitForm('${teacherId}')"/>
                </td>
               </tr>
			 <tr>
               <td height="20" colspan="13" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
             		   通识教育平台教学计划课程</td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#6795B4">
               <tr>
				<td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">选课</div></td>
				<td rowspan="2"  width="22%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;分</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;时</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学期</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">周学时</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">考试考查</div></td>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">开课单位</div></td>
				<td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">性质</div></td>
			   </tr>
		       <tr>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
               
                <s:iterator value="#request.mustPublicCourse" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  
                  <td bgcolor="#EEEEEE" ><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                   <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.mustPublicCourse.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
                
                <s:iterator value="#request.choosePublicCourse" id="cpc" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <s:if test="#st.first">
                  <td rowspan="<s:property value='#request.choosePublicCourse.size()'/>"><div align="center">${courseTheoryCredit}</div></td>
                  </s:if>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  
                  <s:if test="#st.first">
                  <td rowspan="<s:property value='#request.choosePublicCourse.size()'/>"><div align="center">${courseTheoryPeriod}</div></td>
                  </s:if>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  
                  <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.choosePublicCourse.size()'/>" ><div align="center">3~7学期滚动开设,以届时公布的选课计划为准</div></td>
                  </s:if>
                  <td><div align="center"></div></td>
                  <s:if test="#st.first">
                  <td rowspan="<s:property value='#request.choosePublicCourse.size()'/>" ><div align="center">${courseExam}</div></td>
                  	<td rowspan="<s:property value='#request.choosePublicCourse.size()'/>" ><div align="center">${courseOpenDepartment }</div></td>
                  	<td rowspan="<s:property value='#request.choosePublicCourse.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                 </tr>
                 </s:iterator>
                 
               <tr>
                <td height="20" colspan="13" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 学科基础课平台教学计划课程 &nbsp;</td>
               </tr>
               
               <s:iterator value="#request.subjectBaseCourse" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                   <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.subjectBaseCourse.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
               
                <tr>
               <td height="20" colspan="13" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 专业基础课平台教学计划课程 &nbsp;</td>
               </tr>
                <s:iterator value="#request.specialtyBaseCourse" status="st">
                 <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                   <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.specialtyBaseCourse.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
                
                <tr>
               <td height="20" colspan="13" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 专业发展课程平台教学计划课（选修） &nbsp;</td>
               </tr>
               
                <s:iterator value="#request.gzList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}" /></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                  <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.gzList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
               
                <s:iterator value="#request.sjList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                  <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.sjList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
                 
                <s:iterator value="#request.xtList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                   	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                  <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.xtList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
               
                <s:iterator value="#request.yyList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  	  
                 <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                  <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.yyList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	 
                </tr>
                </s:iterator>
                
                <s:iterator value="#request.gcList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                   	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                  <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.gcList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
                
                <s:iterator value="#request.tzList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                 	 	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                   <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.tzList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>
                </tr>
                </s:iterator>
               
                <s:iterator value="#request.oneList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                   	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                 <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.oneList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
               
                <s:iterator value="#request.twoList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  	 	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                 <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.twoList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>
                </tr>
                </s:iterator>
               
                <s:iterator value="#request.threeList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                 <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}" /></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                   <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.threeList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
               
                <s:iterator value="#request.jyList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                     <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.jyList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
               
                <s:iterator value="#request.jtList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                   <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.jtList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
               
                <s:iterator value="#request.fzList" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  	  
                  <td bgcolor="#EEEEEE"><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                   <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.fzList.size()'/>" bgcolor="#EEEEEE"><div align="center"><b>${courseProperty }</b></div></td>
                  </s:if>	
                </tr>
                </s:iterator>
                 
                </table>
             
            </table>
            </td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
<br/>
</form>
</body>
</html>