<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>CookieResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>쿠키값 확인하기</legend>
		<%
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				for(Cookie co:cookies){
					//쿠키명 얻기]
					String name=co.getName();
					//쿠키값 얻기]
					String value=co.getValue();
					out.println(String.format("%s : %s <br/>", name, value));
				}				
				
			}
		%>
	
	
	
	</fieldset>
</body>
</html>