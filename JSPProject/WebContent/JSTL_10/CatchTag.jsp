<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>CatchTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>catch태그</legend>
		<!-- -EL에서 오류날 때 에러 처리시 주로 사용
			 -에러내용을 원하는 위치에서 출력하고자 할 때 사용
			 -JSTL문법오류는 catch가 안됨. -->
		<c:set value="100" var="fnum"/>
		<c:set value="0" var="snum"/>
		<h2>에러가 안나는 경우:에러내용이 저장 안됨</h2>
		<c:catch var="error">
			\${ fnum/snum }:${ fnum/snum }<br/>
		</c:catch>
		${ error }
		
		<h2>에러가 나는 경우:원하는 위치에 에러내용 표시</h2>
		<c:catch var="error">
		\${ "백"+100 }:${ "백"+100 }<br/>
		</c:catch>
		에러내용:${ error }<br/>

		<h2>JSTL문법오류는 catch안됨</h2>
		<%-- 에러나는 코드라 주석처리 함 
		<c:catch var="error">
			<c:choose>
				<!-- 주석 -->
				<c:when test="true">참이다</c:when>
				<c:otherwise>거짓이다</c:otherwise>
			</c:choose>
		</c:catch>
		--%>

	</fieldset>
</body>
</html>