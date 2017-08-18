<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//CookieExamLoginLogout.jsp
	//로그아웃 처리]
	session.invalidate();
	//로그인 페이지 이동
	response.sendRedirect("CookieExamIndex.jsp");

%>