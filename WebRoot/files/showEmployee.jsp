<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>显示员工详细信息----百色学院教务管理系统</title>
<style type="text/css">

</style>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>


<body>
<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
    <td height="30">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" background="../images/nav04.gif">
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
        <input onclick="window.history.go(-1)" type="button" class="button" value="返回">
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
          <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
	         
              <tr>
                <td height="40" class="font42">
                
                <table class="TableLight" width="100%" border="0" cellpadding="4" cellspacing="1">

				  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="color='blue'">${requestScope.employee.employeeName}</span> 详细信息
				    </td>
                  </tr>
                  <tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">编号:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeNumber}</td>
                    </tr>
					<tr>
					    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">姓名:</td>
	                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeName}</td>
                    </tr>
					<tr>
					    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">性别:</td>
	                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeSex}</td>
                    </tr>
                  <tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">出生日期:</td>
                    <td bgcolor="#FFFFFF"><s:date name="employee.employeeBirthday" format="yyyy-MM-dd"/></td>
                    </tr>
					<tr>
				       <td width="20%" height="20" align="right" bgcolor="#FFFFFF">籍贯:</td>
                       <td bgcolor="#FFFFFF">${requestScope.employee.employeeBirthplace}</td>
                    </tr>
                  <tr>
				   <td width="20%" height="20" align="right" bgcolor="#FFFFFF">所学专业:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeSpecialty}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">研究方向:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeSkill}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">学历:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeEducationBackground}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">学位:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeDegree}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">职称:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeProfessionalTitle}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">所在系:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.systems.systemName}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">科室:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeOffice}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">参加工作时间:</td>
                   <td bgcolor="#FFFFFF"><s:date name="employee.employeeWorkDate" format="yyyy-MM-dd"/></td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">身份:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeRole}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">行政职务:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeJob}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">电话:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeePhone}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">QQ:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeQq}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">邮箱:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeEmail}</td>
                    </tr>
					<tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">备注:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeExplain}</td>
                    </tr>
                    <tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">工作简历:</td>
                    <td bgcolor="#FFFFFF">${requestScope.employee.employeeResume}</td>
                    </tr>
                  
                </table></td>
              </tr>
            </table>
            </td>
        </tr>
      </table>
      </td>
  </tr>
</table>
</form>
</body>
</html>