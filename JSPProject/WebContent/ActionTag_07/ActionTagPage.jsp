<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ActionTagPage.jsp -->
<%
	//서블릿으로 변환됨.
	//즉 다른 페이지. 
	//실행결과가 페이지에 포함됨.
	//request영역 공유
	String actiontagString="액션태그로 포함된 페이지안에서 선언된 변수";
	

%>
<h4>ActionTagPage.jsp입니다.</h4>
<ul style="list-style-type:upper-roman;">
	<li>페이지 영역:<%= pageContext.getAttribute("pagevar") %></li>
	<li>리퀘스트 영역:<%= request.getAttribute("requestvar") %></li>
</ul>