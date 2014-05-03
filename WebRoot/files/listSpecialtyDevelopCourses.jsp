、<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
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
 	   <s:if test="#request.comfirm!=null">
  			<script language="javascript">alert('${comfirm}')</script>
       		<tr><td bgcolor="#e3e3e3"><span style="color='red';font-size='20px'"><b>${comfirm}</b></span></td></tr>
       	</s:if>
  <tr>
    <td>
    <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
	
			<tr>
               <td height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                &nbsp;&nbsp; 专业发展课程平台教学计划表（选修） &nbsp;</td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table class="TableLight"  width="100%" border="0" cellpadding="4" cellspacing="1">
               <tr>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程编码</div></td>
				<td rowspan="2"  width="20%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">课程名称</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;分</div></td>
				<td colspan="3" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学&nbsp;&nbsp;&nbsp;&nbsp;时</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">学期</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">周学时</div></td>
				<td rowspan="2"  width="5%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">考试考查</div></td>
				<td rowspan="2"  width="10%" bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">开课单位</div></td>
				<td rowspan="2"  bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">备&nbsp;&nbsp;注</div></td>
			   </tr>
		       <tr>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
                
                <s:iterator value="#request.specialtyDevelopCourse" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  <td><div align="center">${courseNumber}</div></td>
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
                  <td><div align="center">${courseExplain}</div></td>
                </tr>
                </s:iterator>
               
                 <tr style="font-weight:bold">
                 <td colspan="14"  bgcolor="#EEEEEE">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业发展课平台总学时、学分最低要求：720学时；36学分。其中，实验实训课18学分，360学时。
                 <br/>
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;此平台课程要求按模块选择修读，不选具体某门课程。即学生选修某能力模块课程，须修完该模块所包含的所有课程。
			     <br/>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;静态网页技术能力模块课程和专业辅助能力课程将面向计算机学科所有专业开设，根据学生选课情况，4年内滚动开出。
				</td>
                 </tr>
                </table>
             
            </table>
            </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br/>
<br/>

</body>
</html>