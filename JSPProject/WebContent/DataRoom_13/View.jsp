<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytablib.tld" %>
<!DOCTYPE html>
<html>
<head>
	<title>View.jsp</title>
	<meta charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/Styles/divlayout.css" />
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<style>
		.ui-dialog{
			width:400px !important;
			height:100px !important;
		}
	
	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	$(function(){
	
		//다이얼로그 창 설정
			$("#dialog").dialog({
				autoOpen : false,
				show : { effect : "blind", duration : 1000	},
				hide : { effect : "explode", duration : 1000 }
			});

			//수정 클릭
			$("#update").on("click", function() {
				//모드 설정
				$("form").get(0).mode.value = "UPDATE";
				//다이얼로그 창 띄우기
				$("#dialog").dialog("open");

			});

			//삭제 클릭
			$("#delete").click(function() {
				if (confirm("정말로 삭제할래?")) {
					//모드 설정
					$("form").get(0).mode.value = "DELETE";
					$("#dialog").dialog("open");
				}

			});

		});
	
		function updateDownCount(){
			var span = document.getElementById("downcount");
		
			span.innerHTML = parseInt(span.innerHTML)+1;
		}
	</script>
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
							<legend>자료 보기</legend>
								<table width="75%" bgcolor="gray" cellspacing="1">
									<tr bgcolor="white">
										<td width="30%" align="center">제목</td>
										<td>${ dto.title }</td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">올린이</td>
										<td>${ dto.name }</td>
									</tr>
									
									<tr bgcolor="white">
										<td width="30%" align="center">파일</td>
										
										<td><a onclick="updateDownCount();" href='<c:url value="/DATAROOM/Download.do?filename=${ my:urlEncoder(dto.attachedfile) }"/>'>${ dto.attachedfile }</a>
										</td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">다운로드 수</td>
										<td><span id="downcount">${ dto.downcount }</span></td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">등록일</td>
										<td>${ dto.postdate }
										</td>
									</tr>
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td>${ dto.content }</td>

									</tr>
									<tr bgcolor="white" align="center">
										<td colspan="2">
											<a href="#" id="update">수정</a> | 
											<a href="#" id="delete">삭제</a> | 
											<a href="<c:url value='/DATAROOM/List.do' />">목록</a>
										</td>
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
	
	<!-- 수정 및 삭제시 비밀번호를 입력받기 위한 다이얼로그 -->
	<div id="dialog" title="비밀번호 입력창">
		<form method="post" action="<c:url value='/DATAROOM/Password.do'/>">
			<!-- 키값 -->
			<input type="hidden" name="no" value="${dto.no }" />
			<!-- 수정/삭제 판단용 -->
			<input type="hidden" name="mode" /> 
			비밀번호 <input type="password" name="pass" style="border: none; border-bottom: 1px red solid" /> 
			<input 	type="submit" value="확인" />
		</form>
	</div>


</body>
</html>
