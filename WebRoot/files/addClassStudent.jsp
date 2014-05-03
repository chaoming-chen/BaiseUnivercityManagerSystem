<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加班级学生----百色学院教务管理系统</title>
<link rel="stylesheet"  href="../css/style.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

function getNativeSpecialtysByJSON(){
   	$.getJSON("NativeSpecialtys_getNativeSpecialtysByJSON", "", function(data){
		$("#specialty_id option").remove();
		$("#specialty_id").append("<option>===请选择所属专业===</option>");
		$.each(data,function(i){ 
  	     	$("#specialty_id").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
	});
}
function getClassesByJSON(){
	var specialty_id = $("#specialty_id").val();
	
   	$.getJSON("Classs_getClassesByJSON", "classes.nativeSpecialtys.sid="+specialty_id, function(data){
		$("#class_id option").remove();
		$("#class_id").append("<option>===请选择所属班级===</option>");
		$.each(data,function(i){ 
  	     	$("#class_id").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
	});
}

function isEmpty(){
	if(document.getElementById('number').value==''){
	   alert('学号不能为空');
	   document.getElementById('number').focus();
	   return false;
	}else if(document.getElementById('name').value==''){
	   alert('姓名不能为空');
	   document.getElementById('name').focus();
	   return false;
	}else if(document.getElementById('specialty_id').value==''){
		alert('专业名称不能为空');
	}else if(document.getElementById('class_id').value==''){
		alert('班级名称不能为空');
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}

</script>
</head>

<body onload="getNativeSpecialtysByJSON();">

<form action="ClassStudents_saveStudent"  method="post" name="fom" id="fom">
  
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
<table width="88%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td>
    <table width="88%" border="0" align="center" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >班级学生添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">

		<tr>
		<td width="100%">
		<fieldset >
		   <legend>添加班级学生----带有&nbsp;<span style="color='red'">*</span>&nbsp;项为必填项</legend>
			  <table border="0" cellpadding="2" cellspacing="2" style="width:100%">
			  <tr>
			    <td nowrap="nowrap" align="right" width="20%">学生学号:</td>
			    <td width="79%"><input id="number"  name="student.studentNumber" class="text" style="width:280px" type="text" size="50" />
		         <span style="color:red">*</span>
		        </td>
			  </tr>
			  <tr>
			     <td nowrap="nowrap" align="right" width="20%">学生姓名:</td>
			     <td width="79%"><input id="name" name="student.studentName" class="text" style="width:280px" type="text" size="50" />
		          <span style="color:red">*</span>
		        </td>
			  </tr>
			    <tr>
			     <td nowrap="nowrap" align="right" width="20%">学生性别:</td>
			     <td width="79%">
					<select name="student.studentSex" class="regtxt">
						<option>男</option>
						<option>女</option>
					</select>  
		        </td>
			  </tr>
			  
	  <tr>
	     <td nowrap="nowrap" align="right" width="20%">所属专业:</td>
	     <td width="79%">
	      <select id="specialty_id" name="student.nativeSpecialtys.sid" class="regtxt" onchange="getClassesByJSON();">
				<option>===请选择所属专业===</option>
			</select>
			 <span style="color:red">*</span>
        </td>
	 </tr>
	  <tr>
	     <td nowrap="nowrap" align="right" width="20%">所属班级:</td>
	     <td width="79%">
	      <select id="class_id" name="student.classes.classId" class="regtxt">
				<option>===请选择所属班级===</option>
			</select>
			 <span style="color:red">*</span>
        </td>
	 </tr>
	
	  <tr>
	    <td nowrap="nowrap" align="right" width="20%">联系电话:</td>
	    <td width="79%"><input name="student.studentPhone" class="text" style="width:280px" type="text" size="50" />
        &nbsp;&nbsp;<span style="color=blue">&nbsp;&nbsp;填写格式:&nbsp;0776-1234567&nbsp;或者&nbsp;13481696273</span>
        </td>
	  </tr>
	  
	   <tr>
	    <td nowrap="nowrap" align="right" width="20%">Email:</td>
	    <td width="79%"><input name="student.studentEmail" class="text" style="width:280px" type="text" size="50" />
        &nbsp;&nbsp;<span style="color=blue">&nbsp;&nbsp;填写格式:&nbsp;baisexueyang@163.com</span>
        </td>
	  </tr>
	  
	   <tr>
	    <td nowrap="nowrap" align="right" width="20%">QQ:</td>
	    <td width="79%"><input name="student.studentQq" class="text" style="width:280px" type="text" size="50" />
        </td>
	  </tr>
			 
	  <tr>
	    <td  nowrap="nowrap" align="right" height="100px">学生备注:</td>
	    <td colspan="3"><textarea id="textarea" name="student.studentExplain" rows="5" cols="46"></textarea></td>
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