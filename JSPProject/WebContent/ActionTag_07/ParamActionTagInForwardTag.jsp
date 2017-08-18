<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ParamActionTagInForwardTag.jsp -->
<%
/*
	포워드된 페이지나 인클루드된 페이지로 파라미터를 전달시
	한글이 포함된 경우, 한글처리는 반드시 포워드 시키는 최초페이지나 
	인클루드 시키는 페이지에서 설정한다.
*/
	request.setCharacterEncoding("UTF-8");
	/*
		forward의 page속성의 값의 일부만을 표현식으로 처리불가.
		ex)page"<%=url % >"만 가능
		
		파라미터 전달 시 파라미터의 값을 표현식으로 처리하고자 할 때는 param액션태그를 이용한다.
		단, 파라미터명은 표현식 사용불가
	*/
	String pageURL="Forwarded.jsp?query=쿼리스트링";
	String paramValue="HONG";
	/*
		파라미터로는 문자열만 전달가능
		객체를 전달하고자 할때는 기본 내장 객체의 영역에 저장해서 전달한다.
	*/
	request.setAttribute("member", new MemberDTO("KIM", "1234", "김길동", null, null));
	
%>

<jsp:forward page="<%= pageURL %>">
	<jsp:param value="<%= paramValue %>" name="id"/>
</jsp:forward>