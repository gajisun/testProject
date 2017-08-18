<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>UseBeanFormIndex.jsp</title>
</head>
<body>
	<!-- 
   form의 하위요소에 입력한 값을 useBean액션태그를
   사용하면 쉽게 받을 수 있다.
   
   단,form의 하위요소명(파라미터명)을 자바빈의
   속성명과 일치 시키면 유리하다.
   -->
	<fieldset>
		<legend>로그인 화면(일치시)</legend>

		<form action="UseBeanFormResult.jsp" method="post">
			아이디 <input type="text" name="id" /> 
			비 번 <input type="text" name="pwd" /> 
			이 름 <input type="text" name="name" /> 
			<input type="submit" value="로그인" />
		</form>
	</fieldset>
	<fieldset>
		<legend>로그인 화면(불일치시)</legend>

		<form action="UseBeanFormResult.jsp" method="post">
			아이디 <input type="text" name="user" /> 
			비 번 <input type="text" name="pass" /> 
			이 름 <input type="text" name="name" /> 
			<input type="submit" value="로그인" />
		</form>
	</fieldset>
</body>
</html>