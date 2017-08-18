<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>UseBeanActionTagForwarded.jsp</title>
</head>
<body>
	<fieldset>
		<legend>포워드된 페이지</legend>
		<!-- ※자바코드에서 사용한 인스턴스 변수는 액션태그에서 사용불가.
			   단, 액션코드에서 사용한 변수(id속성에 지정한 값)는 자바코드에서도 사용가능  -->
		<!-- 자바코드로 영역에 있는 객체 얻기 -->
		<%-- MemberDTO member=(MemberDTO)request.getAttribute("member"); --%>
		
		<!-- 액션태그로 영역에 있는 객체 얻기 -->
		<jsp:useBean id="member" scope="request" class="model.MemberDTO"/>
		<%--= member --%>
		<h2>자바코드로 출력</h2>
		<ul style="list-style-type:decimal;">
			<li>아이디:<%=member.getId() %></li>
			<li>비밀번호:<%=member.getPwd() %></li>
			<li>이름:<%=member.getName() %></li>
			<li>나이:<%=member.getAge() %></li>
		</ul>
		<h2>액션태그로 출력</h2>
		<ul style="list-style-type:decimal;">
			<li>아이디:<jsp:getProperty property="id" name="member"/></li>
			<li>비밀번호:<jsp:getProperty property="pwd" name="member"/></li>
			<li>이름:<jsp:getProperty property="name" name="member"/></li>
			<li>나이:<jsp:getProperty property="age" name="member"/></li>
		</ul>
	</fieldset>
</body>
</html>