<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Message.jsp -->
<c:choose>
	<c:when test="${ THISIS=='INS' }">
		<c:set var="smsg" value="입력성공" />
		<c:set var="fmsg" value="입력실패" />
		<c:url var="url" value="/DATAROOM/List.do"/>
	</c:when>
	<c:when test="${ THISIS=='UPD' }">
		<c:set var="smsg" value="수정성공" />
		<c:set var="fmsg" value="수정실패" />
		<c:url var="url" value="/DATAROOM/View.do?no=${ requestScope.no }"/>
	</c:when>
	<c:otherwise>
		<c:set var="smsg" value="삭제성공" />
		<c:set var="fmsg" value="삭제실패" />
		<c:url var="url" value="/DATAROOM/List.do"/>
	</c:otherwise>
</c:choose>

<script>
<c:choose>
	<c:when test="${ SUC_FAIL==1 }">
		alert("${smsg}");
		location.href="${ url }";
	</c:when>
	<c:when test="${ SUC_FAIL==0 }">
		alert("${fmsg}");
		history.back();
	</c:when>
	<c:otherwise>
		alert("파일용량초과");
		history.back();
	</c:otherwise>
</c:choose>
</script>