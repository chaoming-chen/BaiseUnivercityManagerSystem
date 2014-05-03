<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
            url:"NativeCourses_deleteNativeCourse?nativeCourse.cid="+order_id,
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
function getNativeSpecialtyName(rex){
		var systemName = $("#system_name"+rex).val();
   		$.getJSON("NativeSpecialtys_getNativeSpecialtyName", "name="+encodeURI(systemName,"UTF-8"), function(data){
		$("#specialty_name"+rex+" option").remove();
		$("#specialty_name"+rex).append("<option>===请选择所属专业===</option>");
		$.each(data,function(i){ 
  	     	$("#specialty_name"+rex).append("<option value="+data[i].specialtyName+">" + data[i].specialtyName + "</option>");
		});
	});
	$("#select_system"+rex).val(systemName);
}

function selectSpecialtyName(rex){
	$("#select_specialty"+rex).val($("#specialty_name"+rex).val());
}
function selectTerm(rex){
	$("#select_term"+rex).val($("#term_name"+rex).val());
}

</script>
</head>

<body onload="getSystemName();">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="30" width="100%" colspan="2">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="58" width="100%" background="../images/nav04.gif" ></td>
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
      <th class="tablestyle_title" >课程更新页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
    <tr>
    <td>  
    <fieldset>
		<legend>更新已经开设的课程</legend>
		<form action="NativeCourses_updateNativeCourses" method="post">
			<table border="0" cellpadding="2" cellspacing="1" style="width:88%"> 
			 <tr>
			     <td nowrap="nowrap" align="right" width="20%">所属系别:</td>
			     <td width="79%">
			    	<select id="system_name" class="regtxt" onchange="getNativeSpecialtyName('');">
						<option>===请选择所属系别===</option>
					</select>
					 <span style="color='red'">*</span>
		        	<input id="select_system" type="text" size="24" disabled="disabled" />
		        </td>
			  </tr>
			  <tr>
			     <td nowrap="nowrap" align="right" width="20%">专业:</td>
			     <td width="79%">
			      <select id="specialty_name" name="nativeCourse.courseSpecialty" class="regtxt" onchange="selectSpecialtyName('');">
						<option>=====请选择专业=====</option>
					</select>
					 <span style="color='red'">*</span>
		        	<input id="select_specialty" type="text" size="24" disabled="disabled" />
		        </td>
			 </tr>
			 <tr>
			     <td nowrap="nowrap" align="right" width="20%">学期:</td>
			     <td width="79%">
			      <select id="term_name" name="nativeCourse.courseTerm" class="regtxt" onchange="selectTerm('')">
						<option value="1">======第一学期======</option>
						<option value="2">======第二学期======</option>
						<option value="3">======第三学期======</option>
						<option value="4">======第四学期======</option>
						<option value="5">======第五学期======</option>
						<option value="6">======第六学期======</option>
						<option value="7">======第七学期======</option>
						<option value="8">======第八学期======</option>
					</select>
					 <span style="color='red'">*</span>
		        	<input id="select_term" type="text" size="24" disabled="disabled" />
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
	<s:if test="#request.nativeCourses!=null && #request.nativeCourses.size()!=0">
    <fieldset>
	<legend>已开设课程</legend>
       <table id="subtree1"  width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="100%" align="center" cellpadding="0" cellspacing="0"  class="CContent">
			<tr>
               <td  colspan="15"  class="tablestyle_title">
                	<span style="font-size:20px; font-weight:bold">
					 <span style="color:blue">
					 <s:property value="#request.nativeCourses[0].courseSpecialty"/></span>专业第<span style="color:blue"><s:property value="#request.nativeCourses[0].courseTerm"/></span>学期<span style="color:blue">已开设</span>课程列表</span>
                	 <input type="hidden" name="teacherId" value="${teacherId}"/>
                 	</td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  class="TableLight" width="100%" border="0" cellpadding="4" cellspacing="1">
               <tr>
				<td rowspan="2"  width="18%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;分</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;时</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学期</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">周学时</div></td>
				<td rowspan="2"  width="6%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">考试考查</div></td>
				<td rowspan="2"  width="8%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">开课单位</div></td>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">专&nbsp;&nbsp;业</div></td>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">操&nbsp;&nbsp;作</div></td>
			   </tr>
		       <tr>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
               
                <s:iterator value="#request.nativeCourses" status="st">
               
                <tr id="tr_${cid}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  <td><div align="center">${courseName}</div></td>
                  <td><div align="center"><s:property value="%{courseTheoryCredit+coursePracticeCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryCredit}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticeCredit}"/></div></td>
                  
                  <td><div align="center"><s:property value="courseTheoryPeriod+coursePracticePeriod"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseTheoryPeriod}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${coursePracticePeriod}"/></div></td>
                  
                  <td><div align="center"><fmt:formatNumber value="${courseTerm}"/></div></td>
                  <td><div align="center"><fmt:formatNumber value="${courseWeekPeriod}"/></div></td>
                  <td><div align="center">${courseExam}</div></td>
                  <td><div align="center">${courseOpenDepartment}</div></td>
                  <td><div align="center">${courseSpecialty}</div></td>
                  <td><div align="center">
                   <input type="button" value="删除课程" class="button09" onclick="javaScript:deleteData('${cid}')"/>
                   </div></td>
                </tr>
                </s:iterator>
                
                </table>
             
            </table>
            
            </td>
        </tr>
        
      </table>
       </fieldset>
       </s:if>
       
       <s:else>
       	<div style="color:red; font-size:24px">暂无数据！请在上面正确地选择 系别 专业 学期 等信息！</div>
       </s:else>
		</td>
        </tr>
      </table>
<br/>
</td>
</tr>
</table>
</td>
</tr>
</table>

</body>
</html>