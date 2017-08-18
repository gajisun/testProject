<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ELError.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL에서 에러가 발생하거나, 값이 출력 안되는 경우</legend>
		<h2>+를 숫자가 아닌 문자열 연결에 사용시(에러)</h2>
		<ul style="list-style-type:upper-alpha;">
			<li>\${ "100"+100 }:${ "100"+100 }</li>
			<li>\${ "백"+100 }:\${ "백"+100 }[에러]</li>
			<li>\${ "Hello"+" Hi" }:\${ "Hello"+" Hi" }[에러]</li>
		</ul>
		<h2>특수문자가 포함된 속성에 .으로 접근시</h2>
		<ul style="list-style-type:upper-latin;">
			<li>\${ header["user-agent"] } : ${ header["user-agent"] }</li>
			<li>\${ header.user-agent } : ${ header.user-agent }[에러 NO, 0출력]</li>
		</ul>
		<h2>.인덱스로 접근시(배열이나 리스트계열 컬렉션)</h2>
		<%
			String[] mountains = {"설악산", "한라산", "송리산"};
			List collection = new Vector();
			for(String mountain:mountains)
				collection.add(mountain);
		%>
		<c:set var="mountains" value="<%= mountains %>"/>
		<c:set var="collection" value="<%= collection %>"/>
		<ul style="list-style-type:upper-latin;">
			<li>\${ mountains[0] }:${ mountains[0] }</li>
			<li>\${ collection[0] }:${ collection[0] }</li>
			<li>\${ mountains.0 }:\${ mountains.0 }[에러]</li>
			<li>\${ collection.0 }:\${ collection.0 }[에러]</li>
		</ul>
		<h2>배열과 리스트계열 컬렉션 출력</h2>
		<h4>배열</h4>
		<c:forEach var="item" items="${ mountains }">
			${ item }<br/>
		</c:forEach>
		<h4>컬렉션</h4>
		<c:forEach var="item" items="${ mountains }">
			${ item }<br/>
		</c:forEach>
		<h2>배열이나 컬렉션의 인덱스를 벗어난 경우(에러 X, 값만 출력 안됨)</h2>
		<ul style="list-style-type:upper-latin;">
			<li>\${ mountains[3] } : ${ mountains[3] }</li>
			<li>\${ collection[3] } : ${ collection[3] }</li>
		</ul>
		<h2>없는 속성이거나, 속성은 존재하지만 getter가 없는 경우(자바빈)</h2>
		<% MemberDTO member = new MemberDTO("KIM", "1234", "김길동", null, null); %>
		<c:set var="member" value=" <%= member %> "/>
		<ul style="list-style-type:upper-latin;">
			<li>존재하지 않는 속성:\${ member.addr } [PropertyNotFoundException 에러]</li>
			<li>속성은 존재, getter가 없다:\${ member.id }[에러]]</li>
			<li>EL변수명이 틀린 경우:\${ members.id }[에러No,출력X]</li>
		</ul>
		<h2>EL내장객체의 없는 속성으로 접근시</h2>
		<ul style="list-style-type:upper-alpha;">
			<li>\${ requestScope.noproperty }:${ requestScope.noproperty }[Scope계열 내장객체 에러X, 출력X-속성명은 개발자 마음대로이기 때문에]</li>
			<li>\${ pageContext.noproperty }:\${ pageContext.noproperty }[컴파일오류 발생 에러-속성명이 정해져있기 때문에, 즉 게터호출과 같다.]</li>
		</ul>
		<h2>EL의 내장객체중 사용자가 정의한 속성에 접근하는 내장객체(Scope계열/param계열) 및 맴 컬렉션인 경우,<br/> 
		존재하지 않은 속성이나 키값으로 접근시 null임으로 에러는 안나고 출력만 안됨</h2>
		<%
			request.setAttribute("myRequest", "리퀘스트 영역");
			Map map = new HashMap();
			map.put("mymap", "맵 컬렉션");
			
		%>
		<c:set var="map" value="<%= map %>" />
		<ul style="list-style-type:upper-roman;">
			<li>\${ requestScope.myRequest } : ${ requestScope.myRequest }</li>
			<li>\${ requestScope.yourrequest } : ${ requestScope.yourrequest }</li>
			<li>\${ map.mymap }:${ map.mymap }</li>
			<li>\${ map.ymap }:${ map.ymap }</li>
		</ul>
		<h2>숫자를 0으로 나누면 INFINITY</h2>
		\${ 100/0 } : ${ 100/0 }
		<h2>EL변수에 값 할당시[톰캣 8.0이상부터는 정상. 그 이전버전은 에러/사용 비추]</h2>
		<c:set var="number" value="100"/>
		데이터 변경 전:${ number }<br/>
		데이터 변경 후:${ number=1 }
		<hr/>
		<h2>임의의 변수로 .을 통해서 접근시-오류</h2>
		<ul style="list-style-type:decimal;">
			<li>\${ kosmo } : ${ kosmo }[NO에러,No출력]</li>
			<li>\${ kosmo.name } : ${ kosmo.name }[NO에러,No출력]</li>
			<li>\${ kosmo["name"] } : ${ kosmo["name"] }[NO에러,No출력]</li>
		</ul>
		
		
		
	</fieldset>
</body>
</html>