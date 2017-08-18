<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytablib.tld" %>
<!DOCTYPE html>
<html>
<head>
<title>List.jsp</title>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href='<c:url value="/Styles/divlayout.css"/>' />
<script>
	
	function updateDownCount(count){
		var span = document.getElementById("downcount"+count);
		
		span.innerHTML = parseInt(span.innerHTML)+1;
	}

</script>
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
							<legend>자료실 목록(${ nowPage }/ ${ totalPage })</legend>
							<table width="100%">
								<tr align="right">
								
									<td><a href="<c:url value='/DATAROOM/Write.do'/>">글작성</a></td>
								</tr>
							</table>

							<table width="100%" bgcolor="gray" cellspacing="1">
								<tr bgcolor="white" align="center">
									<th width="10%">번호</th>
									<th width="40%">제목</th>
									<th width="15%">작성자</th>
									<th width="15%">자료</th>
									<th width="10%">다운로드수</th>
									<th>등록일</th>
								</tr>
								<c:choose>
									<c:when test="${ empty list }">
								<tr bgcolor="white" align="center">
									<td colspan="6">등록된 글이 없어요</td>
								</tr>	
									</c:when>
									<c:otherwise>
										<c:forEach var="item" items="${ list }" varStatus="loop">
								<tr bgcolor="white" align="center">
									<td>${ totalRecordCount - (((nowPage - 1) * pageSize) + loop.index) }</td>
									<td align="left"><a href='<c:url value="/DATAROOM/View.do?no=${ item.no }"/>'>${ item.title }</a></td>
									<td>${ item.name }</td>
									<td><a onclick="updateDownCount(${loop.count});" href='<c:url value="/DATAROOM/Download.do?filename=${ my:urlEncoder(item.attachedfile) }&no=${ item.no }"/>'>${ item.attachedfile }</a></td>
									<td><span id="downcount${ loop.count }">${ item.downcount }</span></td>
									<td>${ item.postdate }</td>
								</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
							<!-- 페이징 -->
							<table width="100%">
								<tr align="center">
									<td>${ pagingstring }</td>
								</tr>
							</table>
							
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
