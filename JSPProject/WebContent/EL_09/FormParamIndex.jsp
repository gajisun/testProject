<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>FormParamIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>사용자 입력값 받기</legend>
		<form method="post" action="FormParamResult.jsp">
			<ul>
				<li>이름: <input type="text" name="name" /></li>
				<li>성별: <input type="radio" name="gender" value="남자" />남자 <input
					type="radio" name="gender" value="여자" />여자
				</li>

				<li>관심사항: <input type="checkbox" name="inter" value="정치" />정치 <input
					type="checkbox" name="inter" value="경제" />경제 <input type="checkbox"
					name="inter" value="연예" />연예 <input type="checkbox" name="inter"
					value="스포츠" />스포츠
				</li>

				<li>학력: <select name="grade">
						<option value="">학력 선택하세요</option>
						<option value="초등학교">초등학교</option>
						<option value="중학교">중학교</option>
						<option value="고등학교">고등학교</option>
						<option value="대학교">대학교</option>
				</select>
				</li>
				<li><input type="submit" value="값 전달" /></li>
			</ul>
		</form>
	</fieldset>
</body>
</html>