<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加专业----百色学院教务管理系统</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function getSpecialtyBeginningsByJSON(){
   	$.getJSON("StandardSpecialtys_getSpecialtyBeginnigsByJSON", "", function(data){
		$("#specialty_beginning option").remove();
		$("#specialty_beginning").append("<option>===请选择发布年度===</option>");
		$.each(data,function(i){ 
  	     	$("#specialty_beginning").append("<option value="+data[i]+">" + data[i] + "</option>");
		});
	});
}
function getStandardSubjectsByJSON(){
	var specialtyBeginning = $("#specialty_beginning").val();
   	$.getJSON("StandardSpecialtys_getStandardSubjectsByJSON", "standardSpecialty.specialtyBeginning="+specialtyBeginning, function(data){
		$("#subject_number option").remove();
		$("#subject_number").append("<option>===请选择专业大类===</option>");
		$.each(data,function(i){ 
  	     	$("#subject_number").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
	});
}

function getStandardClassesByJSON(){
	var subjectNumber = $("#subject_number").val(); 
   	$.getJSON("StandardSpecialtys_getStandardClassesByJSON", "standardSpecialty.specialtySubjectNumber="+subjectNumber, function(data){
		$("#class_number option").remove();
		$("#class_number").append("<option>===请选择专业小类===</option>");
		$.each(data,function(i){ 
  	     	$("#class_number").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
	});
}

function getStandardSpecialtysByJSON(){
	var classNumber = $("#class_number").val();
   	$.getJSON("StandardSpecialtys_getStandardSpecialtysByJSON", "standardSpecialty.specialtyClassNumber="+classNumber, function(data){
		$("#specialty_number option").remove();
		$("#specialty_number").append("<option>===请选择专业名称===</option>");
		$.each(data,function(i){ 
  	     	$("#specialty_number").append("<option value="+data[i].specialtyNumber+">" + data[i].specialtyName + "</option>");
		});
	});
}

function selectSuccess(){
	var specialtyNumber = $("#specialty_number").val();
	$.getJSON("StandardSpecialtys_findStandardSpecialtyDetailsByJSON", "standardSpecialty.specialtyNumber="+specialtyNumber, function(data){
		$.each(data,function(i){
			 $("#specialty_id").val(data[i].sid); 
  	     	 $("#sepecialtyTab").append("<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业代码:</td><td  bgcolor='#FFFFFF'>"+data[i].specialtyNumber+"</td> </tr>");
  	     	 $("#sepecialtyTab").append("<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业名称:</td><td  bgcolor='#FFFFFF'>"+data[i].specialtyName+"</td> </tr>");
  	     	 $("#sepecialtyTab").append("<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业小类代码:</td><td  bgcolor='#FFFFFF'>"+data[i].specialtyClassNumber+"</td> </tr>");
  	     	 $("#sepecialtyTab").append("<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业小类名称:</td><td  bgcolor='#FFFFFF'>"+data[i].specialtyClassName+"</td> </tr>");
  	     	 $("#sepecialtyTab").append("<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业大类代码:</td><td  bgcolor='#FFFFFF'>"+data[i].specialtySubjectNumber+"</td> </tr>");
  	     	 $("#sepecialtyTab").append("<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业大类名称:</td><td  bgcolor='#FFFFFF'>"+data[i].specialtySubjectName+"</td> </tr>");
  	     	 $("#sepecialtyTab").append("<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>培养层次:</td><td bgcolor='#FFFFFF'>"+data[i].specialtyLevel+"</td> </tr>");
  	     	 $("#sepecialtyTab").append("<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>发布年度:</td><td bgcolor='#FFFFFF'>"+data[i].specialtyBeginning+"</td> </tr>");
  	     	 $("#sepecialtyTab").append("<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业备注:</td><td bgcolor='#FFFFFF'>"+data[i].specialtyExplain+"</td> </tr>");
		});
	});
	$("#bigTab").show();
	
}

function isEmpty(){
	 if(document.getElementById('specialty_beginning').value==''){
		   alert('专业发布年度不能为空');
		   return false;
	 }else if(document.getElementById('subject_number').value==''){
	   alert('专业大类不能为空');
	   return false;
	}else if(document.getElementById('class_number').value==''){
	   alert('专业小类不能为空');
	   return false;
	}else if(document.getElementById('specialty_number').value==''){
		alert('专业名称不能为空');
	}else{
		selectSuccess();
		return true;
	}
	
	//alert(document.getElementById('subject_name').value=='');
}

</script>
</head>

<body onload="getSpecialtyBeginningsByJSON();">
<form name="fom" id="fom" method="post" action="NativeSpecialtys_confirmNativeSpecialty">
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
      <th class="tablestyle_title" >专业添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr>
			<td width="100%">
				<fieldset >
				<legend>添加专业----请从下拉框中选择专业，带有&nbsp;<span style="color='red'">*</span>&nbsp;项为必填项</legend>
					  <table border="0" cellpadding="2" cellspacing="2" style="width:100%">
					   <tr>
					    <td nowrap="nowrap" align="right" width="10%">专业发布年度:</td>
					    <td width="89%">
					    	<select id="specialty_beginning"  class="regtxt" onchange="getStandardSubjectsByJSON()">
								<option>===请选择发布年度===</option>
							</select>
							 <span style="color:red">*</span>
				        </td>
					  </tr>
					  <tr>
					    <td nowrap="nowrap" align="right" width="10%">专业大类:</td>
					    <td width="89%">
					       <select id="subject_number"  class="regtxt" onChange="getStandardClassesByJSON()">
								<option>===请选择专业大类===</option>
							</select>
				         <span style="color:red">*</span>
				        </td>
					  </tr>
					  <tr>
					     <td nowrap="nowrap" align="right" width="10%">专业小类:</td>
					     <td width="89%">
					        <select id="class_number"  class="regtxt" onchange="getStandardSpecialtysByJSON();">
								<option>===请选择专业小类===</option>
							</select>
				         <span style="color:red">*</span>
				        </td>
					  </tr>
					  
					  <tr>
					    <td nowrap="nowrap" align="right" width="10%">专业名称:</td>
					    <td width="89%">
					    	<select id="specialty_number"  class="regtxt">
								<option>===请选择专业名称===</option>
							</select>
							 <span style="color:red">*</span>
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
		<input type="button" name="Submit" value="确定" class="button" onclick="isEmpty();"/>　
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
	 </td>
	</tr>
  </table>
<table align="center" id="bigTab" width="88%" border="0" cellspacing="4" cellpadding="2" style="DISPLAY: none">
  <tr>
    <td>
    <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td>
          <table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
                
                <table  class="TableLight" id="sepecialtyTab" width="100%" border="0" cellpadding="4" cellspacing="1">
				  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title"> 
					下面是你从标准专业库中选择准备添加到百色学院本地专业库的专业详细信息
				    </td>
                  </tr>
                </table>
                </td>
              </tr>
            </table>
            </td>
        </tr>
         
        <tr>
       
		<td nowrap="nowrap" colspan="2">
			<span style="color:blue; font-size:18; font-weight:bold"> <!--如果把 <input   disabled="disabled"> form 提交上去也取不了它的值！！！--><label ></label>
				是否确定添加这个专业？<input type="hidden" id="comfirm_system" name="nativeSpecialty.specialtySystem"/>
			 <input type="hidden" id="specialty_id" name="standardSpecialty.sid">&nbsp;&nbsp;
			 <input type="submit" name="Submit" value="添加这个专业" class="button10"/>
			 <input type="button" name="Submit" value="返回" class="button04" onclick="javaScript:window.location.replace('addNativeSpecialty.jsp')"/>
			 </span>　
		
		 </td>
		</tr>
		 
      </table>
      
      </td>
  </tr>
</table>

</div>
 </form>
</body>
</html>