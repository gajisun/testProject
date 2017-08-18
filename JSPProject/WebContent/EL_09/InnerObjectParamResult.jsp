<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>InnerObjectParamResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 param내장객체</legend>
		<h2>자바코드로 영역에 저장딘 값 및 파라미터로 전달된 값 읽기</h2>
		<h4>영역에 저장된 값</h4>
		<% MemberDTO member=(MemberDTO)request.getAttribute("dtoObject"); %>
		<ul style="list-style-type:decimal;">
			<li>MemberDTO객체:<%= String.format("이름:%s,아이디:%s,비번:%s",member.getName(), member.getId(), member.getPwd()) %></li>
			<li>String객체:<%= request.getAttribute("stringObject") %></li>
			<li>Integer객체:<%= request.getAttribute("integerObject") %></li>
		</ul>
		<h4>파라미터에 전달된 값의 합</h4>
		<%
			int fnum = Integer.parseInt(request.getParameter("first"));
			int snum = Integer.parseInt(request.getParameter("second"));
		%>
		두 파라미터의 합:<%= fnum+snum %>
		<!-- 영역의 저장된 값은 xxxScope내장객체로 
			 -xxxScope.속성명 혹은 xxxScope["속성명"]
			파라미터로 전달 된 값은 param내장객체 혹은 paramValues내장객체로
			
			-param.파라미터명 혹은 param["파라미터명"]
			 paramValues.파리미터명 혹은 paramValues["파라미터명"]
			 
			 param은 request.getParameter()와 같고
			 paramValues는 request.getParameterValues()와 같다
		
			 ★EL에서는 문자열등을 표시할 때 ""이나 ''둘다 사용가능 -->
		<h2>EL로 영역에 저장딘 값 및 파라미터로 전달된 값 읽기</h2>
		<h4>영역에 저장된 값</h4>
		<ul style="list-style-type:decimal;">
			<li>MemberDTO객체:이름:${ dtoObject.name },아이디:${ dtoObject.id }, 비번:${ dtoObject['pwd'] }</li>
			<li>String객체:${ stringObject }</li>
			<li>Integer객체:${ integerObject }</li>
		</ul>
		<h4>파라미터에 전달된 값의 합</h4>
		두 파라미터의 합:${ param.first+param.second }
	</fieldset>
</body>
</html>