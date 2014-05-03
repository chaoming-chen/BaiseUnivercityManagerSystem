<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

  <tr>
    <td>
    <table id="subtree1"  width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
	
			<tr>
               <td height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title">
                &nbsp;&nbsp; 通识教育平台教学计划表 &nbsp;</td>
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
				<td rowspan="2"  width="4%"  bgcolor="#EEEEEE"><div align="center" style="font-weight:bold">性质</div></td>
			   </tr>
		       <tr>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="4%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
				<td width="6%" bgcolor="#EEEEEE"><div align="center">总计</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">理论</div></td>
				<td width="5%" bgcolor="#EEEEEE"><div align="center">实践</div></td>
			    </tr>
               
                <s:iterator value="#request.mustPublicCourse" status="st">
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
                  <td><div align="center">必修</div></td>
                </tr>
                </s:iterator>
                
                <s:iterator value="#request.choosePublicCourse" id="cpc" status="st">
                <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                  <td><div align="center">${courseNumber}</div></td>
                  <td><div align="center">${courseName}</div></td>
                
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  
                  <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.choosePublicCourse.size()'/>" ><div align="center">3~7学期滚动开设,以届时公布的选课计划为准</div></td>
                  </s:if>
                  <td><div align="center"></div></td>
                
                   <td><div align="center">${courseExam}</div></td>
                  <s:if test="#st.first">
                  	<td rowspan="<s:property value='#request.choosePublicCourse.size()'/>" ><div align="center">${courseOpenDepartment }</div></td>
                  	 
                  </s:if>
                  <td><div align="center">${courseExplain}</div></td>
                  <td><div align="center">选修</div></td>
                 </tr>
                 </s:iterator>
                 <tr bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">
                 <td><div align="center"></div></td>
                 <td><div align="center">选修模块要求</div></td>
                
                  <td><div align="center">10</div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center">232</div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                  <td><div align="center"></div></td>
                 </tr>
                 <tr style="font-weight:bold">
                 <td colspan="14"  bgcolor="#EEEEEE">通识教育平台总学时、学分最低要求：学时977；学分51，其中实验实训课12学分，298学时；必修41学分，选修10学分。</td>
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