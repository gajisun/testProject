<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>DynamicPageIncluding.jsp</title>
</head>
<body>
	<fieldset>
		<legend>페이지 선택해서 동적으로 페이지 포함하기</legend>
		<% 
			String pageName=request.getParameter("pageName"); 
			if(pageName == null){
				pageName="DirectivePage.jsp";
			}
		%>
		<form>
			<!-- 폼태그에 액션을 지정하지 않아 현재페이지를 보내준다. -->
			<select name="pageName">
				<option value="DirectivePage.jsp" <%if(pageName.indexOf("D") != -1) {%> selected="selected"<%} %> >DirectivePage.jsp</option>
				<option value="ActionTagPage.jsp" <%if(pageName.indexOf("A") != -1) {%> selected="selected"<%} %>>ActionTagPage.jsp</option>
								
			</select> <input type="submit" value="페이지 선택" />
		</form>
		<%
			if(request.getParameter("pageName") != null){
		%>
		<jsp:include page="<%= pageName %>" />
		<% } %>
	</fieldset>
	<%
      	//문]현재 계절에 맞는 페이지를 상기 변수에 저장하여라  
		String []seasons={"Spring.jsp","Summer.jsp", "Autumn.jsp", "Winter.jsp"};
      	String season=seasons[1];
      	      	
      	Calendar date = Calendar.getInstance();
      	int month = date.get(Calendar.MONTH)+1;
      	switch(month){
      		case 3:
      		case 4:
      		case 5: season=seasons[0]; break;
      		case 6:
      		case 7:
      		case 8: season=seasons[1]; break;
      		case 9:
      		case 10:
      		case 11: season=seasons[2]; break;
      		default : season=seasons[3];
      	}
 	%>

	<fieldset>
		<legend>계절에 따른 페이지 변화 시키기</legend>
		<jsp:include page="<%= season %>" />
	</fieldset>

</body>
</html>