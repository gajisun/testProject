<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ApplicationIO</title>
</head>
<body>
	<fieldset>
		<legend>application내장객체의 getResourceAsStream()메소드</legend>
		<h2>자바 IO를 이용해서 파일내용을 웹브라우저에 출력</h2>
		<%
		/*
			데이터 소스:파일-노드스트림
						브릿지 스트림
			데이터 목적지:웹브라우저-out내장객체
		*/
		
		//1]물리적 경로 얻기
		String path=application.getRealPath("/InnerObject_03/Sample.txt");
		//2]입력 스트림 생성-서버의 파일에 빨대 꽂기
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path)));
		//3]br로 읽고 out내장객체로 출력
		String data;
		while((data=br.readLine())!=null){
			out.println(data);
		}
		//4]스트림 닫기
		br.close();
		%>
				
		<h2>getResourceAsStream()메소드를 사용해서 파일내용을 웹브라우저에 출력</h2>
		<%
		/*
			InputStream getResourceAsStream("컨텍스트 루트를 제외한 /로 시작하는 웹상의 경로")			
			-웹 어플리케이션 안의 모든 자원(이미지,텍스트파일,동영상)
		      에 빨대를 꽂을 수 있는 입력스트림을 반환 해주는 메소드
			-물리적 경로 불필요
			-웹상의 경로만 알면 됨.			
		*/
		br = new BufferedReader(new InputStreamReader(application.getResourceAsStream("/InnerObject_03/Sample.txt")));
		
		while((data=br.readLine())!=null){
			out.println(data);
		}
		//4]스트림 닫기
		br.close();
		%>
		
	</fieldset>
</body>
</html>