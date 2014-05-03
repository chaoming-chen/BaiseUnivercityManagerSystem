<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>修改密码成功----百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>


<body>
<form action="../login.jsp" name="fom" id="fom" method="post" target="_top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
<tr>
    <td height="30" width="100%">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" width="100%" background="../images/nav04.gif">
        </td>
      </tr>
    </table>
    </td>
  </tr>

  <tr>
    <td width="100%">
    
 	<fieldset>
	   <legend>修改密码</legend><br/>
		  <table border="0" cellpadding="2" cellspacing="2" style="width:100%"  class="CContent">
		 
		  <tr>
		    <td nowrap="nowrap">
		   <s:if test="#request.newPassword!=null">  
		   		  您的新密码是:&nbsp;&nbsp;
		   <span style="color:blue; font-size:28px">${requestScope.newPassword}</span>
		   </s:if>
		   <s:else>
		   <span style="color:red; font-size:28px">修改密码失败！！！</span>
		   </s:else>
		   </td>
		  </tr>
		  <tr>
		  
		     <td nowrap="nowrap">
		    <s:if test="#request.newPassword!=null">    
		           请牢记您的新密码，并用新密码重新登录-->&nbsp;
		      <input type="submit" name="Submit" value="确定" class="button04"/>
		      </s:if>
		      </td>
		      
		  </tr>
		  </table>
      
	</fieldset>	
 
    </td>
  </tr>

</table>
</form>
</body>
</html>