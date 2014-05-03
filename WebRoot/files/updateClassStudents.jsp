<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

function getSystemName(){
   	$.getJSON("Systems_getSystemName", "", function(data){
		$("#system_name option").remove();
		$("#system_name").append("<option>===请选择所属系别===</option>");
		$.each(data,function(i){ 
  	     	$("#system_name").append("<option value="+data[i].systemName+">" + data[i].systemName + "</option>");
		});
	});
}
function getNativeSpecialtyName(){
	var systemName = $("#system_name").val();
   	$.getJSON("NativeSpecialtys_getNativeSpecialtyName", "name="+encodeURI(systemName,"UTF-8"), function(data){
		$("#specialty_name option").remove();
		$("#specialty_name").append("<option>===请选择所属专业===</option>");
		$.each(data,function(i){ 
  	     	$("#specialty_name").append("<option value="+data[i].specialtyName+">" + data[i].specialtyName + "</option>");
		});
	});
	$("#select_system").val(systemName);
}
function getClassName(){
	var specialtyName = $("#specialty_name").val();
   	$.getJSON("Classs_getClassName", "name="+encodeURI(specialtyName,"UTF-8"), function(data){
		$("#class_name option").remove();
		$("#class_name").append("<option>===请选择所属班级===</option>");
		$.each(data,function(i){ 
  	     	$("#class_name").append("<option value="+data[i].className+">" + data[i].className + "</option>");
		});
	});
	$("#select_specialty").val(specialtyName);
}


function selectClassName(){
	$("#select_class").val($("#class_name").val());
}

function findStudentsByClass(){
	var systemName = $("#system_name").val();
	var specialtyName = $("#specialty_name").val();
	var className = $("#class_name").val();
	$.getJSON("ClassStudents_findStudentsByClass", "name="+encodeURI(className,"UTF-8"), function(data){
		$("#student_title span").remove();
		$("#student_title").append("<span>"+systemName+"  "+specialtyName+"  "+className+" 学生列表</span>");
		$("#students_tab tr").remove();
		var $str="";
		$str+="<tr>";
		$str+="<td width='10%' align='center' bgcolor='#EEEEEE'>学号</td>";
		$str+="<td width='10%' align='center' bgcolor='#EEEEEE'>姓名</td>";
		$str+="<td width='5%' align='center' bgcolor='#EEEEEE'>性别</td>";
		$str+="<td width='10%' align='center' bgcolor='#EEEEEE'>所在班级</td>";
        $str+="<td width='10%' align='center' bgcolor='#EEEEEE'>所属专业</td>";
        $str+="<td width='10%' align='center' bgcolor='#EEEEEE'>所属系别</td>";
        $str+="<td width='10%' align='center' bgcolor='#EEEEEE'>联系电话</td>";
        $str+="<td width='10%' align='center' bgcolor='#EEEEEE'>操作</td>";
        $str+="</tr>";
       	$("#students_tab").append($str);
		
		$.each(data,function(i){
			$str="";
  	    	$str+="<tr bgcolor='#FFFFFF'  onmousemove='this.style.background=\"lightblue\";this.style.color=\"blue\"' onmouseout='this.style.background=\"#ffffff\";this.style.color=\"black\"'>";	  
	        $str+="<td><div align='center'>"+data[i].studentNumber+"</div></td>";
	        $str+="<td><div align='center'>"+data[i].studentName+"</div></td>";
	        $str+="<td><div align='center'>"+data[i].studentSex+"</div></td>";
	        $str+="<td><div align='center'>"+data[i].studentClass+"</div></td>";
	        $str+="<td><div align='center'>"+data[i].studentSpecialty+"</div></td>";
	        $str+="<td><div align='center'>"+data[i].studentSystem+"</div></td>";
	        $str+="<td><div align='center'>"+data[i].studentPhone+"</div></td>";
	        $str+="<td><div align='center'><input value='编辑' type='button' class='button04' onclick='javaScript:location.href=\"ClassStudents_editStudent?student.sid="+data[i].sid+"\"'/>";
	        $str+="<input value='删除' type='button' class='button04' onclick='deleteData(\""+data[i].sid+"\")'/></div></td>";
		    $str+="</tr>";
		    $("#students_tab").append($str);
		});
	});
}

