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
function outputClassStudentsByExcel(){
	location.href="ClassStudents_outputClassStudentsByExcel?student.classes.classId=<s:property value='#request.studentsClass.classId'/>";
}
function outputClassStudentDetailsByExcel(){
	location.href="ClassStudents_outputClassStudentDetailsByExcel?student.classes.classId=<s:property value='#request.studentsClass.classId'/>";
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
            <hr>
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
	               	<input type="button" value="下载学生简易信息" class="button05" onclick="outputClassStudentsByExcel();"/>&nbsp;&nbsp;
	               	<input type="button" value="下载学生详细信息" class="button05" onclick="outputClassStudentDetailsByExcel();"/>
	               	<s:property value="#request.studentsClass.className"/>
               </s:if>
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
                  <s:iterator value="#request.oneClassStudents">
                  <tr id="tr_${sid}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${studentNumber}</div></td>
                    <td><div align="center">${studentName}</div></td>
                    <td><div align="center">${studentSex}</div></td>
                    <td><div align="center"><s:property value="classes.className"/></div></td>
                    <td><div align="center"><s:property value="nativeSpecialtys.specialtyName"/></div></td>
                    <td><div align="center">${studentPhone}</div></td>
                    <td>
                     <div align="center">
                     <input value="详细信息" type="button" class="button09" onclick="javaScript:location.href='ClassStudents_showStudent?student.sid=${sid}'">&nbsp;&nbsp;
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