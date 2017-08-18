<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
<%@include file="IncludedPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>IncludeIndex.jsp</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/Styles/divlayout.css" />
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!--탑메뉴 및 로고 감싸는 div시작-->
			<div class="Header">
				<%@ include file="/Template/Top.jsp"%>

			</div>
			<!--탑메뉴 및 로고 감싸는 div끝-->
			<!--left메뉴 및 실제 내용 감싸는 div시작-->
			<div class="section">
				<%@ include file="/Template/Left.jsp"%>

				<div class="body">
					<div class="content">

						<h2>메인페이지입니다.</h2>
						<fieldset>
							<legend style="margin-left: 30px">메인페이지</legend>
							<h3>
								오늘은
								<%=todayString %>입니다.
							</h3>
						</fieldset>
					</div>
				</div>
			</div>
			<!--left메뉴 및 실제 내용 감싸는 div끝-->
			<!--footer를 감싸는 div시작-->
			<%@ include file="/Template/Footer.jsp"%>
			<!--footer를 감싸는 div끝-->
		</div>
	</div>
</body>
</html>
