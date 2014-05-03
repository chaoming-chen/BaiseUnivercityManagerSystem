<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>
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
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>


<body>
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
    <td><table id="subtree1" style="DISPLAY: " width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
			<tr>
               <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp; 所有专业列表 &nbsp;</td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  class="TableLight" width="100%" border="0" cellpadding="4" cellspacing="1">
                  <tr>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业代码</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业小类代码</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业小类名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业大类代码</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业大类名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所属系别</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">培养层次</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">发布年度</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <s:iterator value="#request.specialtys">
                  <tr  id="tr_${sid}"  bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${specialtyNumber}</div></td>
                    <td><div align="center">${specialtyName}</div></td>
                    <td><div align="center">${specialtyClassNumber}</div></td>
                    <td><div align="center">${specialtyClassName}</div></td>
                    <td><div align="center">${specialtySubjectNumber}</div></td>
                    <td><div align="center">${specialtySubjectName}</div></td>
                    <td><div align="center">${specialtySystem}</div></td>
                    <td><div align="center">${specialtyLevel}</div></td>
                    <td><div align="center">${specialtyBeginning}</div></td>
                     <td onclick="deleteRow(this);">
                     <div align="center">
                     	<input value="编辑" type="button" class="button04" onclick="javaScript:location.href='NativeSpecialtys_editNativeSpecialty?nativeSpecialty.sid=${sid}'"/>
                     	<input type="button" name="Submit" value="删除" class="button04" onclick="deleteData('${sid}');"/>
                     </div>
                     </td>
                  </tr>
                  </s:iterator>
                  
                </table>
             </tr>
               
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>