function outputStudents(){
	var cname = $("#class_name").val();
	location.href="ClassStudents_outputStudents?student.studentClass="+encodeURI(cname,"UTF-8");
}

function deleteData(order_id){
      var confirm_ = confirm('你确定删除吗？');
      if(confirm_){
          $.ajax({
              type:"GET",
              url:"ClassStudents_deleteStudent?student.sid="+order_id,
              success:function(msg){
                   $("#tr_"+order_id).remove();
              }
          });
      }
  };

</script>
</head>


<body onload="getSystemName();">
<form name="fom" id="fom" method="post">
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
  
  <tr>
    <td>
 </table>
  
<table width="88%" border="0" cellpadding="0" cellspacing="0" >
<tr>
	<td>
   <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >更新学生页面</th>
  </tr>
  <tr>
    <td class="CPanel">
  <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
  <tr>
    <td>
    <fieldset>
		<legend> <span style="color='red'; font-size='16'">&nbsp;&nbsp;&nbsp;&nbsp;请选择要更新班级学生所属的系别和专业</span></legend>
			<table border="0" cellpadding="0" cellspacing="1" style="width:100%"> 
			 <tr>
			     <td nowrap="nowrap" align="right" width="20%">所属系别:</td>
			     <td width="79%">
			    	<select id="system_name" name="classes.classSystem" class="regtxt" onchange="getNativeSpecialtyName();">
						<option>===请选择所属系别===</option>
					</select>
					 <span style="color='red'">*</span>
		        	<input id="select_system" type="text" size="24" disabled="disabled" />
		        </td>
			  </tr>
			  <tr>
			     <td nowrap="nowrap" align="right" width="20%">所属专业:</td>
			     <td width="79%">
			      <select id="specialty_name" name="classes.classSpecialty" class="regtxt" onchange="getClassName();">
						<option>===请选择所属专业===</option>
					</select>
					 <span style="color='red'">*</span>
		        	<input id="select_specialty" type="text" size="24" disabled="disabled" />
		        </td>
			 </tr>
			  <tr>
			     <td nowrap="nowrap" align="right" width="20%">班级名称:</td>
			     <td width="79%">
			      <select id="class_name" name="classes.classSpecialty" class="regtxt" onchange="selectClassName();">
						<option>===请选择所属班级===</option>
					</select>
					 <span style="color='red'">*</span>
		        	<input id="select_class" type="text" size="24" disabled="disabled" />
		        </td>
			 </tr>
			 
			  <tr>
			  <td>&nbsp;</td>
			<td  nowrap="nowrap" align="center">
			<input type="button" name="Submit" value="确定" class="button" onclick="findStudentsByClass();"/>　&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
  </table>
    <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
    	<s:if test="#request.comfirm!=null">
       	<tr><td bgcolor="#e3e3e3"><span style="color='red';font-size='20px'"><b>${comfirm}</b></span></td></tr>
       	</s:if>
        <tr>
          <td>
          <table  width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
			  <tr>
               <td id="student_title" height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                  <span></span>
               </td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table class="TableLight"  id="students_tab" width="100%" border="0" cellpadding="4" cellspacing="1">
                 <!--  <tr>
                    <td width="10%" align="center" bgcolor="#EEEEEE">学号</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">姓名</td>
                    <td width="5%" align="center" bgcolor="#EEEEEE">性别</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所在班级</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所属专业</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所属系别</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">联系电话</td>
                  </tr>
                  <s:iterator value="#request.students">
                  <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${studentNumber}</div></td>
                    <td><div align="center">${studentName}</div></td>
                    <td><div align="center">${studentSex}</div></td>
                    <td><div align="center">${studentClass}</div></td>
                    <td><div align="center">${classSpecialty}</div></td>
                    <td><div align="center">${classSystem}</div></td>
                    <td><div align="center">${classPhone}</div></td>
                  </tr>
                  </s:iterator> -->
               </table>
             
            </table>
           
            </td>
        </tr>
      </table>

</form>
</body>
</html>