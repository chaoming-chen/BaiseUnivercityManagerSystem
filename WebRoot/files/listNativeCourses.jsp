<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	$("#specialty_id_1 option").remove();
	$("#specialty_id_1").append("<option>=====请选择专业=====</option>");
	$("#specialty_id_1").append("<option value='000000'>公共课</option>");
	$("#specialty_id_2 option").remove();
	$("#specialty_id_2").append("<option>=====请选择专业=====</option>");
	$("#specialty_id_2").append("<option value='000000'>公共课</option>");
	$.each(data,function(i){
     	$("#specialty_id_1").append("<option value='"+data[i][0]+"'>" + data[i][1] + "</option>");
     	$("#specialty_id_2").append("<option value='"+data[i][0]+"'>" + data[i][1] + "</option>");
	});
});
}
function getGradesByJSON(){
	$.getJSON("Grade_getGradesByJSON", function(data){
	$("#grade_id option").remove();
	$("#grade_id").append("<option>=====请选择年级=====</option>");
	$.each(data,function(i){
     	$("#grade_id").append("<option value="+data[i]['gradeNumber']+">" + data[i]['gradeName'] + "</option>");
	});
});
}
function getYearAndTermByJSON(){
	$.getJSON("YearAndTerm_getYearAndTermByJSON", "", function(data){
	$("#year_term option").remove();
	$.each(data,function(i){
     	$("#year_term").append("<option value="+data[i]['ytNumber']+">" + data[i]['ytName'] + "</option>");
	});
});
}

