<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>更新专业----百色学院教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<form name="fom" id="fom" method="post" action="NativeSpecialtys_modifyNativeSpecialty">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
    <td height="30">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" background="../images/nav04.gif">
          
		   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="679" align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>	
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
                <td height="40" class="font42">
                
                <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#6795B4" class="newfont03">

				  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title">
					更新 <span style="color='blue'">${requestScope.specialty.specialtyName}</span> 专业信息<span style="color='blue'">(只能更新备注)</span>
				    </td>
                  </tr>
                    <tr><td width='20%' height='20' align='right' bgcolor='#FFFFFF'>
                    	<input type="hidden" name="nativeSpecialty.sid" value="${requestScope.specialty.sid}"/>
                                           专业代码:</td>
                     <td bgcolor='#FFFFFF'><input readonly="readonly" name="nativeSpecialty.specialtyNumber" value="${requestScope.specialty.specialtyNumber}"/></td> </tr>
		  	     	<tr><td width='20%' height='20' align='right'  bgcolor='#FFFFFF'>专业名称:</td>
		  	     	 <td bgcolor='#FFFFFF'><input readonly="readonly" name="nativeSpecialty.specialtyName" value="${requestScope.specialty.specialtyName}"/></td> </tr>
		  	     	 <tr><td width='20%' height='20' align='right' bgcolor='#FFFFFF'>专业小类代码:</td>
		  	     	 <td bgcolor='#FFFFFF'><input readonly="readonly" name="nativeSpecialty.specialtyClassNumber" value="${requestScope.specialty.specialtyClassNumber}"/></td> </tr>
		  	     	<tr><td width='20%' height='20' align='right' bgcolor='#FFFFFF'>专业小类名称:</td>
		  	     	<td  bgcolor='#FFFFFF'><input readonly="readonly" name="nativeSpecialty.specialtyClassName" value="${requestScope.specialty.specialtyClassName}"/></td> </tr>
		  	     	 <tr><td width='20%' height='20' align='right' bgcolor='#FFFFFF'>专业大类代码:</td>
		  	     	 <td bgcolor='#FFFFFF'><input readonly="readonly" name="nativeSpecialty.specialtySubjectNumber" value="${requestScope.specialty.specialtySubjectNumber}"/></td> </tr>
		  	     	 <tr><td width='20%' height='20' align='right' bgcolor='#FFFFFF'>专业大类名称:</td>
		  	     	 <td bgcolor='#FFFFFF'><input readonly="readonly" name="nativeSpecialty.specialtySubjectName" value="${requestScope.specialty.specialtySubjectName}"/></td> </tr>
		  	     	 <tr><td width='20%' height='20' align='right' bgcolor='#FFFFFF'>培养层次:</td>
		  	     	 <td bgcolor='#FFFFFF'><input readonly="readonly" name="nativeSpecialty.specialtyLevel" value="${requestScope.specialty.specialtyLevel}"/></td> </tr>
		  	     	 <tr><td width='20%' height='20' align='right' bgcolor='#FFFFFF'>发布年度:</td>
		  	     	 <td bgcolor='#FFFFFF'><input readonly="readonly" name="nativeSpecialty.specialtyBeginning" value="${requestScope.specialty.specialtyBeginning}"/></td> </tr>
		  	     	 <tr><td width='20%' height='20' align='right' bgcolor='#FFFFFF'>所属系别:</td>
		  	     	 <td bgcolor='#FFFFFF'><input readonly="readonly" name="nativeSpecialty.systems.systemName" value="${requestScope.specialty.systems.systemName}"/></td> </tr>
                    <tr>
				      <td  bgcolor='#FFFFFF' nowrap="nowrap" align="right" height="100px">专业备注:</td>
				      <td  bgcolor='#FFFFFF' colspan="3">
				      <textarea id="textarea" name="nativeSpecialty.specialtyExplain" rows="5" cols="46">${requestScope.specialty.specialtyExplain}</textarea></td>
				    </tr>
                </table>
                
                </td>
              </tr>
            </table>
            </td>
        </tr>
        <tr>
		<td align="center" >
			<input type="submit" name="" value="保存" class="button"/>
			<input type="button" name="back" value="返回" class="button" onclick="window.history.go(-1);"/>
		</td>
		</tr>
      </table>
      </td>
  </tr>
</table>
</form>
</body>
</html>