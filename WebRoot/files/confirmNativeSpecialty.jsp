<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>本地添加专业成功----百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>


<body>
<form action="../login.jsp" name="fom" id="fom" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
<tr>
    <td height="30" width="100%">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" width="100%" background="../images/nav04.gif">
        </td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
	<td align="left">
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
	</td>
  </tr>
  <tr>
    <td width="100%">
    
 	<fieldset style="height:100%; width: 90%">
	   <legend>添加专业到百色学院专业库</legend><br/>
		  <table border="0" cellpadding="2" cellspacing="2" style="width:100%"  class="CContent">
		  <tr>
		   <td>
		   <s:if test="#request.specialty!=null">
		   		 <span style="color='blue'; font-size='20px'">  你已经成功添加一个专业到百色学院本地专业库中!新添加的专业信息如下：</span>
		   </s:if>
		    <s:else>
		    	<span style="color='red'; font-size='20px'">百色学院本地专业库中已经存在这个专业！！！</span>
		    </s:else>
		   </td>
		  </tr>
		  </table>
     <s:if test="#request.specialty!=null">
      <table id="bigTab" width="100%" border="0" cellspacing="6" cellpadding="2">
  <tr>
    <td>
    <table id="subtree1"  width="100%" border="0" cellspacing="2" cellpadding="2">

        <tr>
          <td>
          <table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
                
                <table  id="sepecialtyTab" width="100%" border="0" cellpadding="4" cellspacing="1" >

				  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title"> 
						添加到百色学院本地专业库的专业详细信息
				    </td>
                  </tr>
                    <tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业代码:</td>
                     	<td bgcolor='#FFFFFF'>${requestScope.specialty.specialtyNumber}</td> </tr>
		  	     	<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业名称:</td>
		  	     	 	<td bgcolor='#FFFFFF'>${requestScope.specialty.specialtyName}</td> </tr>
		  	     	 <tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业小类代码:</td>
		  	     		 <td bgcolor='#FFFFFF'>${requestScope.specialty.specialtyClassNumber}</td> </tr>
		  	     	<tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业小类名称:</td>
		  	     		<td bgcolor='#FFFFFF'>${requestScope.specialty.specialtyClassName}</td> </tr>
		  	     	 <tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业大类代码:</td>
		  	     		 <td bgcolor='#FFFFFF'>${requestScope.specialty.specialtySubjectNumber}</td> </tr>
		  	     	 <tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业大类名称:</td>
		  	     	 	<td bgcolor='#FFFFFF'>${requestScope.specialty.specialtySubjectName}</td> </tr>
		  	     	 <tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>所属系别:</td>
		  	     	 	<td bgcolor='#FFFFFF'>${requestScope.systems.systemName}</td> 
		  	     	 </tr>
		  	     	 <tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>培养层次:</td>
		  	     	 	<td bgcolor='#FFFFFF'>${requestScope.specialty.specialtyLevel}</td> </tr>
		  	     	 <tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>发布年度:</td>
		  	     	 	<td bgcolor='#FFFFFF'>${requestScope.specialty.specialtyBeginning}</td> </tr>
		  	     	 <tr><td width='30%' height='20' align='right' bgcolor='#FFFFFF'>专业备注:</td>
		  	     	 	<td bgcolor='#FFFFFF'>${requestScope.specialty.specialtyExplain}</td> 
		  	     	 </tr>
                </table>
                </td>
              </tr>
            </table>
            </td>
        </tr>
      </table>
      </td>
  </tr>
</table>
</s:if>
	</fieldset>	
 
    </td>
  </tr>
   <tr>
	<td align="left">
		<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
	</td>
	</tr>
</table>
</form>
</body>
</html>