<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ApplicationScopeResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>어플리케이션 영역에 저장된 속성 읽기</legend>
		<h2>리스트계열 컬렉션</h2>
		<ul style="list-style-type:decimal;">
		<%
			List<MemberDTO> list=(List)application.getAttribute("list");
			
			for(int i= 0 ; i<list.size() ; i++){
		%>
		<li><%= list.get(i) %></li>
		<% } %>
		</ul>
		<h2>맵계열 컬렉션</h2>
		<ul style="list-style-type:decimal;">
		<%
			Map<String,MemberDTO> map=(Map<String,MemberDTO>)application.getAttribute("map");
			
			Set<String> keys=map.keySet();
			for(String key:keys){
		%>
		<li><%= map.get(key) %></li>
		<% } %>
		</ul>
	</fieldset>
</body>
</html>