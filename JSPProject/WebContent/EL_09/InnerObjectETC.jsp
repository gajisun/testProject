<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>InnerObjectETC.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 기타 내장 객체들</legend>
		<h2>1. EL의 pageContext내장객체</h2>
		<!-- JSP의 pageContext내장객체와 같다.
			 단, 자바빈 규칙으로 접근 가능한 메소드만 제공 -->
		<h4>JSP코드로 컨텍스트 루트 얻기</h4>
		<ul>
			<li>방법1]request 내장객체:<%= request.getContextPath() %></li>
			<% ServletRequest req = pageContext.getRequest();
			   String path = ((HttpServletRequest)req).getContextPath(); %>
			<li>방법2]pageContext 내장객체:<%= path %></li>	
		</ul>
		<h4>EL로 컨텍스트 루트 얻기</h4>
		\${ pageContext.request.contextPath } : ${ pageContext.request.contextPath }
		<h4>JSP로 URL얻기</h4>
		<%= request.getRequestURL() %>
		<h4>EL로 URL얻기</h4>
		${ pageContext.request.requestURL }
		<h4>JSP로 세션 유효시간 얻기</h4>
		<%= session.getMaxInactiveInterval() %>
		<h4>EL로 세션 유효시간 얻기</h4>
		${ pageContext.session.maxInactiveInterval }	
		<h2>2. EL의 header내장객체</h2>
		<!-- request.getHeader("user_agent")식으로 얻는다. -->
		<h4>JSP로 요청헤더값 얻기</h4>
		request.getHeader("user-agent") : <%= request.getHeader("user-agent") %>
		<!-- EL식으로 요청헤더명에 다른 헤더값을 출력할 때는 header내장객체.요청헤더명이나 혹은 header내장객체["요청헤더명"]
			 단, 키값에 해당하는 요청헤더명에 특수문자가 들어가 있는 경우에는 무조건 배열형으로 사용 -->
		<ul style="list-style-type:decimal;">
			<li>\${ header.user-agent }:${ header.user-agent }</li>
			<li>\${ header["user-agent"] }:${ header['user-agent'] }</li>
		</ul>
		<h2>3. EL의 쿠키내장객체</h2>
		<!-- ★EL에서는 값을 설정하거나 영역에 속성을 저장하지 못함.
			 단지 저장된 값을 출력만 할 수 있다. -->
		<% 
			Cookie cookie = new Cookie("cookiename","cookievalue");
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		%>
		<h4>JSP로 쿠키 읽기</h4>
		<%
			Cookie[] cookies=request.getCookies();
			if(cookies != null){
				for(Cookie cook:cookies){
					String name=cook.getName();
					String value=cook.getValue();
					out.println(String.format("쿠키명:%s, 쿠키값:%s<br/>", name, value));
				}
			}
		%>
		<h4>EL로 쿠키 읽기</h4>
		<ul>
			<li>\${ cookie.cookiename.value }:${ cookie.cookiename.value }</li>
			<li>\${ pageContext.request.cookies } : ${ pageContext.request.cookies }</li>
		</ul>
		<h4>JSTL을 이용해서 쿠키배열 출력</h4>
		<ul>
			<c:forEach var="cook" items="${ pageContext.request.cookies }">
			<li>쿠키명:${ cook.name }, 쿠키값:${ cook.value }</li>
			</c:forEach>
		</ul>
		<h2>4. EL의 initParam내장객체(Context초기화 파라미터)</h2>
		<!-- [Context초기화 파라미터]
			:ServletContext의 getInitParameter("파라미터명")을 통해 얻는다.
			-Context를 구성하는 모든 서블릿에서 공유할 수 있는 변수
			[Servlet초기화 파라미터]
			:ServletConfig의 getInitParameter("파라미터명")을 통해 얻는다.
			-해당 서블릿에서만 사용할 수 있는 변수
			★초기화 파라미터는 web.xml에 등록 -->
		<h4>JSP코드로 컨텍스트 초기화 파라미터 얻기</h4>
		<ul style="list-style-type:decimal;">
			<li>ORACLE_DRIVER:<%= application.getInitParameter("ORACLE_DRIVER") %></li>
			<li>ORACLE_DRIVER:<%= this.getInitParameter("ORACLE_DRIVER") %></li>
			<li>ORACLE_URL:<%= application.getInitParameter("ORACLE_URL") %></li>
			<li>PAGE_SIZE:<%= application.getInitParameter("PAGE_SIZE") %></li>
		</ul>
		<h4>EL로 컨텍스트 초기화 파라미터 얻기</h4>
		<ul style="list-style-type:decimal;">
			<li>ORACLE_DRIVER:${ initParam.ORACLE_DRIVER }</li>
			<li>ORACLE_URL:${ initParam['ORACLE_URL'] }</li>
			<li>PAGE_SIZE:${ initParam.PAGE_SIZE }</li>
		</ul>
		<h2>컬렉션에 저장된 객체를 EL로 출력</h2>
		<%
			//JSP코드로 컬렉션에 객체 저장]
			MemberDTO first = new MemberDTO("KIM", "1234", "김길동", null, null);
			MemberDTO second = new MemberDTO("LEE", "1234", "이길동", null, null);
			//리스트 계열 컬렉션에 객체 저장]
			List<MemberDTO> list = new Vector<MemberDTO>();
			list.add(first);
			list.add(second);
			//맵 계열 컬렉션에 객체 저장]
			Map<String,MemberDTO> map = new HashMap<String, MemberDTO>();
			map.put("first", first);
			map.put("second", second);
		%>
		<h4>JSP코드로 출력</h4>
		<h5>리스트 컬렉션</h5>
		<h6>일반 for문 사용</h6>
		<ul style="list-style-type:decimal;">
		<% for(int i=0 ; i<list.size() ; i++){ %>
			<li>아이디:<%= list.get(i).getId()%>, 비번:<%= list.get(i).getPwd() %> ,
				이름:<%= list.get(i).getName() %></li>
		<% } %>
		</ul>
		<h6>확장 for문 사용</h6>
		<ul style="list-style-type:decimal;">
		<% for( MemberDTO mem : list ){ %>
			<li><%= String.format("아이디:%s, 비번:%s, 이름:%s",mem.getId(), mem.getPwd(), mem.getName()) %></li>
		<% } %>
		</ul>
		<h5>맵 컬렉션</h5>
		<ul style="list-style-type:decimal;">
		<% Set<String> keys=map.keySet();
		   for(String key:keys){%>
			<li>아이디:<%= map.get(key).getId() %>, 비번:<%= map.get(key).getPwd() %>, 이름:<%= map.get(key).getName() %></li>
			<% } %>
		</ul>
		<h4>EL로 출력</h4>
		<!-- 스크립팅요소에서 선언한 변수를 EL식에서 사용해봤자 소용없다.
		      JSTL을 이용해서 EL변수로 설정해야 한다. -->
		<c:set var="elList" value="<%= list %>"/>
		<c:set var="elMap" value="<%= map %>"/>
		<h5>리스트 계열 컬렉션(JSTL미사용)</h5>
		<ul style="list-style-type:decimal;">
			<li>아이디:${ elList[0].id }, 비밀번호:${ elList[0].pwd }, 이름:${ elList[0].name }</li>
			<li>아이디:${ elList[1].id }, 비밀번호:${ elList[1].pwd }, 이름:${ elList[1].name }</li>
		</ul>
		<h5>리스트 컬렉션 확장for문 사용</h5>
		<ul style="list-style-type: decimal;">
			<c:forEach var="li" items="${ elList }">
				<li>아이디:${ li.id }, 비밀번호:${ li.pwd }, 이름:${ li.name }</li>
			</c:forEach>
		</ul>
		<h5>맵 컬렉션 (JSTL미사용)</h5>
		<ul style="list-style-type: decimal;">
			<li>아이디:${ elMap.first.id }, 비밀번호:${ elMap.first.pwd }, 이름:${ elMap.first.name }</li>
			<li>아이디:${ elMap.second.id }, 비밀번호:${ elMap.second.pwd }, 이름:${ elMap.second.name }</li>
		</ul>
		<h5>맵 컬렉션 확장for문 사용</h5>
		<ul style="list-style-type: decimal;">
			<c:forEach var="ma" items="${ elMap }">
				<!-- toString을 오버라이딩 하지 않았을 때 -->
				<li>아이디:${ ma.value.id }, 비밀번호:${ ma.value.pwd }, 이름:${ ma.value.name }</li>
			</c:forEach>
		</ul>
		<h5>컬렉션에 저장된 객체 수 얻기:EL변수.size()</h5>
		<ul style="list-style-type:upper-roman;">
			<li>\${ elList.size() }:${ elList.size() }</li>
			<li>\${ elMap.size() }:${ elMap.size() }</li>
		</ul>
	</fieldset>
</body>
</html>