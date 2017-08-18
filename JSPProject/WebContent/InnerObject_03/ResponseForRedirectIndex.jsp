<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ResponseForRedirectIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>response객체의 sendRedirect()</legend>

		<form
			action="<%=request.getContextPath()%>/InnerObject_03/ResponseForRedirectProcess.jsp"
			method="post">
			<table cellspacing="1" bgcolor="gray">
				<tr bgcolor="white">
					<td>아이디</td>
					<td><input
						style="width: 200px; height: 20px; border: 1px red solid"
						type="text" name="id" /></td>
				</tr>
				<tr bgcolor="white">
					<td>비밀번호</td>
					<td><input
						style="width: 200px; height: 20px; border: 1px red solid"
						type="password" name="pwd" /></td>
				</tr>
				<tr bgcolor="white" align="center">
					<td colspan="2"><input type="submit" value="로그인" /></td>
				</tr>
			</table>
		</form>
	</fieldset>
</body>
</html>