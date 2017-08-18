<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Write.jsp</title>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/Styles/divlayout.css" />
	<script>
		function isValidate(formObject){
			if(formObject.title.value==""){
				alert("제목을 입력하세요");
				formObject.title.focus();
				return false;
			}
			if(formObject.name.value==""){
				alert("올린이를 입력하세요");
				formObject.name.focus();
				return false;
			}
			else{
				if(formObject.name.value.length>10){
					alert("이름은 10자 이하로 입력");
					formObject.name.focus();
					return false;
				}
			}
			if(formObject.pass.value.length==0){
				alert("비밀번호를 입력하세요");
				formObject.pass.focus();
				return false;
			}
			if(formObject.attachedfile.value.length==0){
				alert("파일을 첨부하세요");
				formObject.name.focus();
				return false;
			}
			else{
				//파일 사이즈(바이트):파일객체.files[0].size
				//파일명:파일객체.files[0].name
				//파일 컨텐츠 타입:파일객체.files[0].type
				if(Math.ceil(formObject.attachedfile.files[0].size/1024)>500){
					alert("파일크기는 최대 500KB여야 합니다.");
					alert("파일크기:"+formObject.attachedfile.files[0].size/1024+"KB, 파일명:"+formObject.attachedfile.files[0].name
							+",파일타입:"+formObject.attachedfile.files[0].type);
					return false;
				}
			}
			if(formObject.content.value==""){
				alert("내용을 입력하세요");
				formObject.content.focus();
				return false;
			}
			
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
							<legend>자료 등록</legend>
							<span style="color:red;font-size:1.5em;">${ errorMessage }</span>
							<form onsubmit="return isValidate(this);" action="${ pageContext.request.contextPath }/DATAROOM/Write.do" method="post" enctype="multipart/form-data">
								<table width="75%" bgcolor="gray" cellspacing="1">
									<tr bgcolor="white">
										<td width="30%" align="center">제목</td>
										<td><input type="text" name="title" style="width: 98%" value="${ dto.title==null?'':dto.title }"/>
										</td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">올린이</td>
										<td><input type="text" name="name" style="width: 98%" value="${ dto.name==null?'':dto.name }"/>
										</td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">비밀번호</td>
										<td><input type="password" name="pass" style="width: 50%" value="${ dto.pass==null?'':dto.pass }"/>
										<span style="color:red;font-size:.8em;font-weight:bold">수정.삭제시 필요</span>
										</td>
									</tr>
									<tr bgcolor="white">
										<td width="30%" align="center">파일</td>
										<td><input type="file" name="attachedfile" style="width: 98%" />
										${ dto.attachedfile==null?'':dto.attachedfile }
										</td>
									</tr>
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td><textarea rows="10" style="width: 98%" name="content">${ dto.content==null?'':dto.content }</textarea>
										</td>

									</tr>
									<tr bgcolor="white" align="center">
										<td colspan="2"><input type="submit" value="등록" onclick="isValidate(this)" /></td>
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
