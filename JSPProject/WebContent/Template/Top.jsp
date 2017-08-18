<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="logo">
	<img src="<c:url value='/Images/logo.PNG'/>" alt="로고이미지" />
</div>
<div class="topMenu">
	<ul> 
		<li><a href="<c:url value='/Directive_01/IncludeIndex.jsp'/>">Home</a></li>
		<%if(session.getAttribute("USER_ID")==null){ %>
		<li><a href="${ pageContext.request.contextPath }/Session_06/Login.jsp">로그인</a></li>
		<%} else{ %>
		<li><a href="${ pageContext.request.contextPath }/Session_06/Logout.jsp">로그아웃</a></li>
		<%} %>
		<li><a href="${ pageContext.request.contextPath }/Directive_01/IncludeMember.jsp">회원가입</a></li>
		<li><a href="${ pageContext.request.contextPath }/BBS_08/List.jsp">게시판</a></li>
		
		<li><a href="<c:url value='/DATAROOM/List.do'/>">자료실</a></li>
	</ul>
</div>
