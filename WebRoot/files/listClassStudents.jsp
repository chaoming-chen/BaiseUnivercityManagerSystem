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

function isEmpty(){
	if(document.getElementById('specialty_id').value==''){
		alert("请选择要查询专业");
		return false;
	}else if(document.getElementById('class_id').value==''){
		alert("请选择要查询的班级");
		return false;
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}
function outputClassStudentsByExcel(){
	location.href="ClassStudents_outputClassStudentsByExcel?student.classes.classId=<s:property value='#request.students[0].classes.classId'/>";
}
function outputClassStudentDetailsByExcel(){
	location.href="ClassStudents_outputClassStudentDetailsByExcel?student.classes.classId=<s:property value='#request.students[0].classes.classId'/>";
}
</script>
</head>


<body onload="getNativeSpecialtysByJSON();">
<form name="fom" id="fom" action="ClassStudents_listClassStudents" method="post">
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
 	   <s:if test="#request.confirm!=null">
  			<script language="javascript">
  			alert('${confirm}');
  			location.href='ClassStudents_listClassStudents';
  			</script>
       	</s:if>
       	
     <tr>
          <td>
          <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td>
            <hr style="color:#6795B4" />
            </td>
            </tr>
            </table>
            </td>
            </tr>
            </table>
            </td>
     </tr>
            
      <tr>
      <td>
	    <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	          <table width="88%" align="center" cellpadding="0" cellspacing="0">
	          	<tr>
	          		<td width="16%" >
					<span style="color:#6795B4;">│</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<input onclick="javaScript:location.href='addClassStudent.jsp'" type="button" value="添加学生" class="button09"/>
					&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6795B4;">│</span>&nbsp;&nbsp;&nbsp;&nbsp;
				   </td>
			     <td nowrap="nowrap">班级学生查询：
			        <select id="specialty_id" name="student.nativeSpecialtys.sid"  class="regtxt" onchange="getClassesByJSON();">
						<option>===请选择所属专业===</option>
					</select>
					<select id="class_id" name="student.classes.classId"  class="regtxt">
						<option>===请选择所属班级===</option>
					</select>
					 <input type="button" onclick="isEmpty();" value="查询" class="button04"/>
		        </td>
				 </tr>
			  </table>
		</td>
		</tr>
	</table>
	</td>
	</tr>
	
	<tr>
          <td>
          <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td>
            <hr style="color:#6795B4" />
            </td>
            </tr>
            </table>
            </td>
            </tr>
            </table>
            </td>
            </tr>
	
	<tr>
	<td>
    <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table  width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
          	<tr>
               <td id="class_title" height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
               <span>
               <s:if test="#request.studentsClass!=null">
               <s:if test="#request.students.size()!=0">
	               	<input type="button" value="下载学生简易信息" class="button05" onclick="outputClassStudentsByExcel();"/>&nbsp;&nbsp;
	               	<input type="button" value="下载学生详细信息" class="button05" onclick="outputClassStudentDetailsByExcel();"/>
	               	<s:property value="#request.students[0].classes.className"/>
               	</s:if>
               </s:if>
               <s:else>所有</s:else>
				学生列表
                </span>
               </td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table class="TableLight"  id="students_tab" width="100%" border="0" cellpadding="4" cellspacing="1">
                 <tr>
                    <td width="8%" align="center" bgcolor="#EEEEEE">学号</td>
                    <td width="6%" align="center" bgcolor="#EEEEEE">姓名</td>
                    <td width="4%" align="center" bgcolor="#EEEEEE">性别</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所在班级</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所属专业</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">联系电话</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <s:iterator value="#request.students">
                  <tr id="tr_${sid}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${studentNumber}</div></td>
                    <td><div align="center">${studentName}</div></td>
                    <td><div align="center">${studentSex}</div></td>
                    <td><div align="center"><s:property value="classes.className"/></div></td>
                    <td><div align="center"><s:property value="nativeSpecialtys.specialtyName"/></div></td>
                    <td><div align="center">${studentPhone}</div></td>
                    <td>
                     <div align="center">
                     <input value="详情" type="button" class="button04" onclick="javaScript:location.href='ClassStudents_showStudent?student.sid=${sid}'">&nbsp;&nbsp;
                     <input value="更新" type="button" class="button04" onclick="javaScript:location.href='ClassStudents_editStudent?student.sid=${sid}'"/>&nbsp;&nbsp;
                     <input value="删除" type="button" class="button04" onclick="deleteData('${sid}')" />
                     </div>
                     </td>
                  </tr>
                  </s:iterator> 
               </table>
            </table>
            </td>
        </tr>
      </table>
      </td>
      </tr>
      </table>
</form>
</body>
</html>