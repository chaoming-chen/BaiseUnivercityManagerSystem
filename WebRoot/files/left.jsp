<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>菜单页----百色学院教务管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="百色学院教务管理系统">
	<meta http-equiv="description" content="菜单页">

<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/left.js"></script>
</head>
<!-- color:#3366CC 
	color:#003399
	color:#006699
	color:#3399CC -->
<body bgcolor="#3399CC">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="100%" height="55" background="../images/nav01.gif">
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="../images/ico02.gif" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font02">欢迎使用本系统</td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="Users_logout" target="_top" class="left-font02">安全退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
		<s:if test="#session.user.roles.roleNumber==11">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
							<a href="javascript:" target="mainFrame" class="left-font03" onclick="listModules('${user.uid}')">基础数据管理</a>
						</td>
					</tr>
				</table>
			</td>
          </tr>		  
	      </table>
		 <table id="subtree${user.uid}" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
					cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="30" ><img  src="../images/ico05.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="Departments_listDepartments" target="mainFrame" class="left-font03"><span style="color:#EEEEEE">部门管理</span></a></td>
				</tr>
				<tr>
				  <td width="9%" height="30" ><img  src="../images/ico05.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="Systems_listSystems" target="mainFrame" class="left-font03"><span style="color:#EEEEEE">系别管理</span></a></td>
				</tr>
				
				<tr>
				  <td width="9%" height="30" ><img src="../images/ico05.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="Employees_listEmployees" target="mainFrame" class="left-font03" ><span style="color:#EEEEEE">人事管理</span></a></td>
				</tr>
	      </table>
	      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="12" /></td>
							<td width="92%">
								<a href="uploadStandardExcelFile.jsp" target="mainFrame" class="left-font01">导入公共课</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>		  
	     </table>
	      
      	</s:if>
       <s:elseif test="#session.user.roles.roleNumber==10">
       <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
							<a href="NativeSpecialtys_listNativeSpecialtys" target="mainFrame" class="left-font01">专业管理</a>
						</td>
					</tr>
				</table>
			</td>
          </tr>		  
       </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
								<a href="NativeCourses_listNativeCourses" target="mainFrame" class="left-font01">课程管理</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>		  
	     </table>
	     </s:elseif>
	     <s:elseif test="#session.user.roles.roleNumber=='12'">
	      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
								<a href="Classs_listClasss" target="mainFrame" class="left-font01">班级管理</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>		  
	      </table>
	      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
								<a href="ClassStudents_listClassStudents" target="mainFrame" class="left-font01">班级学生管理</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>		  
	      </table>
	     </s:elseif>
	     <s:elseif test="#session.user.roles.roleNumber=='15'">
	     	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
								<a href="Teachers_listTeacherSelectedCourses" target="mainFrame" class="left-font01">任课记录</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>		  
	      </table>
	     </s:elseif>
	     <s:elseif test="#session.user.roles.roleNumber=='17'">
	     	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
								<a href="StudentMonitors_listOneClassStudents" target="mainFrame" class="left-font01">学生信息</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>		  
	      </table>
	     	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
								<a href="Teachers_listTeacherSelectedCourses" target="mainFrame" class="left-font01">下载课程</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>		  
	      </table>
	     </s:elseif>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
								<a href="modifyPassword.jsp" target="mainFrame" class="left-font01">修改密码</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>		  
	        </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
								<a href="Users_logout" target="_top" class="left-font01">安全退出</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>		  
	        </table>
	  </td>
  </tr>
  
</table>
</body>
</html>
