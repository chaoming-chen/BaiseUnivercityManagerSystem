<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>编辑部门----百色学院教务管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">

function link(){
	alert('保存成功！');
    document.getElementById("fom").action="Departments_modifyDepartment";
    document.getElementById("fom").submit();
    //location.href = "Departments_listDepartments";
}
</script>
</head>

<body>

<form action="Departments_modifyDepartment" method="post" name="fom" id="fom">

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
          <table width="88%" border="0" align="center" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >部门编辑页面</th>
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
				<legend>编辑部门 <span style="color='blue'">${department.departmentName}</span>----带有&nbsp; <span style="color='red'">*</span>&nbsp;项为必填项</legend>
					  <table border="0" cellpadding="2" cellspacing="2" style="width:100%">
					 
					  <tr>
					  
					    <td nowrap="nowrap" align="right" width="20%">	
					    <input type="hidden" name="department.did" value="${requestScope.department.did}"/>
					    	部门编号:</td>
					    <td width="79%"><input name="department.departmentNumber"  readonly="readonly" value="${requestScope.department.departmentNumber}" class="text" style="width:280px" type="text" size="50" />
				          <span style="color:red">*</span><span style="color:yellow">&nbsp;&nbsp;注:&nbsp;编号不能修改</span>
				        </td>
					  </tr>
					  <tr>
					     <td nowrap="nowrap" align="right" width="20%">部门名称:</td>
					     <td width="79%"><input name="department.departmentName"  value="${requestScope.department.departmentName}"  class="text" style="width:280px" type="text" size="50" />
				         <span style="color:red">*</span>
				        </td>
					  </tr>
					   <tr>
					    <td nowrap="nowrap" align="right" width="20%">部门性质:</td>
					    <td width="79%">
						    <select name="department.departmentCategory"  style="width='90px'" >
	                          <option selected="selected">${requestScope.department.departmentCategory}</option>
	                          <option>行政部门</option>
	                          <option>教育部门</option>
	                        </select>
	                         <span style="color:red">*</span>
	                    </td>
					  </tr>
					  
					  <tr>
					    <td nowrap="nowrap" align="right" width="20%">部门电话:</td>
					    <td width="79%"><input name="department.departmentPhone" value="${requestScope.department.departmentPhone}"  class="text" style="width:280px" type="text" size="50" />
				        &nbsp;&nbsp;<span style="color=blue">&nbsp;&nbsp;填写格式:&nbsp;0776-1234567&nbsp;或者&nbsp;13481696273</span>
				        </td>
					  </tr>
					  
					   <tr>
					    <td nowrap="nowrap" align="right" width="20%">部门邮箱:</td>
					    <td width="79%"><input name="department.departmentEmail"  value="${requestScope.department.departmentEmail}" class="text" style="width:280px" type="text" size="50" />
				        &nbsp;&nbsp;<span style="color=blue">&nbsp;&nbsp;填写格式:&nbsp;baisexueyang@163.com</span>
				        </td>
					  </tr>
					  
					  <tr>
					    <td  nowrap="nowrap" align="right" height="100px">部门说明:</td>
					    <td colspan="3"><textarea id="textarea" name="department.departmentExplain"  rows="5" cols="46">${requestScope.department.departmentExplain}</textarea></td>
					    </tr>
					  </table>
			      
				</fieldset>			
			</td>
		</tr>
		</table>
		</td>
		</tr>
		
		 </table>
	  </td>
  </tr>
		<tr>
			<td  nowrap="nowrap" align="center">
			<input type="submit" name="Submit" value="保存" class="button"/>　
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		 </td>
		</tr>
  
  </table>

</div>
</form>
</body>
</html>