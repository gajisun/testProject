<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ForwardExamMyPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>마이페이지</legend>
		<ul style="list-style-type:decimal;">
			<li>아이디:<%= session.getAttribute("USER_ID") %></li>
				<!-- request.getParameter("userid")도 가능 -->
			<li>비밀번호:<%= session.getAttribute("USER_PWD") %></li>
		</ul>
		<a href="ForwardExamLogout.jsp">로그아웃</a>
	</fieldset>
</body>
</html>