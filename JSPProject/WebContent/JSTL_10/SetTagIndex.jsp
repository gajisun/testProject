<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SetTagIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set태그</legend>
		<!-- var속성:문자열만
			 value속성:값, 표현식, EL식 모두 가능
			 scope속성:문자열만("page", "request","session","application"중 하나)
			 		 "page"가 기본값 -->
		<h2>set태그로 EL에서 사용할 변수 설정</h2>
		<ul style="list-style-type:upper-roman;">
			<li>value속성에 직접 값 대입:<c:set var="directvar" value="100" /></li>
			<!-- 자바코드로=>pageContext.setAttribute("directvar","100); -->
			<li>value속성에 EL로 값 대입:<c:set var="elvar" value="${ directvar }" /></li>
			<li>value속성에 표현식으로 값 대입:<c:set var="expvar" value="<%= new Date() %>" /></li>
			<li>시작태그와 종료태그 사이에 값 설정:<c:set var="betweenvar">시작태그와 종료태그 사이에 설정</c:set></li>
		</ul>
	</fieldset>
	<fieldset>
		<legend>set태그로 설정한 값 출력</legend>
		<h2>JSP로 출력</h2>
		<ul style="list-style-type:decimal;">
			<li>directvar:<%= pageContext.getAttribute("directvar") %></li>
			<li>elvar:<%= pageContext.getAttribute("elvar") %></li>
			<li>expvar:<%= pageContext.getAttribute("expvar") %></li>
			<li>betweenvar:<%= pageContext.getAttribute("betweenvar") %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style="list-style-type:decimal;">
			<li>directvar:${ pageScope.directvar }</li>
			<li>elvar:${ elvar }</li>
			<li>expvar:${ expvar }</li>
			<li>betweenvar:${ betweenvar }</li>
		</ul>
	</fieldset>
	<fieldset>
		<legend>set태그로 각 영역에 객체 저장</legend>
		<c:set var="pagevar" value="페이지 영역"/>
		<c:set var="requestvar" value="리퀘스트 영역" scope="request"/>
		<c:set var="sessionvar" value="세션 영역" scope="session"/>
		<c:set var="applicationvar" value="어플리케이션 영역" scope="application"/>
	</fieldset>
	<fieldset>
		<legend>set태그로 설정한 값 출력</legend>
		<h2>JSP로 출력</h2>
		<ul style="list-style-type:decimal;">
			<li>pagevar:<%= pageContext.getAttribute("pagevar") %></li>
			<li>requestvar:<%= request.getAttribute("requestvar") %></li>
			<li>sessionvar:<%= session.getAttribute("sessionvar") %></li>
			<li>applicationvar:<%= application.getAttribute("applicationvar") %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul style="list-style-type:decimal;">
			<li>pagevar:${ pagevar }</li><!-- pageScope.pagevar -->
			<li>requestvar:${requestvar}</li><!-- requestScope.requestvar -->
			<li>sessionvar:${sessionvar}</li><!-- sessionScope.sessionvar -->
			<li>applicationvar:${applicationvar}</li><!-- applicationScope.applicationvar -->
		</ul>
	</fieldset>
	<fieldset>
		<legend>set태그로 자바빈 개체 설정</legend>
		<h2>기본 생성자로 설정</h2>
		<c:set var="defaultMember" value="<%= new MemberDTO() %>" scope="request"/>
		<h3>JSP로 출력</h3>
		<ul>
			<li>아이디:<%= ((MemberDTO)request.getAttribute("defaultMember")).getId() %></li>
			<li>비번:<%= ((MemberDTO)request.getAttribute("defaultMember")).getPwd() %></li>
			<li>이름:<%= ((MemberDTO)request.getAttribute("defaultMember")).getName() %></li>
		</ul>
		<h3>EL로 출력</h3>
		<ul>
			<li>아이디:${requestScope.defaultMember.id}</li>
			<li>비번:${requestScope.defaultMember.pwd}</li>
			<li>이름:${requestScope.defaultMember.name}</li>
		</ul>
		<h2>기본 생성자로 설정</h2>
		<c:set var="argsMember" value='<%= new MemberDTO("KOSMO", "7777", "한소인", null,null) %>' scope="request"/>
		<h3>JSP로 출력</h3>
		<ul>
			<li>아이디:<%= ((MemberDTO)request.getAttribute("argsMember")).getId() %></li>
			<li>비번:<%= ((MemberDTO)request.getAttribute("argsMember")).getPwd() %></li>
			<li>이름:<%= ((MemberDTO)request.getAttribute("argsMember")).getName() %></li>
		</ul>
		<h3>EL로 출력</h3>
		<ul>
			<li>아이디:${requestScope.argsMember.id}</li>
			<li>비번:${requestScope.argsMember.pwd}</li>
			<li>이름:${requestScope.argsMember.name}</li>
		</ul>
	</fieldset>
	<!-- set태그의 target속성과 property속성은 자바빈 객체의 속성이나
		컬렉션계열 객체의 값을 설정할때 사용할 수 있는 속성.
		
		target속성:반드시 EL식이나 표현식만 가능
		property속성:값,표현식,EL식 모두 가능.
		                자바빈 인 경우-속성명(멤버변수명)
		               Map컬렉션 - 키값  
	
		※Scope속성은 var속성을 지정한 태그에서만 설정가능 
		
		*target과 property를 사용해서 자바빈이나 컬렉션에 값을 설정할 때는 var속성을 지정하면 안된다.
		
		*target속성과 property속성을 이용해서 자바빈 객체의 속성값 설정
	-->
	<c:set target="${ defaultMember }" property="id" value="JSTL"/>
	<c:set target="${ defaultMember }" property="pwd" value="9999"/>
	<c:set target="${ defaultMember }" property="name" value="태그라이브러리"/>
	<h4>target및 property속성으로 속성 설정 후 출력</h4>
	<ul style="list-style-type:upper-roman;">
		<li>아이디:${requestScope.defaultMember.id}</li>
		<li>비번:${requestScope.defaultMember.pwd}</li>
		<li>이름:${requestScope.defaultMember.name}</li>
	</ul>
	<%
		//리스트 계열 컬렉션
		List list = new Vector();
		list.add(request.getAttribute("defaultMember"));
		list.add(request.getAttribute("argsMember"));	
	%>
	<h2>1단계:set태그로 리스트계열 컬렉션 설정</h2>
	<c:set var="list" value="<%= list %>" scope="request"/>
	<h4>target 및 property속성으로 미 설정 후 출력</h4>
	<ul>
		<li>아이디:${ list[0].id }</li>
		<li>비번:${ list[0].pwd }</li>
		<li>이름:${ list[0].name }</li>
	</ul>
	<h4>target 및 property속성으로 속성값 변경</h4>
	<c:set target="${ list[0]}" property="id" value="제이에스티엘"/>
	<c:set target="${ list[0]}" property="pwd" value="구구구구"/>
	<c:set target="${ list[0]}" property="name" value="tablibrary"/>
	<h4>target 및 property속성으로 변경 후 출력</h4>
	<ul>
		<li>아이디:${ list[0].id }</li>
		<li>비번:${ list[0].pwd }</li>
		<li>이름:${ list[0].name }</li>
	</ul>
	<%
		//맵계열 컬렉션]
		Map map = new HashMap();
		map.put("default",request.getAttribute("defaultMember"));
		map.put("args",request.getAttribute("argsMember"));
	%>
	<h2>1단계:set태그로 맵 컬렉션 설정</h2>
	<c:set var="map" value="<%= map %>" scope="request"/>
	<h4>target 및 property속성으로 변경 후 출력</h4>
	<ul style="list-style-type: square;">
		<li>아이디:${ map.args.id }</li>
		<li>비번:${ map.args.pwd }</li>
		<li>이름:${ map.args.name }</li>
	</ul>
	<h2>2단계:target 및 property속성으로 속성값 설정</h2>	
	<c:set target="${ map.args}" property="id" value="코스모"/>
	<c:set target="${ map.args}" property="pwd" value="칠칠칠칠"/>
	<c:set target="${ map.args}" property="name" value="KOSMO MEMBER"/>
	<h4>target 및 property속성으로 변경 후 출력</h4>
	<ul style="list-style-type: square;">
		<li>아이디:${ map.args.id }</li>
		<li>비번:${ map.args.pwd }</li>
		<li>이름:${ map.args.name }</li>
	</ul>
	<jsp:forward page="SetTagResult.jsp" >
		<jsp:param value="android" name="subject"/>
	</jsp:forward>
</body>
</html>