<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加部门----百色学院教务管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<script type="text/javascript">
function isEmpty(){
	if(document.getElementById('number').value==''){
	   alert('部门编号不能为空');
	   document.getElementById('number').focus();
	   return false;
	}else if(document.getElementById('name').value==''){
	   alert('部门名称不能为空');
	   document.getElementById('name').focus();
	   return false;
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}
</script>
</head>

<body>

<form action="Departments_saveDepartment" method="post" name="fom" id="fom">
  
<div class="MainDiv">
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
</table>
<table width="88%" border="0" cellpadding="0" cellspacing="0" >
<tr>
	<td>
         <table width="88%" border="0" align="center" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >部门添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">

		<tr>
			<td width="100%">
				<fieldset>
				<legend>添加部门----带有&nbsp;<span style="color='red'">*</span>&nbsp;项为必填项</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap="nowrap" align="right" width="20%">部门编号:</td>
					    <td width="79%"><input id="number" name="department.departmentNumber" class="text" style="width:280px" type="text" size="50" />
				        <span style="color:red">*</span><span style="color:yellow">&nbsp;&nbsp;注:&nbsp;编号不能重复</span>
				        </td>
					  </tr>
					  <tr>
					     <td nowrap="nowrap" align="right" width="20%">部门名称:</td>
					     <td width="79%"><input id="name" name="department.departmentName" class="text" style="width:280px" type="text" size="50" />
				          <span style="color:red">*</span>
				        </td>
					  </tr>
					   <tr>
					    <td nowrap="nowrap" align="right" width="20%">部门性质:</td>
					    <td width="79%">
						    <select name="department.departmentCategory" style="width='90px'">
	                          <option value="无" selected="selected">==请选择==</option>
	                          <option>行政部门</option>
	                          <option>教育部门</option>
	                        </select>
	                         <span style="color:red">*</span>
	                    </td>
					  </tr>
					  
					  <tr>
					    <td nowrap="nowrap" align="right" width="20%">部门电话:</td>
					    <td width="79%"><input name="department.departmentPhone" class="text" style="width:280px" type="text" size="50" />
				        </td>
					  </tr>
					  
					   <tr>
					    <td nowrap="nowrap" align="right" width="20%">部门邮箱:</td>
					    <td width="79%"><input name="department.departmentEmail" class="text" style="width:280px" type="text" size="50" />
				        </td>
					  </tr>
					  
					  <tr>
					    <td  nowrap="nowrap" align="right" height="100px">部门说明:</td>
					    <td colspan="3"><textarea id="textarea" name="department.departmentExplain" rows="5" cols="46"></textarea></td>
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
			<input type="button" name="Submit" value="保存" class="button" onclick="isEmpty()"/>　
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		 </td>
		</tr>
  
  </table>

</div>
</form>
</body>
</html>