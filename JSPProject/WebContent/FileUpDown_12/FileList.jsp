<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getRealPath("/Upload");
	
	File file = new File(saveDirectory);
	File[] files=file.listFiles();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>FileList.jsp</title>
</head>
<body>
	<fieldset>
		<legend>업로드된 파일 목록</legend>
		<ul style = "list-style-type:upper-latin;">
			<% for(File f:files){ %>
			<li><a href='Download.jsp?filename=<%= URLEncoder.encode(f.getName(), "UTF-8") %>'>파일명:<%= f.getName() %></a>,
					파일크기:<%= (int)Math.ceil(file.length()/1024.0) %></li>
			<% } %>
		</ul>
	</fieldset>
</body>
</html>