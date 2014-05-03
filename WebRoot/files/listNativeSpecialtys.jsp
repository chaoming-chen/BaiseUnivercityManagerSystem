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
                type:"POST",
                url:'NativeSpecialtys_deleteNativeSpecialty?nativeSpecialty.sid='+order_id,
                success:function(msg){
                    $("#tr_"+order_id).remove();
                }
            });
        }
    };
   
</script>
</head>


<body onload="getSpecialtyBeginning();">

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
			location.href='NativeSpecialtys_listNativeSpecialtys';
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
    <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0">
          	<tr>
          		<td width="16%" >
					<span style="color:#6795B4;">│</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<input onclick="javaScript:location.href='addNativeSpecialty.jsp'" type="button" value="添加专业" class="button09"/>&nbsp;&nbsp;&nbsp;&nbsp;
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
    <table id="subtree1" style="DISPLAY: " width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0"  class="CContent">
			<tr>
               <td height="20" colspan="2" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                               专业列表</td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  class="TableLight" width="100%" border="0" cellpadding="4" cellspacing="1">
                  <tr>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业代码</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业小类</td>
                    <td width="8%" align="center" bgcolor="#EEEEEE">专业大类</td>
                    <td width="4%" align="center" bgcolor="#EEEEEE">培养层次</td>
                    <td width="4%" align="center" bgcolor="#EEEEEE">发布年度</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <s:iterator value="#request.specialtys">
                  <tr id="tr_${sid}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${specialtyNumber}</div></td>
                    <td><div align="center">${specialtyName}</div></td>
                    <td><div align="center">${specialtyClassName}</div></td>
                    <td><div align="center">${specialtySubjectName}</div></td>
                    <td><div align="center">${specialtyLevel}</div></td>
                    <td><div align="center">${specialtyBeginning}</div></td>
                     <td>
                     <div align="center">
                     <input value="详情" type="button" class="button04" onclick="javaScript:location.href='NativeSpecialtys_showNativeSpecialty?nativeSpecialty.sid=${sid}'">&nbsp;&nbsp;
                     <input value="更新" type="button" class="button04" onclick="javaScript:location.href='NativeSpecialtys_editNativeSpecialty?nativeSpecialty.sid=${sid}'"/>&nbsp;&nbsp;
                     <input value="删除" type="button" name="Submit"  class="button04" onclick="deleteData('${sid}');"/>
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