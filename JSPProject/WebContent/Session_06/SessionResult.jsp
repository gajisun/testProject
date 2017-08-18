<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SessionResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>세션 결과 페이지</legend>
		<ul style="list-style-type: upper-roman;">
			<li>세션 아이디:<%=session.getId()%></li>
			<li>세션의 유효시간:<%=session.getMaxInactiveInterval() %>초</li>
			<li>리퀘스트 영역:<%= request.getAttribute("requestScope") %></li>
			<li>세션 영역:<%= session.getAttribute("sessionScope") %></li>
		</ul>

	</fieldset>
</body>
</html>