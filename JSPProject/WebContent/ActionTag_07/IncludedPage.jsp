<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>IncludedPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>포워드된 페이지</legend>
		<h2>파라미터로 전달된 데이터</h2>
		<ul style="list-style-type:upper-roman;">
			<li>query:<%= request.getParameter("query") %></li>
			<li>name:<%= request.getParameter("name") %></li>
			<li>id:<%= request.getParameter("id") %></li>
		</ul>
		<h2>영역에 저장된 데이터</h2>
		<%= request.getAttribute("member") %>
	</fieldset>
</body>
</html>