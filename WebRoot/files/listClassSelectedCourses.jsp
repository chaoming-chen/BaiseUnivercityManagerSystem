<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="../js/jquery.js"></script>
<script type="text/javascript">
function deleteData(class_id,course_id){
    var confirm_ = confirm('你确定取消吗？');
    if(confirm_){
        $.ajax({
            type:"GET",
            url:"NativeCourses_cancelClassSelectedCourse?classes.classId="+class_id+"&nativeCourse.cid="+course_id,
            success:function(msg){
                 $("#tr_"+course_id).remove();
            }
        });
    }
};
    
function getYearAndTermByJSON(){
	$.getJSON("YearAndTerm_getYearAndTermByJSON", "", function(data){
	$("#year_term option").remove();
	$.each(data,function(i){
     	$("#year_term").append("<option value="+data[i]['ytNumber']+">" + data[i]['ytName'] + "</option>");
	});
});
}

</script>
</head>

<body onload="getYearAndTermByJSON();">
 <form action="NativeCourses_listClassSelectedCourses" method="post">
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
  
    <tr>
      <td>
      <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
      <tr>
      <td>
      <table width="88%" align="center" cellpadding="0" cellspacing="0">
        <tr>
        <td>
        <hr>
        </td>
        </tr>
        </table>
        </td>
        </tr>
        </table>
        </td>
      </tr>
  
	<tr>
      <td>
      <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
      <table width="88%" align="center" cellpadding="0" cellspacing="0">
        <tr>
        <td>
        <input onclick="window.history.go(-1)" type="button" class="button04" value="返回">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	查询班级已选课程：
	         <select id="year_term" name="yearTerm.ytNumber" class="regtxt2">
			 </select>
			 <input type="hidden" name="classes.classId" value='<s:property value="#request.myClass.classId"/>'>
			 <input type="submit" value="查询" class="button04"/>
        </td>
        </tr>
        </table>
        </td>
        </tr>
        </table>
        </td>
      </tr> 
  <tr>
    <td>
    <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
       
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0"  class="CContent">
			<tr>
               <td height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                                  班级<span style="color:blue">&nbsp;<s:property value="#request.myClass.className"/>&nbsp;
                   <s:property value="#request.yearTerm.ytName"/>&nbsp;
                   </span>已选课程如下
                 </td>
                 
               </tr>
              <tr>
                <td height="40" class="font42">
                <table class="TableLight"  width="100%" border="0" cellpadding="4" cellspacing="1">
               <tr>
				<td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">取消</div></td>
				<td rowspan="2"  width="16%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td rowspan="2"  width="15%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;期</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;分</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;时</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">周学时</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">考试考查</div></td>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">开课单位</div></td>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">专&nbsp;&nbsp;业</div></td>
				<td rowspan="2"  bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">备&nbsp;&nbsp;注</div></td>
			   </tr>
		       <tr>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
               
                <s:iterator value="#request.classSelectedCourses" status="st">
                <tr id="tr_${cid}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                 <td bgcolor="#EEEEEE" ><div align="center"><img width="22" height="22" alt="取消选课" src="../images/delete.png" onclick="deleteData('${myClass.classId}','${cid}')">   <%--<input type="radio"  onchange="deleteData('${cid}')"/>--%></div></td>
                
                  <td><div align="center">${courseName}</div></td>
                  <td><div align="center">${courseTerm}</div></td>
                  
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                  <td><div align="center">${courseSpecialty}</div></td>
                  <td><div align="center">${courseExplain}</div></td>
                </tr>
                </s:iterator>
                <tr>
			   	<td  colspan="16" bgcolor="#EEEEEE">
					<input type="button" value="返回查看课程" class="button10" onclick="javaScript:window.location.href='NativeCourses_listNativeCourses'"/>
				</td>
			   </tr>
                </table>
	       </table>
	       </td>
           </tr>
             
      </table>
    </td>
  </tr>
 
</table>
<br/>
<br/>

</body>
</html>