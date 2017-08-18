<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//★★★★★★★★★★★★★★★★★★★★(다 중요한 메소드들)
	//선언부에서 물리적 경로 얻는 방법들]
	//this키워드
	String getRealPath(){
		return this.getServletContext().getRealPath("/Images");
	}
	//매개변수로 내장객체 전달받기
	String getRealPath(ServletContext app){
		return app.getRealPath("/Images");
	}
	//멤버변수 사용
	ServletContext application;
	String getRealPathString(){
		return application.getRealPath("/Images");
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Application.jsp</title>
</head>
<body>
	<fieldset>
		<legend>Application 내장객체의 주요 메소드</legend>
		<!-- 목적]웹 어플리케이션(컨텍스트)를 구성하는 모든 jsp(서블릿)에서
				  스트링형 상수를 공유하기 위함.
			★★★★★
			 step1]web.xml에 컨텍스트 초기화 파라미터 등록 
			 step2]ServletContext의 getInitParameter("파라미터명")메소드로 얻기 -->
		<ul style="list-style-type:decimal;">
			<li>오라클 드라이버 : <%=application.getInitParameter("ORACLE_DRIVER") %></li>
			<li>오라클 URL : <%=application.getInitParameter("ORACLE_URL") %></li>
			<li> this.getInitParameter()(서블릿초기화 파라미터의미) : <%= this.getInitParameter("ORACLE_URL") %></li>
			<li>SERVLET_INIT : <%= this.getInitParameter("SERVLET_INIT") %></li>
			<li>config 내장객체:<%= config.getInitParameter("SERVLET_INIT") %></li>
		</ul>
		<h2>Context 초기화 파라미터</h2>
		<ul style="list-style-type:upper-roman;">
			<%
			Enumeration<String> names=application.getInitParameterNames();
			while(names.hasMoreElements()){
				//컨텍스트 초기화 파라미터명]
				String name=names.nextElement();
				//컨텍스트 초기화 파라미터값]
				String value = application.getInitParameter(name);
			%>
			<li><%= name %> : <%= value %></li>
			<% } %>		
		</ul>
		<h2>서버의 물리적 경로 얻기</h2>
		<!-- ServletContext의 메소드인 getRealPath(/로 시작하는 웹상의 경로)로 얻는다.
			 웹상의 경로는 Context루트를 제외한 /로 시작 -->
		<ul style="list-style-type:upper-roman;">
			<li>application내장객체 : <%= application.getRealPath("/Images") %></li>
			<li>request내장객체(주로 서블릿에서 사용) : <%= request.getServletContext().getRealPath("/Images") %></li>
			<li>request내장객체(주로 서블릿에서 사용) : <%= request.getRealPath("/Images") %></li>
			<li>session내장객체: <%= session.getServletContext().getRealPath("/Images") %></li>
			<li>config내장객체: <%= config.getServletContext().getRealPath("/Images") %></li>
			<li>this키워드(선언부에서 사용) : <%= this.getServletContext().getRealPath("/Images") %></li>
		</ul>
		<h2>선언부에서 물리적 경로 사용하기</h2>
		<ul style="list-style-type:upper-roman;">
			<li>this키워드 사용 : <%=getRealPath() %></li>
			<li>매개변수로 전달:<%=getRealPath(application) %></li>
			<% this.application = application; %>
			<li>멤버변수로 전달:<%= getRealPathString() %></li>
		</ul>
	</fieldset>
</body>
</html>