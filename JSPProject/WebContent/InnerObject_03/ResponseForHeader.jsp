<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//[응답헤더 설정]
	/*
	웹브라우저의 캐쉬를 이용하지 않겠다.
	즉 현재 페이지를 매번 서버에 요청하도록 만드는 것
	*/
	//HTTP/1.0에 적용시킬때
	response.setHeader("pragma", "no-cache");
	//HTTP/1.1에 적용시킬 때
	response.setHeader("cache-control", "no-cache");
	/*
	웹브라우저가 인식하지 못하는 content-Type(MIME타입)인 경우
	웹브라우저는 파일 다운로드창을 보여준다.
	
	※다운로드 구현시 적용
	
	IE에서는 아무값이나 가능
	FX에서는 application/unknown
			 binary/octect-stream등
	★★★★★★★
	*/
	//response.setContentType("binary/octect-stream");
	/*
	add계열:기존 헤더명 존재 시 계속 추가, 없을 시 생성됨
	set계열:기존 헤더명 존재 시 기존 헤더명의 값이 변경됨.없을 시 생성
	*/
	long time=new Date().getTime();
	//오늘날짜를 set계열로 생성-응답헤더명(Current-Date)
	response.setDateHeader("Current-Date", time);
	//특정날짜를 add계열로 생성
	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
	time=simple.parse("2017-04-11").getTime();
	//response.setDateHeader("Current-Date", time);
	response.addDateHeader("Current-Date", time);
	
	response.addIntHeader("NumberOfStudent", 24);
	
	response.setIntHeader("NumberOfStudent", 20);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ResponseForHeader.jsp</title>
</head>
<body>
	<fieldset>
		<legend>응답헤더</legend>
		<ul	style="list-style-type:upper-roman;">
			<%
				Collection<String> headerNames = response.getHeaderNames();
				for(String headerName:headerNames){
					String headerValue = response.getHeader(headerName);
			%>
			<li><%= headerName %> : <%= headerValue %></li>
			<%	}	%>
		</ul>
		<h2>응답헤더명 존재여부 판단:boolean</h2>
		<h4>Content-Type존재</h4>
		<%= response.containsHeader("Content-Type") ? "Content-Type존재" : "Content-Type존재X" %>
		<h4>Current-Date존재</h4>
		<%= response.containsHeader("Current-Date") ? "Current-Date존재" : "Current-Date존재X" %>
		<h4>Current-Date존재(소문자)</h4>
		<%= response.containsHeader("current-date") ? "Current-Date존재" : "Current-Date존재X" %>
		
	</fieldset>
</body>
</html>