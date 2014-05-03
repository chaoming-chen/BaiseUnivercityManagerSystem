<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>成功----百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>


<body>
<form action="../login.jsp" name="fom" id="fom" method="post">
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
 
      <table id="bigTab" width="100%" border="0" cellspacing="6" cellpadding="2">
  <tr>
    <td>
    <table id="subtree1"  width="88%" border="0" cellspacing="2" cellpadding="2">
	
        <tr>
          <td>
          <table  width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
       <s:if test="#request.newAddCourses!=null && #request.newAddCourses.size()!=0"> 
               <tr>
                  <td height="20"  bgcolor="#EEEEEE" class="tablestyle_title"> 
				     <span style="color:blue">添加课程成功！</span> 您刚添加到百色学院本地课程库的课程详细信息：
		         </td>
            </tr>
           <tr>
                <td height="40" class="font42">
                
                <table class="TableLight" id="sepecialtyTab" width="100%" cellpadding="6" cellspacing="1" >
                    <tr>
                    <td width="24%" align="center" bgcolor="#EEEEEE">课程名称</td>
                    <td width="16%" align="center" bgcolor="#EEEEEE">学&nbsp;&nbsp;期</td>
                    <td width="16%" align="center" bgcolor="#EEEEEE">专&nbsp;&nbsp;业</td>
                    <td width="6%" align="center" bgcolor="#EEEEEE">考试考查</td>
                    <td width="20%" align="center" bgcolor="#EEEEEE">开课单位</td>
                    <td align="center" bgcolor="#EEEEEE">备注</td>
                  </tr>
                  <s:iterator value="#request.newAddCourses">
                  <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${courseName}</div></td>
                    <td><div align="center">${courseTerm}</div></td>
                    <td><div align="center">${courseSpecialty}</div></td>
                    <td><div align="center">${courseExam}</div></td>
                    <td><div align="center">${courseOpenDepartment}</div></td>
                    <td><div align="center">${courseExplain}</div></td>
                  </tr>
                  </s:iterator>
                </table>
                </s:if>
                <s:else>
		        <tr>
		          <td colspan="6"  bgcolor="#EEEEEE" > 
					<span style="color:red; font-size: 16px; font-weight: bold"> 添加失败！！！</span>
		         </td>
		        </tr>
			   </s:else>
			    <tr>
			   	<td colspan="6">&nbsp;&nbsp;
			   	</td>
			   	</tr>
			   <tr>
			   	<td colspan="6">
					是否继续添加课程？ &nbsp;&nbsp;
					<input type="button" value="继续添加课程" class="button10" onclick="javaScript:window.location.href='addNativeCourse.jsp'"/>&nbsp;&nbsp;
					<input type="button" value="查看课程" class="button10" onclick="javaScript:window.location.href='NativeCourses_listNativeCourses'"/>
				</td>
			   </tr>
            </table>
            </td>
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