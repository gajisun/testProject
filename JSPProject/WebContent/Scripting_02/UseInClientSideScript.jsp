<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//사용자 선택값 받기]
	String color=request.getParameter("color");
	String font=request.getParameter("font");
	
	if(color == null || color.length()==0 )
		color="black";
	if(font == null || font.length()==0)
		color="verdana";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>UseInClientSideScript.jsp</title>
<style>
	span{
		color:<%=color%>;
		font-family:<%=font%>;
	}
</style>
</head>
<body>
	<fieldset>
		<legend>HTML안에서 스크립팅요소 사용</legend>
		<% for(int i=1 ; i<=5 ; i++){ %>
				<h<%= i %>>제목<%= i %></h<%= i %>>
		<% } %>
		<form>
			<input type="text" name="counter" /> 
			<input type="submit" value="이미지 카운터" />
		</form>
		<%
			String counter = request.getParameter("counter");
			if(counter != null){
				char[] ch = counter.toCharArray();
				for(int i=0 ; i<ch.length ; i++){
		%>
		<img src="/JSPProject/Images/num_<%=ch[i] %>.gif" alt="<%=ch[i] %>번 이미지" /> 
		<% 		}//for
			}//if %>
	</fieldset>


	<fieldset>
		<legend>CSS안에서 스크립팅 요소 사용</legend>
		<span>CSS를 적용한 텍스트</span>
		<form method="post">
			[글자색] <select name="color">
				<option value="">색상 선택요망</option>
				<option value="Red">빨강</option>
				<option value="Green">그린</option>
				<option value="Blue">블루</option>
			</select> [글꼴] <select name="font">
				<option value="">글꼴 선택요망</option>
				<option value="굴림체">굴림체</option>
				<option value="바탕체">바탕체</option>
				<option value="휴먼옛체">휴먼옛체</option>
			</select> <input type="submit" value="글꼴 및 색상 변경" />
		</form>
	</fieldset>
	<%
	//사용자 입력값 받기]
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	%>
	<script>
    	//id:kim,pw:1234를 회원이라 가정
    	<% if(id != null){ 
    		if(id.trim().toUpperCase().equals("KIM") && pwd.trim().equals("1234")){
    	
    	%>
    		alert("<%= id %>님 즐감하세요!");
    		<% }else { %>
    					alert("아이디 비번 불일치");
    	
    	<% 		} 
    	   } %>
    	
   </script>
	<fieldset>
		<legend>자스안에서 스크립팅 요소 사용</legend>
		<form>
			아이디 <input type="text" name="id" /> 비밀번호<input type="password"
				name="pwd" /> <input type="submit" value="로그인" />
		</form>
	</fieldset>
</body>
</html>