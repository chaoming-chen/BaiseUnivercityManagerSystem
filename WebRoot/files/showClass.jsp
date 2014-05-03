<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>显示班级详细信息----百色学院教务管理系统</title>
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
                <table class="TableLight" width="88%" border="0" cellpadding="4" cellspacing="1">
				  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> 
					<span style="color='blue'">${requestScope.class.className}</span> 详细信息
				    </td>
                  </tr>
                  <tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">班级编号:</td>
                    <td bgcolor="#FFFFFF">${requestScope.class.classNumber}</td>
                    </tr>
					<tr>
					    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">班级名称:</td>
	                    <td bgcolor="#FFFFFF">${requestScope.class.className}</td>
                    </tr>
					<tr>
					    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">年级:</td>
	                    <td bgcolor="#FFFFFF">${requestScope.class.classGrade}</td>
                    </tr>
                  <tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">所属专业:</td>
                    <td bgcolor="#FFFFFF">${requestScope.class.nativeSpecialtys.specialtyName}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">所属系别:</td>
                    <td bgcolor="#FFFFFF">${requestScope.class.systems.systemName}</td>
                    </tr>
                  <tr>
				   <td width="20%" height="20" align="right" bgcolor="#FFFFFF">辅导员:</td>
                    <td bgcolor="#FFFFFF">${requestScope.class.classTeacher}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">联系电话:</td>
                    <td bgcolor="#FFFFFF">${requestScope.class.classPhone}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">Email:</td>
                    <td bgcolor="#FFFFFF">${requestScope.class.classEmail}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">QQ:</td>
                    <td bgcolor="#FFFFFF">${requestScope.class.classQq}</td>
                    </tr>
					<tr>
				    <td width="20%" height="20" align="right" bgcolor="#FFFFFF">班级备注:</td>
                    <td bgcolor="#FFFFFF">${requestScope.class.classExplain}</td>
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