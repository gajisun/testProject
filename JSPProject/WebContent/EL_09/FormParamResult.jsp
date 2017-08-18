<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>FormParamResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>파라미터값 받기</legend>
		<h2>자바코드로 받기</h2>
		<ul style="list-style-type:decimal;">
			<li>이름:<%= request.getParameter("name") %></li>
			<li>성별:<%= request.getParameter("gender") %></li>
			<% String []inters =  request.getParameterValues("inter");
			   StringBuffer inter = new StringBuffer();
			   for(String i:inters)
			   		inter.append(i+" ");%>
			<li>관심사항:<%= inter %></li>
			<li>학력:<%= request.getParameter("grade") %></li>
		</ul>
		
		<h2>EL로 받기</h2>
		<!-- 하나만 받을 때는 param.파라미터명
			 여러개 받을 때는 paramValues.파라미터명 == paramValues["파라미터명"] -->
		<ul style="list-style-type:decimal;">
			<li>이름:${ param.name }</li>
			<li>성별:${ param.gender }</li>
			<li>관심사항:
			<c:forEach var="inters" items="${ paramValues.inter }">
			${ inters }&nbsp;</c:forEach></li>
			<li>학력:${ param.grade }</li>
		</ul>
	</fieldset>
</body>
</html>