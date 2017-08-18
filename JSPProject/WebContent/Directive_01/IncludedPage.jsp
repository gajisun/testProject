<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- IncludedPage.jsp -->
<!-- 여러 JSP페이지에서 공통으로 사용할 변수나 상수, 메소드 정의 -->
<%
	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
	String todayString = simple.format(new Date());
%>