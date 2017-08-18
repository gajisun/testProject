<%@page import="java.util.Map"%>
<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/IsMember.jsp"%>
<%
	//파라미터(키값) 받기
	String no=request.getParameter("no");
	//현재페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//CRUD작업용 BbsDAO생성
	//상세보기용 메소드 호출
	BbsDAO dao = new BbsDAO(application);
	
	//조회수 update
	dao.updateVisitCount(no);
	
	BbsDTO dto = dao.selectOne(no);
	
	//이전글 다음글 조회
	Map<String,BbsDTO> map = dao.preNnext(no);
	
	//자원반납
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<script>
	function isDelete(){
		var answer=confirm("정말 삭제하시겠습니까?");
	    if (answer){
			//삭제처리로직
			location.href="Delete.jsp?no=<%=dto.getNo()%>&nowPage=<%=nowPage%>";
		}
	}
</script>
<title>View.jsp</title>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Styles/divlayout.css" />
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!--탑메뉴 및 로고 감싸는 div시작-->
			<div class="Header">
				<jsp:include page="/Template/Top.jsp" />
			</div>
			<!--탑메뉴 및 로고 감싸는 div끝-->
			<!--left메뉴 및 실제 내용 감싸는 div시작-->
			<div class="section">
				<jsp:include page="/Template/Left.jsp" />
				<div class="body">
					<div class="content">
						<fieldset style="padding: 20px 0 50px 20px">
							<legend>내용 보기</legend>

							<table width="75%" bgcolor="gray" cellspacing="1">
								<tr bgcolor="white">
									<td width="100px" align="center">글번호</td>
									<td><%= dto.getNo() %></td>
								</tr>
								<tr bgcolor="white">
									<td align="center">작성자</td>
									<td><%= dto.getName() %></td>
								</tr>
								<tr bgcolor="white">
									<td align="center">작성일</td>
									<td><%= dto.getPostdate() %></td>
								</tr>
								<tr bgcolor="white">
									<td align="center">조회수</td>
									<td><%= dto.getVisitcount() %></td>
								</tr>
								<tr bgcolor="white">
									<td align="center">제목</td>
									<td><%= dto.getTitle() %></td>
								</tr>
								<tr bgcolor="white">
									<td align="center" colspan="2">내용</td>
								</tr>
								<tr bgcolor="white">
									<td colspan="2"><%= dto.getContent().replace("\r\n","<br/>") %>
									</td>

								</tr>
								<tr bgcolor="white" align="center">
									<td colspan="2">
										<% if(session.getAttribute("USER_ID").toString().equals(dto.getId())){ %>
										<a href="Edit.jsp?no=<%=dto.getNo()%>&nowPage=<%=nowPage%>">수정
									</a>| <a href="javascript:isDelete()">삭제</a> | <%} %><a
										href="List.jsp?nowPage=<%=nowPage%>">목록</a>
									</td>
								</tr>
							</table>
							<table width="75%">
								<tr>
									<td width="15%">이전글:</td>
									<td><%=map.get("PREV")==null?"이전글이 없습니다": String.format("<a href='View.jsp?no=%s'>%s</a>", map.get("PREV").getNo(),map.get("PREV").getTitle())%></td>
								</tr>
								<tr>
									<td>다음글:</td>
									<td><%=map.get("NEXT")==null?"다음글이 없습니다": String.format("<a href='View.jsp?no=%s'>%s</a>", map.get("NEXT").getNo(),map.get("NEXT").getTitle())%></td>
								</tr>
							</table>
						</fieldset>
					</div>
				</div>
			</div>
			<!--left메뉴 및 실제 내용 감싸는 div끝-->
			<!--footer를 감싸는 div시작-->
			<jsp:include page="/Template/Footer.jsp" />
			<!-- include지시어로 페이지 포함했었음 -->
			<!--footer를 감싸는 div끝-->
		</div>
	</div>
</body>
</html>
