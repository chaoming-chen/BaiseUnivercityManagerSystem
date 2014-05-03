<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>更新班级----百色学院教务管理系统</title>
<link rel="stylesheet"  href="../css/style.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

function getNativeSpecialtysByJSON(){
   	$.getJSON("NativeSpecialtys_getNativeSpecialtysByJSON", "", function(data){
		//$("#specialty_id option").remove();
		//$("#specialty_id").append("<option>===请选择所属专业===</option>");
		$.each(data,function(i){ 
  	     	$("#specialty_id").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
	});
}

function getGradesByJSON(){
	$.getJSON("Grade_getGradesByJSON", "", function(data){
	//$("#classGrade_id option").remove();
	//$("#classGrade_id").append("<option>=====请选择年级=====</option>");
	$.each(data,function(i){
     	$("#classGrade_id").append("<option value="+data[i]['gradeNumber']+">" + data[i]['gradeName'] + "</option>");
	});
});
}

function isEmpty(){
	if(document.getElementById('number').value==''){
	   alert('班级编号不能为空');
	   document.getElementById('number').focus();
	   return false;
	}else if(document.getElementById('name').value==''){
	   alert('班级名称不能为空');
	   document.getElementById('name').focus();
	   return false;
	}else if(document.getElementById('classGrade_id').value==''){
	   alert('年级不能为空');
	   document.getElementById('classGrade_id').focus();
	   return false;
	}else if(document.getElementById('specialty_id').value==''){
		alert('专业名称不能为空');
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}

</script>
</head>

<body onload="getNativeSpecialtysByJSON();getGradesByJSON();">

<form action="Classs_modifyClass"  method="post" name="fom" id="fom">
  
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
      <th class="tablestyle_title" >班级更新页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr>
			<td width="100%">
				<fieldset >
				<legend>更新班级 <span style="color='blue'">${requestScope.class.className}</span>----带有&nbsp;<span style="color='red'">*</span>&nbsp;项为必填项</legend>
					  <table border="0" cellpadding="2" cellspacing="2" style="width:100%">
					 
					  <tr>
					    <td nowrap="nowrap" align="right" width="20%">
					    <input type="hidden" name="classes.classId" value="${requestScope.class.classId}"/>
					    班级编号:</td>
					    <td width="79%"><input name="classes.classNumber" readonly="readonly" value="${requestScope.class.classNumber}" class="text" style="width:280px" type="text" size="50" />
				         <span style="color:red">*</span><span style="color:yellow">&nbsp;&nbsp;注:&nbsp;编号不能修改</span>
				        </td>
					  </tr>
					  <tr>
					     <td nowrap="nowrap" align="right" width="20%">班级名称:</td>
					     <td width="79%"><input name="classes.className" value="${requestScope.class.className}"  class="text" style="width:280px" type="text" size="50" />
				          <span style="color:red">*</span>
				        </td>
					  </tr>
					  <tr>
					     <td nowrap="nowrap" align="right" width="20%">年级:</td>
					     <td width="79%">
							 <select id="classGrade_id" name="classes.classGradeNumber" class="regtxt">
								<option selected="selected" value="${requestScopse.class.classGradeNumber}">${requestScope.class.classGrade }</option>
							</select>
							 <span style="color:red">*</span>
				        </td>
				        </td>
					  </tr>
					  <tr>
					     <td nowrap="nowrap" align="right" width="20%">所属专业:</td>
					     <td width="79%">
					      <select id="specialty_id" name="classes.nativeSpecialtys.sid"  class="regtxt">
							<option selected="selected" value="${requestScope.class.nativeSpecialtys.sid}">${requestScope.class.nativeSpecialtys.specialtyName}</option>
						</select>
							 <span style="color:red">*</span>
				        </td>
					  </tr>
					  <tr>
					     <td nowrap="nowrap" align="right" width="20%">辅导员:</td>
					     <td width="79%"><input name="classes.classTeacher"value="${requestScope.class.classTeacher}"  class="text" style="width:280px" type="text" size="50" />
				        </td>
					  </tr>
					  
					  <tr>
					    <td nowrap="nowrap" align="right" width="20%">联系电话:</td>
					    <td width="79%"><input name="classes.classPhone" value="${requestScope.class.classPhone}"  class="text" style="width:280px" type="text" size="50" />
				        &nbsp;&nbsp;<span style="color=blue">&nbsp;&nbsp;填写格式:&nbsp;0776-1234567&nbsp;或者&nbsp;13481696273</span>
				        </td>
					  </tr>
					  
					   <tr>
					    <td nowrap="nowrap" align="right" width="20%">Email:</td>
					    <td width="79%"><input name="classes.classEmail" value="${requestScope.class.classEmail}" class="text" style="width:280px" type="text" size="50" />
				        &nbsp;&nbsp;<span style="color=blue">&nbsp;&nbsp;填写格式:&nbsp;baisexueyang@163.com</span>
				        </td>
					  </tr>
					  
					   <tr>
					    <td nowrap="nowrap" align="right" width="20%"> QQ:</td>
					    <td width="79%"><input name="classes.classQq" value="${requestScope.class.classQq}" class="text" style="width:280px" type="text" size="50" />
				        </td>
					  </tr>
					  <tr>
					    <td  nowrap="nowrap" align="right" height="100px">班级备注:</td>
					    <td colspan="3">
					    <textarea id="textarea" name="classes.classExplain" rows="5" cols="46">${requestScope.class.classExplain}</textarea>
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