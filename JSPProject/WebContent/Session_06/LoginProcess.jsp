<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	//사용자 입력값 받기
	String user = request.getParameter("user").trim();
	String pass = request.getParameter("pass").trim();
	//id:kim pwd:1234 rkwjd
	//if("KIM".equals(user) && "1234".equals(pass)){
		
	//실제 테이블과 연동
	BbsDAO dao = new BbsDAO(application);
	boolean flag=dao.isMember(user,pass);
	dao.close();
	
	if(flag){
	
		//1.로그인 처리]-세션영역에 속성 저장
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pass);
		//2.로그인 처리 후 마이페이지로 이동
		response.sendRedirect("My_Page.jsp");
	}
	else{//비회원-다시 로그인 페이지로 포워드
		/*
		out.println("<script>");
		out.println("alert(\"아이디와 비번 불일치\");");
		out.println("history.back();");
		out.println("</script>");
		*/
		//리퀘스트 영역에 필요한 데이터 저장
		request.setAttribute("ERROR_MSG", "아이디와 비번 불일치");
		//로그인 페이지로 포워드
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>