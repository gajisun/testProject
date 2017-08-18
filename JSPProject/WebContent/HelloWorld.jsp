<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="model.dataroom.DataRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.text.SimpleDateFormat,java.util.Date"
	info="JSP첫 시간입니다."
	session="true"
	buffer="8kb"
	
	%><!-- text/plain으로 하면 태그를 문자열취급해서 실행하면 다 보인다. 
				import속성은 ,로 나열 가능(원래는 따로따로 되있음)
				-->
<%@page import="java.sql.Connection" %>
<%
    	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
    	String dateString = simple.format(new Date());
    	
    	DataRoomDAO dao = new DataRoomDAO(application);
    	dao.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>HelloWorld.jsp</title>
</head>
<body>
	<h2>Hello JSP 가지선</h2>
	<fieldset>
		<legend>JSP테스트</legend>
		<h3>오늘은 <%=dateString %>일 입니다.</h3>
	</fieldset>

	<fieldset>
		<legend>[SERVLET테스트]</legend>
		<h2>
			<a href="HelloServlet.do">HELLO SERVLET</a>
		</h2>
		<span style="color: red; font-size: 1.2em; font-weight: bold">${message}</span>

		<h2>계산기</h2>
		<form action="Calculate.kosmo"> 
			<input type="text" name="firstNum" size="10" maxlength="10" /> <select
				name="operator">
				<option value="+">+</option>
				<option value="-">-</option>
				<option value="*">*</option>
				<option value="/">/</option>
			</select> <input type="text" name="secondNum" size="10" maxlength="10" /> <input
				type="submit" value="결과는" /> <span
				style="font-size: 1.4em; color: green; font-weight: bold">${calculateValue}</span>
		</form>
	</fieldset>
</body>
</html>