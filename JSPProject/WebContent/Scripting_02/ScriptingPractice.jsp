<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//멤버변수]
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private JspWriter out;
	
	void connect(ServletContext app){
		try {
			//드라이버 로딩]
			Class.forName(app.getInitParameter("ORACLE_DRIVER"));
			//데이터베이스 연결]
			conn = DriverManager.getConnection(app.getInitParameter("ORACLE_URL"),"scott","scott1234");		
			
		} catch (ClassNotFoundException e) {
			try{
				out.println("<h2>드라이버 로딩 실패</h2>");	
			}catch(IOException e1){	}
		}catch(SQLException e){
			try{
				out.println("<h2>데이터베이스 연결 실패</h2>");	
			}catch(IOException e1){	}
		}

	}
	
	void close(){
		try{
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
			
		}catch(SQLException e){}
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ScriptingPractice.jsp</title>
</head>
<body>
	<fieldset>
		<legend>스크립팅 요소 연습하기</legend>
		<h2>표현식(expression)으로 출력</h2>
		<table
			style="background-color: green; border-spacing: 1px; width: 80%">
			<tr style="background-color: white">
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
				<th>입사일</th>
				<th>연봉</th>
				<th>보너스</th>
				<th>부서코드</th>
			</tr>
			<!--  아래 태그 반복 -->
			<%
				this.out=out;
				//데이터베이스 연결]
				connect(application);
				
				String sql="SELECT * FROM EMP ORDER BY HIREDATE DESC";
				psmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,
											ResultSet.CONCUR_UPDATABLE);
				
				rs = psmt.executeQuery();
				while(rs.next()){
			%>
			<tr style="background-color: white; text-align: center">
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getDate(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=rs.getString(8) %></td>
			</tr>
			<% } %>

		</table>

		<h2>out내장객체로 출력</h2>
		<table
			style="background-color: green; border-spacing: 1px; width: 80%">
			<tr style="background-color: white">
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
				<th>입사일</th>
				<th>연봉</th>
				<th>보너스</th>
				<th>부서코드</th>
			</tr>
			<%
			while(rs.previous()){
				out.println("<tr style=\"background-color: white; text-align: center\">");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getDate(5)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+(rs.getString(7)==null?"":rs.getString(7))+"</td>");
				out.println("<td>"+rs.getString(8)+"</td>");
				out.println("</tr>");
			}
			%>

		</table>
	</fieldset>
	<%
	//자원반납
		close();
	%>
</body>
</html>