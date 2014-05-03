<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/jquery_dialog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery_dialog.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

function getNativeSpecialtysNumberByJSON(){
	$.getJSON("NativeSpecialtys_getNativeSpecialtysNumberByJSON", "", function(data){
	$("#specialty_id option").remove();
	var sNumber = "<s:property value='#request.specialty.specialtyNumber'/>";
	if(sNumber!=null && sNumber!=''){
		$("#specialty_id").append("<option value='"+sNumber+"' selected='selected'><s:property value='#request.specialty.specialtyName'/></option>");
	}else{
		$("#specialty_id").append("<option>=====请选择专业=====</option>");
	}
	$.each(data,function(i){
     	$("#specialty_id").append("<option value='"+data[i][0]+"'>" + data[i][1] + "</option>");
	});
});
}
function getGradesByJSON(){
	$.getJSON("Grade_getGradesByJSON", function(data){
	$("#grade_id option").remove();
	var gNumber = "<s:property value='#request.grade.gradeNumber'/>";
	if(gNumber!=null && gNumber!=''){
		$("#grade_id").append("<option value='"+gNumber+"' selected='selected'><s:property value='#request.grade.gradeName'/></option>");
	}else{
		$("#grade_id").append("<option>=====请选择年级=====</option>");
	}
	$.each(data,function(i){
     	$("#grade_id").append("<option value="+data[i]['gradeNumber']+">" + data[i]['gradeName'] + "</option>");
	});
});
}
function getYearAndTermByJSON(){
	$.getJSON("YearAndTerm_getYearAndTermByJSON", "", function(data){
	$("#year_term option").remove();
	var ytNumber = "<s:property value='#request.yearTerm.ytNumber'/>";
	if(ytNumber!=null && ytNumber!=''){
		$("#year_term").append("<option value='"+ytNumber+"' selected='selected'><s:property value='#request.yearTerm.ytName'/></option>");
	}
	$("#year_term").append("<option value='all'>所有学期</option>");	
	$.each(data,function(i){
     	$("#year_term").append("<option value="+data[i]['ytNumber']+">" + data[i]['ytName'] + "</option>");
	});
});
}


function deleteData(order_id){
    var confirm_ = confirm('你确定取消此课程吗？');
    if(confirm_){
        $.ajax({
            type:"GET",
            url:"NativeCourses_deleteSelectedCourse?nativeCourse.cid="+order_id,
            success:function(msg){
                 $("#tr_"+order_id).remove();
            }
        });
    }
}

function cancelTeacherSelectedCourse(order_id){
    var confirm_ = confirm('你确定取消吗？');
    if(confirm_){
        $.ajax({
            type:"GET",
            url:"NativeCourses_cancelTeacherSelectedCourse?nativeCourse.cid="+order_id,
            success:function(msg){
                 $("#div_"+order_id).remove();
                 $("#td_"+order_id).css("background-color","#FF9999");
            }
        });
    }
}

function isEmpty_1(){
	if(document.getElementById('specialty_id').value==''){
	   alert('专业不能为空');
	   document.getElementById('specialty_id').focus();
	   return false;
	}else if(document.getElementById('grade_id').value==''){
		alert('年级不能为空');
   		document.getElementById('grade_id').focus();
        return false;
	}else{
		document.getElementById('nativeCourse_fom').submit();
		return true;
	}
}

