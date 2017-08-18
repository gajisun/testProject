<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>FunctionOfJSTL.jsp</title>
</head>
<body>
	<fieldset>
		<legend>JSTL함수 라이브러리</legend>
		<!-- JSTL에서 제공하는 함수들은 EL식에서 호출 해야한다.
			 호출방법:\${접두어:함수명([매개변수들])}
			 JSTL의 모든 함수는 항상 값을 반환한다. -->
		<%	String [] mountains={"한라산","지리산","설악산","덕유산"};	%>
		<!-- EL에서 사용할 변수들 선언 -->
		<fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" var="today" />
		<c:set var="strToday">Today는 ${ today }입니다.</c:set>
		<c:set var="stringinters">Sports,Economics,Politics,Entertainments</c:set>
		<c:set var="array" value="<%= mountains %>"/>
		<c:set var="collection" value="<%= new HashMap() %>"/>
		<c:set target="${ collection }" property="id" value="KIM"/>
		<c:set target="${ collection }" property="pass" value="1234"/>
		
		<!-- 문자열인 경우는 문자열의 길이 반환(한글 1자도 길이 1로 처리)
			 배열인 경우는 배열의 크기(즉 메모리 갯수) 반환
			 컬렉션인 경우는 컬렉션의 저장된 객체의 수 반환 -->
		<h2>int length(Object)</h2>
		<ul style="list-style-type:upper-roman;">
			<li>문자열의 길이: ${ fn:length(strToday) }</li>
			<li>배열의 길이: ${ fn:length(array) }</li>
			<li>컬렉션에 저장된 객체수(JSTL함수): ${ fn:length(collection) }</li>
			<li>컬렉션에 저장된 객체수(EL함수): ${ collection.size() }</li>
		</ul>
		<h4>컬렉션에 객체 저장여부 판단</h4>
		<h5>JSTL함수 이용(방법1)</h5>
		<c:choose>
			<c:when test="${ fn:length(collection)==0 }">
				저장된 객체가 없어요			
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${ collection }">
					${ item.value }&nbsp;
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<h5>EL함수 이용(방법2)</h5>
		<c:choose>
			<c:when test="${ collection.size() ==0 }">
				저장된 객체가 없어요			
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${ collection }">
					${ item.value }&nbsp;
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<h2>String toUpperCase(String) 및 String toLowerCase(String)</h2>
		<ul>
			<li>\${fn:toLowerCase(stringinters) }:${fn:toLowerCase(stringinters) }</li>
			<li>\${fn:toUpperCase(stringinters) }:${fn:toUpperCase(stringinters) }</li>
		</ul>
		
		<h2>String substring(문자열, 시작인덱스, 끝 인덱스)</h2>
		<!-- 문자열에서 시작 인덱스부터 끝인덱스 -1까지 추출,
			 끝인덱스가 -1인경우 시작인덱스부터 문자열 끝까지 추출
			 인덱스는 0부터 시작 -->
		<ul>
			<li>특정부분 추출:${ fn:substring(strToday,7,20) }</li>
			<li>문자열 끝까지 추출:${ fn:substring(strToday,7,-1) }</li>
		</ul>
		
		<h2>String substringAfter(문자열, str2):문자열에서 str2이후의 문자열 추출</h2>
		\${ fn:substringAfter(strToday,"Today는 ") }:${ fn:substringAfter(strToday,"Today는 ") }
		
		<h2>String substringBefore(문자열, str2):문자열에서 str2이전의 문자열 추출</h2>
		\${ fn:substringBefore(strToday,"는 ") }:${ fn:substringBefore(strToday,"는 ") }
		
		<h2>String trim(문자열):좌우 공백 제거</h2>
		\${ fn:trim("      J    a  v   a    ") }:X${ fn:trim("      J    a  v   a    ") }X
		
		<h2>String replace(str,src,desc):str에서 src를 desc로 대체</h2>
		\${ fn:replace(strToday, "Today","tomorrow") }:${ fn:replace(strToday, "Today","tomorrow") }
		<h4>방법1</h4>
		${ strToday }<br />
		<c:set var="temp" value="${ fn:replace(strToday,'Today','Tomorrow') }"/>
		${ fn:replace(temp,"17일","18일") }
		<h4>방법2</h4>
		${ fn:replace(fn:replace(strToday,"Today","Tomorrow"),"17일","18일") }
		
		<h2>int indexOf(str1,str2):str1에서 str2가 시작하는 인덱스 위치 반환</h2>
		<ul>
			<li>\${ fn:indexOf(strToday,"day") }:${ fn:indexOf(strToday,"day") }</li>
			<li>\${ fn:indexOf(strToday,"Day") }:${ fn:indexOf(strToday,"Day") }</li>
		</ul>
		
		<h2>boolean startWith(str1,str2):str1이 str2로 시작하면 true, 아니면 false반환</h2>
		\${ fn:startsWith(strToday,"To")?"'To'로 시작":"'To'로 시작안함" }:${ fn:startsWith(strToday,"To")?"'To'로 시작":"'To'로 시작안함" }
		
		<h2>boolean endsWith(str1,str2):str1이 str2로 끝나면 true, 아니면 false반환</h2>
		\${ fn:endsWith(strToday,"다.")?"다로 끝남":"다로 안끝남" }:${ fn:endsWith(strToday,"다.")?"다로 끝남":"다로 안끝남"}
		
		<h2>String[]split(str1,str2):str1에서 str2(구분자)를 기준으로 문자열 분리()</h2>
		\${ fn:split(stringinters,",") }:${ fn:split(stringinters,",") }
		<c:set var="inters" value='${ fn:split(stringinters,",")}'/><br />
		<c:forEach var="inter" items="${ inters }">
			${inter }&nbsp;
		</c:forEach>
		
		<h2>String join(array,str2):배열에 저장된 각 요소를 str2라는 문자열로 연결해서 하나의 문자열로 반환</h2>
		\${ fn:join(array,"▲") }:${ fn:join(array,"▲") }
		
		<h2>escapeXml(str):html태그를 그대로 출력하고자 할 때</h2>
		<ul>
			<li>JSTL함수 이용:${ fn:escapeXml("<h3>HTML태그가 포함된 문자열</h3>") }</li>
			<li>코어의 out태그 이용:<c:out value="<h3>HTML태그가 포함된 문자열</h3>"/> </li>
		</ul>
		
	</fieldset>
</body>
</html>