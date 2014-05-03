<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>inner2</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function Ok(){
	//alert("自动提交");
	//模拟向服务端POST
	//document.getElementById("form1").submit();
	return true;
}
function getData(){
	$.getJSON("NativeCourses_popTeacherSelectedCourses","employee_id=<%=request.getParameter("employee_id")%>", function(data){
		$("#teacherName").append(data[0]["courseTeacherName"]);
		$.each(data,function(i){ 
 	     	$("#teacherCourses").append("<tr><td bgcolor='#FFFFFF'>"+data[i]["courseName"]+"</td><td bgcolor='#FFFFFF'>"+data[i]["courseClassName"]+"</td> </tr>");
		});
	});
	return true;
}

</script>
</head>

<body style="margin:0px;padding:0px;" onload="getData();">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
       <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td>
        <table width="98%" align="center" cellpadding="0" cellspacing="0">
			<tr>
               <td height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                教师&nbsp;<span id="teacherName" style="color:blue"></span>&nbsp;已任课程如下</td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table id="teacherCourses" class="TableLight"  width="100%" border="0" cellpadding="6" cellspacing="1">
               <tr>
				<td width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">开课班级</div></td>
			   </tr>
               
                </table>
     	  </table>
     	 </td>
     	 </tr>
     	 </table>
     	</td>
     </tr>
</table>

</body>
</html>
