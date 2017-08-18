<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Directive_01/IncludedPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>IncludeMember.jsp</title>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="/JSPProject/Styles/divlayout.css" />
<script type="text/javascript" src="/JSPProject/JS/member.js"></script>

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
						<h2>회원 가입 페이지:<%=todayString %></h2>
						<form name="frmObj" action="IncludeMemberComplete.jsp" method="post"
							onsubmit="return isValidate(this)">

							<table
								style="width: 75%; border-spacing: 1px; background-color: green">

								<tr style="background-color: white">
									<td>아이디</td>
									<td><input type="text" name="id" size="20" /></td>
								</tr>
								<tr style="background-color: white">
									<td>비밀번호</td>
									<td><input type="password" name="pwd" size="20" /></td>
								</tr>
								<tr style="background-color: white">
									<td>비밀번호확인</td>
									<td><input type="password" name="pwd2" id="pwd2" size="20" /></td>
								</tr>
								<tr style="background-color: white">
									<td>성별</td>
									<td><input type="radio" name="gender" value="man" />남 <input
										type="radio" name="gender" value="woman" />녀 <input
										type="radio" name="gender" value="trans" />트랜스젠더</td>
								</tr>
								<tr style="background-color: white">
									<td>관심사항</td>
									<td><input type="checkbox" name="inter" value="pol" />정치
										<input type="checkbox" name="inter" value="eco" />경제 <input
										type="checkbox" name="inter" value="spo" />스포츠 <input
										type="checkbox" name="inter" value="ent" />연예</td>
								</tr>
								<tr style="background-color: white">
									<td>학력사항</td>
									<td><select name="grade">
											<option value="">==학력을 선택하세요==</option>
											<option value="ele">초등학교</option>
											<option value="mid">중학교</option>
											<option value="hig">고등학교</option>
											<option value="uni">대학교</option>
									</select></td>
								</tr>
								<tr style="background-color: white">
									<td>첨부파일</td>
									<td><input type="file" name="file" size="40" /></td>
								</tr>
								<tr style="background-color: white">
									<td>자기소개</td>
									<td><textarea cols="60" rows="5" name="self"></textarea></td>
								</tr>
								<tr style="background-color: white">
									<td colspan="2" align="center">
										<table>
											<!-- 방법1:submit기능이 있는 폼 하위태그-->
											<tr>
												<td><input type="image"
													src="/JSPProject/Images/button.jpg" title="type=image"
													alt="image버튼" />
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</form>

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
