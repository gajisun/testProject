<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>FormatDateTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>formatDate태그</legend>
		<!-- JSTL로 date타입의 날짜 변수 설정 -->
		<c:set var="today" value="<%= new Date() %>"/>
		<h2>필수 속성만 사용</h2>
		<!-- value는 필수속성, 단 날짜타입이 와야함
			 type은 기본값:date
			 dateStyle기본값:default -->
		<h4>EL로 출력</h4>
		\${ today }:${ today }
		<h4>JSTL로 출력</h4>
		<fmt:formatDate value="${ today }" />
		<h4>type="date",dateStyle="short"</h4>
		<fmt:formatDate value="${ today }" dateStyle="short"/>
		<h4>type="date",dateStyle="medium"</h4>
		<fmt:formatDate value="${ today }" dateStyle="medium"/>
		<h4>type="date",dateStyle="long"</h4>
		<fmt:formatDate value="${ today }" dateStyle="long"/>
		<h4>type="date",dateStyle="full"</h4>
		<fmt:formatDate value="${ today }" dateStyle="full"/>
		
		<h4>type="time",timeStyle="default"</h4>
		<fmt:formatDate value="${ today }" type="time"/>
		<h4>type="time",timeStyle="short"</h4>
		<fmt:formatDate value="${ today }" type="time" timeStyle="short"/>
		<h4>type="time",timeStyle="medium"</h4>
		<fmt:formatDate value="${ today }" type="time" timeStyle="medium"/>
		<h4>type="time",timeStyle="long"</h4>
		<fmt:formatDate value="${ today }" type="time" timeStyle="long"/>
		<h4>type="time",timeStyle="full"</h4>
		<fmt:formatDate value="${ today }" type="time" timeStyle="full"/>
		
		<h2>pattern속성 지정-type속성 의미 없다(가장 많이 사용)</h2>
		<fmt:formatDate value="${ today }" pattern="yyyy-MM-dd HH:mm:ss"/><br />
		<fmt:formatDate value="${ today }" pattern="yyyy년 MM월 dd일"/><br />
		<fmt:formatDate value="${ today }" pattern="yyyy년 MM월 dd일 HH시mm분ss초"/><br />
		
		<h2>var속성 지정-원하는 위치에 출력</h2>
		<fmt:formatDate value="${ today }" pattern="yyyy년 MM월 dd일" var="promise"/>
		<h4>모임 날짜</h4>
		모임은 <span style="color:green;font-size:1.8em">${ promise }</span>입니다.
	</fieldset>
</body>
</html>