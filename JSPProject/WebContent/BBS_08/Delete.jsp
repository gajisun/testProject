<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.HashMap"%>
<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String no=request.getParameter("no");
	int nowPage=Integer.parseInt(request.getParameter("nowPage"));
		
	BbsDAO dao = new BbsDAO(application);

	int affected = dao.delete(no);
	
	int total=dao.getTotalRecordCount(new HashMap<String,Object>());
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int totalPage=(int)Math.ceil((double)total/pageSize);
	
	int start= (nowPage-1)*pageSize+1;
	
	if(nowPage>totalPage)
		nowPage=totalPage;
		
	dao.close();
	if (affected == 1) { 
			
	%>
		alert("삭제되었습니다.");
	
<%
		response.sendRedirect("List.jsp?nowPage="+nowPage);
	} else {
%>
<script>
	alert("삭제실패");
	history.back();
</script>
<%
	}
%>