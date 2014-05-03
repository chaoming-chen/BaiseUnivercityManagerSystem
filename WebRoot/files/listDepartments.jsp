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
                url:"Departments_deleteDepartment?department.did="+order_id,
                success:function(msg){
                    $("#tr_"+order_id).remove();
                }
            });
        }
    };
</script>
</head>


<body>

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
  			location.href='Departments_listDepartments';
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
          <table width="88%" align="center" cellpadding="0" cellspacing="0" >
          	<tr>
          		<td width="16%">
					<span style="color:#6795B4;">│</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<input onclick="javaScript:location.href='addDepartment.jsp'" type="button" value="添加部门" class="button09"/>
					&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#6795B4;">│</span>&nbsp;&nbsp;&nbsp;&nbsp;
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
               <td height="20" colspan="6" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
               	 所有部门列表 </td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table class="TableLight"  width="100%" border="0" cellpadding="4" cellspacing="1">
                  <tr>
                    <td width="10%" align="center" bgcolor="#EEEEEE">部门编号</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">部门名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">部门性质</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">部门电话</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">部门邮箱</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
	
                  <s:iterator value="#request.departments">
                  <tr id="tr_${did}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${departmentNumber}</div></td>
                    <td><div align="center">${departmentName}</div></td>
                    <td><div align="center">${departmentCategory}</div></td>
                    <td><div align="center">${departmentPhone}</div></td>
                    <td><div align="center">${departmentEmail}</div></td>
                     <td>
                     <div align="center">
                     	<input value="详情" type="button" class="button04" onclick="javaScript:location.href='Departments_showDepartment?department.did=${did}'">&nbsp;&nbsp;
                     	<input value="更新" type="button" class="button04" onclick="javaScript:location.href='Departments_editDepartment?department.did=${did}'"/>&nbsp;&nbsp;
                   	    <input value="删除" type="button" class="button04" onclick="deleteData('${did}')" />
                     </div>
                     </td>
                  </tr>
                  </s:iterator>
                  
                </table>
             
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

</body>
</html>