<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加学年学期----百色学院教务管理系统</title>
<link rel="stylesheet"  href="../css/style.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function year(){

	var myDate = new Date();
	/**
    myDate.getYear();       //获取当前年份(2位)
    myDate.getFullYear();   //获取完整的年份(4位,1970-????)
    myDate.getMonth();      //获取当前月份(0-11,0代表1月)
    myDate.getDate();       //获取当前日(1-31)
    myDate.getDay();        //获取当前星期X(0-6,0代表星期天)
    myDate.getTime();       //获取当前时间(从1970.1.1开始的毫秒数)
    myDate.getHours();      //获取当前小时数(0-23)
    myDate.getMinutes();    //获取当前分钟数(0-59)
    myDate.getSeconds();    //获取当前秒数(0-59)
    myDate.getMilliseconds();   //获取当前毫秒数(0-999)
    myDate.toLocaleDateString();    //获取当前日期
    var mytime=myDate.toLocaleTimeString();    //获取当前时间
    myDate.toLocaleString( );       //获取日期与时间
*/
	var year = myDate.getFullYear();
	$("#year_id").append("<option selected='selected' value="+year+""+(year+1)+">" + year+"-"+ (year+1) + "学年</option>");
    for(var i=-1;i<=5;i++){
    	//if(i==0)continue;
    	$("#year_id").append("<option value="+(year+i)+""+(year+1+i)+">" +(year+i)+"-"+ (year+1+i) + "学年</option>");
    }
}

function deleteData(order_id){
    var confirm_ = confirm('你确定删除吗？');
    if(confirm_){
        $.ajax({
            type:"GET",
            url:"YearAndTerm_deleteYearAndTerm?yearTerm.yearTermId="+order_id,
            success:function(msg){
                 $("#tr_"+order_id).remove();
            }
        });
    }
}

</script>
</head>

<body onload="year();">

<form action="YearAndTerm_addYearAndTerm"  method="post" name="fom" id="fom">
  
<div class="MainDiv">
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
</table>
<table width="88%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td>
<table width="88%" border="0" align="center" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >学年及学期创建页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		
		<tr>
			<td width="100%">
				<fieldset >
				   <legend>创建学年及学期----带有&nbsp;<span style="color='red'">*</span>&nbsp;项为必填项</legend>
					  <table border="0" cellpadding="6" cellspacing="6" style="width:100%">
					  					  
					  <tr>
					     <td nowrap="nowrap" width="30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					        学年:
					      <select id="year_id" name="yearId">
								
							</select>
							 <span style="color:red">*</span>
				        </td>
				         <td nowrap="nowrap" >学期:
					       <select id="term_id" name="termId">
								<option value="01">第一学期</option>
								<option value="02">第二学期</option>
							</select>
							 <span style="color:red">*</span>
				        </td>
					  </tr>
				  
					   <tr>
					     <td nowrap="nowrap" width="30%" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					     开始月份:
					       <select id="ytStart_id" name="yearTerm.ytStart">
								<option value="101">1月</option>
								<option value="102">2月</option>
								<option value="103">3月</option>
								<option value="104">4月</option>
								<option value="105">5月</option>
								<option value="106">6月</option>
								<option value="107">7月</option>
								<option value="108">8月</option>
								<option value="109">9月</option>
								<option value="110">10月</option>
								<option value="111">11月</option>
								<option value="112">12月</option>
							</select>
				        </td>
				         <td nowrap="nowrap">结束月份:
					       <select id="ytEnd_id" name="yearTerm.ytEnd">
								<option value="201">1月</option>
								<option value="202">2月</option>
								<option value="203">3月</option>
								<option value="204">4月</option>
								<option value="205">5月</option>
								<option value="206">6月</option>
								<option value="207">7月</option>
								<option value="208">8月</option>
								<option value="209">9月</option>
								<option value="210">10月</option>
								<option value="211">11月</option>
								<option value="212">12月</option>
							</select>
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
		<tr>
			<td  nowrap="nowrap" align="center">
			<input type="submit" name="" value="创建" class="button"/>　
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
		 </td>
		</tr>
  
  </table>
           
<table width="88%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
          <td>
          <table width="88%" align="center" cellpadding="0" cellspacing="0">
          	<tr>
               <td class="tablestyle_title">
       	        已存在的学年学期
       	        </td>
       	        </tr>
       	        <tr>
                <td height="40" class="font42">
              <table  class="TableLight" width="100%" border="0" cellpadding="4" cellspacing="1">
	       	   <tr>
	               <td width="20%" bgcolor="#EEEEEE"><div align="center">学年学期编号</div></td>
	               <td width="20%" bgcolor="#EEEEEE"><div align="center">学年学期</div></td>
	               <td width="10%" bgcolor="#EEEEEE"><div align="center">操作</div></td>
	       	   </tr>
	       	   <s:iterator value="#request.allYearAndTerm">
		       	   <tr id="tr_${yearTermId}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'" >
	                  <td><div align="center">${ytNumber}</div></td>
	                  <td><div align="center">${ytName}</div></td>
	                  <td><div align="center">
	                  <input value="删除此学年学期" type="button" class="button10" onclick="deleteData('${yearTermId}')" />
	                  </div></td>
	               </tr>
	       	   </s:iterator>
    	     </table>
    	    </td>
     	  </tr>
     	</table>
     	</td>
     	</tr>
     	</table>
  
     	
</div>
</form>

</body>
</html>