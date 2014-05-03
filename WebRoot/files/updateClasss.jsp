<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百色学院统一教务管理系统</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="../js/jquery.js"></script>
<script type="text/javascript">
    function deleteData(order_id){
        var confirm_ = confirm('你确定删除吗？');
        if(confirm_){
            $.ajax({
                type:"GET",
                url:"Classs_deleteClass?classes.cid="+order_id,
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
    		$.each(data,function(i){ 
      	     	$("#system_name").append("<option value="+data[i].systemName+">" + data[i].systemName + "</option>");
    		});
    	});
    }

    
    function getNativeSpecialtyName(){
    	var systemName = $("#system_name").val();
       	$.getJSON("NativeSpecialtys_getNativeSpecialtyName", "name="+encodeURI(systemName,"UTF-8"), function(data){
    		$("#specialty_name option").remove();
    		$("#specialty_name").append("<option>===请选择所属专业===</option>");
    		$.each(data,function(i){ 
      	     	$("#specialty_name").append("<option value="+data[i].specialtyName+">" + data[i].specialtyName + "</option>");
    		});
    	});
    	$("#select_system").val(systemName);
    }

    function getGradesByJSON(){
    	$.getJSON("Grade_getGradesByJSON", "", function(data){
    	$("#classGrade_id option").remove();
    	$("#classGrade_id").append("<option>=====请选择年级=====</option>");
    	$.each(data,function(i){
         	$("#classGrade_id").append("<option value="+data[i]['gradeNumber']+">" + data[i]['gradeName'] + "</option>");
    	});
    });
    }

    function selectSpecialtyName(){
    	$("#select_specialty").val($("#specialty_name").val());
    }

    function findClassesBySpecialty(){
    	var systemName = $("#system_name").val();
    	var specialtyName = $("#specialty_name").val();
    	$.getJSON("Classs_findClassesBySpecialty", "name="+encodeURI(specialtyName,"UTF-8"), function(data){
    		$("#class_title span").remove();
    		$("#class_title").append("<span>"+systemName+" "+specialtyName+"专业  所有班级列表</span>");
    		$("#classes_tab tr").remove();
    		var $str="";
    		$str+="<tr>";
    		$str+="<td width='10%' align='center' bgcolor='#EEEEEE'>班级编号</td>";
    		$str+="<td width='10%' align='center' bgcolor='#EEEEEE'>班级名称</td>";
            $str+="<td width='10%' align='center' bgcolor='#EEEEEE'>所属专业</td>";
            $str+="<td width='10%' align='center' bgcolor='#EEEEEE'>所属系别</td>";
            $str+="<td width='10%' align='center' bgcolor='#EEEEEE'>辅导员</td>";
            $str+="<td width='10%' align='center' bgcolor='#EEEEEE'>联系电话</td>";
            $str+="<td width='10%' align='center' bgcolor='#EEEEEE'>操作</td>";
            $str+="</tr>";
           	$("#classes_tab").append($str);
    		
    		$.each(data,function(i){
    			$str="";
      	    	$str+="<tr bgcolor='#FFFFFF'  onmousemove='this.style.background=\"lightblue\";this.style.color=\"blue\"' onmouseout='this.style.background=\"#ffffff\";this.style.color=\"black\"'>";	  
    	        $str+="<td><div align='center'>"+data[i].classNumber+"</div></td>";
    	        $str+="<td><div align='center'>"+data[i].className+"</div></td>";
    	        $str+="<td><div align='center'>"+data[i].classSpecialty+"</div></td>";
    	        $str+="<td><div align='center'>"+data[i].classSystem+"</div></td>";
    	        $str+="<td><div align='center'>"+data[i].classTeacher+"</div></td>";
    	        $str+="<td><div align='center'>"+data[i].classPhone+"</div></td>";
    	        $str+="<td><div align='center'><input value='编辑' type='button' class='button04' onclick='javaScript:location.href=\"Classs_editClass?classes.cid="+data[i].cid+"\"'/>";
    			$str+="<input value='删除' type='button' class='button04' onclick='deleteData("+data[i].cid+")'/></div></td>";
    		    $str+="</tr>";
    		    $("#classes_tab").append($str);
    		});
    	});
    }

    function outputClass(){
    	var sname = $("#specialty_name").val();
    	location.href="Classs_outputClass?name="+encodeURI(sname,"UTF-8");
    }
</script>
</head>


<body onload="getSystemName();">
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
  <tr>
    <td>
    </table>
     <table width="88%" border="0" cellpadding="0" cellspacing="0" >
<tr>
	<td>
   <table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >班级更新页面</th>
  </tr>
  <tr>
    <td class="CPanel">
  <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
  <tr>
    <td>
     <fieldset>
		<legend> <span style="color='red'; font-size='16'">&nbsp;&nbsp;&nbsp;&nbsp;请选择要查询班级所属的系别和专业</span></legend>
			<table border="0" cellpadding="2" cellspacing="2" style="width:100%"> 
			 <tr>
			     <td nowrap="nowrap" align="right" width="20%">所属系别:</td>
			     <td width="79%">
			    	<select id="system_name" name="classes.classSystem" class="regtxt" onchange="getNativeSpecialtyName();">
						<option>===请选择所属系别===</option>
					</select>
					 <span style="color='red'">*</span>
		        	<input id="select_system" type="text" size="24" disabled="disabled" />
		        </td>
			  </tr>
			  
			  <tr>
			     <td nowrap="nowrap" align="right" width="20%">所属专业:</td>
			     <td width="79%">
			      <select id="specialty_name" name="classes.classSpecialty" class="regtxt" onchange="selectSpecialtyName();">
						<option>===请选择所属专业===</option>
					</select>
					 <span style="color='red'">*</span>
		        	<input id="select_specialty" type="text" size="24" disabled="disabled" />
		        </td>
			 </tr>
			  <tr>
			  <td>&nbsp;</td>
			<td  nowrap="nowrap" align="center">
			<input type="button" name="button2" value= "确定" class="button" onclick="findClassesBySpecialty();"/>　
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
  </table>
    <table id="subtree1" style="DISPLAY: " width="88%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="88%" align="center" cellpadding="0" cellspacing="0" class="CContent">
	
			<tr>
               <td  id="class_title"  height="20" colspan="9" align="center" bgcolor="#EEEEEE" class="tablestyle_title"> 
               		 <span>班级列表</span></td>
               </tr>
              <tr>
                <td height="40" class="font42">
                <table  class="TableLight"  id="classes_tab"  width="100%" border="0" cellpadding="4" cellspacing="1" >
                  <tr>
                    <td width="10%" align="center" bgcolor="#EEEEEE">班级编号</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">班级名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所属专业</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">所属系别</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">辅导员</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">联系电话</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <s:iterator value="#request.classes">
                  <tr id="tr_${cid}" bgcolor="#FFFFFF" onmousemove="this.style.background='lightblue';this.style.color='blue'" onmouseout="this.style.background='#ffffff';this.style.color='black'">	  
                    <td><div align="center">${classNumber}</div></td>
                    <td><div align="center">${className}</div></td>
                    <td><div align="center">${classSpecialty}</div></td>
                    <td><div align="center">${classSystem}</div></td>
                    <td><div align="center">${classTeacher}</div></td>
                    <td><div align="center">${classPhone}</div></td>
                     <td>
                     <div align="center"><input value="编辑" type="button" class="button04" onclick="javaScript:location.href='Classs_editClass?classes.cid=${cid}'"/>
                     <input value="删除" type="button" class="button04" onclick="deleteData('${cid}')" />
                     </div>
                     </td>
                  </tr>
                  </s:iterator>
                </table>
            </table>
            </td>
        </tr>
      </table>

</form>
</body>
</html>