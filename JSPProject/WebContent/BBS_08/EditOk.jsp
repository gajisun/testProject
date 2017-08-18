<%@page import="javax.swing.JOptionPane"%>
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
	String no = request.getParameter("no");
	String nowPage = request.getParameter("nowPage");
	
	//데이터를 전달할 DTO객체 생성 및 데이터 설정
	BbsDTO dto = new BbsDTO();
	dto.setNo(no);
	dto.setTitle(title);
	dto.setContent(content);

	//CRUD작업용 DAO객체 생성
	BbsDAO dao = new BbsDAO(application);
	int affected = dao.update(dto);
	dao.close();
	if( affected == 1 ){
		response.sendRedirect("View.jsp?no="+no+"&nowPage="+nowPage);
	}
	else{ %>
		<script>
			alert("수정실패");		
			history.back();
		</script>
<%	} %>