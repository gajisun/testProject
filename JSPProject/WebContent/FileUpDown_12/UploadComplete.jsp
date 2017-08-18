<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	/*
		파일업로드를 위한 MultipartRequest객체 생성
		※MultipartReqeust객체 생성만으로 파일 업로드가 이루어짐
		MultipartRequest(javax.servlet.http.HttpServletRequest request, 
						java.lang.String saveDirectory, 
						int maxPostSize, --최대업로드 용량
						java.lang.String encoding, encoding타입
						FileRenamePolicy policy) 
		★MultipartRequest 객체 생성시, 최대 업로드 용량 초과시에는 예외 발생
	*/
	//MultipartRequest객체 생성자의 인자 설정
	//업로드할 서버의 물리적 디렉토리 설정
	String saveDirectory = application.getRealPath("/Upload");
	//out.println(saveDirectory);
	//업로드 최대 용량 설정(바이트 단위)
	//파일을 여러개 업로드시에는 각각의 용량을 합친 크기가 최대 용량이다.
	int maxPostSize = 1024 * 500;//500KB
	//인코딩 타입 설정
	String encoding = "UTF-8";
	//파일명이 중복된 경우 파일명을 재정의하도록 FileRenamePolicy객체 얻기(인덱스가 자동으로 부여됨)
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	//MultipartRequest객체 생성
	
	MultipartRequest mr = null;
	String name=null;
	String title=null;
	StringBuffer buffer = new StringBuffer();
	
	try{
		mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding, policy);
		//기타 폼 하위요소 받기
		//request는 mr이 가로채갔기 때문에 아래 받식으로 받아야함.
		name=mr.getParameter("name");
		title=mr.getParameter("title");
		String [] inters=mr.getParameterValues("inter");
		for(String inter:inters)
			buffer.append(inter+"&nbsp;");
		
	}catch(Exception e){
		//에러내용을 리퀘스트영역에 저장
		request.setAttribute("errormessage", "파일 업로드 용량 초과");
		//UploadForm.jsp으로 포워드
		request.getRequestDispatcher("UploadForm.jsp").forward(request, response);
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>UploadComplete.jsp</title>
</head>
<body>
	<fieldset>
		<legend>파일 업로드 결과</legend>
		<h2>type="file"요소를 제외한 폼 요소</h2>
		<ul style="list-style-type:decimal;">
			<li>이름:<%= name %></li>
			<li>제목:<%= title %></li>
			<li>관심사항:<%= buffer %></li>
		</ul>
		<h2>업로드된 file관련 정보</h2>
		<h3>첫번째 파일</h3>
		<ul style="list-style-type:upper-alpha;">
			<li>원본 파일명:<%=mr.getOriginalFileName("attachedFile1") %></li>
			<li>실제 서버에 저장된 파일명:<%= mr.getFilesystemName("attachedFile1") %></li>
			<li>컨텐츠 타입:<%= mr.getContentType("attachedFile1") %></li>
			<li>파일 크기:<%= (int)Math.ceil(mr.getFile("attachedFile1").length()/1024.0) %>KB</li>
		</ul>
		<h3>두번째 파일</h3>
		<ul style="list-style-type:upper-alpha;">
			<li>원본 파일명:<%=mr.getOriginalFileName("attachedFile2") %></li>
			<li>실제 서버에 저장된 파일명:<%= mr.getFilesystemName("attachedFile2") %></li>
			<li>컨텐츠 타입:<%= mr.getContentType("attachedFile2") %></li>
			<li>파일 크기:<%= (int)Math.ceil(mr.getFile("attachedFile2").length()/1024.0) %>KB</li>
		</ul>
	</fieldset>
</body>
</html>