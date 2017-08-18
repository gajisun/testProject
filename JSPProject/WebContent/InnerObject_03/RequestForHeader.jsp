<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>RequestForHeader.jsp</title>
</head>
<body>
	<fieldset>
	<!-- 요청헤더 보는 사이트(http://web-sniffer.net -->
		<legend>요청헤더명:요청헤더값</legend>
		<ul style="list-style-type:upper-roman">
		<%
		/* 
		request객체의 메소드]
		1] 요청 헤더명 얻기:getHeaderNames()
		2] 헤더명에 따른 헤더값:getHeader(헤더명)
		*/
		Enumeration<String> headerNames = request.getHeaderNames();
		while(headerNames.hasMoreElements()){
			// 헤더명
			String headerName = headerNames.nextElement();
			//헤더값
			String headerValue=request.getHeader(headerName);
		%>
		<li><%=headerName %> : <%=headerValue %></li>
		<% } %>
		</ul>	
	</fieldset>
	<fieldset>
		<legend>요청헤더명에 따른 브라우저 종류 알아내기</legend>
		<%
			String browser = request.getHeader("user-agent");
			if(browser.toUpperCase().indexOf("MSIE")==-1)
				out.println("기타 웹브라우저 및 IE 11.0");
			else if(browser.toUpperCase().indexOf("MSIE 6.0")!=-1 ||
					browser.toUpperCase().indexOf("MSIE 7.0")!=-1 ||
					browser.toUpperCase().indexOf("MSIE 8.0")!=-1 )
				out.println("IE 6.0/7.0/8.0");
			else
				out.println("IE 9.0/10.0");
				
		%>
	</fieldset>
</body>
</html>