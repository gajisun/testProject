<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//리퀘스트 영역에 객체저장]
	request.setAttribute("member", new MemberDTO("PARK", "1111", "박순자", null, null));
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ParamActionTagInIncludeTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>인클루드 되는 페이지에 파라미터 전달</legend>
		<jsp:include page="IncludedPage.jsp" >
			<jsp:param value="쿼리스트링" name="query"/>
			<jsp:param value="홍길동" name="name"/>
			<jsp:param value="HONG" name="id"/>
		</jsp:include>
	</fieldset>
</body>
</html>