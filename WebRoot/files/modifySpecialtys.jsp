<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>

<style type="text/css">

</style>
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
          <td><table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
	
			<tr>
               <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp; 所有专业列表 &nbsp;</td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  width="100%" border="0" cellpadding="2" cellspacing="2" bgcolor="#6795B4" class="newfont03">
                  <tr>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业代码</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">培养层次</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">发布年度</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所属系别</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">专业备注</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <s:iterator value="#request.specialtys">
                  <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${specialtyNumber}</div></td>
                    <td><div align="center">${specialtyName}</div></td>
                    <td><div align="center">${specialtyBeginning}</div></td>
                    <td><div align="center">${departmentPhone}</div></td>
                    <td><div align="center">${specialtyDepartment}</div></td>
                    <td><div align="center">${specialtyExplain}</div></td>
                     <td><div align="center"><a href="Departments_showDepartment?department.did=${did}">查看</a></div></td>
                  </tr>
                  </s:iterator>
                  
                </table>
             
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>