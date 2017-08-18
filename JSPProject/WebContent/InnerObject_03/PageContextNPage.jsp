<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>PageContextNPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>pageContext 및 page내장객체</legend>
		<h2>pageContext내장객체</h2>
		<hr/>
		<h4>request내장객체로 전송방식 얻기</h4>
		<%= request.getMethod()	%>
		<h4>pageContext내장객체로 전송방식 얻기</h4>
		<%
			//상속 계층도 ServletRequest > HttpServletRequest
			//getMethod()는 HttpServletRequest에서
			//새롭게 정의한 메소드]
			ServletRequest req=pageContext.getRequest();
			String method=((HttpServletRequest)req).getMethod();
			out.println(method);
		%>
		<h4>pageContext내장객체로 out내장객체 얻기</h4>
		<% pageContext.getOut().println("메소드 체인"); %>
		<!-- 
		※getRealPath(경로명)는 ServletContext의 메소드
		-경로명은 /로 시작하는 절대경로(단,컨텍스트 루트는 제외)
	 	-->
		<h4>application내장객체로 서버의 물리적 경로 얻기</h4>
		<%= application.getRealPath("/Images") %>
		<h4>pageContext내장객체로 서버의 물리적 경로 얻기</h4>
		<%= pageContext.getServletContext().getRealPath("/Images") %>
		
		<h2>page내장객체</h2>
		<hr/>
		<%
			/*
			page내장객체(Object타입)는 jsp페이지 자체를 의미하고
			this키워드롸 같은 의미다.
			*/
			out.println("page 내장객체의 클래스명:"+page.getClass().getName()+"<br/>");
			out.println("this의 클래스명:"+this.getClass().getName()+"<br/>");
			out.println(page instanceof HttpServlet ? "page는 HttpServlet" : "page는 HttpServlet타입이 아니다." );
		%>
		
	</fieldset>
</body>
</html>