<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ForwardExamProcess.jsp -->
<%
	//1]파라미터 받기
	String user=request.getParameter("userid").trim();
	String pwd=request.getParameter("pwd").trim();
	//2]아이디가 KIM이고 비번이 1234면 회원
	//회원인 경우 로그인 처리
	//로그인 처리 후 액션태그를 이용해서 ForwardExamMyPage.jsp로 포워드해라.
	//MyPage에서는 아이디와 비번 출력하고 로그아웃처리
	if("KIM".equals(user) && "1234".equals(pwd)){//회원
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pwd);
%>
	<jsp:forward page="/ActionTag_07/ForwardExamMyPage.jsp"/>
<%
	}
	
	//3]비회원인 경우는 리퀘스트 영역에 에러메시지 저장
	//다시 로그인 페이지로 액션태그를 이용해서 포워드하여라
	//또한 포워드시 사용자가 입력한 아이디와 비번을 그대로 input태그에 출력하여라.
	else{//비회원
		request.setAttribute("ERROR_MSG", "회원이 아닙니다.");
		
%>
		<jsp:forward page="/ActionTag_07/ForwardExamLogin.jsp"/>
<%
	}
%>