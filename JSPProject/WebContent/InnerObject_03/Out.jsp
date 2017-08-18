<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Out.jsp</title>
</head>
<body>
	<fieldset>
		<legend>out내장객체</legend>
		<h2>버퍼관련 메소드</h2>
		<%
		out.println("버퍼에 저장될 문자열<br/>");
		//버퍼에 저장된 내용이 웹브라우저로 바로 전송됨
		out.flush();
		out.println("웹브라우저에 출력안될 문자열<br/>");
		// 버퍼에 저장된 내용 지움
		out.clearBuffer();
		//아래는 버퍼에 저장됐다가 응답이 되면 바로 웹브라우저로 전송됨.
		out.println("마지막으로 저장된 문자열<br/>");
		
		%>
		<h2>기타 메소드</h2>
		<ul style="list-style-type:decimal;">
			<li>자동 플러쉬 여부:<%= out.isAutoFlush() %></li>
			<li>버퍼크기 : <%= out.getBufferSize() %>byte</li>
			<li>남은 버퍼크기:<%= out.getRemaining() %>byte</li>			
		</ul>
		<h2>print와 println메소드의 차이</h2>
		<h4>print메소드로 출력</h4>
		<%
			out.print("<table style=\"border-spacing:1px;background-color:green;width:400px;\">");
			out.print("<tr style='background-color:white'>");		
			out.print("<td>가</td>");
			out.print("<td>나</td>");
			out.print("</tr>");
			out.print("</table>");		
		%>
		<h4>println메소드로 출력</h4>
		<!-- 소스보기 시 가독성이 더 높다 -->
		<%
			out.println("<table style=\"border-spacing:1px;background-color:green;width:400px;\">");
			out.println("<tr style='background-color:white'>");		
			out.println("<td>가</td>");
			out.println("<td>나</td>");
			out.println("</tr>");
			out.println("</table>");		
		%>
		
	</fieldset>
</body>
</html>