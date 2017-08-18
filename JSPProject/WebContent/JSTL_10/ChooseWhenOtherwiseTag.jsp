<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core태그용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내가 만든 태그 라이브러리용 -->
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytablib.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ChooseWhenOtherwiseTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>choose~when~otherwise태그</legend>
		<!-- EL에서 사용할 변수 설정 -->
		<c:set var="numvar" value="101"/>
		<c:set var="strvar" value="자바"/>
		<h2>if태그로 짝/홀수 판단</h2>
		<c:if test="${ numvar mod 2 eq 0 }" var="result">
		${ numvar }는 짝수
		</c:if>
		<c:if test="${ not result }">
		${ numvar }는 홀수
		</c:if>
		<h2>choose~when~otherwise태그로 짝/홀수 판단</h2>
		<c:choose>
			<c:when test="${ numvar % 2 == 0 }">
				${ numvar }는 짝수
			</c:when>
			<c:otherwise>
				${ numvar }는 홀수
			</c:otherwise>
		</c:choose>
		<!-- choose태그 뒤에는 바로 when~otherwise태그가 와야함
			 사이에 주석이 끼면 500에러 -->
		<h2>choose~when~otherwise태그로 문자열비교</h2>
		<c:choose>
			<c:when test="${ strvar == 'JAVA' }">
				${ strvar }는 JAVA다
			</c:when>
			<c:when test="${ strvar == 'JaVa' }">
				${ strvar }는 JaVa다
			</c:when>
			<c:when test="${ strvar == '자바' }">
				${ strvar }는 자바다
			</c:when>
		</c:choose>
	</fieldset>
	<fieldset>
		<legend>점수 입력</legend>
		<form>
			국어:<input type="text" name="kor" /> 영어:<input type="text" name="eng" />
			수학:<input type="text" name="math" /> <input type="submit" value="확인" />
		</form>
		<c:set var="kor" value="${ param.kor }" />
		<c:set var="eng" value="${ param.eng }" />
		<c:set var="math" value="${ param.math }" />
		<c:if test="${ not empty kor and not empty eng and not empty math }">
			<c:if test="${ !(my:isNumber(kor)==false || my:isNumber(eng)==false || my:isNumber(math)==false) }" var="result">
				<c:choose>
					<c:when test="${ (kor+eng+math)/3 >= 90 }">A학점</c:when>
					<c:when test="${ (kor+eng+math)/3 >= 80 }">B학점</c:when>
					<c:when test="${ (kor+eng+math)/3 >= 70 }">C학점</c:when>
					<c:when test="${ (kor+eng+math)/3 >= 60 }">D학점</c:when>
					<c:otherwise>F학점</c:otherwise>
				</c:choose>
			</c:if>
			<c:if test="${ not result }">
				<span style="color:red;font-size:1.5em;font-weight:bold">숫자만 입력하세요</span>
			</c:if>
		</c:if>
	</fieldset>
	<fieldset>
		<legend>로그인</legend>
		<form method="post">
			아이디:<input type="text" name="user" /> 
			비밀번호:<input type="text" name="pass" />
			<input type="submit" value="로그인" />
		</form>
		<c:set var="user" value="${ param.user }"/>
		<c:set var="pass" value="${ param.pass }"/>
		<c:if test="${ not empty user and not empty pass }">
		<c:choose>
			<c:when test="${ my:isMember(user,pass,pageContext.servletContext)==true }">
				${ user }님 반갑습니다.
			</c:when>
			<c:otherwise>
				로그인 후 이용하세요.
			</c:otherwise>		
		</c:choose>		
		</c:if>
	</fieldset>
	
</body>
</html>