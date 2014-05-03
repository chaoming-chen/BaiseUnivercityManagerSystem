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
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

function getNativeSpecialtysByJSON(){
	$.getJSON("NativeSpecialtys_getNativeSpecialtysByJSON", "", function(data){
	$("#specialty_id option").remove();
	$("#specialty_id").append("<option>===请选择所属专业===</option>");
	$.each(data,function(i){ 
	     	$("#specialty_id").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
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

function showEmployeesTab(sign){
	if(sign=="1")
		$("#employees_tab").hide();
	else
		$("#employees_tab").show();
}

function isEmpty(){
	if(document.getElementById('specialty_id').value==''){
		alert("请选择查询条件");
		return false;
	}else{
		document.getElementById('classes_fom').submit();
		return true;
	}
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
		alert("请选择班级!");
	}
}
</script>
</head>

<body onload="getNativeSpecialtysByJSON();getYearAndTermByJSON();">

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
        <hr>
        </td>
        </tr>
        </table>
        </td>
        </tr>
        </table>
        </td>
      </tr>
     <s:if test="#request.selectedClass!=null">
     	 <tr>
          <td>
          <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td class="tablestyle_title2">
            	给班级<span style="color:blue;">&nbsp;<s:property value="#request.selectedClass.className"/>&nbsp;</span>分配课程&nbsp;
            	请在下面选择课程，分配给班级:&nbsp;<span style="color:blue;"><s:property value="#request.selectedClass.className"/>&nbsp;</span>
            </td>
            </tr>
            </table>
            </td>
            </tr>
            </table>
            </td>
            </tr>
     </s:if>
     <s:elseif test="#request.classes!=null">
     <!-- 班级查询 -->
     <form id="classes_fom" action="NativeCourses_selectClassAndClassCourses" method="post">
     <tr>
      <td>
	    <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	         <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0">
          	<tr>
          		<td><input type="button" value="返回" class="button04" onclick="window.history.go(-1);"/></td>
		     <td nowrap="nowrap" align="right" width="10%">班级查询：</td>
		     <td>
		       <select id="specialty_id" name="classes.nativeSpecialtys.sid" class="regtxt">
					<option>===请选择所属专业===</option>
				</select>
				 <input type="button" onclick="isEmpty();" value="查询" class="button04"/>
	          	</td>
			 </tr>
		  </table>
		</td>
		</tr>
	</table>
	</td>
	</tr>
	</form>
 <!-- 班级列表 -->
	 <tr>
    <td>
    <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
 <form id="my_fom" action="NativeCourses_selectClassAndClassCourses" method="post">
          <table  width="88%" align="center" cellpadding="0" cellspacing="0"  class="CContent">
			 <tr>
               <td height="20" colspan="19" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
              	<input type="button" name="button" value="确定选择" onclick="isChecked()" class="button09"/>&nbsp;&nbsp;
              	请在下面选择班级
              	 <span>
                <s:if test="#request.classesNativeSpecialty!=null">
               	<s:if test="#request.classes.size()!=0">
               		<input type="button" value="下载班级列表" class="button10" onclick="outputClassesByExcel();"/>
               		<s:property value="#request.classes[0].nativeSpecialtys.specialtyName"/> 专业
               	</s:if>
               </s:if>
               <s:else>所有</s:else>
				班级列表
                </span>
                 </td>
               </tr>
              <tr>
              <tr>
                <td height="40" class="font42">
                <table  class="TableLight"  id="classes_tab" width="100%" cellpadding="4" cellspacing="1">
                  <tr class="title_">
                    <td width="5%" align="center" bgcolor="#EEEEEE">选择班级</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">班级名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所属专业</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">操&nbsp;&nbsp;作</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">班级编号</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">辅导员</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">联系电话</td>
                  </tr>
                  <s:iterator value="#request.classes">
                  <tr id="tr_${classId}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center"><input type="radio" name="classId" value="${classId}"/></div></td>
                    <td><div align="center">${className}</div></td>
                    <td><div align="center"><s:property value="nativeSpecialtys.specialtyName"/> </div></td>
                     <td>
                     <div align="center">
                     	<input value="详情" type="button" class="button04" onclick="javaScript:location.href='Classs_showClass?classes.classId=${classId}'">&nbsp;&nbsp;
                     	<input value="已选课程" type="button" class="button09" onclick="javaScript:location.href='NativeCourses_listClassSelectedCourses?classes.classId=${classId}'">
                     </div>
                     </td>
                    <td><div align="center">${classNumber}</div></td>
                    <td><div align="center">${classTeacher}</div></td>
                    <td><div align="center">${classPhone}</div></td>
                  </tr>
                  </s:iterator>
               </table>
             
            </table>
           </form>
            </td>
        </tr>
      </table>
      </td>
      </tr>
     </s:elseif>
<!-- 本地课程 --> 
	<s:if test="#request.nativeCourses!=null && #request.nativeCourses.size()!=0 
            	 ||#request.classSelectedNativeCourses!=null && #request.classSelectedNativeCourses.size()!=0">
	<tr>
     <td>
      <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	<form  id="my_fom" action="NativeCourses_confirmClassSelectCourses">
	   <table width="88%" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="15"  class="tablestyle_title">
	              <input type="hidden" name="classes.classId" value="<s:property value='#request.selectedClass.classId'/>"/> 
	              <input type="button" value="确定分配" class="button09" onclick="isChecked()"/>&nbsp;&nbsp;
			 <span style="color:blue">
			 <s:if test="#request.nativeCourses!=null && #request.nativeCourses.size()!=0">
			    <s:property value="#request.nativeCourses[0].courseSpecialty"/>
			 </s:if>
			 <s:elseif test="#request.classSelectedNativeCourses!=null && #request.classSelectedNativeCourses.size()!=0">
			    <s:property value="#request.classSelectedNativeCourses[0].courseSpecialty"/>
			 </s:elseif>
			 </span>专业
			 <span style="color:blue">
			  <s:if test="#request.nativeCourses!=null && #request.nativeCourses.size()!=0">
			    <s:property value="#request.nativeCourses[0].courseGrade"/>
			 </s:if>
			 <s:elseif test="#request.classSelectedNativeCourses!=null && #request.classSelectedNativeCourses.size()!=0">
			    <s:property value="#request.classSelectedNativeCourses[0].courseGrade"/>
			 </s:elseif>
			 </span>
			 第<span style="color:blue">
			  <s:if test="#request.nativeCourses!=null && #request.nativeCourses.size()!=0">
			    <s:property value="#request.nativeCourses[0].courseTerm"/>
			 </s:if>
			 <s:elseif test="#request.classSelectedNativeCourses!=null && #request.classSelectedNativeCourses.size()!=0">
			    <s:property value="#request.classSelectedNativeCourses[0].courseTerm"/>
			 </s:elseif>
			 </span>
			 已开设课程列表
          	  </td>
            	</tr>
                <tr>
                <td>
          <table width="100%"  class="TableLight" border="0" cellpadding="2" cellspacing="1">
               <tr>
               	<td rowspan="2"  width="4%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">分配课程</div></td>
				<td rowspan="2"  width="16%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">任课教师</div></td>
				<td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">已开课班级数</div></td>
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
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  <td><div align="center"><input type="checkbox" name="selectCourses" value="${cid}"/></div></td>
                  <td><div align="center">${courseName}</div></td>
                  <td><div align="center"><a href="Employees_listTeacherSelectedCourses?employee.eid=<s:property value="employees.eid"/>"><s:property value="employees.employeeName"/></a>  </div></td>
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
                
               </s:iterator>
                <s:iterator value="#request.classSelectedNativeCourses" status="st">
                <tr  bgcolor="#FF9999">
                  <td><div align="center">已分配</div></td>
                  <td><div align="center">${courseName}</div></td>
                  <td><div align="center"><a href="Employees_listTeacherSelectedCourses?employee.eid=<s:property value="employees.eid"/>"><s:property value="employees.employeeName"/></a>  </div></td>
                  <td><div align="center"><s:property value="classes.size()"/></div></td>
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
        
<!-- 统计 -->
  </s:if>
      </table>
</body>
</html>