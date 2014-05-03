<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>编辑系别----百色学院教务管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />

</head>

<body>

<form action="Systems_modifySystem" method="post" name="fom" id="fom">
  
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
      <th class="tablestyle_title" >系别更新页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr>
		<td align="left">
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		</td>
		</tr>

		<tr>
			<td width="100%">
				<fieldset >
				<legend>更新&nbsp;<span style="color='blue'">${requestScope.system.systemName }</span>&nbsp;----带有&nbsp;<span style="color='red'">*</span>&nbsp;项为必填项</legend>
					  <table border="0" cellpadding="2" cellspacing="2" style="width:100%">
					  <tr>
					    <td nowrap="nowrap" align="right" width="20%">
					    <input type="hidden" name="system.sid" value="${requestScope.system.sid}"/>
					    系别编号:</td>
					    <td width="79%"><input name="system.systemNumber" readonly="readonly" value="${requestScope.system.systemNumber }" class="text" style="width:280px" type="text" size="50" />
				         <span style="color:red">*</span><span style="color:yellow">&nbsp;&nbsp;注:&nbsp;编号不能修改</span>
				        </td>
					  </tr>
					  <tr>
					     <td nowrap="nowrap" align="right" width="20%">系别名称:</td>
					     <td width="79%"><input name="system.systemName" value="${requestScope.system.systemName }"  class="text" style="width:280px" type="text" size="50" />
				          <span style="color:red">*</span>
				        </td>
					  </tr>
				
					  
					  <tr>
					    <td nowrap="nowrap" align="right" width="20%">系别简称:</td>
					    <td width="79%"><input name="system.systemSimple" value="${requestScope.system.systemSimple }"  class="text" style="width:280px" type="text" size="50" />
				        </td>
					  </tr>
					  <tr>
					    <td nowrap="nowrap" align="right" width="20%">系别电话:</td>
					    <td width="79%"><input name="system.systemPhone" value="${requestScope.system.systemPhone }"  class="text" style="width:280px" type="text" size="50" />
				        &nbsp;&nbsp;<span style="color=blue">&nbsp;&nbsp;填写格式:&nbsp;0776-1234567&nbsp;或者&nbsp;13481696273</span>
				        </td>
					  </tr>
					  
					   <tr>
					    <td nowrap="nowrap" align="right" width="20%">系别邮箱:</td>
					    <td width="79%"><input name="system.systemEmail" value="${requestScope.system.systemEmail }"  class="text" style="width:280px" type="text" size="50" />
				        &nbsp;&nbsp;<span style="color=blue">&nbsp;&nbsp;填写格式:&nbsp;baisexueyang@163.com</span>
				        </td>
					  </tr>
					  
					  <tr>
					    <td  nowrap="nowrap" align="right" height="100px">系别备注:</td>
					    <td colspan="3">
					    <textarea id="textarea" name="system.systemExplain" rows="5" cols="46">${requestScope.system.systemExplain}</textarea>
					    </td>
					    </tr><%--
					    <tr>
					    <td>
					    <s:property value="requestScope.system.studentses.sid"/>
					   
					    	<input type="hidden" name="system.nativeSpecialtyses.sid" value="${requestScope.system.nativeSpecialtyses}" />
					    	<input type="hidden" name="system.studentses.sid" value="${requestScope.system.studentses}" />
					    	<input type="hidden" name="system.users.uid" value="${requestScope.system.userses}" />
					    	<input type="hidden" name="system.employeeses.eid" value="${requestScope.system.employeeses}" />
					    	<input type="hidden" name="system.classeses.cid" value="${requestScope.system.classeses}" />
					    </td>
					    </tr>
					  --%></table>
			      
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