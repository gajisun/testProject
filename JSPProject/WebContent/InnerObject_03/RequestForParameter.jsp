<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String getStringValue(String value){
		switch(value){
			case "spo":return "스포츠";
			case "ent":return "연예";
			case "pol":return "정치";
			default : return "경제";
		}
	
	}
%>

<%
	//POST방식일 때 한글처리용 코드 추가
	request.setCharacterEncoding("UTF-8");
	/*
	★getParameter계열 메소드가 null을 반환하거나 빈 문자열을 반환하는 경우]
	  1] parameter를 전달하지 않거나 파라미터명이 없는 경우
      2] Text박스 계열인 경우 값을 입력 안하고 전송한 경우 빈문자열("") 반환
	  3] 선택 계열인 radio박스나 checkbox등인 경우 미 선택시 null반환

	  ★name이 같은 form의 하위요소의 값을 받을때는 getParameterValues()
	  단, type="radio"처럼 하나의 이름으로 하나의 값을 전달할 때는
	  	  getParameter로 받아도 된다.
	*/
	//파라미터 받기]
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String[]inters=request.getParameterValues("inter");
	//out.println(name);	out.println(gender);	out.println(inters);
	
	String values="";
	if((name != null && name.trim() != "") && gender != null && inters != null){
		values += "이름:"+name+", 성별:"+gender+", 관심사항:";
		for(String inter:inters){
			values += getStringValue(inter)+"&nbsp";
		}
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>RequestForParameter.jsp</title>
</head>
<body>
<fieldset>
    <legend>사용자가 전송한 파라미터와 관련된 request객체의 메소드</legend>
    <h3>form태그를 이용한 값 전송</h3>
    <form method="post">
    <table cellspacing="1" bgcolor="gray">
     <tr bgcolor="white">
      <td>이름</td>
      <td><input type="text" name="name"/></td>
     </tr>
     <tr bgcolor="white">
      <td>성별</td>
      <td>남<input type="radio" name="gender" value="남자"/>
          여<input type="radio" name="gender" value="여자"/>
      </td>
     </tr>
     <tr bgcolor="white">
      <td>관심사항</td>
      <td>경제<input type="checkbox" name="inter" value="eco"/>
             정치<input type="checkbox" name="inter" value="pol"/>
             스포츠<input type="checkbox" name="inter" value="spo"/>
             연예<input type="checkbox" name="inter" value="ent"/>       
      </td>
     </tr>
     <tr bgcolor="white" align="center">
      <td colspan="2"><input type="submit" value="확인"/></td>
        </tr>
    </table>
    </form>
     <%= values %>   
    <h3>A태그를 이용한 값 전송</h3> 
    <a href="RequestForParameter.jsp?name=홍길동&gender=남&inter=ent&inter=spo">GET</a>
    <h3>모든 파라미터명 얻기</h3>
    <!--
     -request객체의 getParameterNames()메소드로 얻는다
     -파라미터명 존재 여부판단
    -->
    <ul style="list-style-type:upper-roman;">
     <% 
     Enumeration<String> paramNames =request.getParameterNames(); 
     while(paramNames.hasMoreElements()){
    	 //파라미터명 얻기]
    	 String paramName = paramNames.nextElement();
    	 //파라미터명 값 얻기]
    	 String paramValue = request.getParameter(paramName); 
     %>
      <li><%=paramName %> : <%=paramValue %></li>
  	<% } %>
   </ul>
  </fieldset> 

</body>
</html>