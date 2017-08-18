<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- WriteOk.jsp -->
<%@ include file="/Common/IsMember.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title=request.getParameter("title");
	String content = request.getParameter("content");
	String id = String.valueOf(session.getAttribute("USER_ID"));
	
	//데이터를 전달할 DTO객체 생성 및 데이터 설정
	BbsDTO dto = new BbsDTO();
	dto.setId(id);
	dto.setTitle(title);
	dto.setContent(content);

	//CRUD작업용 DAO객체 생성
	BbsDAO dao = new BbsDAO(application);
	int affected = dao.insert(dto);
	dao.close();
	if( affected == 1 ){
		response.sendRedirect("List.jsp");
	}
	else{ %>
		<script>
			alert("입력실패");		
			history.back();
		</script>
<%	} %>