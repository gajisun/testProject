<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CookieExamLoginProcess.jsp -->
<%
	//사용자 입력값 받기]
	String user = request.getParameter("user").trim();
	String pass = request.getParameter("pass").trim();
	String idsave = request.getParameter("idsave");
	
	if("PARK".equals(user)&&"1234".equals(pass)){	//회원
		//로그인 처리
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pass);
		
		//아이디저장 체크여부 판단
		if(idsave != null){
			//아이디를 쿠키에 저장
			Cookie cookie = new Cookie("USER_ID",user);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		}
		else{
			//체크 해제된 경우 쿠키 삭제
			Cookie cookie = new Cookie("USER_ID","");
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(-10);
			response.addCookie(cookie);
		}
		//로그인 결과 페이지로 이동
		response.sendRedirect("CookieExamLoginResult.jsp");
	}
	else{ //비회원
		//에러메시지 리퀘스트 영역에 저장]
		request.setAttribute("ERROR_MSG", "회원이 아닙니다.");
		
		//다시 로그인페이지로 포워드
		request.getRequestDispatcher("CookieExamIndex.jsp").forward(request,response);
	}

%>