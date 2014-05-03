<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>显示系别详细信息----百色学院教务管理系统</title>
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
                
                <table class="TableLight" width="100%" border="0" cellpadding="4" cellspacing="1">

				  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="color='blue'">${requestScope.system.systemName}</span> 详细信息
				    </td>
                  </tr>
                  <tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">系别编号:</td>
                    <td bgcolor="#FFFFFF">${requestScope.system.systemNumber}</td>
                    </tr>
					<tr>
					    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">系别名称:</td>
	                    <td bgcolor="#FFFFFF">${requestScope.system.systemName}</td>
                    </tr>
					<tr>
					    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">系别简称:</td>
	                    <td bgcolor="#FFFFFF">${requestScope.system.systemSimple}</td>
                    </tr>
                
					<tr>
				       <td width="20%" height="20" align="right" bgcolor="#FFFFFF">系别电话:</td>
                       <td bgcolor="#FFFFFF">${requestScope.system.systemPhone}</td>
                    </tr>
                  <tr>
				   <td width="20%" height="20" align="right" bgcolor="#FFFFFF">系别邮箱:</td>
                    <td bgcolor="#FFFFFF">${requestScope.system.systemEmail}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">系别备注:</td>
                    <td bgcolor="#FFFFFF">${requestScope.system.systemExplain}</td>
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