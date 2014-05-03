<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
		$("#specialty_id_2 option").remove();
		$("#specialty_id_2").append("<option>=====请选择专业=====</option>");
		$("#specialty_id_2").append("<option value='000000'>公共课</option>");
		$.each(data,function(i){
		 	$("#specialty_id_2").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
	});
}

function getGradesByJSON(){
	$.getJSON("Grade_getGradesByJSON", "", function(data){
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
		//alert(data);
     	$("#year_term").append("<option value="+data[i]['ytNumber']+">" + data[i]['ytName'] + "</option>");
	});
});
}


function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "selectCourses"){
			obj[i].checked = true;
		}
	}
}
 
function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "selectCourses"){
			if (obj[i].checked==true){
				obj[i].checked = false;
			}else{
				obj[i].checked = true;
			}
		}
	}
}

function isEmpty(){
	if(document.getElementById('specialty_id_2').value==''){
	   alert('请选择专业');
	   document.getElementById('specialty_id_2').focus();
	   return false;
	}else if(document.getElementById('grade_id').value==''){
	   alert('请选择年级');
	   document.getElementById('grade_id').focus();
	   return false;
	}else if(document.getElementById('year_term').value==''){
	   alert('请选择学年学期');
	   document.getElementById('year_term').focus();
	   return false;
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}


function isChecked(){
	var _fom = document.getElementById('courses_fom');
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

function checkIsOpenCource_2(){
	var specialty_id_2 = document.getElementById('specialty_id_2').value;
	if(specialty_id_2=='000000'){
		document.getElementById('term_id').disabled=true;
	}else{
		document.getElementById('term_id').disabled=false;
	}
}

function f2(){
	var leftValue = $("#left").val();
	var text = $("#left").find("option:selected").text();
	var cc1   = $("select[@name='left'] option[@selected]").text();
	$("select[@name='left'] option[@selected]").each(function(){
		var exist = false;
		var value = $(this).val();
		var text = "";
		$("select[@name='right'] option").each(function(){
			if($(this).val() == value){
				exist = true;
				//break;
			}
		});
		if(exist==false){
			$("<option value='"+value+"'>"+$(this).text()+"</option>").appendTo($("select[@name=right]"));
		}
	}); 
}

function f3(){
	$("select[@name='right'] option[@selected]").each(function(){
		$(this).remove();
	});
}

function submitForm(){
	var selectCourses="";
	$("select[@name='right'] option").each(function(){
		selectCourses += $(this).val()+",";
	});
	$("#selectCourses").val(selectCourses);
	//alert($("#selectCourses").val());
	$("#courses_fom").submit();
}



</script>
</head>

<body onload="getNativeSpecialtysNumberByJSON();getGradesByJSON();getYearAndTermByJSON();">
<div class="MainDiv">

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
	
     <form id="fom" action="NativeCourses_addNativeCourse" method="post">
 	<tr>
      <td>
       
	    <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	          <table width="88%" align="center" cellpadding="0" cellspacing="0">
				 <tr>
				  <td nowrap="nowrap" align="right" width="10%">&nbsp;</td>
			     <td>&nbsp;</td>
				 </tr>
	          	<tr>
			     <td nowrap="nowrap" align="right" width="10%">请选择为哪个专业哪个年级哪个学年学期添加课程：</td>
			     <td>
			       <select id="specialty_id_2" name="standardCourse.courseSpecialtyNumber"  class="regtxt">
						<option>=====请选择专业=====</option>
				   </select>
			       <select id="grade_id" name="grade.gradeNumber" class="regtxt">
						
					</select>
					
			       <select id="year_term" name="yearTerm.ytNumber" class="regtxt2">
						
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" onclick="isEmpty();" value="确定" class="button04"/>
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
            
     <!-- 添加专业 -->
	<s:if test="(#request.standardCourses!=null && #request.standardCourses.size()>0)
	        ||(#request.nativeCourses!=null && #request.nativeCourses.size()>0)">
	<tr>
	<td>
	  <form id="courses_fom" name="fom" action="NativeCourses_confirmAddNativeCourses" method="post">
	  
       <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="1">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="1"    background="../images/bg_showCourses.png">
			<tr>
               <td  class="tablestyle_title" colspan="2">
                <input type="hidden" name="nativeSpecialty.specialtyNumber" value='<s:property value="#request.specialty.specialtyNumber"/>'/>
                <input type="hidden" name="grade.gradeNumber" value='<s:property value="#request.grade.gradeNumber"/>'/>
                <input type="hidden" name="yearTerm.ytNumber" value='<s:property value="#request.yearTerm.ytNumber"/>'/>
                <input type="hidden" name="selectCourses" id="selectCourses" value=''/>
				 为<span style="color:blue">
				 <s:property value="#request.specialty.specialtyName"/></span>&nbsp;专业
				 <span style="color:blue"><s:property value="#request.grade.gradeName"/></span>
				 第<span style="color:blue">
				 <s:property value="#request.term"/>&nbsp;</span>学期添加课程。(注：课程将添加到： 
			   <span style="color:yellow;font-weight: bold;"><s:property value="#request.grade.gradeName"/></span>&nbsp;第
			   <span style="color:yellow;font-weight: bold;"><s:property value="#request.yearTerm.ytName"/></span>
			   课程库中)
			</td>
			</tr>
			<tr>
                <td width="50%">
                <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="6">
                <tr>
                	<td  class="tablestyle_title">
                	<div align="center" style="font-size: 14px; font-weight: bold;">本地课程列表</div> 
                	</td>
                	<td  class="tablestyle_title">
                	<div align="center" style="font-size: 14px; font-weight: bold;">
                	<input type="button" class="button05" value="确定添加所选课程" onclick="submitForm();"/></div>
                	</td>
                	<td  class="tablestyle_title">
                	<div align="center" style="font-size: 14px; font-weight: bold;">本地课程列表</div> 
                	</td>
                </tr>
                <tr>
                	<td>
                	<div align="center">
						<select id="left" name="left"  class="regtxt3" multiple="multiple" >
					      	<option disabled="disabled">专业课：</option>
					      	<s:iterator value="#request.standardCourses" status="st">
					      		<option value="${courseNumber }">${courseName }</option>
					      	</s:iterator>
					      	<option></option>
					        <option disabled="disabled" value="000000">公共课：</option>
				      </select>
                    </div>
                    </td>
                	<td width="200px">
                	<div align="right" style="font-weight:bold; height: 100%;" ><br/><br/>
                        <input style="border: 0px; background-image: url('../images/del.png'); cursor:pointer; 
                               width:32px; height:32px;" type="button" value="" onclick="f3();"/>
                               <br/><br/>
                        <img alt="添加" src="../images/button_jiantou.png" style="cursor:pointer;"  onclick="f2();">
                    </div>
                   
                    </td>
                	<td>
                	<div style="font-weight:bold;">
						<select id="right" name="right" multiple="multiple" class="regtxt3">
					        <option disabled="disabled"><span style="font-style: italic;">专业课：</span></option>
        					<s:iterator value="#request.nativeCourses" status="st">
				                <option value="${courseNumber }" disabled="disabled">${courseName }</option>
			                </s:iterator>
				      </select>
                    </div>
                    </td>
                </tr>
               
                </table>
             	</td>
             	<td width="50%">
             	<table class="TableLight"  height="100%" width="100%" border="0" cellpadding="6" cellspacing="1">
               <tr>
               <td  class="tablestyle_title" colspan="6">参考数据：
				 <span style="color:blue"><s:property value="#request.previousGrade.gradeName"/></span>
				 第<span style="color:blue">&nbsp;<s:property value="#request.term"/></span>&nbsp;学期课程安排
			</td>
			</tr>
               <tr>
				<td rowspan="2"  width="16%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">任课教师</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;时</div></td>
				<td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">周学时</div></td>
			   </tr>
		       <tr>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
               
                <s:iterator value="#request.previousGradeCourses" status="st">
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
         </form>
         </td>
     
          </tr>
            </s:if>
         <%--
            <s:else>
             	<tr>
               <td>
          <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	          <table width="88%" align="center" cellpadding="0" cellspacing="0">
			<tr>
               <td class="tablestyle_title">
       	    <div style="font-size:18px">暂无数据！请在上面正确地选择 系别 专业 学期 等信息！</div>
       	 </td>
       	 </tr>
       	 </table>
       	 </td>
       	 </tr>
       	 </table>
       	 </td>
       	 </tr>
		</s:else>
		
		
--%>
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

</div>
</body>
</html>