<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	★include지시어의 file속성과 include액션태그의 page속성에
	절대경로로 페이지 포함시에는 Context루트 제외한 경로.
	단, server.xml의 Context엘리먼트의 path속성을 ""으로
	 설정시에는 request.getContextPath()로 해도 상관없다.
	★include지시어의 file속성에는 표현식 사용 불가
	 include액션태그의 page속성에는 표현식 사용 가능
	단, 표현식을 사용할 때는 page속성에 표현식만 와야한다.
	
	파라미터로 넘어온 값을 읽을 때는 한글처리를 해줘야함.
	(request.setCharacterEncoding("문자인코딩셋"))
	단, 영역에 저장된 값을 읽어 올때는 한글처리 불필요
	
	[include지시어와 include 액션태그의 차이점]

  	include 지시어를 사용한 페이지 include(포함)]
    -소스 그대로 해당 위치에 포함됨
    -include지시어를 통해 포함된 페이지는 현재 페이지와 같은 페이지를 의미
     include 액션태그를 사용한 페이지 include(포함)]
       -JSP컨테이너에 의해 실행된 결과가 해당 위치에 포함됨
       -서로 다른 페이지를 의미
       -단, request영역 공유
 -->
 <%
 	//페이지명 변수에 저장]
 	String directivePath="DirectivePage.jsp";
 	String actionTagPath="ActionTagPage.jsp";
 	//페이지 및 리퀘스트 영역에 속성저장]
 	pageContext.setAttribute("pagevar", "페이지영역");
 	request.setAttribute("requestvar", "리퀘스트 영역");
 	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>IncludeActionTag.jsp</title>
</head>

<body>
	<fieldset>
		<legend>IncludeActionTag &lt;jsp:include/&gt;</legend>
		<h2>include지시어로 페이지 포함</h2>
		<!-- file속성에 표현식 사용 불가 -->
		<%--@ include file="<%=directivePath %>" --%>
		<%@ include file="DirectivePage.jsp" %>
		<h2>include액션태그로 페이지 포함</h2>
		<!-- page속성에 표현식 가능 -->
		<jsp:include page="<%= actionTagPath %>"/>
		<h2>포함된 페이지에서 선언한 변수 사용하기</h2>
		<ul style="list-style-type:decimal;">
		<li>directiveString:<%= directiveString %></li>
		<li><!-- actionTagString:<%--= actionTagString --%>  --></li>
		
		</ul>
	</fieldset>
</body>
</html>