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

function deleteData(order_id){
    var confirm_ = confirm('你确定删除吗？');
    if(confirm_){
        $.ajax({
            type:"GET",
            url:"Employees_deleteEmployee?employee.eid="+order_id,
            success:function(msg){
                $("#tr_"+order_id).remove();
            }
        });
    }
};

function getSystemsByJSON(){
   		$.getJSON("Systems_getSystemsByJSON", "", function(data){
		$("#system_id option").remove();
		$("#system_id").append("<option>===请选择所属系别===</option>");
		$.each(data,function(i){ 
			$("#system_id").append("<option value="+data[i][0]+">" + data[i][1] + "</option>");
		});
		
	});
}

function isEmpty(){
	if(document.getElementById('system_id').value==''){
		alert("请选择查询条件");
		return false;
	}else{
		document.getElementById('fom').submit();
		return true;
	}
}
</script>
</head>


<body onload="getSystemsByJSON();">
<form id="fom" action="Employees_listEmployees" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="30" width="100%">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" width="100%" background="../images/nav04.gif" >
        </td>
      </tr>
    </table>
    </td>
  </tr>
 	   <s:if test="#request.confirm!=null">
  			<script language="javascript">
  			    alert('${confirm}');
  				location.href='Employees_listEmployees';
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
         <hr style="color:#6795B4;" />
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
          		<td width="16%">
					<span style="color:#6795B4;">│</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<input onclick="javaScript:location.href='addEmployee.jsp'" type="button" value="添加员工" class="button09"/>
					&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6795B4;">│</span>
				</td>
					
				 <td nowrap="nowrap">员工查询：
		    	<select id="system_id" class="regtxt" name="employee.systems.sid">
				</select>
	        	<input type="button" value="查询" class="button04" onclick="isEmpty();"/>　
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
            <hr style="color:#6795B4;" />
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
          <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
			<tr>
               <td height="20" colspan="10" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                              所有职工列表 
                 </td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  class="TableLight" width="100%" border="0" cellpadding="4" cellspacing="1" >
                  <tr>
                    <td width="8%" align="center" bgcolor="#EEEEEE">姓名</td>
                    <td width="4%" align="center" bgcolor="#EEEEEE">性别</td>
                    <td width="12%" align="center" bgcolor="#EEEEEE">所学专业</td>
                    <td width="8%" align="center" bgcolor="#EEEEEE">学历</td>
                    <td width="8%" align="center" bgcolor="#EEEEEE">职称</td>
                    <td width="12%" align="center" bgcolor="#EEEEEE">所在系</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">电话</td>
                    <td width="20%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <s:iterator value="#request.employees">
                  <tr id="tr_${eid}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                    <td><div align="center">${employeeName}</div></td>
                    <td><div align="center">${employeeSex}</div></td>
                    <td><div align="center">${employeeSpecialty}</div></td>
                    <td><div align="center">${employeeEducationBackground}</div></td>
                    <td><div align="center">${employeeProfessionalTitle}</div></td>
                    <td><div align="center"><s:property value="systems.systemName"/></div></td>
                    <td><div align="center">${employeePhone}</div></td>
                     <td>
                     <div align="center">
                     <input value="已任课程" type="button" class="button09" onclick="javaScript:location.href='NativeCourses_listTeacherSelectedCourses?employee.eid=${eid}'">&nbsp;&nbsp;
                     <input value="详情" type="button" class="button04" onclick="javaScript:location.href='Employees_showEmployee?employee.eid=${eid}'">&nbsp;&nbsp;
                     <input value="更新" type="button" class="button04" onclick="javaScript:location.href='Employees_editEmployee?employee.eid=${eid}'">&nbsp;&nbsp;
                     <input value="删除" type="button" class="button04" onclick="deleteData('${eid}')">
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