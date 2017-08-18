<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SessionIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>session(HttpSession타입)객체의 주요 메소드</legend>
		<ul style="list-style-type:upper-roman;">
			<li>세션의 유효시간 설정(web.xml:분단위)</li>
			<li>세션의 유효시간 설정(메소드:초단위)</li>
			<% session.setMaxInactiveInterval(30); %>
			<li>세션 아이디:<a href="SessionResult.jsp"><%= session.getId() %></a></li>
			<%
			//세션의 최초 생성 시간
			long createTime = session.getCreationTime();
			SimpleDateFormat simple = new SimpleDateFormat("HH:mm:ss");
			String creationTime=simple.format(new Date(createTime));
			//클라이언트의 마지막 요청시간
			long lastTime=session.getLastAccessedTime();
			String lastTimes = simple.format(new Date(lastTime));
			%>
			<li>세션의 최초 생성시간:<%= creationTime %></li>
			<li>마지막 요청 시간:<%= lastTimes%></li>
		</ul>
		<h2>세션 및 리퀘스트 영역에 속성 저장</h2>
		<%
		request.setAttribute("requestScope", "리퀘스트 영역입니다.");
		session.setAttribute("sessionScope", "세션영역입니다.");
		%>
	</fieldset>
</body>
</html>