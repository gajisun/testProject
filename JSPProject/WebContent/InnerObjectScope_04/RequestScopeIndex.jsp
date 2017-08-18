<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	포워드방식으로 파라미터전달시
	한글 처리-포워드 시키는 페이지에서 하자(권장)
	*/
	request.setCharacterEncoding("UTF-8");
	/*
	모든 영역(페이지,리퀘스트,세션,어플리케이션)에는 
	모든 타입(Object)의 객체 저장 가능
	파라미터로 값을 전달할때는 문자열만 가능
	※request영역에 저장한 속성은 그 요청에 대한 응답이 완료되면 사라진다.
	request영역에는 request객체(HttpServletRequest타입)존재
	*/
	//리퀘스트 영역에 속성 저장]
	request.setAttribute("requestNumber", 1000);
	request.setAttribute("requestString", "페이지영역에 저장한 문자열");
	request.setAttribute("requestDate", new Date());
	request.setAttribute("requestMemberFirst", new MemberDTO("KIM", "1234", "김길동", null, "20"));

	MemberDTO requestMemberSecond = new MemberDTO();
	requestMemberSecond.setId("PARK");
	requestMemberSecond.setPwd("1234");
	requestMemberSecond.setName("박영희");
	requestMemberSecond.setAge("30");

	request.setAttribute("requestMemberSecond", requestMemberSecond);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>RequestScopeIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>리퀘스트 영역</legend>
		<h2>리퀘스트영역에 저장된 속성값</h2>
		<%
			Object object=request.getAttribute("requestDate");
			String dateString = null;
			if(object instanceof Date){
				SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
				dateString = simple.format((Date)object);
			}
			MemberDTO firstMember=(MemberDTO)request.getAttribute("requestMemberFirst");
			String firstString = String.format("아이디:%s,비번:%s,이름:%s,나이:%s",
											firstMember.getId(),firstMember.getPwd(),
											firstMember.getName(),firstMember.getAge());
			
			MemberDTO secondMember=(MemberDTO)request.getAttribute("requestMemberSecond");
			
		%>	
		<ul style="list-style-type:upper-roman;">
			<li>Integer타입:<%= request.getAttribute("requestNumber") %></li>
			<li>String타입:<%= request.getAttribute("requestString") %></li>
			<li>Date타입:<%= dateString %></li>
			<li>MemberDTO타입1:<%= firstString %></li>
			<li>MemberDTO타입2-아이디:<%= secondMember.getId() %>,비번:<%= secondMember.getPwd() %>,
								이름:<%= secondMember.getName() %>,나이:<%= secondMember.getAge() %></li>
		</ul>
		<h2>리퀘스트영역에 저장된 속성값 삭제 후 출력</h2>
		<%
			//속성이 틀린경우 삭제가 안됨. 에러는 안남
			request.removeAttribute("NOKEY");
			//존재하는 키값으로 삭제
			request.removeAttribute("requestNumber");
			request.removeAttribute("requestString");
		%>
		<ul style="list-style-type:upper-roman;">
			<li>Integer타입:<%= request.getAttribute("requestNumber") %></li>
			<li>String타입:<%= request.getAttribute("requestString") %></li>
			<li>Date타입:<%= dateString %></li>
			<li>MemberDTO타입1:<%= firstString %></li>
			<li>MemberDTO타입2-아이디:<%= secondMember.getId() %>,비번:<%= secondMember.getPwd() %>,
								이름:<%= secondMember.getName() %>,나이:<%= secondMember.getAge() %></li>
		</ul>
		<h2>페이지 이동</h2>
		<a href="RequestScopeResult.jsp">사용자 클릭에 의한 페이지 이동</a>
	</fieldset>
	<%
	//[사용자 클릭이 아닌 자동으로 페이지 이동하는 방법]
    //[forward방식]
    /*
     -최초 요청시 생성된 request객체를 포워드되는
      페이지로 전달한다.
     -고로 포워드 되는 페이지와 리퀘스트 영역을
      공유한다
     -URL주소창에는 최초 요청한 URL이 보인다.
     (포워드된 URL아님)
    */
		//자동으로 이동할 페이지 설정]
		//RequestDispatcher dispatcher=request.getRequestDispatcher("RequestScopeResult.jsp?param=포워드");
		//forward방식]
		//dispatcher.forward(request, response);
		//redirect방식]
		/*
			- location.href로 이동한 거 와 같다
     		- 즉 새로운 요청이다.
     		- 고로 리퀘스트영역이 공유가 안된다.
     		- URL주소창에는 리다이렉트된 최종 URL이 보인다.  
		*/
		response.sendRedirect("RequestScopeResult.jsp?param="+URLEncoder.encode("리다이렉트", "UTF-8"));
	%>
</body>
</html>