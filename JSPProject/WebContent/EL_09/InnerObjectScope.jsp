<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		EL에서는 각 영역에 저장된 속성을 읽어  올 수 있는 xxxScope계열 내장 객체를 제공함.
		읽어 올때 : xxxxScope.속성명 혹은 xxxxScope["속성명"]
		또한 XXXScope는 생략가능, 생략시 가장 작은 영역에 있는값을 읽어옴
	*/
	//각 영역에 속성 저장(JSP기본 내장객체로)
	pageContext.setAttribute("scopevar", "페이지 영역");
	request.setAttribute("scopevar", "리퀘스트 영역");
	session.setAttribute("scopevar", "세션 영역");
	application.setAttribute("scopevar", "어플리케이션 영역");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>InnerObjectScope.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 xxxScope계열 내장 객체</legend>
		<h2>각 영역에 저장된 속성 읽기(xxxScope지정)</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${ pageScope.scopevar }:${ pageScope.scopevar }</li>
			<li>\${ requestScope.scopevar }:${ requestScope.scopevar }</li>
			<li>\${ sessionScope["scopevar"] }:${ sessionScope["scopevar"] }</li>
			<li>\${ applicationScope["scopevar"] }:${ applicationScope["scopevar"] }</li>		
		</ul>
		<h2>각 영역에 저장된 속성 읽기(xxxScope미지정)</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${ scopevar }:${scopevar }</li>
			<li>\${ scopevar }:${scopevar }</li>
			<li>\${ scopevar }:${scopevar }</li>
			<li>\${ scopevar }:${scopevar }</li>
		</ul>
	</fieldset>
	<jsp:forward page="InnerObjectScopeForwarded.jsp" />
</body>
</html>