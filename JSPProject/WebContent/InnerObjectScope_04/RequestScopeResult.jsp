<%@page import="model.MemberDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>RequestScopeResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>이전페이지(RequestScopeIndex.jsp)의 Request 영역에 저장한 속성</legend>
		<h2>리퀘스트 영역에 저장된 속성값 읽기</h2>
		<%
			Object object=request.getAttribute("requestDate");
			String dateString = null;
			if(object instanceof Date){
				SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
				dateString = simple.format((Date)object);
			}
			MemberDTO firstMember=(MemberDTO)request.getAttribute("requestMemberFirst");
			String firstString = null;
			if(firstMember != null){
			firstString = String.format("아이디:%s,비번:%s,이름:%s,나이:%s",
											firstMember.getId(),firstMember.getPwd(),
											firstMember.getName(),firstMember.getAge());
			}
			MemberDTO secondMember=(MemberDTO)request.getAttribute("requestMemberSecond");
		%>	
		<ul style="list-style-type:upper-roman;">
			<li>Integer타입:<%= request.getAttribute("requestNumber") %></li>
			<li>String타입:<%= request.getAttribute("requestString") %></li>
			<li>Date타입:<%= dateString %></li>
			<li>MemberDTO타입1:<%= firstString %></li>
			<li>MemberDTO타입2-
			<% if(secondMember != null){ %>
				아이디:<%= secondMember.getId() %>,비번:<%= secondMember.getPwd() %>,
				이름:<%= secondMember.getName() %>,나이:<%= secondMember.getAge() %></li>
			<% } %>
		</ul>
	</fieldset>
	<fieldset>
		<legend>파라미터로 전달된 값</legend>
		<%=request.getParameter("param") %>
	</fieldset>
</body>
</html>