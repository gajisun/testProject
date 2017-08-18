<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- IsMember.jsp -->
<%
//로그인 여부 판단
	if(session.getAttribute("USER_ID")==null){
		out.println("<script>");
		out.println("alert('로그인 후 이용하세요')");
		//out.println("location.href="+request.getContextPath()+"/Session_06/Login.jsp");
		out.println("location.replace('"+request.getContextPath()+"/Session_06/Login.jsp')");
		out.println("</script>");
	}

%>