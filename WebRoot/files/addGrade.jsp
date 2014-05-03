<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加年级----百色学院教务管理系统</title>
<link rel="stylesheet"  href="../css/style.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function year(){

	var myDate = new Date();

	var year = myDate.getFullYear();
	$("#year_id").append("<option selected='selected' value="+year+">" + year + " 级</option>");
    for(var i=-2;i<=3;i++){
    	//if(i==0)continue;
    	$("#year_id").append("<option value="+(year+i)+">" +(year+i)+" 级</option>");
    }
}

function deleteData(order_id){
    var confirm_ = confirm('你确定删除吗？');
    if(confirm_){
        $.ajax({
            type:"GET",
            url:"Grade_deleteGrade?grade.gradeId="+order_id,
            success:function(msg){
                 $("#tr_"+order_id).remove();
            }
        });
    }
}

</script>
</head>

<body onload="year();">

<form action="Grade_addGrade"  method="post" name="fom" id="fom">
  
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
				   <legend>创建年级----带有&nbsp;<span style="color='red'">*</span>&nbsp;项为必填项</legend>
					  <table border="0" cellpadding="6" cellspacing="6" style="width:100%">
					  					  
					  <tr>
					     <td nowrap="nowrap" width="30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					       创建年级:
					       <select id="year_id" name="grade.gradeNumber">
								
							</select>
							 <span style="color:red">*</span>
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
       	        已存在的年年级
       	        </td>
       	        </tr>
       	        <tr>
                <td height="40" class="font42">
              <table  class="TableLight" width="100%" border="0" cellpadding="4" cellspacing="1">
	       	   <tr>
	               <td width="20%" bgcolor="#EEEEEE"><div align="center">年级编号</div></td>
	               <td width="20%" bgcolor="#EEEEEE"><div align="center">年级名称</div></td>
	               <td width="10%" bgcolor="#EEEEEE"><div align="center">操作</div></td>
	       	   </tr>
	       	   <s:iterator value="#request.grades">
		       	   <tr id="tr_${gradeId}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'" >
	                  <td><div align="center">${gradeNumber}</div></td>
	                  <td><div align="center">${gradeName}</div></td>
	                  <td><div align="center">
	                  <input value="删除此年级" type="button" class="button10" onclick="deleteData('${gradeId}')" />
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