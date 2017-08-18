<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int getTotal(int start,int end){
		int total=0;
		for(int i=start;i<=end;i++) total+=i;
		
		return total;
	}



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Expression.jsp</title>
</head>
<body>
	<fieldset>
		<legend>expression(표현식) 사용하기</legend>
		<h2>out내장객체를 사용한 출력</h2>
		<h4>1부터 100까지 누적합</h4>
		<%
			out.println(getTotal(1,100));
			out.println("<h4>1부터 1000까지 누적합</h4>");
			out.println(getTotal(1,1000));
		%>
		<h4>1부터 10000까지 누적합</h4>
		<%	out.println(getTotal(1, 10000)); %>
		<h2>표현식 사용한 출력</h2>
		<h4>1부터 100까지 누적합</h4>
		<%= getTotal(1,100) %>
		<%= "<h4>1부터 1000까지 누적합</h4>" %>
		<%= getTotal(1,1000) %>
		<h4>1부터 10000까지 누적합</h4>
		<%= getTotal(1,10000) %>
	</fieldset>
</body>
</html>