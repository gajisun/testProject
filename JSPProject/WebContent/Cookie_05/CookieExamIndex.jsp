<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트(웹브라우저)에서 전송한 쿠키 읽기
	Cookie[] cookies=request.getCookies();
	StringBuffer buffer = new StringBuffer();
	
	String user="";
	
	if(cookies != null){
		for(Cookie ck:cookies){
			//장바구니에 담은 상품 꺼내오기
			if(ck.getName().indexOf("")!=-1){
				buffer.append(ck.getName());
			}
			//아이디 저장용 쿠키 체크
			if(ck.getName().indexOf("USER_ID") != -1){
				user=ck.getValue();	
			}
		}
	
	}

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>CookieExamIndex.jsp</title>
</head>
<body>
	<fieldset>
        <legend>쿠키를 이용한 장바구니 예제</legend>
        <form action="CookieExamCartResult.jsp">
            <input type="checkbox" name="cart" value="product1" <%if(buffer.indexOf("product1") != -1){ %> disabled="disabled" checked="checked" <%} %>/>상품1
            <input type="checkbox" name="cart" value="product2" <%if(buffer.indexOf("product2") != -1){ %> disabled="disabled" checked="checked" <%} %>/>상품2
            <input type="checkbox" name="cart" value="product3" <%if(buffer.indexOf("product3") != -1){ %> disabled="disabled" checked="checked" <%} %>/>상품3
            <input type="checkbox" name="cart" value="product4" <%if(buffer.indexOf("product4") != -1){ %> disabled="disabled" checked="checked" <%} %>/>상품4
            <input type="submit" value="장바구니 담기"/>        
        </form>
        <form action="CookieExamCartEmpty.jsp">
            <input type="submit" value="장바구니 비우기"/>        
        </form>
    </fieldset>
    <fieldset>
        <legend>쿠키를 이용한 아이디 저장 예제</legend>
        <span style="color:red;font-weight:bold"><%= request.getAttribute("ERROR_MSG") == null ? "" : request.getAttribute("ERROR_MSG") %></span>
        <form method="post" action="CookieExamLoginProcess.jsp" >
            <table style="width:400px;border-spacing:1px;background-color:green">
                <tr style="background-color:white">
                    <td style="width:25%">아이디</td>
                    <td>
                                
                        <input type="text" name="user" value='<%= request.getParameter("user") == null ? user : request.getParameter("user")%>'/>
                   
                        <input type="checkbox" name="idsave" value="Y"  <%if(user.length() != 0 ){ %> checked ="checked"<% } %>/> 아이디저장
                    </td>
                </tr>
                <tr style="background-color:white">
                    <td>비밀번호</td>
                    <td><input type="password" name="pass" value="<%= request.getParameter("pass") == null ? "" : request.getParameter("pass")%>"/></td>
                </tr>
                <tr style="background-color:white;text-align:center">                   
                    <td colspan="2"><input type="submit" value="로그인"/></td>
                </tr>
            </table>       
        </form>
      	<% if(session.getAttribute("USER_ID") != null){ %>
        <a href="CookieExamLoginLogout.jsp">로그아웃</a>
    	<% } %>
    </fieldset> 
</body>
</html>