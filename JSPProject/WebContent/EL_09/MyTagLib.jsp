<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="eltag.MyTagLibrary"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytablib.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>MyTagLib.jsp</title>
</head>
<body>
	<fieldset>
		<legend>내가 만든 태그 라이브러리</legend>
		<h2>자바코드로 메소드 호출</h2>
		<ul style="list-style-type:upper-roman;">
			<li> MyTagLibrary.isNumber("100"):<%= MyTagLibrary.isNumber("100") %></li>
			<li> \${ MyTagLibrary.isNumber("100") }:${ MyTagLibrary.isNumber("100")}</li>
			<li> MyTagLibrary.getGender("123456-2234567"):<%= MyTagLibrary.getGender("123456-2234567") %></li>
		</ul>
		<h2>EL에서 자바클래스로 만든 메소드 호출</h2>
		<ul	style="list-style-type:upper-roman;">
			<li>\${my:isNumber("100") }:${my:isNumber("100") }</li>
			<li>\${my:isNumber("백") }:${my:isNumber("백") }</li>
		</ul>
		<h2>JSTL에서 제공하는 함수라이브러리 사용</h2>
		<%
			String []array={"한라산", "설악산", "덕유산"};
			List collection = new Vector();
			collection.add("지리산");
			collection.add("덕유산");
			
			String string="HELLO JSP";
		%>
		<c:set var="elarray" value="<%=array %>"/>
		<c:set var="elcollection" value="<%=collection %>"/>
		<c:set var="elstring" value="<%=string %>"/>
		<ul style="list-style-type:upper-roman;">
			<li>배열의 크기:${ fn:length(elarray) }</li>
			<li>컬렉션의 사이즈:${ fn:length(elcollection) }</li>
			<li>컬렉션의 사이즈:${ elcollection.size() }</li>
			<li>문자열의 길이:${ fn:length(elstring) }</li>
			<li>소문자로 변경:${ fn:toLowerCase(elstring) }</li>			
		</ul>		
	</fieldset>
</body>
</html>