<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>IfTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>if태그</legend>
		<c:set var="numvar">100</c:set>
		<c:set var="strvar" value="JAVA"/>
		<!-- if태그는 시작 태그와 종료태그를 사용해서 판단해라. 
			 else문이 없다.-->
		<h2>JSTL의 if태그로 짝/홀수 판단</h2>
		<c:if test="${ numvar mod 2 eq 0 }" var="result">
			${ numvar }는 짝수<br/>
		</c:if>
		\${ result } : ${ result }<br/>
		<c:if test="${ not result }" var="result">
			${ numvar }는 홀수<br/>
		</c:if>
		\${ result }:${ result }<br/>
		<c:if test="${ numvar mod 2 ne 0 }" var="result">
			${ numvar }는 홀수<br/>
		</c:if>
		\${ result } : ${ result }<br/>
		
		<h2>위 if문(JSTL0)을 EL의 삼항식으로 변경</h2>
		${ numvar }는 ${ numvar mod 2 eq 0 ? "짝수":"홀수"}
		
		<h2>문자열 비교</h2>
		<c:if test="${strvar == '자바'}">
		${ strvar }	<br/>	
		</c:if>
		<c:if test="${strvar ne '자바'}">
		${ strvar }는 자바가 아니다.<br/>
		</c:if>
		
		<h2>항상 출력되는 조건식</h2>
		<c:if test="${ true }">
		항상 출력되는 컨텐츠<br/>
		</c:if>
		<c:if test="${ false }">
		항상 출력안되는 컨텐츠<br/>
		</c:if>
		<!-- 
			※test속성에 EL식이 아닌 일반 값을 넣으면 무조건 거짓
	 		  또한 EL식이더라도 {}양쪽에 빈 공백이 들어가면 무조건 거짓
	 		 단,일반 값이라도 TRUE(true)인(대소문자 상관없이) 경우는 true로 판단
		 -->
		<h2>test속성에 일반값으로 조건 설정</h2>
		<c:if test="100" var="result">
		100은 참이다.<br/>
		</c:if>
		\${ result }:${ result }<br/>
		<c:if test="100>10" var="result">
		100>10은 참이다.<br/>
		</c:if>
		\${ result }:${ result }<br/>
		<c:if test="TrUe" var="result">
		TrUe는 참이다.<br/>
		</c:if>
		\${ result }:${ result }<br/>
		<c:if test="fAlse" var="result">
		fAlse는 참이다.<br/>
		</c:if>
		\${ result }:${ result }<br/>
		
		<h2>EL로 조건 설정시{}양쪽에 공백이 있으면조건이 참이라도 무조건 거짓</h2>
		<c:if test="${ true } " var="result">
		무조건 참이다.<br/>
		</c:if>
		\${ result }:${ result }<br/>
		
		<h2>표현식으로 조건 설정</h2>
		<!-- 표현식으로 조건식을 구성할때는 %>이후에 바로 "을 붙여야한다.(안그러면 500error)
			< %=이전에 빈공백이 붙으면 조건식이 true라도 결과값은 무조건 false -->
		<c:if test="<%= 100 >1 %>" var="result">
		100>1는 참이다.<br/>
		</c:if>
		\${ result }:${ result }<br/>
		
		<h2>if태그 연습</h2>
		<!-- 문]파라미터로 아이디(user)와 비밀번호(pass)를 받아서 아이디가 "KIM"이고 비밀번호가 "1234"인 경우
			 회원이라고 가정하자.
			 회원인 경우는 "\${}님 즐감하세요" 출력
			 비회원인경우는 "아이디와 비번이 틀려요" 출력
			 단, EL과 JSTL만 사용해서 구현해라. -->
		<c:if test="${ param.user ne null && param.pass ne null }">
		<!-- ${not empty param.user and not empty param.pass} --> 
			<c:if test="${ param.user eq 'KIM' && param.pass eq '1234' }" var="result">
			${ param.user }님 즐감하세요.
			</c:if>
			<c:if test='${"KIM" ne param.user && "1234" ne param.pass}'>
			<!-- not result -->
			아이디와 비번이 틀려요
			</c:if>
		</c:if>	
		
	</fieldset>
</body>
</html>