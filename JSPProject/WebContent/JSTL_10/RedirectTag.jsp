<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- RedirectTag.jsp -->
<!-- redirect방식으로 페이지 이동
	 request영역 공유 안함
	 
	 절대 경로로 설정시 url속성에 역시 컨텍스트 루트 제외
	 단, JSP내장객체의 response의 sendRedirect()로 이동시에는 컨텍스트 루트 포함 -->
<c:set var="requestvar" value="리퀘스트 영역" scope="request"/>
<!-- JSP로 리다이렉트 -->
<%--
	response.sendRedirect(request.getContextPath()+"/JSTL_10/ImportedPage.jsp?user=KIM&pass=9999");
--%>
<!-- JSTL태그로 리다이렉트(같은 웹 어플 안에서 -->
<c:redirect url="/JSTL_10/ImportedPage.jsp" >
	<c:param name="user" value="KIM"/>
	<c:param name="pass">5555</c:param>
</c:redirect>

<!-- JSTL태그로 리다이렉트(다른 어플 안에 있는 페이지로)
	다른 어플리케이션안에 있는 페이지로 redirect
	context속성:다른 웹 어플의 /로 시작하는 프로젝트명
	url속성:프로젝트명을 제외한 /로 시작하는 절대 경로 -->
<%--
<c:redirect url="/View/ImportedPage.jsp" context="/OtherWepApp">
	<c:param name="user" value="KIM"/>
	<c:param name="pass">5555</c:param>
</c:redirect>
 --%>