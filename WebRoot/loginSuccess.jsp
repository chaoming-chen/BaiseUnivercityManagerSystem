<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Struts2 test</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<LINK href="css/style.css" type=text/css rel=stylesheet>
	<SCRIPT language=javaScript src="js/admin.js" type=text/javascript></SCRIPT>
  </head>
  
  <BODY style="MARGIN: 0px"><!--导航部分-->
<DIV class=top_table>
<DIV class=top_table_leftbg>
<DIV class=system_logo>

</DIV>
<DIV class=menu>
<UL>
  <LI id=menu_0 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="#">学校概况</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="#" 
    target=frmright>学校概况列表</A> </LI>
    <LI><A href="#" 
    target=frmright>添加学校概况</A> </LI>
    <LI><A href="#" 
    target=frmright>生成学校概况列表</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="images/menu01_right.gif"></DIV></LI>
  <LI id=menu_1 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="#">学生学籍</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="#" 
    target=frmright>注册信息</A> </LI>
    <LI><A href="#" 
    target=frmright>学籍档案</A> </LI>
    <LI><A href="#" 
    target=frmright>学籍异动</A> </LI>
   </UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="images/menu01_right.gif"></DIV></LI>
  <LI id=menu_2 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="#">网上选课</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A 
    href="#" 
    target=frmright>正选</A> </LI>
    <LI><A href="#" 
    target=frmright>补选</A> </LI>
    <LI><A href="#" 
    target=frmright>退选</A> </LI>
    </UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="images/menu01_right.gif"></DIV></LI>
  <LI id=menu_3 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="#">学生成绩</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A 
    href="#" 
    target=frmright>查看成绩</A> </LI>
    <LI><A href="#" 
    target=frmright>申请重修</A> </LI>
    <LI><A href="#" 
    target=frmright>申请免修</A> </LI>
    </UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="images/menu01_right.gif"></DIV></LI>
  <LI id=menu_4 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="#">网上评教</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="#" 
    target=frmright>教学评价表</A> </LI>
    <LI><A href="#" 
    target=frmright>问卷调查表</A> </LI>
    </UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="images/menu01_right.gif"></DIV></LI>
  <LI id=menu_5 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="#">其他信息</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A 
    href="#" 
    target=frmright>信息类别</A> </LI>
    <LI><A href="#" 
    target=frmright>信息列表</A> </LI>
    <LI><A href="#" 
    target=frmright>添加信息</A> </LI>
    <LI><A href="#" 
    target=frmright>生成其他信息分类页面</A> </LI>
    <LI><A href="#" 
    target=frmright>生成其他信息详细页面</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="images/menu01_right.gif"></DIV></LI>
  <LI id=menu_7 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="#">访客反馈</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="#" 
    target=frmright>留言信息</A> </LI>
    <LI><A href="#" 
    target=frmright>订单信息</A> </LI>
    <LI><A href="#" 
    target=frmright>人才信息</A> </LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="images/menu01_right.gif"></DIV></LI>
  <LI id=menu_8 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="#">用户管理</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="#" 
    target=frmright>网站管理员</A> </LI>
    <LI><A href="#" 
    target=frmright>前台会员</A> </LI>
    <LI><A href="#" 
    target=frmright>会员组别</A></LI></UL></DIV>
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="images/menu01_right.gif"></DIV></LI>
  <LI id=menu_10 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A 
  href="#">系统管理</A> 
  <DIV class=menu_childs onmouseout=Menus.Hide(0);>
  <UL>
    <LI><A href="#" 
    target=frmright>修改密码</A> </LI>
    
    <LI><A href="#" 
    target=frmright>数据库操作</A> </LI>
   
    <LI><A href="#" 
    target=frmright>访问统计</A> </LI>
    <LI><A href="#" 
    target=frmright>链接</A> </LI>
    <LI><A href="#" target=frmright>使用帮助</A></LI></UL></DIV>
  
  
  <DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" 
  src="images/menu01_right.gif"></DIV></LI></UL></DIV></DIV></DIV>
<DIV style="BACKGROUND: #337abb; HEIGHT: 24px"></DIV><!--导航部分结束-->
<TABLE style="BACKGROUND: #337abb" height="92%" cellSpacing=0 cellPadding=0 
width="100%" border=0>
  <TBODY>
  <TR>
    <TD class=main_left id=frmTitle vAlign=top align=middle name="fmTitle">
      <TABLE class=main_left_top cellSpacing=0 cellPadding=0 width="100%" 
      border=0>
        <TBODY>
        <TR height=32>
          <TD vAlign=top></TD>
          <TD class=main_left_title id=leftmenu_title>常用快捷功能</TD>
          <TD vAlign=top align=right></TD></TR></TBODY></TABLE><IFRAME 
      class=left_iframe id=frmleft name=frmleft 
      src="include/left.htm" frameBorder=0 
      allowTransparency></IFRAME>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR height=32>
          <TD vAlign=top></TD>
          <TD vAlign=bottom align=middle></TD>
          <TD vAlign=top align=right></TD></TR></TBODY></TABLE></TD>
    <TD style="WIDTH: 10px" bgColor=#337abb>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD style="HEIGHT: 100%" onclick=switchSysBar()><SPAN class=navPoint 
            id=switchPoint title=关闭/打开左栏><IMG 
            src="images/right.gif"></SPAN> 
        </TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top width="100%" bgColor=#337abb>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed 
        border=0><TBODY>
        <TR height=32>
          <TD vAlign=top width=10 
          background=images/bg2.gif><IMG alt="" 
            src="images/teble_top_left.gif"></TD>
          <TD width=28 
          background=images/bg2.gif></TD>
          <TD background=images/bg2.gif><SPAN 
            style="FLOAT: left">网域高科学校网站管理系统中英繁生成静态网页html</SPAN><SPAN 
            id=dvbbsannounce 
            style="FONT-WEIGHT: bold; FLOAT: left; WIDTH: 300px; COLOR: #c00"></SPAN></TD>
          <TD style="COLOR: #135294; TEXT-ALIGN: right" 
          background=images/bg2.gif>| <A 
            href="#" target=_top>后台首页</A> 
            | <A href="#" target=_top>首页</A> | <A 
            href="javascript:AdminOut()" target=_top>退出</A> </TD>
          <TD vAlign=top align=right width=28 
          background=images/bg2.gif><IMG alt="" 
            src="images/teble_top_right.gif"></TD>
          <TD align=right width=16 bgColor=#337abb></TD></TR></TBODY></TABLE><IFRAME 
      class=main_iframe id=frmright name=frmright 
      src="include/syscome.htm" frameBorder=0 
      scrolling=yes></IFRAME>
      <TABLE style="BACKGROUND: #c4d8ed" cellSpacing=0 cellPadding=0 
      width="100%" border=0>
        <TBODY>
        <TR>
          <TD><IMG height=6 alt="" 
            src="images/teble_bottom_left.gif" 
            width=5></TD>
          <TD align=right><IMG height=6 alt="" 
            src="images/teble_bottom_right.gif" 
            width=5></TD>
          <TD align=right width=16 
  bgColor=#337abb></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<DIV id=dvbbsannounce_true style="DISPLAY: none"></DIV>
</BODY>
</html>
