<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ForEachTagGeneral.jsp</title>
<style>
	tr:NTH-CHILD(2n):HOVER {
		background-color:red !important;
	}
	tr:NTH-CHILD(2n+1):HOVER {
		background-color:yellow !important;
	}
</style>
</head>
<body>
	<fieldset>
		<legend>일반 for문 형태의 forEach태그</legend>
		<!-- 필수 속성:begin 및 end 그리고 var속성
			 step은 생략가능(생략시 1씩증가)
			 step에는 0보다 큰 정수값만 가능 -->
		<h2>JSP로 Hn태그 출력</h2>
		<%
			for(int i=1 ; i<=6 ; i++){
		%>
		<h<%=i %>>제목<%=i %></h<%=i %>>
		<% } %>
		<h2>JSTL 및 EL태그로 Hn태그 출력</h2>
		<c:forEach begin="1" end="6" var="i">
			<h${ i }>제목${i }</h${i }>
		</c:forEach>
		<h2>varStatus속성</h2>
		<!-- varStatus속성에 지정한 변수에는 반복과 관련된 정보를 
			 추상화한 클래스인 LoopTagStatus객체가 저장됨 -->
		<c:forEach begin="3" end="5" var="i" varStatus="Loop">
			<h4>${Loop.count }번째 반복</h4>
			<ul style="list-style-type:decimal-leading-zero;">
				<li>\${ Loop.index } : ${ Loop.index }</li>
				<li>\${ Loop.first } : ${ Loop.first }</li>
				<li>\${ Loop.last } : ${ Loop.last }</li>
				<li>\${ Loop.current } : ${ Loop.current }</li>
			</ul>
		</c:forEach>	
		<!-- 문]반복이 짝수번째일 때는 글자색을 red로 홀수번째일 때는 글자색을 green으로
			 단, 첫번째 반복이라면 글자색을 blue로 마지막 반복이면 cyan -->
		<h2>varStatus속성을 이용한 스타일 변경</h2>	 
		<c:forEach begin="1" end="6" var="i" varStatus="loop">
		<c:choose>
			<c:when test="${ loop.first }">
				<c:set var="color" value="blue"/>
			</c:when>
			<c:when test="${ loop.last }">
				<c:set var="color" value="cyan"/>
			</c:when>
			<c:when test="${ loop.count mod 2 eq 0 }">
				<c:set var="color" value="red"/>
			</c:when>
			<c:otherwise>
				<c:set var="color" value="green"/>
			</c:otherwise>
		</c:choose>
		<h${ i } style="color:${ color }">제목${i }</h${i }>
		</c:forEach>
		
		<h2>1부터 100까지 홀수의 합(JSTL가 EL사용)</h2>
		<c:set var="sum" value="0"/><!-- EL에서는 처음 선언된 변수는 null처리해줌으로 초기값을 0으로 생각해도 됨 -->
		<c:forEach begin="1" end="100" var="i" step="2">
			<c:set var="sum" value="${ sum+i }"/>
		</c:forEach>
		결과:${ sum }
		
		<h2>for문안의 for문</h2>
		<!-- 1 0 0 0 0
			 0 1 0 0 0
			 0 0 1 0 0 
			 0 0 0 1 0
			 0 0 0 0 1 -->
		<c:forEach begin="1" end="5" var="i">
			<c:forEach begin="1" end="5" var="j">
				<c:if test="${ i eq j }">
					1&nbsp;
				</c:if>
				<c:if test="${ i ne j }">
					0&nbsp;
				</c:if>
			</c:forEach>
			<br/>
		</c:forEach>
		
		<h2>구구단 출력</h2>
		<!-- 짝수행에 마우스 오버시 빨강/홀수행에 마우스 오버시 노랑
			 마우스 아웃시는 흰색 -->
		<table style="width:600px;border-spacing:1;background-color:green">
		<c:forEach begin="1" end="9" var="i" varStatus="loop">
			<!-- inline으로 처리 
			<c:if test="${loop.count mod 2 eq 0 }">
				<c:set var="color" value="red"/>
			</c:if>
			<c:if test="${loop.count mod 2 ne 0 }">
				<c:set var="color" value="yellow"/>
			</c:if>
			<tr style="background-color:white" 
				onmouseover="this.style.backgroundColor = '${color}'" 
				onmouseout="this.style.backgroundColor = 'white'"> 
			-->
			<tr style="background-color:white" >
			<c:forEach begin="2" end="9" var="j">
				<td>${j}*${i}=${j*i}</td>
			</c:forEach>	
			</tr>	
			
		</c:forEach>	
		</table>
		
		
	</fieldset>
</body>
</html>