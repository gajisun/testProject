<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	-application영역에 저장된 속성은 모든 JSP페이지(서블릿)에서 공유
	-링크로 페이지 이동하든 리다이렉트나 포워드로 자동이동 하든 모든 JSP페이지는
	 하나의 application영역안에 있기 때문
	*/
	//application영역에 속성 저장]
	//객체 생성]
	MemberDTO first = new MemberDTO("KIM", "1234", "김철수", null, "20");
	MemberDTO second = new MemberDTO("PARK", "1234", "박철수", null, "35");
	MemberDTO third = new MemberDTO("LEE", "1234", "이철수", null, "40");
	//리스트 계열 컬렉션에 객체 저장]
	List<MemberDTO> list = new Vector<MemberDTO>();
	list.add(first);
	list.add(second);
	list.add(third);
	//맵 계열 컬렉션에 객체 저장]
	Map<String,MemberDTO> map = new HashMap<String,MemberDTO>();
	map.put("first", first);
	map.put("second", second);
	map.put("third", third);
	//어플리케이션 영역에 컬렉션들 저장]
	application.setAttribute("list", list);
	application.setAttribute("map", map);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ApplicationScopeIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>어플리케이션 영역</legend>
		<h2>사용자 클릭에 의한 이동</h2>
		<a href="<%= request.getContextPath() %>/InnerObjectScope_04/ApplicationScopeResult.jsp">사용자 클릭</a>
		<h2>포워드 방식으로 자동 이동</h2>
		<%
		/*
			절대경로 지정시]
			★포워드:context root제외
			  리다이렉트:context root포함
			  단,server.xml에서 Context태그의 path속성을 빈문자열로
			  지정시에는 신경 안써도 된다.
		*/
		request.getRequestDispatcher("/InnerObjectScope_04/ApplicationScopeResult.jsp").forward(request, response);
		
		%>
		<h2>리다이렉트 방식으로 자동 이동</h2>
		<%
			//response.sendRedirect(request.getContextPath()+"/InnerObjectScope_04/ApplicationScopeResult.jsp");
		%>
	</fieldset>
</body>
</html>