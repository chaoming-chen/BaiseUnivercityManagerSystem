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
function deleteData(order_id){
    var confirm_ = confirm('你确定删除吗？');
    if(confirm_){
        $.ajax({
            type:"GET",
            url:"Classs_deleteClass?classes.classId="+order_id,
            success:function(msg){
                 $("#tr_"+order_id).remove();
            }
        });
    }
}

function isEmpty(){
	if(document.getElementById('specialty_id').value==''){
		alert("请选择查询条件");
		return false;
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}

function outputClassesByExcel(){
	location.href="Classs_outputClassesByExcel?classes.nativeSpecialtys.sid=<s:property value='#request.classes[0].nativeSpecialtys.sid'/>";
}
</script>
</head>

<body onload="getNativeSpecialtysByJSON();">
<form name="fom" id="fom" action="Classs_listClassCourses" method="post">
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
  			location.href='Classs_listClasss';
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
	    <table width="88%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	          <table width="88%" align="center" cellpadding="0" cellspacing="0">
	          	<tr>
	            <td><input type="button" value="返回" class="button04" onclick="window.history.go(-1);"/></td>
			     <td nowrap="nowrap" align="right" width="10%">班级查询：</td>
			     <td>
			       <select id="specialty_id" name="classes.nativeSpecialtys.sid" class="regtxt">
						<option>===请选择所属专业===</option>
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
           
          <table  width="88%" align="center" cellpadding="0" cellspacing="0"  class="CContent">
			  <tr>
               <td id="class_title" height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
               <span>
                <s:if test="#request.classesNativeSpecialty!=null">
               	<s:if test="#request.classes.size()!=0">
               		<s:property value="#request.classes[0].nativeSpecialtys.specialtyName"/> 专业
               	</s:if>
               </s:if>
               <s:else>所有</s:else>
				班级列表
                </span>
               </td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  class="TableLight"  id="classes_tab" width="100%" cellpadding="4" cellspacing="1">
                  <tr class="title_">
                    <td width="10%" align="center" bgcolor="#EEEEEE">查&nbsp;&nbsp;看</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">班级编号</td>
                    <td width="16%" align="center" bgcolor="#EEEEEE">班级名称</td>
                    <td width="16%" align="center" bgcolor="#EEEEEE">所属专业</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">辅导员</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">联系电话</td>
                  </tr>
                  <s:iterator value="#request.classes">
                  <tr id="tr_${classId}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                     <td>
                     <div align="center">
                     <input value="已选课程" type="button" class="button09" 
                     	onclick="javaScript:location.href='NativeCourses_listClassSelectedCourses?classes.classId=${classId}'"/>
                     </div>
                     </td>
                    <td><div align="center">${classNumber}</div></td>
                    <td><div align="center">${className}</div></td>
                    <td><div align="center"><s:property value="nativeSpecialtys.specialtyName"/> </div></td>
                    <td><div align="center">${classTeacher}</div></td>
                    <td><div align="center">${classPhone}</div></td>
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