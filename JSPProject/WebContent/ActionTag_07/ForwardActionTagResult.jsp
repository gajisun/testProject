<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ForwardActionTagResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>포워드 및 리다이렉트 결과 페이지</legend>
		<ul style="list-style-type:upper-roman;">
			<li>페이지 영역:<%= pageContext.getAttribute("pagevar") %></li>
			<li>리퀘스트 영역:<%= request.getAttribute("requestvar") %></li>
		</ul>
	</fieldset>
</body>
</html>