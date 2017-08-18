<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ForTokensTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>forTokens태그</legend>
		<%
			String color="red,green,blue,#ff77aa";
			StringTokenizer tokens=new StringTokenizer(color,",");
			out.println("<h2>StringTokenizer클래스</h2>");
			out.println("<h3>토큰 수:"+tokens.countTokens()+"</h3>");
			//hasMoreTokens():꺼내올 토큰이 있으면 true, 없으면 false반환
			while(tokens.hasMoreTokens()){
				//토큰을 꺼내올 때는 nextToken()
				String token=tokens.nextToken();
				out.println("<h4 style='color:"+token+"'>TOKEN</h4>");
			}
			//구분자가 .이면 정규표현식을 의미하기 때문에 앞에 \\를 붙여줘야한다.
			String [] colors=color.split(",");
			out.println("<h2>String클래스 사용</h2>");
			for(String token:colors){
				out.println("<h4 style='color:"+token+"'>TOKEN</h4>");
			}
		%>
		<h2>forTokens JSTL태그 사용</h2>
		<!-- items은 문자열만 올 수 있다(배열이나 컬렉션은 담을 수 없음) -->
		<c:forTokens items="<%= color %>" delims="," var="token">
			<h4 style="color:${token}">TOKEN</h4>
		</c:forTokens>
	</fieldset>
</body>
</html>