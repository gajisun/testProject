<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>UseBeanActionTagBasic.jsp</title>
</head>
<body>
	<fieldset>
		<legend>useBean액션태그</legend>
		<!-- useBean액션태그는 무조건 기본 생성자를 사용해서 객체 생성 -->
		<jsp:useBean id="member" class="model.MemberDTO" scope="request"/>
		<!-- 위 액션태그를 자바코드 만으로 코딩시 아래와 같다. -->
		<%--
			//1]scope속성에 지정한 영역에서 객체 얻기
			MemberDTO member=(MemberDTO)request.getAttribute("member");
			//2]영역에 존재하지 않을 때 생성
			if(member == null){
				//기본생성자로 생성
				member = new MemberDTO();
				//생성된 객체를 SCOPE에 지정한 영역에 저장
				request.setAttribute("member", member);
			}
		--%>
		<h2>setProperty액션태그로 자바빈 객체 속성 설정</h2>
		<jsp:setProperty property="id" name="member" value="KIM"/>
		<jsp:setProperty property="pwd" name="member" value="1234"/>
		<!-- 자바코드로 설정 -->
		<% member.setName("김철수"); %>
		<h2>getProperty액션태그로 자바빈 객체 속성 설정</h2>
		<!-- getter를 호출한 것과 같다. -->
		<ul style="list-style-type:decimal;">
					   <!-- member.getId() -->
			<li>아이디:<jsp:getProperty property="id" name="member"/></li>
			<li>비밀번호:<jsp:getProperty property="pwd" name="member"/></li>
			<li>나이:<%= member.getAge() %></li>
		</ul>
	</fieldset>
	<!-- scope속성에 지정한 영역에 객체가 저장되었는지 테스트를 위한 포워드 -->
	<jsp:forward page="UseBeanActionTagForwarded.jsp" />
</body>
</html>