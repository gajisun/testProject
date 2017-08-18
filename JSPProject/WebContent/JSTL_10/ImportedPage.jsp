<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ImportedPage.jsp -->
<h4>포함된 페이지</h4>
<hr/>
<h5>리퀘스트 영역에 저장된 속성</h5>
\${ requestScope.requestvar } : ${ requestvar }
<h5>파라미터로 전달된 값</h5>
<ul style="list-style-type:upper-roman;">
	<li>\${ param.user } : ${ param.user }</li>
	<li>\${ param.pass } : ${ param.pass }</li>
</ul>
<hr/>
