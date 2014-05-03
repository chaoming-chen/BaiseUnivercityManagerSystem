<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>修改密码----百色学院教务管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />

<script type="text/javascript" src="../js/jquery.js"></script>

<script language="JavaScript" type="text/javascript">
function isEmpty(){
	if(document.getElementById('oldPassword').value==''){
	   alert('旧密码不能为空');
	   document.getElementById('oldPassword').focus();
	   return false;
	}else if(document.getElementById('newPassword').value==''){
	   alert('新密码不能为空');
	   document.getElementById('newPassword').focus();
	   return false;
	}else if(document.getElementById('confirmNewPassword').value==''){
	   alert('确认新密码不能为空');
	   document.getElementById('confirmNewPassword').focus();
	   return false;
	}else if(document.getElementById('confirmNewPassword').value!=document.getElementById('newPassword').value){
	   alert('两次输入的新密码不一致');
	   document.getElementById('confirmNewPassword').focus();
	   return false;
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}
</script>

</head>

<body>

<form action="Users_confirmModifyPassword" method="post" name="fom" id="fom">

<div class="MainDiv">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" width="100%">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" width="100%" background="../images/nav04.gif">&nbsp; &nbsp;
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<table width="88%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >修改密码页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
		<td align="left">
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		</td>
		</tr>

		<tr>
			<td width="100%">
				<fieldset>
				<legend>在此修改密码----带有&nbsp; <span style="color='red'">*</span>&nbsp;项为必填项</legend>
					  <table border="0" cellpadding="3" cellspacing="2" style="width:100%"> 
					  <tr>		  
					    <td nowrap="nowrap" align="right" width="20%">旧密码:</td>
					    <td width="79%"><input id="oldPassword" name="userPassword.userOldPassword" class="text" style="width:280px" type="password" size="50" />
					    <span style="color='red'">*</span>
				        </td>
					  </tr>
					  <tr>
					    <td nowrap="nowrap" align="right" width="20%">新密码:</td>
					    <td width="79%"><input id="newPassword" name="userPassword.userNewPassword" class="text" style="width:280px" type="password" size="50" />
					    <span style="color='red'">*</span>
				        </td>
					  </tr>
					  
					   <tr>
					    <td nowrap="nowrap" align="right" width="20%">确认新密码:</td>
					    <td width="79%"><input id="confirmNewPassword" class="text" style="width:280px" type="password" size="50" />
					    <span style="color='red'">*</span>
				        </td>
					  </tr>
					  
					  </table>
			      
				</fieldset>			
			</td>
		</tr>
		</table>
		</td>
		</tr>
		
		 </table>
	
		<tr>
			<td  nowrap="nowrap" align="center">
			<input type="button" name="Submit" value="修改" class="button" onclick="isEmpty()"/>　
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		 </td>
		</tr>
  
  </table>

</div>
</form>
</body>
</html>