<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加员工----百色学院教务管理系统</title>
<link rel="stylesheet"  href="../css/style.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/date.js"></script>
<script type="text/javascript">
function getSystemsByJSON(){
   	$.getJSON("Systems_getSystemsByJSON", "", function(data){
		$.each(data,function(i){ 
  	     	$("#system_id").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
	});
}

function getStandardSubjectsByJSON(){
   	$.getJSON("StandardSpecialtys_getStandardSubjectsByJSON", "", function(data){
		$("#subject_number option").remove();
		$("#subject_number").append("<option>专业大类</option>");
		$.each(data,function(i){ 
  	     	$("#subject_number").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
	});
}

function getStandardClassesByJSON(){
	var subjectNumber = $("#subject_number").val(); 
   	$.getJSON("StandardSpecialtys_getStandardClassesByJSON", "standardSpecialty.specialtySubjectNumber="+subjectNumber, function(data){
		$("#class_number option").remove();
		$("#class_number").append("<option>专业小类</option>");
		$.each(data,function(i){ 
  	     	$("#class_number").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
	});
}
function getStandardSpecialtysByJSON(){
	var classNumber = $("#class_number").val();
   	$.getJSON("StandardSpecialtys_getStandardSpecialtysByJSON", "standardSpecialty.specialtyClassNumber="+classNumber, function(data){
		$("#specialty_number option").remove();
		$("#specialty_number").append("<option>专业名称</option>");
		$.each(data,function(i){ 
  	     	$("#specialty_number").append("<option value="+data[i].specialtyName+">" + data[i].specialtyName + "</option>");
		});
	});
}

function selectSpecialtyName(){
	$("#specialty_name").val($("#specialty_number").val());
}

function showArea(){
	var birthPlace=$("#s_province").val()+'-'+$("#s_city").val()+'-'+$("#s_county").val();
	$("#birth_place").val(birthPlace);
}

function isEmpty(){
	if(document.getElementById('number').value==''){
	   alert('员工编号不能为空');
	   document.getElementById('number').focus();
	   return false;
	}else if(document.getElementById('name').value==''){
	   alert('员工名称不能为空');
	   document.getElementById('name').focus();
	   return false;
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}
</script>
</head>

<body onload="getSystemsByJSON(); getStandardSubjectsByJSON()">

<form action="Employees_modifyEmployee"  method="post" name="fom" id="fom">
  
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
      <th class="tablestyle_title" >更新员工页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">

		<tr>
		<td width="100%">
		<fieldset >
		   <legend>更新员工----带有&nbsp;<span style="color='red'">*</span>&nbsp;项为必填项</legend>
			  <table border="0" cellpadding="2" cellspacing="2" style="width:100%">
		  <tr>
		    <td nowrap="nowrap" align="right" width="20%">
		    <input type="hidden" value="${employee.eid}" name="employee.eid">
		    工号:</td>
		    <td width="79%"><input id="number" readonly="readonly" value="${employee.employeeNumber}" name="employee.employeeNumber" class="text" style="width:280px" type="text" size="50" />
	         <span style="color:red">*</span><span style="color:yellow">&nbsp;&nbsp;注:&nbsp;工号不能修改</span>
	        </td>
		  </tr>
		  <tr>
		     <td nowrap="nowrap" align="right" width="20%">姓名:</td>
		     <td width="79%"><input id="name" value="${employee.employeeName}" name="employee.employeeName" class="text" style="width:280px" type="text" size="50" />
	          <span style="color:red">*</span>
	        </td>
		  </tr>
		  <tr>
		     <td nowrap="nowrap" align="right" width="20%">出生日期:</td>
		     <td width="79%">
		     <input value="<s:date name='employee.employeeBirthday' format='yyyy-MM-dd'/>"  name="employee.employeeBirthday" onfocus="calendar()" class="text" style="width:280px" type="text" size="50" />
	        </td>
		  </tr>
		  <tr>
		     <td nowrap="nowrap" align="right" width="20%">籍贯:</td>
		     <td width="79%">
		      <select id="s_province" name=""></select>&nbsp;&nbsp;&nbsp;&nbsp;
              <select id="s_city" name="" ></select>&nbsp;&nbsp;&nbsp;&nbsp;
    		  <select id="s_county" name="" onchange="showArea()"></select>
    		  <script type="text/javascript" src="../js/area.js"></script>
			  <script type="text/javascript">_init_area();</script>
			  <br/>
			  <input  value="${employee.employeeBirthplace}"  id="birth_place" name="employee.employeeBirthplace" class="text" style="width:280px" type="text" size="50" />
	        </td>
		  </tr>
		    <tr>
		     <td nowrap="nowrap" align="right" width="20%">性别:</td>
		     <td width="79%">
				<select name="employee.employeeSex" class="regtxt">
					<option selected="selected">${employee.employeeSex}</option>
					<option>男</option>
					<option>女</option>
				</select>  
	        </td>
		  </tr>
       <tr>
	    <td nowrap="nowrap" align="right" width="20%">所学专业:</td>
	     <td width="79%">
	     <select id="subject_number" onChange="getStandardClassesByJSON();">
			<option>专业大类</option>
		</select>&nbsp;
		 <select id="class_number" class="regtxt" onchange="getStandardSpecialtysByJSON();">
			<option>专业小类</option>
		</select>&nbsp;
	    <select id="specialty_number" onchange="selectSpecialtyName();">
		   <option>专业名称</option>
	    </select> 
	    <br/>
	    <input id="specialty_name" name="employee.employeeSpecialty" value="${employee.employeeSpecialty}" class="text" style="width:280px" type="text" size="50" />
        </td>
	    </tr>
		<tr>
	     <td nowrap="nowrap" align="right" width="20%">学历:</td>
	     <td width="79%">
	    	<select name="employee.employeeEducationBackground" class="regtxt">
				<option selected="selected">${employee.employeeEducationBackground}</option>
				<option>硕士研究生</option>
				<option>专科</option>
				<option>本科</option>
				<option>博士研究</option>
				<option>无学历</option>
				<option>其它</option>
			</select>
        </td>
	  </tr>
	  	
	  	<tr>
	     <td nowrap="nowrap" align="right" width="20%">学位:</td>
	     <td width="79%">
	    	<select name="employee.employeeDegree" class="regtxt">
				<option selected="selected">${employee.employeeDegree}</option>
				<option>硕士学位</option>
				<option>学士学位</option>
				<option>博士学位</option>
				<option>无学位</option>
				<option>其它</option>
			</select>
        </td>
	  </tr>
	  <tr>
	     <td nowrap="nowrap" align="right" width="20%">职称:</td>
	     <td width="79%">
	    	<select name="employee.employeeProfessionalTitle" class="regtxt">
				<option selected="selected">${employee.employeeProfessionalTitle}</option>
				<option>讲师</option>
				<option>助教</option>
				<option>副教授</option>
				<option>教授</option>
				<option>无职称</option>
				<option>其它</option>
			</select>
        </td>
	  </tr>
	  	
	  <tr>
	     <td nowrap="nowrap" align="right" width="20%">所在系别:</td>
	     <td width="79%">
	    	<select id="system_id" name="employee.systems.sid" class="regtxt">
	    		<option  value="${employee.systems.sid}" selected="selected">${employee.systems.systemName}</option>
			</select>
        </td>
	  </tr>
	   <tr>
	    <td nowrap="nowrap" align="right" width="20%">身份:</td>
	    <td width="79%">
	        <select name="employee.employeeRole" class="regtxt">
				<option selected="selected">${employee.employeeRole}</option>
				<option>教师</option>
				<option>行政人员</option>
				<option>其他</option>
			</select>
        </td>
	  </tr>
	  <tr>
	    <td nowrap="nowrap" align="right" width="20%">研究方向:</td>
	    <td width="79%"><input value="${employee.employeeSkill}"  name="employee.employeeSkill" class="text" style="width:280px" type="text" size="50" />
        </td>
	  </tr>
	  <tr>
	    <td nowrap="nowrap" align="right" width="20%">科室:</td>
	    <td width="79%"><input value="${employee.employeeOffice}"  name="employee.employeeOffice" class="text" style="width:280px" type="text" size="50" />
        </td>
	  </tr>
	  <tr>
	    <td nowrap="nowrap" align="right" width="20%">参加工作时间:</td>
	    <td width="79%"><input value="<s:date name='employee.employeeWorkDate' format='yyyy-MM-dd'/>"  name="employee.employeeWorkDate"  onfocus="calendar()" class="text" style="width:280px" type="text" size="50" />
        </td>
	  </tr>
	 
	  <tr>
	    <td nowrap="nowrap" align="right" width="20%">行政职务:</td>
	    <td width="79%"><input value="${employee.employeeJob}"  name="employee.employeeJob" class="text" style="width:280px" type="text" size="50" />
        </td>
	  </tr>
	  <tr>
	    <td nowrap="nowrap" align="right" width="20%">电话:</td>
	    <td width="79%"><input value="${employee.employeePhone}"  name="employee.employeePhone" class="text" style="width:280px" type="text" size="50" />
        </td>
	  </tr>
	  <tr>
	    <td nowrap="nowrap" align="right" width="20%">QQ:</td>
	    <td width="79%"><input value="${employee.employeeQq}"  name="employee.employeeQq" class="text" style="width:280px" type="text" size="50" />
        </td>
	  </tr>
	  <tr>
	    <td nowrap="nowrap" align="right" width="20%">邮箱:</td>
	    <td width="79%"><input value="${employee.employeeEmail}"  name="employee.employeeEmail" class="text" style="width:280px" type="text" size="50" />
        </td>
	  </tr>
	 
	  <tr>
	    <td  nowrap="nowrap" align="right" height="100px">简历:</td>
	    <td colspan="3">
	    <textarea id="textarea" name="employee.employeeResume" 
	    	rows="5" cols="46">${employee.employeeResume}</textarea></td>
	    </tr>
	  <tr>
	    <td  nowrap="nowrap" align="right" height="100px">备注:</td>
	    <td colspan="3"><textarea id="textarea" name="employee.employeeExplain" 
	    	rows="5" cols="46">${employee.employeeExplain}</textarea></td>
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
			<input type="button"  value="保存" class="button" onclick="isEmpty();"/>　
			<input type="button" value="返回" class="button" onclick="window.history.go(-1);"/>
		 </td>
		</tr>
  
  </table>

</div>
</form>
</body>
</html>