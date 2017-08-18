<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<c:choose>
		<c:when test="${param.mode == 'UPDATE'}">
			<c:set var="moveURL" value="/DATAROOM/Edit.do?no=${param.no}" />
		</c:when>
		<c:otherwise>
			<c:set var="moveURL" value="/DATAROOM/Delete.do?no=${param.no}" />
		</c:otherwise>
	</c:choose>
	
<script>
	<c:choose>
		<c:when test="${PASS_CORRECT}">
			location.href = '<c:url value="${moveURL}" />';
		</c:when>
		<c:otherwise>
			alert("비밀번호가 일치하지 않아요");
			history.back();
		</c:otherwise>
	</c:choose>
</script>