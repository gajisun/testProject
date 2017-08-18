<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CookieExamCartEmpty.jsp -->
<%
	//장바구니 비우기-쿠키삭제
	//브라우저가 보낸 쿠키 얻기]★★★★★
	Cookie[] cookies=request.getCookies();
	if(cookies != null){
		for(Cookie cook:cookies){
			if((cook.getName().indexOf("product")) != -1){
			//1]동일한 쿠키명으로 쿠키 생성, 쿠키값은 빈 문자열로
			Cookie ck = new Cookie(cook.getName(),"");
			ck.setPath(request.getContextPath());
			//2]유효기간은 0이나 -값으로 설정
			ck.setMaxAge(0);
			//3]다시 응답헤더에 추가
			response.addCookie(ck);
			}
		}
	}
	//다시 장바귀 페이지로 이동]
	response.sendRedirect("CookieExamIndex.jsp");
%>