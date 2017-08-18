<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ForwardExamLogin.jsp</title>
</head>
<body>
	<fieldset>
      <legend>forward 액션 태그 연습-로그인 페이지</legend>
      <form action="ForwardExamProcess.jsp" method="post">
       아이디 <input type='text' name="userid" value="<%= request.getParameter("userid")==null?"":request.getParameter("userid") %>"/>
       비밀번호 <input type="password" name="pwd" value="<%= request.getParameter("pwd")==null?"":request.getParameter("pwd") %>"/>
       <input type="submit" value="로그인"/> 
      </form>
      <span style="color:red;font-weight:bold;font-size:1.6em"><%= request.getAttribute("ERROR_MSG")==null?"":request.getAttribute("ERROR_MSG") %></span>
    </fieldset>
</body>
</html>