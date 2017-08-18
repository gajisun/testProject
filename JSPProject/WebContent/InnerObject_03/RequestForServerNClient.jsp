<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>RequestForServerNClient.jsp</title>
</head>
<body>
	<fieldset>
		<legend>요청한 서버와 클라이언트에 관한 정보</legend>
		<form method="post"><input type="submit" value="확인"/></form>
		<ul style="list-style-type:upper-roman;">
			<li>전송방식:<%= request.getMethod() %></li>
			<li>전체 URL:<%= request.getRequestURL() %></li>
			<li>도메인을 제외한 URL:<%= request.getRequestURI() %></li>
			<li>요청 프로토콜:<%= request.getProtocol() %></li>
			<li>요청 서버:<%= request.getServerName() %></li>
			<li>요청한 서버 포트:<%= request.getServerPort() %></li>
			<!-- 
				IPV6값으로 반환시
				톰캣 실행시의 JVM에 환경변수를 추가.
				이클립스 > Run > Run Configuration > Arguiments > -Djava.net.preferIPv4Stack=true				
			 -->
			<li>클라이언트의 아이피주소:<%= request.getRemoteHost() %></li>
			<!-- IPv6의 아이피주소로 나옴 -->
			<li>클라이언트의 아이피주소:<%= request.getRemoteAddr() %></li>
			<!-- 
			JSP에서는 HttpSession타입의 session이라는 내장 객체를 제공함.
			고로 request 내장 객체로 getSession()메소드를 호출해서 굳이 얻어올 필요는 없다.
			
			단,개발자가 직접 구현한 서블릿에서는 HttpServletRequest
			타입의 매개변수를 이용해서 getSession()메소드로
			session객체를 얻을 수 있다.	
		  	-->
			<li>요청과 관련된 세선객체얻기:<%= request.getSession() %></li>
			<li>JSP내장 세선 객체<%= session %></li>
			<!-- JSP에서는 웹 어플리케이션 전체 영역을 Context라 칭함
			
				getContextPath():server.xml의 Context태그에 
				path속성에 지정한 값을 얻어옴
				★HTML에서 절대경로로 링크를 걸때 주로 사용
			 -->
			
		</ul>
		<fieldset>
			<legend>Context Root얻기</legend>
			<h3>프로젝트 생성 후 server.xml의 Context태그의 path속성 미 변경시</h3>
			Context Root(프로젝트명):<%= request.getContextPath() %>
			<h3>프로젝트 생성 후 server.xml의 Context태그의 path속성 변경시("" 혹은 "/")</h3>
			Context Root(빈 문자열):<%= request.getContextPath() %>
		</fieldset>
		
		
	</fieldset>
</body>
</html>