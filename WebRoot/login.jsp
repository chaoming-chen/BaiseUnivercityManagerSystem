<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>登录页----百色学院教务管理系统</title>

<link href="css/login.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	function cancel() {
		document.getElementById("user_name").value = '';
		document.getElementById("user_password").value = '';
		document.getElementById("user_name").focus();
	}
	function getFocus() {
		document.getElementById("user_name").focus();
	}
</script>
</head>

<body leftMargin=0 topMargin=0 MARGINWIDTH="0" MARGINHEIGHT="0"
	onload="getFocus();">
	<s:form action="Users_login" method="post">
		<TABLE cellSpacing=0 cellPadding=0 width=1004 border=0>
			<TBODY>
				<TR>
					<TD colSpan=6><img height=92 alt="" src="images/crm_1_3.jpg"
						width=345></TD>
					<TD colSpan=4><IMG height=92 alt="" src="images/crm_2_5.jpg"
						width=452></TD>
					<TD><IMG height=92 alt="" src="images/crm_3.gif" width=207></TD>
				</TR>
				<TR>
					<TD colSpan=6><img height=98 alt="" src="images/crm_4.gif"
						width=345></TD>
					<TD colSpan=4><img height=98 alt="" src="images/crm_5.gif"
						width=452></TD>
					<TD><IMG height=98 alt="" src="images/crm_6.gif" width=207></TD>
				</TR>
				<TR>
					<TD rowSpan=5><IMG height=370 alt="" src="images/crm_7.gif"
						width=59></TD>
					<TD colSpan=5><IMG height=80 alt="" src="images/crm_8.gif"
						width=286></TD>
					<TD colSpan=4><IMG height=80 alt="" src="images/crm_9.gif"
						width=452></TD>
					<TD><IMG height=80 alt="" src="images/crm_10.gif" width=207></TD>
				</TR>
				<TR>
					<TD><IMG height=110 alt="" src="images/crm_11.gif" width=127></TD>
					<TD background=images/crm_12.gif colSpan=6>
						<TABLE id=table1 cellSpacing=0 cellPadding=0 width="98%" border=0>
							<TBODY>
								<TR>
									<TD>
										<TABLE id=table2 cellSpacing=1 cellPadding=0 width="100%"
											border=0>
											<TBODY>
												<s:if test="#request.confirm!=null">
													<tr>
														<td align="right">提示：</td>
														<td><span style="color='yellow';font-size='14px'">${confirm}</span></td>
													</tr>
												</s:if>
												<TR>
													<TD align="right" width=81><FONT color=#ffffff>学/工号：</FONT></TD>
													<TD align="left"><INPUT id="user_name" class="regtxt"
														title='请填写用户名 ' type="text" name="users.userNumber"></TD>
												</TR>
												<TR>
													<TD align="right" width=81><FONT color=#ffffff>密&nbsp;&nbsp;码：</FONT></TD>
													<TD align="left"><INPUT id="user_password"
														class="regtxt" title="请填写密码 " type="password"
														name="users.userPassword"></TD>
												</TR>
												<TR>
													<TD align="right" width=81><FONT color=#ffffff>身&nbsp;
															份：</FONT></TD>
													<TD align="left"><select name="users.roles.roleNumber"
														class="regtxt">
															<option value="10" selected="selected">教研室主任</option>
															<option value="11">教务处人员</option>
															<option value="12">教学秘书</option>
															<option value="13">系主任</option>
															<option value="14">系部副主任</option>
															<option value="15">教师</option>
															<option value="16">学生</option>
															<option value="17">班干部</option>
															<option value="18">系统管理员</option>
													</select></TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD colSpan=2 rowSpan=2><img height=158 alt=""
						src="images/crm_13.gif" width=295></TD>
					<TD rowSpan=2><IMG height=158 alt="" src="images/crm_14.gif"
						width=207></TD>
				</TR>
				<TR>
					<TD rowSpan=3><IMG height=180 alt="" src="images/crm_15.gif"
						width=127></TD>
					<TD rowSpan=3><IMG height=180 alt="" src="images/crm_16.gif"
						width=24></TD>
					<TD><INPUT title="登录后台" type=image height=48 alt="" width=86
						src="images/crm_17.gif" name=image></TD>
					<TD><IMG height=48 alt="" src="images/crm_18.gif" width=21></TD>
					<TD colSpan=2><A href="javaScript:cancel();"><IMG
							title="取消" height=48 alt="" src="images/crm_19.gif" width=84
							border=0></A></TD>
					<TD><IMG height=48 alt="" src="images/crm_20.gif" width=101></TD>
				</TR>
				<TR>
					<TD colSpan=5 rowSpan=2><IMG height=132 alt=""
						src="images/crm_21.gif" width=292></TD>
					<TD rowSpan=2><IMG height=132 alt="" src="images/crm_22.gif"
						width=170></TD>
					<TD colSpan=2><IMG height=75 alt="" src="images/crm_23.gif"
						width=332></TD>
				</TR>
				<TR>
					<TD colSpan=2><IMG height=57 alt="" src="images/crm_24.gif"
						width=332></TD>
				</TR>
				<TR>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=59></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=127></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=24></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=86></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=21></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=28></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=56></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=101></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=170></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=125></TD>
					<TD><IMG height=1 alt="" src="images/spacer.gif" width=207></TD>
				</TR>
			</TBODY>
		</TABLE>

	</s:form>
</body>
</html>
