<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
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
	          	<%--<tr>
			     <td nowrap="nowrap" align="right" width="10%">请从拟开设课程中选择要添加的课程：</td>
			     <td>
			        <select id="specialty_id_2" name="standardCourse.courseSpecialtyNumber"  class="regtxt"
			        onchange="checkIsOpenCource_2();">
						<option>=====请选择专业=====</option>
					</select>
					
					 <select id="term_id" name="standardCourse.courseTerm" class="regtxt2">
						<option>======请选择学期======</option>
						<option value="1">=====第一学期课程=====</option>
						<option value="2">=====第二学期课程=====</option>
						<option value="3">=====第三学期课程=====</option>
						<option value="4">=====第四学期课程=====</option>
						<option value="5">=====第五学期课程=====</option>
						<option value="6">=====第六学期课程=====</option>
						<option value="7">=====第七学期课程=====</option>
						<option value="8">=====第八学期课程=====</option>
					</select>
		        </td>
				 </tr>
				 --%>
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
	
	<tr>
	<td>
	  <form id="courses_fom" name="fom" action="NativeCourses_confirmAddNativeCourses" method="post">
       <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
          <s:if test="#request.standardCourses!=null && #request.standardCourses.size()!=0">
			<tr>
               <td  colspan="15" >
                <input type="hidden" name="grade.gradeNumber" value='<s:property value="#request.grade.gradeNumber"/>'/>
                <input type="hidden" name="yearTerm.ytNumber" value='<s:property value="#request.yearTerm.ytNumber"/>'/>
			   <input type="button" class="button" value="添加所选课程" onclick="isChecked();"/>
			   	添加课程到： 
			   <span style="color:yellow;font-weight: bold;">
			   <s:property value="#request.grade.gradeName"/>&nbsp; 
			   <s:property value="#request.yearTerm.ytName"/>
			   </span> 
			   课程库中
			</td>
			</tr>
			<tr>
               <td  colspan="15"  class="tablestyle_title">
                	<span style="font-size:14px; font-weight:bold">
				 <span style="color:blue">
				 <s:property value="#request.standardCourses[0].courseSpecialty"/></span>&nbsp;专业第<span style="color:blue">
				 <s:property value="#request.standardCourses[0].courseTerm"/>&nbsp;</span>学期所有拟开课程列表:</span>
                 	</td>
               </tr>
              <tr>
                <td>
                <table  class="TableLight" width="100%" border="0" cellpadding="2" cellspacing="1">
               <tr>
                <td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">选择课程</div>
                <div align="center"><a href="#" onclick="selectAll();"><span style="font-weight:bold; color:blue">全选</span></a>-<a href="#" onclick="unselectAll();"><span style="font-weight:bold; color:blue">反选</span></a></div></td>
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
                <s:if test="courseAddToNativeSign!=null && courseAddToNativeSign.trim()==1">
                <tr  bgcolor="#FF9999">
                  <td><div align="center" style="color:red; font-weight:bold">此课程已添加</div></td>
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
               </s:if>
                <s:else>
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
                  <td><div align="center">${courseSpecialty}</div></td>
                  <td><div align="center">${courseExplain}</div></td>
                </tr>
                </s:else>    
                </s:iterator>
                
                </table>
             	</td>
             	</tr>
             	</s:if>
           </table>
             </td>
             </tr>
             </table>
             </form>
             </td>
             </tr>
            
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
            </table>
            
            </td>
        </tr>
        
      </table>
      </form>
    
       </td>
        </tr>
      </table>

</div>
</body>
</html>