function isEmpty_1(){
	if(document.getElementById('specialty_id_1').value==''){
	   alert('专业不能为空');
	   document.getElementById('specialty_id_1').focus();
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
function isEmpty_2(){
	if(document.getElementById('specialty_id_2').value==''){
	   alert('专业不能为空');
	   document.getElementById('specialty_id_2').focus();
	   return false;
	}else if(document.getElementById('term_id').value==''){
		if(document.getElementById('specialty_id_2').value=='000000'){
			document.getElementById('standardCourse_fom').submit();
			return true;
		}else{
			alert('学期不能为空');
	   		document.getElementById('term_id').focus();
	        return false;
		}
	}else{
		document.getElementById('standardCourse_fom').submit();
		return true;
	}
}

function showEmployeesTab(sign){
	if(sign=="1")
		$("#employees_tab").hide();
	else
		$("#employees_tab").show();
}

function isChecked(){
	var _fom = document.getElementById('my_fom');
	var obj = _fom.elements;
	var checked = false;
	for(var i=0; i<obj.length; i++){
		if(obj[i].checked==true){
			checked = true;
			break;
		}
	}
	if(checked==true){
		_fom.submit();
	}else{
		alert("请至少选择一个课程!");
	}
}
/**
function checkIsOpenCource_1(){
	var specialty_id_1 = document.getElementById('specialty_id_1').value;
	if(specialty_id_1=='000000'){
		document.getElementById('year_term').disabled=true;
	}else{
		document.getElementById('year_term').disabled=false;
	}
}
*/
function checkIsOpenCource_2(){
	var specialty_id_2 = document.getElementById('specialty_id_2').value;
	if(specialty_id_2=='000000'){
		document.getElementById('term_id').disabled=true;
	}else{
		document.getElementById('term_id').disabled=false;
	}
}

</script>

</head>

<body  style="margin:0px;padding:0px;"  onload="getGradesByJSON();getYearAndTermByJSON();getNativeSpecialtysNumberByJSON(); ">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="30" width="100%" colspan="2">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" width="100%" background="../images/nav04.gif" ></td>
      </tr>
    </table>
    </td>
  </tr>
      <s:if test="#request.confirm!=null">
		<script language="javascript">alert('${comfirm}')</script>
    	<tr><td bgcolor="#e3e3e3"><span style="color='red';font-size='20px'"><b>${comfirm}</b></span></td></tr>
     </s:if>
     
	<tr>
         <td>
         <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td>
         <table width="88%" align="center" cellpadding="0" cellspacing="0">
           <tr>
           <td>
           <hr style="color:#6795B4;" />
           </td>
           </tr>
           </table>
           </td>
           </tr>
           </table>
           </td>
        </tr>
	
   <!-- 课程查询 -->
    <tr>
      <td>
	    <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	          <table width="88%" align="center" cellpadding="0" cellspacing="0">
	          <tr>
          	  <td>
          	    <span style="color:#6795B4;">│</span>&nbsp;&nbsp;<input type="button" value="管理学年学期" class="button10" onclick="javaScript:location.href='YearAndTerm_addYearAndTerm'" />&nbsp;&nbsp;
          	    <span style="color:#6795B4;">│</span>&nbsp;&nbsp;<input type="button" value="管理年级" class="button10" onclick="javaScript:location.href='Grade_addGrade'" />&nbsp;&nbsp;
				<span style="color:#6795B4;">│</span>&nbsp;&nbsp;<input type="button" value="添加课程" class="button09" onclick="javaScript:location.href='addNativeCourse.jsp'" />&nbsp;&nbsp;
				<span style="color:#6795B4;">│</span>&nbsp;&nbsp;<input type="button" value="查询专业课程" class="button05" onclick="javaScript:location.href='NativeCourses_listSpecialtysCourses'"/>&nbsp;&nbsp;
				<span style="color:#6795B4;">│</span>&nbsp;&nbsp;<input type="button" value="查询教师课程" class="button10" onclick="javaScript:location.href='Employees_listTeacherCourses'"/>&nbsp;&nbsp;
				<span style="color:#6795B4;">│</span>&nbsp;&nbsp;<input type="button" value="查询班级课程" class="button10" onclick="javaScript:location.href='Classs_listClassCourses'"/>&nbsp;&nbsp;
				<span style="color:#6795B4;">│</span>&nbsp;&nbsp;<input type="button" value="给教师分配课程" class="button05" onclick="javaScript:location.href='Employees_selectEmployees'"/>&nbsp;&nbsp;
				<span style="color:#6795B4;">│</span>&nbsp;&nbsp;<input type="button" value="给班级分配课程" class="button05" onclick="javaScript:location.href='NativeCourses_selectClassAndClassCourses'"/>&nbsp;&nbsp;
				<span style="color:#6795B4;">│</span>
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
           <hr style="color:#6795B4" />
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
	    <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	          <table width="88%" align="center" cellpadding="0" cellspacing="0">
	       <tr>
		 <form id="nativeCourse_fom" action="NativeCourses_listNativeCourses?employee.eid=${employee.eid}" method="post">				
				<td nowrap="nowrap" align="right">已开设课程：</td>
			     <td>
			        <select id="specialty_id_1" name="nativeCourse.courseSpecialtyNumber"  class="regtxt">
						<option>=====请选择专业=====</option>
					</select>
					<select id="grade_id" name="nativeCourse.courseGradeNumber" class="regtxt">
						<option>=====请选择年级=====</option>
					</select>
					 <select id="year_term" name="nativeCourse.courseTermNumber" class="regtxt2">
						
					</select>
					<input type="button" onclick="isEmpty_1();" value="查询" class="button04"/>
					<span style="color:#6795B4;">│</span>
		        </td>
		        </form>
		       
		  <form id="standardCourse_fom" action="NativeCourses_listNativeCourses" method="post">
			     <td nowrap="nowrap" >拟开设课程：</td>
			     <td>
			        <select id="specialty_id_2" name="standardCourse.courseSpecialtyNumber"  class="regtxt"
			        	onchange="checkIsOpenCource_2();">
						<option>=====请选择专业=====</option>
					</select>
					 <select id="term_id" name="standardCourse.courseTerm" class="regtxt">
						<option>=====请选择学期=====</option>
						<option value="1">======第一学期======</option>
						<option value="2">======第二学期======</option>
						<option value="3">======第三学期======</option>
						<option value="4">======第四学期======</option>
						<option value="5">======第五学期======</option>
						<option value="6">======第六学期======</option>
						<option value="7">======第七学期======</option>
						<option value="8">======第八学期======</option>
					</select>
					<input type="button" onclick="isEmpty_2();" value="查询" class="button04"/>
		        </td>
		        </form>
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
            <hr style="color:#6795B4" />
            </td>
            </tr>
            </table>
            </td>
            </tr>
            </table>
            </td>
            </tr>
<!-- 给教师分配课程按钮 -->
	<s:if test="#request.employee!=null && #request.employee.employeeName!=null">
	  <tr>
          <td>
          <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td  class="tablestyle_title2">
             <span style="font-weight:bold">给教师&nbsp;<span style="color:blue;">${employee.employeeName}&nbsp;</span>分配课程:</span>
           <s:if test="#request.nativeCourses==null || #request.nativeCourses.size()==0">     
              <span style="color:yellow;"> 请在上面的已开设课程查询栏中输入条件，查找要分配的课程</span>
             </s:if>
             <s:else>
             	请在下面选择要分配的课程，分配给教师:&nbsp;<span style="color:blue;">${employee.employeeName}&nbsp;</span>
             </s:else>
      	</td>
      	</tr>
      </table>
      </td>
      </tr>
      </table>
      </td>
      </tr>
     </s:if>
<!-- 本地课程 --> 
	<s:if test="#request.nativeCourses!=null && #request.nativeCourses.size()!=0">
	<tr>
     <td>
      <table width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
	<form  id="my_fom" action="NativeCourses_confirmTeacherSelectCourses">
	   <table width="88%" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="15"  class="tablestyle_title">
                <s:if test="#request.employee!=null && #request.employee.employeeName!=null">
	                <input type="hidden" name="employee.eid" value="${employee.eid}"/> 
	              	<input type="button" value="确定分配" class="button09" onclick="isChecked()"/> 
	              </s:if>
			 <span style="color:blue">
			 <s:property value="#request.nativeCourses[0].courseSpecialty"/></span>专业 <span style="color:blue">
			 <s:property value="#request.nativeCourses[0].courseGrade"/></span>
			 第<span style="color:blue"><s:property value="#request.nativeCourses[0].courseTerm"/></span>&nbsp;已开设课程列表
              	 <input type="button" value="下载课程" class="button09"/>
          	  </td>
            	</tr>
                <tr>
                <td>
          <table width="100%"  class="TableLight" border="0" cellpadding="6" cellspacing="1">
               <tr>
               <s:if test="#request.employee!=null && #request.employee.employeeName!=null">
               		<td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">分配课程</div></td>
               </s:if>
				<td rowspan="2"  width="16%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">任课教师</div></td>
				<td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">已开课班级</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;分</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;时</div></td>
				<td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">周学时</div></td>
				<td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">考试考查</div></td>
				<td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">开课单位</div></td>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">专&nbsp;&nbsp;业</div></td>
			   </tr>
		       <tr>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
               
                <s:iterator value="#request.nativeCourses" status="st">
                <s:if test="employees.eid!=null">
                <tr  bgcolor="#FF9999">
                  <s:if test="#request.employee!=null && #request.employee.employeeName!=null">
                  	<td><div align="center">已任课</div></td>
                  </s:if>
                  <td><div align="center">${courseName}</div></td>
                  <td><div align="center">
                    <a href="JavaScript:JqueryDialog.Open('教师任课信息', 'teacherCoursesDialog.jsp?employee_id=<s:property value="employees.eid"/>', 500, 600);">
                     <s:property value="employees.employeeName"/></a>
                       </div></td>
                  <td><div align="center"><s:property value="classes.size()"/> </div></td>
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
                </tr>
                </s:if>
                <s:else>
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  <s:if test="#request.employee!=null && #request.employee.employeeName!=null">
                  	<td><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  </s:if>
                  <td><div align="center">${courseName}</div></td>
                  <td><div align="center">
                  </div></td>
                  <td><div align="center"><s:property value="classes.size()"/></div></td>
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  <s:set ></s:set>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                  <td><div align="center">${courseSpecialty}</div></td>
                </tr>
                </s:else>
                </s:iterator>
                
                </table>
                </td>
                </tr>
            </table>
            </form>
            </td>
        </tr>
        
        </table>
        </td>
        </tr>
        
       </s:if>
       <!-- 标准课程 -->
       <s:elseif test="#request.standardCourses!=null && #request.standardCourses.size()!=0">
       <tr>
       <td>
      <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	          <table width="88%" align="center" cellpadding="0" cellspacing="0">
			<tr>
               <td  colspan="15"  class="tablestyle_title">
                	<span style="font-size:16px; font-weight:bold">
					 <span style="color:blue">
					 <s:property value="#request.standardCourses[0].courseSpecialty"/></span>专业
					 第<span style="color:blue"><s:property value="#request.standardCourses[0].courseTerm"/></span>学期<span style="color:blue">
					 拟开设</span>课程列表</span>
                 	</td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  class="TableLight" width="100%" border="0" cellpadding="6" cellspacing="1">
               <tr>
				<td rowspan="2"  width="18%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;分</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;时</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学期</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">周学时</div></td>
				<td rowspan="2"  width="6%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">考试考查</div></td>
				<td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">开课单位</div></td>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">专&nbsp;&nbsp;业</div></td>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">备&nbsp;&nbsp;注</div></td>
			   </tr>
		       <tr>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
               
                <s:iterator value="#request.standardCourses" status="st">
               
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'" >
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
                  <td><div align="center">${courseSpecialty}</div></td>
                  <td><div align="center">${courseExplain}</div></td>
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
       </s:elseif>
       
<!-- 统计 -->

       <tr>
         <td>
          <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	         <table width="88%" align="center" cellpadding="0" cellspacing="0">
               <tr>
               <td class="tablestyle_title">
       	        <s:property value="#request.YearAndTerm"/> 课程统计表
       	        </td>
       	        </tr>
			   <tr>
                <td height="40" class="font42">
              <table  class="TableLight" width="100%" border="0" cellpadding="6" cellspacing="1">
	       	   <tr>
	               <td width="10%" bgcolor="#EEEEEE"><div align="center">课程门数</div></td>
	               <td width="10%" bgcolor="#EEEEEE"><div align="center">理论学时数</div></td>
	               <td width="10%" bgcolor="#EEEEEE"><div align="center">实践学时数</div></td>
	               <td width="10%" bgcolor="#EEEEEE"><div align="center">总学时数</div></td>
	               <td width="10%" bgcolor="#EEEEEE"><div align="center">周学时总数</div></td>
	               <td width="10%" bgcolor="#EEEEEE"><div align="center">教师平均课时</div></td>
	               <td width="10%" bgcolor="#EEEEEE"><div align="center">教师周平均课时</div></td>
	       	   </tr>
	       	   
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'" >
                  <td><div align="center"><s:property value="#request.countCourses['courseNumber']"/></div></td>
                  <td><div align="center"><s:property value="#request.countCourses['theoryPeriod']"/></div></td>
                  <td><div align="center"><s:property value="#request.countCourses['practicePeriod']"/></div></td>
                  <td><div align="center"><s:property value="#request.countCourses['theoryPeriod']+#request.countCourses['practicePeriod']"/></div></td>
                  <td><div align="center"><s:property value="#request.countCourses['weekPeriod']"/></div></td>
                  <td><div align="center"><s:property value="#request.countCourses['teacherPeriod']"/></div></td>
                  <td><div align="center"><s:property value="#request.countCourses['teacherWeekPeriod']"/></div></td>
                </tr>
       	    </table>
       	  </table>
       	 </td>
       	 </tr>
       	 </table>
       	 </td>
       	 </tr>
      </table>

</body>
</html>