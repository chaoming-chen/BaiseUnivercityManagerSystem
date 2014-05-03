<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function getSystemsByJSON(){
   		$.getJSON("Systems_getSystemsByJSON", "", function(data){
		$("#system_id option").remove();
		$.each(data,function(i){ 
			$("#system_id").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
		
	});
}
</script>
</head>


<body onload="getSystemsByJSON();">

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
  
<!-- 教师信息页面 -->
	<form id="fom" action="Employees_selectEmployees" method="post">
	<tr>
	<td>
	
	<table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
        
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0">
          	<tr>
          	<td><input type="button" value="返回" onclick="window.history.go(-1)" class="button04"/></td>
			 <td nowrap="nowrap" align="right">教师查询：</td>
				<td>
		    	<select id="system_id" class="regtxt2" name="employee.systems.sid">
				</select>
	        	<input type="submit" value="查询" class="button04"/>　
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
      <form action="NativeCourses_listNativeCourses?sign='1'" method="post">
	    <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	          <table width="88%" align="center" cellpadding="0" cellspacing="0"  class="CContent">
			<tr>
               <td height="20" colspan="19" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
						<input type="hidden" name="nativeCourse.courseSpecialty" value="<s:property value="#request.nativeCourses[0].courseSpecialty"/>" />  
              	<input type="submit" name="button" value="确定选择" class="button09"/>&nbsp;&nbsp;请在下面选择教师
                 </td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  class="TableLight" width="100%" border="0" cellpadding="2" cellspacing="1" >
                  <tr>
                  	<td width="6%" align="center" bgcolor="#EEEEEE">选择教师</td>
                    <td width="8%" align="center" bgcolor="#EEEEEE">姓名</td>
                    <td width="4%" align="center" bgcolor="#EEEEEE">性别</td>
                    <td width="12%" align="center" bgcolor="#EEEEEE">所学专业</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">研究方向</td>
                    <td width="8%" align="center" bgcolor="#EEEEEE">学历</td>
                    <td width="8%" align="center" bgcolor="#EEEEEE">职称</td>
                    <td width="14%" align="center" bgcolor="#EEEEEE">所在系</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">电话</td>
                    <td align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <s:iterator value="#request.employees">
                  <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  	<td><div align="center">
                  	<input type="radio" name="employee.eid" value="${eid}"/>
                  	</div></td>
                    <td><div align="center">${employeeName}</div></td>
                    <td><div align="center">${employeeSex}</div></td>
                    <td><div align="center">${employeeSpecialty}</div></td>
                    <td><div align="center">${employeeSkill}</div></td>
                    <td><div align="center">${employeeEducationBackground}</div></td>
                    <td><div align="center">${employeeProfessionalTitle}</div></td>
                    <td><div align="center">${systems.systemName}</div></td>
                    <td><div align="center">${employeePhone}</div></td>
                     <td>
                     <div align="center">
                     <input value="详情" type="button" class="button04" onclick="javaScript:location.href='Employees_showEmployee?employee.eid=${eid}'">
                     <input value="已任课程" type="button" class="button09" onclick="javaScript:location.href='NativeCourses_listTeacherSelectedCourses?employee.eid=${eid}'">
                     </div>
                     </td>
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
</table>
</body>
</html>