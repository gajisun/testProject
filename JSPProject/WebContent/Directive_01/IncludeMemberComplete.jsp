<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Directive_01/IncludedPage.jsp" %>

<%!
	String getStringValue(String value){
		switch(value){
			case "man":return "남";
			case "woman":return "여";
			case "trans":return "트랜스젠더";
			case "spo":return "스포츠";
			case "ent":return "연예";
			case "pol":return "정치";
			case "eco" : return "경제";
			case "ele":return "초등학교";
			case "mid":return"중학교";
			case "hig":return "고등학교";
			default : return "대학교";
		}

	}
%>
<%
	//POST방식일 때 한글처리용 코드 추가
	request.setCharacterEncoding("UTF-8");
	
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String gender=getStringValue(request.getParameter("gender"));
	String[]inters=request.getParameterValues("inter");
	String grade=getStringValue(request.getParameter("grade"));
	String fileName=request.getParameter("file");
	
	String self=request.getParameter("self");
	//self=self.replace("\r\n", "<br/>"); 더 좋은 방법
	String []selfs = self.split("\r\n");
	String selfStr="";
	if(selfs != null){
		for(String str : selfs)
			selfStr+=str+"<br/>";
	}
	
	String values="";
	if(inters != null){
		values += "관심사항:";
		for(String inter:inters){
			values += getStringValue(inter)+"&nbsp";
		}
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<title>IncludeMemberComplete.jsp</title>
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
						<h2>회원 가입 페이지 완료정보:<%=todayString %></h2>
						
							<table
								style="width: 75%; border-spacing: 1px; background-color: green">

								<tr style="background-color: white">
									<td>아이디</td>
									<td><%= id %></td>
								</tr>
								<tr style="background-color: white">
									<td>비밀번호</td>
									<td><%= pwd %></td>
								</tr>
								
								<tr style="background-color: white">
									<td>성별</td>
									<td><%= gender %></td>
								</tr>
								<tr style="background-color: white">
									<td>관심사항</td>
									<td><%= values %></td>
								</tr>
								<tr style="background-color: white">
									<td>학력사항</td>
									<td><%= grade %></td>
								</tr>
								<tr style="background-color: white">
									<td>첨부파일</td>
									<td><%= fileName %></td>
									
								</tr>
								<tr style="background-color: white">
									<td>자기소개</td>
									<td><%= selfStr %></td>
									
								</tr>
								
							</table>
						
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
