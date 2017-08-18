<%@page import="java.util.Collection"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL(Java Standard Tag Library)사용시 taglib지시어를 이용해서 선언
	 단, 필요한 jar파일을 WEB-INF디렉토리 밑에 lib에 넣어줘야 한다. -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ELOperator.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 연산자들</legend>
		<h2>EL에서의 null연산</h2>
		<!-- EL에서 null이 연산에 참여시 0으로 간주된다. -->
		<div>
		\${ null+10 } : ${ null+10 } <br/>
		\${ null*10 } : ${ null*10 } <br/>
		\${ param.mynumber+10 } : ${ param.mynumber+10 } <br/>
		\${ param.mynumber>10 } : ${ param.mynumber>10 }
		</div>
		<% String varInScriptlet="스크립틀릿안에서 선언한 변수"; %>
		<!-- EL표현식에서는 JSP 스크립틀릿의 요소에서 선언한 변수를 직접 사용 못한다. 값이 출력 안됨. null로 인식됨-->
		\${ varInScriptlet } : ${ varInScriptlet }<br/>
		<!-- 고로 EL식에서 사용할 변수는 JSTL을 이용해서 선언해야 한다. -->
		<h2>JSTL로 EL에서 사용할 변수 선언</h2>
		<c:set value="<%= varInScriptlet %>" var="elvar"/>		
		\${ elvar }:${ elvar }
		<c:set var="fnum" value="9"/>
		<c:set var="snum" value="5"/>
		<!-- 톰캣 8.0부터 할당가능(비 권장) -->
		<h2>EL변수에 값 할당 불가(출력만 가능)</h2>
		\${fnum=100}:\${fnum=100}
		<h2>EL의 산술 연산자</h2>
		<ul  style="list-style-type:upper-roman;">
			<li>\${ fnum+snum }:${ fnum+snum }</li>
			<li>\${ fnum-snum }:${ fnum-snum }</li>
			<li>\${ fnum*snum }:${ fnum*snum }</li>
			<li>\${ fnum div snum }:${ fnum div snum }</li>
			<li>\${ fnum mod snum }:${ fnum mod snum }</li>
			<li>\${ "100"+100 }:${ "100"+100 }</li>
			<li>\${ "Hello"+" EL!!!" }:\${ "Hello"+" EL!!!" }</li>
		</ul>
		<h2>EL의 비교 연산자</h2>
		<c:set var="fnum" value="100"/>
		<c:set var="snum" value="90"/>
		<ul style="list-style-type:decimal;">
		<!-- compareTo()와 같은 방식으로 비교한다.(모두 문자열로 취급) 첫번째 문자부터 하나씩 비교해 나간다.
			 단, 숫자로 비교할 때는 바르게 비교된다. -->
			<li>\${ fnum>snum }:${ fnum>snum }</li>
			<li>\${ 100>90 }:${ 100>90 }</li>
			<!-- 자바에서는 문자열 비교시 equals
				 EL에서는 == -->
			<li>\${ "JAVA"=='JAVA' }:${ "JAVA"=='JAVA' }</li>
			<li>\${ "Java"=='JAVA' }:${ "Java"=='JAVA' }</li>	
		</ul>
		<h2>EL의 논리 연산자</h2>
		<ul style="list-style-type:decimal;">
			<li>\${ 5>=5 && 10 != 10 }:${ 5 ge 5 and 10 ne 10 }</li>
			<li>\${ 5<6 || 10 > 100 }:${ 5 lt 6 or 10 gt 10 }</li>	
		</ul>
		<h2>EL의 삼항 연산자</h2>
		\${ 10 gt 9 ? "10은 9보다 크다" : '10은 9보다 크지않다' }:${ 10 gt 9 ? "10은 9보다 크다" : '10은 9보다 크지않다' }
		<!-- null이거나 ""이거나 배열인 경우는 길이가 0이거나 컬렉션인 경우는 size가 0인경우 true반환
			empty연산자 사용법: \${empty el변수}=>true나 false반환 -->
		<%
			String nullString = null;
			String emptyString = "";
			Integer[] lengthZero = new Integer[0];
			Collection sizeZero = new Vector();
		%>
		<!-- JSTL로 EL에서 사용할 변수 선언 -->
		<c:set var="elnullString" value="<%= nullString %>"/>
		<c:set var="elemptyString" value="<%= emptyString %>"/>
		<c:set var="ellengthZero" value="<%= lengthZero %>"/>
		<c:set var="elsizeZero" value="<%= sizeZero %>"/>
		<ul style="list-style-type:upper-roman;">
			<li>\${ empty elnullString }:${ empty elnullString }</li>
			<li>\${ empty elemptyString }:${ empty elemptyString }</li>
			<li>\${ not empty ellengthZero ? "배열크기가 0이 아니다." : "배열크기가 0이다."} : 
				${ not empty ellengthZero ? "배열크기가 0이 아니다." : "배열크기가 0이다."}</li>
			<li>\${ ! empty elsizeZero ? "컬렉션에 저장된 객체가 있다." : "컬렉션에 저장된 객체가 없다."} : 
				${ ! empty elsizeZero ? "컬렉션에 저장된 객체가 있다." : "컬렉션에 저장된 객체가 없다."}</li>
		
		</ul>
	</fieldset>
</body>
</html>