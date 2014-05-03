<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <base href="<%=basePath%>">   
<title>首页----百色学院教务管理系统</title>
</head>

<frameset rows="59,*" cols="*" frameborder="no" border="0" framespacing="0" >
  <frame src="files/top.html" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="168,*"  frameborder="no" border="0" framespacing="0">
    <frame src="files/left.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="files/mainfra.html" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
