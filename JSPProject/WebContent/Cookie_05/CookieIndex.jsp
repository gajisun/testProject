<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>CookieIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>쿠키</legend>
		<h2>쿠키 설정</h2>
		<%
		//1]쿠키 객체 설정:new Cookie("쿠키명", "쿠키값")
		//쿠키명 설정하는 setName()없다. 반드시 생성자로 쿠키명 설정
		Cookie cookie = new Cookie("UserID", "KOSMO");
		//2]쿠키가 적용되는 path설정
		cookie.setPath(request.getContextPath());
		//3]쿠키 유효기간 설정-초 단위(나중에)
		//유효기간 미 설정시 쿠키는 웹브라우저에 저장됨.
		//-웹브라우저 닫을 때
		//유효기간 설정시 쿠키는 사용자 PC에 저장됨.
		//-유효기간이 지나면 자동으로 삭제됨.
		cookie.setMaxAge(3600);
		//4]생성된 쿠키를 응답헤더에 설정
		response.addCookie(cookie);
		%>
		<h2>쿠키를 설정하는 현재페이지에서 쿠키값 확인</h2>
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
		<h2>페이지 이동 후 쿠키 값 확인</h2>
		<a href="CookieResult.jsp">쿠키값 확인</a>
		<%
		
		
		%>
	</fieldset>
</body>
</html>