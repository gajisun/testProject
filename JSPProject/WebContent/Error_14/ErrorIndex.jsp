<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ErrorIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>web.xml에 설정을 통한 예외처리</legend>
		<%
			//방법1)try~catch사용
			/*try{
				out.println("파라미터 길이:"+request.getParameter("name").length());
			}catch(Exception e){out.println("관리자에게 문의하세요");}
			//방법2)page지시어 속성 사용

			//방법3)web.xml의 설정으로 예외 처리
			/*
				설정을 통한 에러 처리]
				-개발완료 후 범용적인 에러 처리시
				1)에러코드로
				2)예외클래스 직접 지정-예외 클래스 직접 지정이 우선한다.

				location:컨텍스트 루트를 제외한 /로 시작하는 웹상의 경로
			*/
			out.println("파라미터 길이:"+request.getParameter("name").length());
			
		%>
	
	</fieldset>
</body>
</html>