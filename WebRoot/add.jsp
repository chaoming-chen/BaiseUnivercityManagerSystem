<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Struts2 test</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>插入数据：
<br><br/>
  <s:form action="Users_add" method="post">
<s:textfield name="users.userNumber" value="wang"></s:textfield>
<s:textfield name="users.userPassword" type="password" value="123"></s:textfield>
<s:textfield name="users.userRole" value="1"></s:textfield>
<s:submit></s:submit>
</s:form>

<br><br/>更新数据：
  <s:form action="Users_update" method="post">
<s:textfield name="users.userNumber" value="wang"></s:textfield>
<s:textfield name="users.userPassword" type="password" value="123"></s:textfield>
<s:textfield name="users.userRole" value="1"></s:textfield>
<s:submit></s:submit>
</s:form>
   <s:debug></s:debug>
  </body>
</html>
