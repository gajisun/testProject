<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ImportedNate.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<hr/>
<h2>네이트입니다.</h2>
<c:import url="http://www.nate.com" var="content"/>
${ fn:replace(content,'href="/css/','href="http://www.nate.com/css/') }
<hr/>