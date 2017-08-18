<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- PageScopeIncludedPage.jsp 
     이클립스 오류로 인해 에러표시 남-->
<fieldset>
	<legend>포함된 페이지</legend>
	<ul style="list-style-type:upper-roman;">
			<li>Integer타입:<%= pageContext.getAttribute("pageNumber") %></li>
			<li>String타입:<%= pageContext.getAttribute("pageString") %></li>
			<li>Date타입:<%= dateString %></li>
			<li>MemberDTO타입1:<%= firstString %></li>
			<li>MemberDTO타입2-아이디:<%= secondMember.getId() %>,비번:<%= secondMember.getPwd() %>,
								이름:<%= secondMember.getName() %>,나이:<%= secondMember.getAge() %></li>
	</ul>


</fieldset>