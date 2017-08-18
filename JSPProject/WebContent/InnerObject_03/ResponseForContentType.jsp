<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ResponseForContentType.jsp</title>
</head>
<body>
	<fieldset>
		<legend>Content-Type응답헤더</legend>
		<!-- JSP페이지에서는 response객체의 setContentType()불필요
			 page지시어에 속성을 설정해놓았기 때문
			 단, 서블릿에서 페이지 이동을 안하고 직접 서블릿 자체에서 
			 웹브라우저에 출력시에는 반드시 설정해야함.-->
		<h3>서블릿에서 직접 웹브라우저로 출력	
		(이 때는 반드시 setContentType()메소드 사용)</h3>
		<!-- 서블릿으로 요청을 보낼 때 링크 방법
			절대경로:/Context루트/이후는 마음대로
			단, web.xml의 url-pattern요소에서는 
			Context루트를 제외한 /로 시작 -->
		<a href = "<%= request.getContextPath() %>/AirDir/SomeDir/SetContentType.kosmo">서블릿으로 요청</a>
		
	</fieldset>
</body>
</html>