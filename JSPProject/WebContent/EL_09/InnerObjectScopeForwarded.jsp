<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>InnerObjectScopeForwarded.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 xxxScope계열 내장 객체</legend>
		<h2>자바코드로 영역에 저장된 속성 읽기</h2>
		<ul style="list-style-type:upper-roman;">
			<li>pageContext.getAttribute("scopevar"):<%= pageContext.getAttribute("scopevar")%></li>
			<li>request.getAttribute("scopevar"):<%= request.getAttribute("scopevar")%></li>
			<li>session.getAttribute("scopevar"):<%= session.getAttribute("scopevar")%></li>
			<li>application.getAttribute("scopevar"):<%= application.getAttribute("scopevar")%></li>		
		</ul>
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
</body>
</html>