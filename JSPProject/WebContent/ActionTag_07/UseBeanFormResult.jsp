<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//POST방식으로 파라미터 전달시 한글처리(GET방식이면 필요 없음)
	request.setCharacterEncoding("UTF-8");
	//폼의 하위요소값 받기
	String id=request.getParameter("id")==null?request.getParameter("user"):request.getParameter("id");
	String pwd=request.getParameter("pwd")==null?request.getParameter("pass"):request.getParameter("pwd");
	String name=request.getParameter("name");
	//받은 값을 MemberDTO객체의 속성에 설정
	MemberDTO member = new MemberDTO();
	member.setId(id);
	member.setPwd(pwd);
	member.setName(name);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>UseBeanFormResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>userBean 액션태그로 폼의 하위요소 값 받기</legend>
		<h2>자바코드로 받기</h2>
		<%= member.toString() %>
		<h2>액션태그로 받기</h2>
		<!-- ★ 중요!!
			 jsp:getProperty나 jsp:setProperty의 name속성에는 반드시 jsp:useBean액션태그의 id속성에 지정한 값이어야한다.
			 자바코드로 생성한 인스턴스변수는 불가. -->
		<!-- 1)액션태그로 자바빈 객체 생성 -->
		<jsp:useBean id="actionmember" class="model.MemberDTO"/>
		<!-- 2)setProperty액션태그로 폼요소값 설정:value속성 미지정 -->
		<h4>폼의 하위요소의 파라미터명과 자바빈의 속성명 일치시</h4>
		<jsp:setProperty property="*" name="actionmember"/>
		<%= actionmember %>
		<h4>폼의 하위요소의 파라미터명과 자바빈의 속성명 불일치시</h4>
		<!-- Property에는 자바빈의 속성명(멤버변수명)
			 Param속성에는 form의 하위요소명(name속성에 지정한 값) -->
		<jsp:setProperty property="id" name="actionmember" param="user"/>
		<jsp:setProperty property="pwd" name="actionmember" param="pass"/>
		<%= actionmember %> 
	</fieldset>
</body>
</html>