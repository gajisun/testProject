<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ForwardExamLogout.jsp -->
<%
	session.invalidate();

	//로그아웃 처리 후 로그인 페이지로 이동
	//response.sendRedirect("ForwardExamLogin.jsp");
%>
	<jsp:forward page="/ActionTag_07/ForwardExamLogin.jsp"/>
	