function isEmpty(){
	if(document.getElementById('specialty_id').value==''){
		alert("请选择查询条件");
		return false;
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}

function outputClassesByExcel(){
	location.href="Classs_outputClassesByExcel?classes.nativeSpecialtys.sid=<s:property value='#request.classes[0].nativeSpecialtys.sid'/>";
}
</script>
</head>

<body onload="getNativeSpecialtysNumberByJSON();getGradesByJSON();getYearAndTermByJSON();">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="30" width="100%">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" width="100%" background="../images/nav04.gif">&nbsp; &nbsp;
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
    <form id="nativeCourse_fom" action="NativeCourses_listSpecialtysCourses" method="post">
	<tr>
      <td>
	    <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	          <table width="88%" align="center" cellpadding="0" cellspacing="0">
	       <tr>
		     <td>
		     <div>
		               专业课程查询:&nbsp;&nbsp;&nbsp;&nbsp;
		               专业: <select id="specialty_id" name="nativeCourse.courseSpecialtyNumber"  class="regtxt">
				    </select>&nbsp;&nbsp;&nbsp;&nbsp;
				年级:<select id="grade_id" name="nativeCourse.courseGradeNumber" class="regtxt">
				    </select>&nbsp;&nbsp;&nbsp;&nbsp;
				学期:<select id="year_term" name="nativeCourse.courseTermNumber" class="regtxt2">
				    </select>&nbsp;&nbsp;&nbsp;&nbsp;
				  <input type="button" onclick="isEmpty_1();" value="查询" class="button04"/>
				  </div>
	            </td>
			</tr>
		</table>
		</td>
		</tr>
	</table>
	</td>
	</tr>
 </form>
 
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
       <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="1">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="4"    background="../images/bg_showCourses.png">
			<tr>
            <td width="56%">
                <table class="TableLight"  height="100%" width="100%" border="0" cellpadding="6" cellspacing="1">
                <tr>
	              <td colspan="7"  class="tablestyle_title">
				 <span style="color:blue">
				 <s:property value="#request.specialty.specialtyName"/></span>&nbsp;专业 <span style="color:blue">
				 <s:property value="#request.grade.gradeName"/></span>&nbsp;
				  <span style="color:blue">
				 <s:if test="#request.yearTerm!=null">
				 	<s:property value="#request.yearTerm.ytName"/>
				 </s:if>
				 <s:else>
				 所有学期
				 </s:else>
				 </span>
				 已开设课程
	          	  </td>
           		 </tr>
                <tr>
                <td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">取消课程</div></td>
				<td rowspan="2"  width="14%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td rowspan="2"  width="14%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">任课教师</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;时</div></td>
				<td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">周学时</div></td>
			   </tr>
		       <tr>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
               
                <s:iterator value="#request.nativeCourses" status="st">
                <s:if test="sign!=null">
					<tr>
						<td colspan="13"  class="tablestyle_title">
						<div>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="NativeCourses_listSpecialtysCourses?nativeCourse.courseSpecialtyNumber=${courseSpecialtyNumber }&nativeCourse.courseGradeNumber=${courseGradeNumber }&nativeCourse.courseTermNumber=${courseTermNumber }">${courseTerm }</a>&nbsp;
						(即:第&nbsp;<span style="color:yellow">${sign }</span>&nbsp;学期)
						</div></td>
					</tr>
                </s:if>
                <tr id="tr_${cid }" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">

                 <td bgcolor="#EEEEEE" ><div align="center"><img style="cursor:pointer;" width="22" height="22" alt="取消课程" src="../images/delete.png" onclick="deleteData('${cid}')"></div></td>
                
                  <td><div align="center">
                   <a href="JavaScript:JqueryDialog.Open('课程信息', 'courseMsgDialog.jsp?course_id=${cid }', 500, 600);">
                     ${courseName}
                     </a>
                  </div></td>
                  <s:if test="employees.eid!=null">
                  <td id="td_${cid}"><div id="div_${cid}" align="center">
                    <a href="JavaScript:JqueryDialog.Open('教师任课信息', 'teacherCoursesDialog.jsp?employee_id=<s:property value="employees.eid"/>', 500, 600);">
                     <s:property value="employees.employeeName"/>
                    </a>&nbsp;&nbsp;
                    <input type="button" value="修改" onclick="JavaScript:JqueryDialog.Open('选择教师', 'selectEmployeeDialog.jsp?employee_id=<s:property value="employees.eid"/>', 500, 600);" class="button04"/>&nbsp;&nbsp;
                    <input type="button" value="取消" onclick="cancelTeacherSelectedCourse('${cid}');" class="button04"/>
                       </div>
                      </td>
                   </s:if>
                   <s:else>
                   	<td bgcolor="#FF9999"><div align="center"></div></td>
                   </s:else>
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                 </tr>
                </s:iterator>
               
                </table>
             	</td>
             	<td width="44%">
             	<table class="TableLight"  height="100%" width="100%" border="0" cellpadding="6" cellspacing="1">
               <tr>
               <td  class="tablestyle_title" colspan="6">参考数据：<span style="color:blue">
               <s:property value="#request.specialty.specialtyName"/></span>&nbsp;专业 
				 <span style="color:blue"><s:property value="#request.previousGrade.gradeName"/></span>
				课程安排
			</td>
			</tr>
               <tr>
				<td rowspan="2"  width="15%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">任课教师</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;时</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">周学时</div></td>
			   </tr>
		       <tr>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
               
                <s:iterator value="#request.previousGradeCourses" status="st">
                 <s:if test="sign!=null">
					<tr>
						<td colspan="6"  class="tablestyle_title"><div>
						${courseTerm }&nbsp;(即:第&nbsp;<span style="color:yellow">${sign }</span>&nbsp;学期&nbsp;)</div></td>
					</tr>
                </s:if>
                <tr  bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  <td><div align="center">${courseName}</div></td>
                   <s:if test="employees.eid!=null">
                  <td><div align="center">
                    <a href="JavaScript:JqueryDialog.Open('教师任课信息', 'teacherCoursesDialog.jsp?employee_id=<s:property value="employees.eid"/>', 500, 600);">
                     <s:property value="employees.employeeName"/></a>
                       </div>
                      </td>
                   </s:if>
                   <s:else>
                   	<td bgcolor="#FF9999"><div align="center"></div></td>
                   </s:else>
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                </tr>
                	</s:iterator>
               
               
                </table>
             	</td>
             	</tr>
	       </table>
	         </td>
	         </tr>
         </table>
         </td>
	 </tr>
   </table>  

</body>
</html>