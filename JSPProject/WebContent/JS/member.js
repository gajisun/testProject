//<script>태그는 제외
//순수 자바스크립트 코드만 작성
//확장자는 .js로
//.js를 필요로 하는 모든 페이지에서는 <script>태그로 include처리한다.
//★공통으로 사용하는 변수나 함수를 정의

function isValidate(obj) {
	if (obj.id.value === "") {
		alert("아이디를 입력하세요");
		obj.id.focus();
		return false;
	}
	else if (frmObj.pwd.value.length === 0) {
		alert("비번을 입력하세요");
		frmObj.pwd.focus();
		return false;
	}
	else if (frmObj.pwd.value != frmObj.pwd2.value) {
		alert("비번이 일치하지 않아요");
		frmObj.pwd2.focus();
		return false;
	}
	//라디오 버튼 선택여부 판단하기
	var isGender = false;
	for (var i = 0 ; i < obj.gender.length ; i++) {
		if (obj.gender[i].checked) isGender = true;
	}
	if (!isGender) {
		alert("성별을 선택하세요");
		obj.gender[0].focus();
		return false;
	}

	//문]체크박스 2개 이상 선택하도록 유효성 검사
	var checkedCount = 0;
	for (i = 0 ; i < obj.inter.length ; i++) {
		if (obj.inter[i].checked) checkedCount++;
	}
	if (checkedCount < 1) {
		alert("관심사항을 두개 선택하세요");
		obj.inter[0].focus();
		return false;
	}
	else if (checkedCount < 2 && checkedCount>=1) {
		alert("관심사항을 하나더 선택하세요");
		obj.inter[0].focus();
		return false;
	}

	if (obj.grade.selectedIndex === 0) {
		alert("학력을 선택하세요");
		obj.grade.focus();
		return false;//true를 하지 않아도 전송되는 이유는 submit버튼 때문
	}
	if (obj.file.value === "") {
		alert("파일을 선택하세요");
		obj.file.focus();
		return false;
	}
	if (obj.self.value === "") {
		alert("자기소개를 선택하세요");
		obj.self.focus();
		return false;
	}
	//submit기능이 없는 경우를 위해 추가]
	return true;
}
