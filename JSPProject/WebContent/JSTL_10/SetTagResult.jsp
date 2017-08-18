<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SetTagResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set태그로 설정한 객체를 EL로 출력</legend>
		<h2>xxxvar계열</h2>
		<ul style="list-style-type: upper-roman;">
			<li>pagevar:${ pageScope.pagevar }</li>
			<li>requestvar:${ requestScope.requestvar }</li>
			<li>sessionvar:${ sessionScope.sessionvar }</li>
			<li>applicationvar:${ applicationScope.applicationvar }</li>
		</ul>
		<h2>MemberDTO 객체</h2>
		<ul style="list-style-type: upper-roman;">
			<li>defaultmember:아뒤-${ defaultMember.id },
							   비번-${ requestScope.defaultMember.pwd },
							   이름-${ requestScope.defaultMember.name }</li>
			<li>argsmember:아뒤-${requestScope.argsMember.id},
						    비번-${requestScope.argsMember.pwd},
						    이름-${requestScope.argsMember.name}</li>
		</ul>
		<h2>리스트 계열 컬렉션</h2>
		<ul style="list-style-type: upper-roman;">
			<li>첫번째 멤버:아뒤-${list[0].id},
						 비번-${requestScope.list[0].pwd},
						 이름-${requestScope.list[0].name}</li>
			<li>두번째 멤버:아뒤-${requestScope.list[1].id},
						 비번-${requestScope.list[1].pwd},
						 이름-${requestScope.list[1].name}</li>
		</ul>
		<h2>맵 계열 컬렉션</h2>
		<ul style="list-style-type: upper-roman;">
			<li>default키값인 멤버:아뒤-${ map["default"].id },
							     비번-${ map["default"].pwd },
							     이름-${ map["default"].name }</li>
					<!-- default가 예약어라서 배열형으로 해줘야만 출력 가능 -->
			<li>args키값인 멤버:아뒤-${ map["args"]["id"] },
							비번-${ map.args.pwd },
							이름-${ map.args.name }</li>
		</ul>

		<h2>파라미터</h2>
		subject : ${ param.subject }
	</fieldset>
</body>
</html>