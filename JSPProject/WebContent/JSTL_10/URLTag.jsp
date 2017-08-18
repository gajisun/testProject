<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>URLTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>url 태그</legend>
		<!-- url생성시 사용]
			 -절대경로로 생성시에는 역시 컨텍스트 루트 제외(컨텍스트루트 신경 쓸 필요 없다.)
			 -var속성 미지정시에는 해당위치에 url이 출력됨
			 (param태그에 지정한 파라미터가 쿼리스트링으로 연결됨)
		 -->
		<h2>var속성 미 지정</h2>
		<c:url value="/JSTL_10/ImportedPage.jsp">
			<c:param name="user" value="KS"/>
			<c:param name="pass" value="0714"/>
		</c:url>
		<h2>var속성 지정</h2>
		<!-- var속성에 해당 url저장됨. 해당 위치에는 출력X -->
		<c:url value="/JSTL_10/ImportedPage.jsp" var="url">
			<c:param name="user" value="KS"/>
			<c:param name="pass" value="0714"/>
		</c:url>
		<h2>내가 원하는 위치에 url출력</h2>
		<a href="${ url }">ImportedPage.jsp</a>
		<h2>HTML태그에 직접 JSTL태그로 절대경로 지정</h2>
		<a href="<c:url value='/JSTL_10/ImportedPage.jsp'/>?user=KOKOA&pass=9999">ImportedPage.jsp</a>
		
	</fieldset>
</body>
</html>