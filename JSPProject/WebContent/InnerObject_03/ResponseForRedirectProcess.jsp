<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ResponseForRedirectProcess.jsp -->
<%
	/*
	사용자가 입력한 아이디와 비번을 받아서 회원인지 판단 후
	회원인 경우 마이페이지로 이동
	아닌 경우 다시 로그인 페이지로 이동시키자]
	가정]아이디가 kim이고 비번이 1234가 회원이라 가정
	*/
	//1]사용자 입력값 받기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	if(id.trim().equals("")){
		out.println("<script>");
		out.println("alert('아이디를 입력하세요')");
		out.println("history.back();");
		out.println("</script>");
	}
	else if(pwd.trim().length()==0){%>
		<script>
			alert("비밀번호를 입력하세요!!");
			history.back();			
		</script>
<%	}
	//2]회원여부 판단(DB테이블에서 조회)
	//3]회원인 경우 로그인처리(session객체로) 후
	//마이페이지로 이동, 회원아니면 다시 로그인페이지로
	if("kim".equals(id) && "1234".equals(pwd)){ //회원
		//방법1]
		//response.sendRedirect(request.getContextPath()+"/InnerObject_03/ResponseForSelfPage.jsp?user="+id+"&pass="+pwd);
		//방법2]자스로 메시지 띄운 후 이동
	%>
		<script>
			//alert("<%=id%>님 즐감하세요");
			//location.href="<%=request.getContextPath()+"/InnerObject_03/ResponseForSelfPage.jsp?user="+id+"&pass="+pwd%>";
		</script>		
	<%
	/*
	★sendRedirect메소드는 자스의 location.href와 같다.
	*/
	//방법3]
	%>
	<form method="post" action="ResponseForSelfPage.jsp">
		<input type="hidden" name="user" value="<%=id%>" />
		<input type="hidden" name="pass" value="<%=pwd%>" />
	</form>
	<script>
		alert("<%=id%>님 마이페이지로 이동합니다");
		document.forms[0].submit();
	</script>
	<%
	}
	else{ //비회원
		response.sendRedirect("ResponseForRedirectIndex.jsp");
	%>
		<script>
			alert("아이디와 비번 불일치");
			//기존값이 유지됨.
			history.back();
			//기존값 사라짐
			//location.href="ResponseForRedirectIndex.jsp";
		</script>
	<%
	}
%>