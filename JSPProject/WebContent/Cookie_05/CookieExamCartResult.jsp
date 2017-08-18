<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String getProductName(String code){
		switch(code){
			case "product1": return "상품1";
			case "product2": return "상품2";
			case "product3": return "상품3";
			default : return "상품4";
		}
	}
%>
<%
	//장바구니에 담은 상품 코드 받기]
	String [] products=request.getParameterValues("cart");	
	//상품코드를 쿠키로 설정]
	for(String code:products){
		Cookie cookie = new Cookie(code,code);
		cookie.setPath(request.getContextPath());
		response.addCookie(cookie);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>CookieExamCartResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>장바구니 예제결과(장바구니에 담은 상품들)</legend>
		<ul style="list-style-type:decimal;">
		<% for(String code:products){ %>
			<li><%= getProductName(code) %></li>
		<% } %>
		</ul>
		<a href = "CookieExamIndex.jsp">쇼핑계속하기</a>
	</fieldset>
</body>
</html>