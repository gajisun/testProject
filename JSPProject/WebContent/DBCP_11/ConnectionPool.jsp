<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		커넥션 풀을 이용한 커넥션 객체 사용]
		-톰캣 서버가 커넥션 pool에 미리 생성해 놓은 Connection객체를 갖다 사용하는것		
	*/
	//1]InitialContext객체 생성(Context > InitialContext)
	Context ctx = new InitialContext();
	//2]InitialContext객체로 JNDI서비스 구조의 초기 root디렉토리 얻기(예:c드라이브 접근)
	//lookup해서 각was서버의 서비스 루트 디렉토리를 얻는다.
	//단, 톰캣은 루트 디렉토리명이 java:comp/env이다.
	//ctx=(Context)ctx.lookup("java:comp/env");
	//3]server.xml에 등록한 네이밍을 lookup(우리는 Context.xml에 등록함)
	//-톰캣의 server.xml에 등록한 네이밍으로 DataSource를 얻는다.
	//DataSource source=(DataSource)ctx.lookup("jdbc/myoracle");
	
	//풀경로로 접근
	DataSource source=(DataSource)ctx.lookup(application.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/myoracle");
	
	//4]커넥션pool에서 톰캣서버가 생성해 놓은 Connection객체를 가져다 쓴다.
	Connection conn=source.getConnection();
	String connString;
	if(conn!=null) 	connString="<h2>데이터 베이스 연결 성공</h2>";
	else  connString="<h2>데이터 베이스 연결 실패</h2>";	
	//5]커넥션 풀에 사용한 커넥션 객체 다시 반납(메모리 해제 아님)
	if(conn!=null) conn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ConnectionPool.jsp</title>
</head>
<body>
	<fieldset>
		<legend>커넥션 풀 사용하기</legend>
		<%= connString %>
		
		
		
	</fieldset>
</body>
</html>