<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ResponseForSelfPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>마이페이지</legend>
		<ul style="list-style-type:upper-alpha;">
			<li>아이디 : <%= request.getParameter("user") %></li>
			<li>비밀번호 : <%= request.getParameter("pass") %></li>
		</ul>
	</fieldset>
</body>
</html>