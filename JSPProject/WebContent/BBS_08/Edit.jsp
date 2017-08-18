﻿<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/IsMember.jsp"%>
<%
	String no=request.getParameter("no");
	//현재 페이지 받기
	String nowPage=request.getParameter("nowPage");
	BbsDAO dao = new BbsDAO(application);
	BbsDTO dto = dao.selectOne(no);
	
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<title>Edit.jsp</title>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Styles/divlayout.css" />
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!--탑메뉴 및 로고 감싸는 div시작-->
			<div class="Header">
				<jsp:include page="/Template/Top.jsp" />
			</div>
			<!--탑메뉴 및 로고 감싸는 div끝-->
			<!--left메뉴 및 실제 내용 감싸는 div시작-->
			<div class="section">
				<jsp:include page="/Template/Left.jsp" />
				<div class="body">
					<div class="content">
						<fieldset style="padding: 20px 0 50px 20px">
							<legend>게시글 수정</legend>
							<form action="EditOk.jsp" method="post">
								<input type="hidden" name="no" value="<%=no %>">
								<input type="hidden" name="nowPage" value="<%=nowPage%>">
								<table width="75%" bgcolor="gray" cellspacing="1">
									<tr bgcolor="white">
										<td width="30%" align="center">제목</td>
										<td><input type="text" name="title" style="width: 98%" value="<%= dto.getTitle() %>" />
										</td>
									</tr>
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td><textarea rows="10" style="width: 98%" name="content"><%= dto.getContent() %></textarea>
										</td>

									</tr>
									<tr bgcolor="white" align="center">
										<td colspan="2"><input type="submit" value="수정" /></td>
									</tr>
								</table>
							</form>
						</fieldset>
					</div>
				</div>
			</div>
			<!--left메뉴 및 실제 내용 감싸는 div끝-->
			<!--footer를 감싸는 div시작-->
			<jsp:include page="/Template/Footer.jsp" />
			<!-- include지시어로 페이지 포함했었음 -->
			<!--footer를 감싸는 div끝-->
		</div>
	</div>
</body>
</html>
