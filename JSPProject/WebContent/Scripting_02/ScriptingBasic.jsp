<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!//선언부(Declaration)]
	/*선언부에 작성한 자바코드는 서블릿으로 변환시 Class안에 정의됨.
	즉 멤버변수나 멤버메소드 혹은 상수등을 선언부에 선언함.
	*/
	public static final int INT_MAX = Integer.MAX_VALUE;
    
	String memberVariable="<h3>선언부에서 선언한 변수</h3>";
    
	int getMaxNumber(int num1, int num2){
				
		return num1>num2 ? num1 : num2;
	}
	
	/*
	선언부안에서 JSP내장객체를 사용못함으로
	1]멤버변수로 선언해서 스크립트릿안에서 this.멤버변수=내장객체 후 사용
	2]메소드의 매개변수로 내장객체를 전달해서 사용
	*/
	//방법1]
	JspWriter out;
	void showMessage(String message) {
		try {
			out.println(message);
		} catch (IOException e) {

		}
	}
	//방법2]
	void showMessage(String message,JspWriter out){
		try {
			out.println(message);
		} catch (IOException e) {

		}
	}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ScriptingBasic.jsp</title>
</head>
<body>
	<fieldset>
		<legend>스크립팅 요소</legend>
		<%
		/*스크립트릿(scriptlet)]
		  스크립트릿 안에서는 메소드선언 불가
		  
		  jsp에서 제공하는 내장객체는 _jspService()메소드안에서 
		  선언되므로(지역변수) 선언부에서는 사용 불가★★★
		*/
		//void method(){}//[x]
		String localVariable="<h4>스크립틀릿 안에서 선언한 로컬변수</h4>";
		out.println(memberVariable);
		out.println(localVariable);
		out.println("최대값:"+getMaxNumber(10, 100));
		//방법1] 클래스의 멤버변수(this.out)=지역변수(out)
		this.out = out;
		showMessage("<h4>this.out=out으로 내장객체 전달</h4>");
		//방법2]
		showMessage("<h4>매개변수로 내장객체 전달</h4>",out);
		
		%>
		<h3>표현식으로 출력</h3>
		<%= "EXPRESSION" %>
		<!-- 표현식은 _jspService()에서 out.print();로 변환됨
			 고로 표현식안에서 ;을 붙이면 에러 -->
		<%= memberVariable %>
		<%= localVariable %>
		<%= "최대값:"+getMaxNumber(9, 99) %>
		
	</fieldset>
</body>
</html>