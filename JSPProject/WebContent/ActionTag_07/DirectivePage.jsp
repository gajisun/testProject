<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DirectivePage.jsp -->
<%
	//서블릿으로 변환안됨.
	//즉 페이지에 포함되어 서블릿으로 변환됨으로 같은 페이지다.
	String directiveString="지시어로 포함된 페이지안에서 선언된 변수";
	

%>
<h4>DirectivePage.jsp입니다.</h4>
<ul style="list-style-type:upper-roman;">
	<li>페이지 영역:<%= pageContext.getAttribute("pagevar") %></li>
	<li>리퀘스트 영역:<%= request.getAttribute("requestvar") %></li>
</ul>