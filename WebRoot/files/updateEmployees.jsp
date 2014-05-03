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
    function getSystemName(){
   		$.getJSON("Systems_getSystemName", "", function(data){
		$("#system_name option").remove();
		$("#system_name").append("<option>===请选择所属系别===</option>");
		$("#system_name2 option").remove();
		$("#system_name2").append("<option>===请选择所属系别===</option>");
		$.each(data,function(i){ 
  	     	$("#system_name").append("<option value="+data[i].systemName+">" + data[i].systemName + "</option>");
  	     	$("#system_name2").append("<option value="+data[i].systemName+">" + data[i].systemName + "</option>");
		});
		
	});
  }

function selectSystemName(){
	var systemName = $("#system_name").val();
	$("#select_system").val(systemName);
}
</script>
</head>


<body onload="getSystemName();">

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
 	   <s:if test="#request.comfirm!=null">
  			<script language="javascript">alert('${comfirm}')</script>
       		<tr><td bgcolor="#e3e3e3"><span style="color='red';font-size='20px'"><b>${comfirm}</b></span></td></tr>
       	</s:if>
</table>
 <table width="88%" border="0" cellpadding="0" cellspacing="0" >
<tr>
	<td>
  <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >查看职工页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
    <tr>
    <td>  
    <fieldset>
		<legend>查看职工</legend>
		<form action="Employees_updateEmployees" method="post">
			<table border="0" cellpadding="2" cellspacing="1" style="width:88%"> 
			 <tr>
			     <td nowrap="nowrap" align="right" width="20%">所在系:</td>
			     <td width="79%">
			    	<select id="system_name" class="regtxt" onchange="selectSystemName()" name="employee.employeeSystem">
						<option>===请选择所属系别===</option>
					</select>
					 <span style="color='red'">*</span>
		        	<input id="select_system" type="text" size="24" disabled="disabled" />
		        </td>
			  </tr>
			  
			  <tr>
			  <td>&nbsp;</td>
			<td  nowrap="nowrap" align="center">
			<input type="submit" name="Submit" value="确定" class="button"/>　
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1)"/>
		   </td>
		   </tr>
			</table>
			</form>
	</fieldset>	
       </td>
        </tr>
        
        
  <tr>
    <td>
    <fieldset>
    <table id="subtree1"  width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="100%" align="center" cellpadding="0" cellspacing="0" class="CContent">
	
			<tr>
               <td height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                &nbsp;&nbsp; 所有职工列表 &nbsp;</td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table class="TableLight"  width="100%" border="0" cellpadding="4" cellspacing="1">
                  <tr>
                    <td width="10%" align="center" bgcolor="#EEEEEE">姓名</td>
                    <td width="4%" align="center" bgcolor="#EEEEEE">性别</td>
                    <td width="16%" align="center" bgcolor="#EEEEEE">所学专业</td>
                    <td width="12%" align="center" bgcolor="#EEEEEE">研究方向</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">学历</td>
                    <td width="8%" align="center" bgcolor="#EEEEEE">职称</td>
                    <td width="16%" align="center" bgcolor="#EEEEEE">所在系</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">电话</td>
                    <td align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <s:iterator value="#request.employees">
                  <tr  id="tr_${eid}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${employeeName}</div></td>
                    <td><div align="center">${employeeSex}</div></td>
                    <td><div align="center">${employeeSpecialty}</div></td>
                    <td><div align="center">${employeeSkill}</div></td>
                    <td><div align="center">${employeeEducationBackground}</div></td>
                    <td><div align="center">${employeeProfessionalTitle}</div></td>
                    <td><div align="center">${employeeSystem}</div></td>
                    <td><div align="center">${employeePhone}</div></td>
                     <td>
                     <div align="center">
                     <input value="编辑" type="button" class="button04" onclick="javaScript:location.href='Employees_editEmployee?employee.eid=${eid}'">
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
</body>
</html>