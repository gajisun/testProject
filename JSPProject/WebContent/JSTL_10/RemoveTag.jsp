<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>RemoveTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>remove태그</legend>
		<!-- 각 영역에 JSTL을 이용해서 속성저장 -->
		<c:set var="pagevar" value="페이지 영역"/>
		<c:set var="pagevar" value="리퀘스트 영역 1번째" scope="request"/>
		<c:set var="requestvar" value="리퀘스트 영역 2번째" scope="request"/>
		<c:set var="sessionvar" value="세션영역" scope="session"/>
		<c:set var="applicationvar" value="어플리케이션영역" scope="application"/>
		<h2>삭제전 출력</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${ pagevar }:${ pagevar }</li>
			<li>\${ requestScope.pagevar }:${ requestScope.pagevar }</li>
			<li>\${ requestvar }:${ requestvar }</li>
			<li>\${ sessionvar }:${ sessionvar }</li>
			<li>\${ applicationvar }:${ applicationvar }</li>
		</ul>
		<h2>속성명은 존재하나, 영역이 다른 경우-에러X,삭제X</h2>
		<c:remove var="requestvar" scope="session"/>
		<h2>영역이 다른 속성명 삭제 후 출력</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${ pagevar }:${ pagevar }</li>
			<li>\${ requestScope.pagevar }:${ requestScope.pagevar }</li>
			<li>\${ requestvar }:${ requestvar }</li>
			<li>\${ sessionvar }:${ sessionvar }</li>
			<li>\${ applicationvar }:${ applicationvar }</li>
		</ul>
		<h2>동일한 속성명이 여러 영역에 존재하는 경우(scope 미지정시)-모두 삭제</h2>
		<c:remove var="pagevar" />
		<h2>동일한 속성명 삭제 후 출력(영역 미지정)</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${ pagevar }:${ pagevar }</li>
			<li>\${ requestScope.pagevar }:${ requestScope.pagevar }</li>
			<li>\${ requestvar }:${ requestvar }</li>
			<li>\${ sessionvar }:${ sessionvar }</li>
			<li>\${ applicationvar }:${ applicationvar }</li>
		</ul>
		 
		
	</fieldset>
</body>
</html>