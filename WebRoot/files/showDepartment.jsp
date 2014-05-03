<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>显示部门详细信息----百色学院教务管理系统</title>
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
          
      </tr>
    </table></td>
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
                
                <table class="TableLight" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#6795B4" class="newfont03">

				  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="color='blue'">${requestScope.department.departmentName}</span> 详细信息
				    </td>
                  </tr>
                  <tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">部门编号:</td>
                    <td bgcolor="#FFFFFF">${requestScope.department.departmentNumber}</td>
                    </tr>
					<tr>
					    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">部门名称:</td>
	                    <td bgcolor="#FFFFFF">${requestScope.department.departmentName}</td>
                    </tr>
                  <tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">部门性质:</td>
                    <td bgcolor="#FFFFFF">${requestScope.department.departmentCategory}</td>
                    </tr>
					<tr>
				       <td width="20%" height="20" align="right" bgcolor="#FFFFFF">部门电话:</td>
                       <td bgcolor="#FFFFFF">${requestScope.department.departmentPhone}</td>
                    </tr>
                  <tr>
				   <td width="20%" height="20" align="right" bgcolor="#FFFFFF">部门邮箱:</td>
                    <td bgcolor="#FFFFFF">${requestScope.department.departmentEmail}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">部门说明:</td>
                    <td bgcolor="#FFFFFF">${requestScope.department.departmentExplain}</td>
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