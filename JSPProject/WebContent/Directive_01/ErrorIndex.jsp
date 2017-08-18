<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="ErrorInformation.jsp"
    %>
<%
	//사용자가 입력한 값 받기]
	String stringAge = request.getParameter("age");
	int after10age=-1;
	String errorMessage = "";
	if (stringAge != null) {
		//방법1]try~catch로 직접 에러처리
		/*try {
			after10age = Integer.parseInt(stringAge) + 10;
		} catch (NumberFormatException e) {
			errorMessage="나이는 숫자만.....";
		}*/
		//방법2]page지시어의 errorPage속성 사용:try~catch필요 없음
		after10age = Integer.parseInt(stringAge) + 10;
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ErrorIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>에러가 발생할 페이지</legend>
		<form >
			나이를 입력하세요:
			<input type="text" name="age" />
			<input type="submit" value="확인" />
		</form>
		<%if(after10age != -1){ %>
		<span style="font-size:1.4em;color:green;font-weight:bold">
			당신의 10년후 나이는 <%=after10age %>살 이군요!!
		</span>
		<%}else{  %>
		<%=errorMessage %>
		<%} %>
	</fieldset>
</body>
</html>