<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>OutTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>out태그</legend>
		<!-- JSTL주석처리는 HTML주석처리하듯이 하거나 혹은 JSP주석처리하듯이 한다. -->
		<!-- 
		<c:out value="HTML주석처리하듯이 JSTL주석처리하기"/>
		 -->
		<%-- 
		<c:out value="JSP주석처리하듯이 JSTL주석처리하기"/>
		 --%>
		<c:set var="htmlString"><h3>h3태그로 감싼 문자열</h3></c:set>
		<!-- escapeXml이 true(디폴트)이면 HTML코드를 escape문자로 바꿔서 출력(예: > 는 &gt; 등)
			 false이면  HTML코드를 해석되어 출력 
			 고로 웹브라우저에 의해 실행됨-->
		<h2>escapeXml = true(기본값)-HTML태그 그대로 출력</h2> 
		<c:out value="${ htmlString }" escapeXml="true"/><br/>
		
		<h2>escapeXml=false -HTML태그가 해석되서 출력(EL과 동일)</h2>
		<c:out value="${ htmlString }" escapeXml="false"></c:out> 
		\${ htmlString } : ${ htmlString }
		<h2>default속성</h2>
		<!-- value속성에 값이 없을 때 default속성에 지정한 값을 출력함. -->
		<h4>값이 빈 문자열인 경우:값이 null이 아닌경우(값이 있다.)</h4>
		<c:out value="" default="빈 문자열"/>
		<h4>값이 null인 경우(값이 없다.)</h4>
		<c:out value="${ param.name }" default="김철수"/>
		
		<h4>페이지 링크에 응용</h4>
		<c:url value="/BBS_08/List.jsp?nowPage="/><br/>
		<c:out value="${ param.nowPage }" default="1"/><br/>
		<a href='<c:url value="/BBS_08/List.jsp?nowPage="/><c:out value="${ param.nowPage }" default="1"/>'>회원제 게시판</a>
	</fieldset>
</body>
</html>