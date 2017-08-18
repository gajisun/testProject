<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Edit.jsp</title>
	<meta charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/Styles/divlayout.css" />
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
							<legend>자료 수정</legend>
							<form action="${ pageContext.request.contextPath }/DATAROOM/Edit.do" method="post" enctype="multipart/form-data">
								<!-- 키값 -->
								<input type="hidden" name="no" value="${dto.no}"/>
								<!-- 수정전 파일명 -->
								<input type="hidden" name="originalName" value="${dto.attachedfile}"/>
								<table width="75%" bgcolor="gray" cellspacing="1">
									<tr bgcolor="white">
										<td width="30%" align="center">제목</td>
										<td><input type="text" name="title" style="width: 98%" value="${ dto.title }"/></td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">올린이</td>
										<td><input type="text" name="name" style="width: 98%" value="${ dto.name }"/></td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">비밀번호</td>
										<td><input type="password" name="pass" style="width: 50%" value="${ dto.pass }"/>
										<span style="color:red;font-size:.8em;font-weight:bold">수정.삭제시 필요</span>
										</td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">파일</td>
										<td><input type="file" name="attachedfile" style="width: 98%" value=""/>
										${ dto.attachedfile }
										</td>
									</tr>
									
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td><textarea rows="10" style="width: 98%" name="content">${ dto.content }</textarea></td>

									</tr>
									<tr bgcolor="white" align="center">
										<td colspan="2"><input type="submit" value="수정완료" /></td>
									</tr>
								</table>
							</form>
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
