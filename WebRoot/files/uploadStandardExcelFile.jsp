<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>标准文件上传----百色学院教务管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<script type="text/javascript">
	function isUploadExcel(_form){
		var path = _form.fileName.value; 
		alert(path.substring(path.indexOf("."),path.length));
		if(path.length==0 || path==""){
			return false;
		}else if(path.substring(path.indexOf("."),path.length)!=".xls"){
			return false;
		}else{
			return true;
		}
	}
</script>
</head>

<body>

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
      <th class="tablestyle_title" >标准文件上传页面</th>
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
		<form id="form1" action="StandardSpecialtys_confirmUploadStandardSpecialtys" method="post" enctype="multipart/form-data">
		   <fieldset>
			<legend>标准文件上传</legend>
			 
			  <table border="0" cellpadding="1" cellspacing="0" style="width:100%"> 
			  <tr>		  
			    <td nowrap="nowrap" align="right" width="36%">
			    	<span style="font-weight:bold">上传国家标准专业表:</span></td>
			    <td>
			    <input id="fileName"  type="file" name="file">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <input type="submit" name="Submit" value="上传" class="button04"/>
		        </td>
			  </tr>
			  </table>
			  </fieldset>
			  </form>
			  <form id="form2" action="StandardCourses_uploadStandardCourses" method="post" enctype="multipart/form-data" >
			  <fieldset>
			  <legend>通识教育平台教学计划课程表</legend>	
			  <table border="0" cellpadding="1" cellspacing="0" style="width:100%">
			  <tr>		  
			    <td nowrap="nowrap" align="right" width="36%">
			    	<span style="font-weight:bold">上传通识教育平台教学计划表:</span></td>
			    <td>
				<input id="fileName"  type="file" name="file" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <input type="submit" name="Submit" value="上传" class="button04"/>
		        </td>
			  </tr>
			   </table>
			   </fieldset>
			   </form>
			  <form id="form3" action="StandardCourses_uploadStandardCourses" method="post" enctype="multipart/form-data" >
			  <fieldset>
			  <legend>学科基础课平台教学计划课程表</legend>
			  <table border="0" cellpadding="1" cellspacing="0" style="width:100%">
			  <tr>		  
			    <td nowrap="nowrap" align="right" width="36%">
			    	<span style="font-weight:bold">上传学科基础课平台教学计划表(必修):</span></td>
			    <td>
			    <input id="fileName"  type="file" name="file" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <input type="submit" name="Submit" value="上传" class="button04"/>
		        </td>
			  </tr>
			   </table>
			   </fieldset>
			   </form>
			  <form id="form4" action="StandardCourses_uploadStandardCourses" method="post" enctype="multipart/form-data" >
			  <fieldset>
			  <legend>专业基础课平台教学计划课程表</legend>
			  <table border="0" cellpadding="1" cellspacing="0" style="width:100%">
			  <tr>		  
			    <td nowrap="nowrap" align="right" width="36%">
			    	<span style="font-weight:bold">上传专业基础课平台教学计划表(必修):</span></td>
			    <td>
			    <input id="fileName"  type="file" name="file" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <input type="submit" name="Submit" value="上传" class="button04"/>
		        </td>
			  </tr>
			   </table>
			   </fieldset>
			   </form>
			   
			  <form action="StandardCourses_uploadStandardCourses" method="post" enctype="multipart/form-data" >
			  <fieldset style="height:100%; width: 100%">
			  <legend>专业发展课程平台教学计划课程表</legend>
			  <table border="0" cellpadding="1" cellspacing="0" style="width:100%">
			  <tr>		  
			    <td nowrap="nowrap" align="right" width="36%">
			    	<span style="font-weight:bold">上传专业发展课程平台教学计划表(选修):</span></td>
			    <td>
			    <input id="fileName"  type="file" name="file" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <input type="submit" name="Submit" value="上传" class="button04"/>
		        </td>
			  </tr>
			  </table>
		   </fieldset>
		   </form>
		   
		   
		 </td>
		</tr>
		</table>
		</td>
		</tr>
		</table>
	  </td>
  </tr>
  
  </table>

</div>
</body>
</html>