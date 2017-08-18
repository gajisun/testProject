<%@page import="model.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@include file="/Common/IsMember.jsp" %>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
	//검색과 관련된 파라미터 받기]
	String searchWord = request.getParameter("searchWord");
	String searchColumn = request.getParameter("searchColumn");
	
	//검색 후 페이징과 관련된 파라미터를 전달할 값을 저장할 변수
	String addQuery = "";
	if(searchWord != null){
		addQuery+="searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
	}
	
	Map <String, Object> map = new HashMap<String,Object>();
	
	if(searchColumn != null){
		map.put("searchColumn",searchColumn);
		map.put("searchWord",searchWord);
	}
	
	//전체목록 가져오기
	BbsDAO dao = new BbsDAO(application);
	//페이징을 위한 로직시작]	
	//전체 레코드 수
	int totalRecordCount = dao.getTotalRecordCount(map);
	//페이지 사이즈
	int pageSize=Integer.valueOf(application.getInitParameter("PAGE_SIZE"));
	//블락 페이지
	int blockPage=Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
	//전체 페이지 수
	int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);
	//현재 페이지
	int nowPage=request.getParameter("nowPage")==null?1:Integer.parseInt(request.getParameter("nowPage"));
	//시작 및 끝
	int start= (nowPage-1)*pageSize+1;
	int end = nowPage*pageSize;
	map.put("start", start);
	map.put("end", end);
			
	//페이징을 위한 로직 끝]
	List <BbsDTO> records =dao.selectList(map);
		
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<title>List.jsp</title>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/Styles/divlayout.css" />
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!--탑메뉴 및 로고 감싸는 div시작-->
			<div class="Header">
				<jsp:include page="/Template/Top.jsp"/>
				

			</div>
			<!--탑메뉴 및 로고 감싸는 div끝-->
			<!--left메뉴 및 실제 내용 감싸는 div시작-->
			<div class="section">
				<jsp:include page="/Template/Left.jsp"/>
				<div class="body">
					<div class="content">
						<fieldset style="padding: 20px 0 50px 20px">
							<legend>회원제 게시판 목록(<%=nowPage %>/<%=totalPage %>)</legend>
							<table width="100%">
								<tr align="right">
									<td><a href="Write.jsp">글작성</a></td>
								</tr>
							</table>

							<table width="100%" bgcolor="gray" cellspacing="1">
								<tr bgcolor="white" align="center">
									<th width="10%">번호</th>
									<th width="45%">제목</th>
									<th width="15%">작성자</th>
									<th width="10%">조회수</th>
									<th>작성일</th>
								</tr>
								<%	if(records.isEmpty()){ %>
									<tr bgcolor="white" align="center">
									<td colspan="5">등록된 글이 없어요</td>
									</tr>	
								<%	}
									else{	//반복
										int count=0;
										for(BbsDTO record:records){%>
								
								<tr bgcolor="white" align="center">
									<td><%= totalRecordCount - (((nowPage - 1) * pageSize) + count) %></td>
									<td align="left"><a href="View.jsp?no=<%= record.getNo() %>&nowPage=<%=nowPage%>"><%= record.getTitle() %></a></td>
									<td><%= record.getName() %></td>
									<td><%= record.getVisitcount() %></td>
									<td><%= record.getPostdate() %></td>
								</tr>
								<%			count++;
										}///////for
									}////////else %>
							</table>
							<!-- 페이징 -->
							<table width="100%">
								<tr align="center">
									<td><%= PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "List.jsp?"+addQuery) %></td>
								</tr>
							</table>
							<!-- 검색UI -->
							<form method="post">
								<table width="100%">
									<tr align="center">
										<td><select name="searchColumn">
												<option value="title">제목</option>
												<option value="name">작성자</option>
												<option value="content">내용</option>
										</select> <input type="text" name="searchWord" /> <input type="submit"
											value="검색" /></td>
									</tr>
								</table>
							</form>
						</fieldset>
					</div>
				</div>
			</div>
			<!--left메뉴 및 실제 내용 감싸는 div끝-->
			<!--footer를 감싸는 div시작-->
			<jsp:include page="/Template/Footer.jsp"/>
			<!-- include지시어로 페이지 포함했었음 -->
			<!--footer를 감싸는 div끝-->
		</div>
	</div>
</body>
</html>
