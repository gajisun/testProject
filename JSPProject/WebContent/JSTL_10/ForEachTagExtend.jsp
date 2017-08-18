<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ForEachTagExtend.jsp</title>
</head>
<body>
	<fieldset>
		<legend>확장 for문 형태의 forEach태그</legend>
		<!-- 필수 속성:item 및 var
			 -배열이나 컬렉션에서 값을 꺼내올 때 사용
			 -varStatus에 지정한 LoopStatusTag객체의 index속성은 항상 0부터 시작 -->
		<% String[]colors={"red","green","blue","#997856"}; %>
		<h2>JSP로 배열 출력</h2>
		<% for(String color:colors){ %>
			<h4 style="color:<%= color%>">JSP</h4>
		<%} %>
		<h2>JSTL 및 EL로 배열 출력</h2>
		<c:set var="colors" value="<%= colors %>"/>
		<c:forEach var="color" items="${ colors }">
			<h4 style="color:${ color}">JSP</h4>
		</c:forEach>
		
		<h2>varStatus속성</h2>
		<c:forEach var="color" items="${ colors }" varStatus="loop">
			<h4>${loop.count }번째 반복</h4>
			<ul style="list-style-type:decimal-leading-zero;">
				<li>\${ loop.index } : ${ loop.index }</li>
				<li>\${ loop.first } : ${ loop.first }</li>
				<li>\${ loop.last } : ${ loop.last }</li>
				<li>\${ loop.current } : ${ loop.current }</li>
			</ul>
		</c:forEach>
		
		<h2>리스트 계열 컬렉션</h2>
		<%
			List list=new Vector();
			list.add(new MemberDTO("KIM", "1111", "김길동", null,null));
			list.add(new MemberDTO("LEE", "2222", "이길동", null,null));
			list.add(new MemberDTO("PARK", "3333", "박길동", null,null));
		%>
		<c:set var="list" value="<%= list %>"/>
		<h2>일반 for문 형태의 forEach태그로 출력</h2>
		<ul style="list-style-type:decimal;">
		<c:forEach begin="1" end="${ list.size() }" var="i">
			<li>아이디:${ list[i-1].id },비번:${ list[i-1].pwd },이름:${ list[i-1].name }</li>
		</c:forEach>
		</ul>
		
		<h2>확장 for문 형태의 forEach태그로 출력</h2>
		<ul style="list-style-type:decimal;">
		<c:forEach var="item" items="${ list }">
			<li>아이디:${ item.id },비번:${ item.pwd },이름:${ item.name }</li>
		</c:forEach>
		</ul>
		
		<h2>맵 계열 컬렉션</h2>
		<%
			Map map= new HashMap();
			map.put("first", list.get(0));
			map.put("second", list.get(1));
			map.put("third", list.get(2));
		%>
		<c:set var="map" value="<%=map %>"/>
		<h4>키 값을 알 때 el변수. 키값 혹은 el변수["키값"]</h4>
		<ul style="list-style-type:decimal;">
		 	<li>id:${ map.first.id },비번:${ map.first.pwd },이름:${ map.first.name }</li>
			<li>id:${ map["second"]["id"] },비번:${ map["second"]["pwd"] },이름:${ map["second"]["name"] }</li>
			<li>id:${ map.third["id"] },비번:${ map.third["pwd"]},이름:${ map.third["name"] } </li>
		</ul>
		
		<h4>키값을 모를때 (확장 for문 사용)</h4>
		<!-- 키값 얻기 : var속성에 지정한 \${EL변수명.key}
		    value값 얻기: var속성에 지정한 \${EL변수명.value} -->
		<ul style="list-style-type:decimal;">
			<c:forEach var="item" items="${ map }">
			<li>키:${item.key }, value=> 아이디:${item.value.id },비번:${ item.value.pwd },이름:${item.value.name }</li>
			</c:forEach>
		</ul>
		
	</fieldset>
</body>
</html>