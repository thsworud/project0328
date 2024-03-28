<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="DBConn.jsp" %>
<%
PreparedStatement pstmt = null;
ResultSet rs= null;
String sql="";
int next_id = 0;
try{
	sql="SELECT MAX(id) FROM member2024";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		next_id=rs.getInt(1)+1;
	}else{
		next_id=1;
	}
}catch(Exception e){
	System.out.println("member 테이블 읽기 오류");
	System.out.println("SQL:"+ e.getMessage());
}
%>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
	<h3>회원 가입 등록 화면</h3>
	<form name="form" method="post" action="memberprocess.jsp">
	<table border='1'>
	
	<tr>
	<th>아이디</th>
	<td><input type="text" name="id" value="<%=next_id%>"></td>
	</tr>
	
	<tr>
	<th>성 명</th>
	<td><input type="text" name="name"></td>
	</tr>
	
	<tr>
	<th>비밀번호</th>
	<td><input type="password" name="password"></td>
	</tr>
	
	<tr>
	<th>비밀번호 확인</th>
	<td><input type="password" name="password2"></td>
	</tr>
	
	<tr>
	<th>성 별</th>
	<td>
	<input type="radio" name="gender" value="1" checked>남성
	<input type="radio" name="gender" value="2">여성
	</td>
	</tr>
	
	<tr>
	<th>생 일</th>
	
	<td>
	<select name="bt_year">
	<%for(int i=1920; i<=2024; i++) {%>
	<option value="<%=i%>"><%=i %></option>
	<%} %>
	</select>년
	
	<select name="bt_month">
	<%for(int i=1; i<=12; i++){ %>
	<option value="<%=i%>"><%=i%></option>
	<%} %>
	</select>월
	
	<select name="bt_day">
	<%for(int i=1; i<=31;i++){ %>
	<option value="<%=i%>"><%=i %></option>
	<%} %>
	</select>일
	</td>
	</tr>
	
	<tr>
	<th><label for="email">이메일:</label></th>
	<td>
	<input type="text" id="email" class="email"  name="email"  value="" title="이메일 아이디" placeholder="이메일" maxlength="18" /> @
	<input type="text" id="email2" class="email"  name="email2"  value="" title="이메일 아이디" placeholder="직접입력" maxlength="18" />
	<select class="selectem" title="이메일 도메인 주소 선택" name="emailDomain" onchange="updateEmail()" >
	<option value="">-선택-</option>
	<option value="naver.com">naver.com</option>
	<option value="gmail.com">gmail.com</option>
	<option value="hanmail.net">hanmail.net</option>
	<option value="hotmail.com">hotmail.com</option>
	<option value="korea.com">korea.com</option>
	<option value="nate.com">nate.com</option>
	<option value="yahoo.com">yahoo.com</option>
	</select>
	</td>
	</tr>
	
	<tr>
	<th>연락처</th>
	<td>
	<input type="text" name="phone"  maxlength="3">-<input type="text" name="phone2"  maxlength="4">-<input type="text" name="phone3"  maxlength="4">
	</td>
	</tr>
	
	<tr>
	<th>주소</th>
	<td><input type="text" name="address"></td>
	</tr>
	
	<tr>
	<th>관심분야</th>
	<td>
	<input type="checkbox" name="field" value="프로그램">프로그램
	<input type="checkbox" name="field" value="독서">독서
	<input type="checkbox" name="field" value="등산">등산
	<input type="checkbox" name="field" value="여행">여행
	<input type="checkbox" name="field" value="컴퓨터">컴퓨터
	<input type="checkbox" name="field" value="영화">영화
	<input type="checkbox" name="field" value="운동">운동
	<input type="checkbox" name="field" value="진학">진학
	</td>
	</tr>
	
	<tr>
            <th colspan="2">
            	
                <input type="button" value="등록" class="button" onclick="Entry()">
                <input type="button" value="취소" class="button">
            </th>
        </tr>
	</table>
	</form>
</section>
<script>
function updateEmail() {
    var selectBox = document.querySelector('.selectem');
    var emailInput = document.getElementById('email2');
    var selectedDomain = selectBox.value;
    emailInput.value = selectedDomain;
}
function Entry(){
	if(document.form.id.value == ""){
		alert("아이디가 입력되지 않았습니다")
		documentform.form.id.focus();
		return false;
	}
	if(document.form.name.value == ""){
		alert("성명이 입력되지 않았습니다")
		documentform.form.name.focus();
		return false;
	}
	if(document.form.password.value == ""){
		alert("비밀번호가 입력되지 않았습니다")
		documentform.form.password.focus();
		return false;
	}
	if(document.form.password2.value == ""){
		alert("비밀번호확인란이 입력되지 않았습니다")
		documentform.form.password2.focus();
		return false;
	}
	if(document.form.email.value == ""){
		alert("이메일이 입력되지 않았습니다.")
		documentform.form.email.focus();
		return false;
	}
	if(document.form.email2.value == ""){
		alert("이메일이 입력되지 않았습니다.")
		documentform.form.email2.focus();
		return false;
	}
	if(document.form.address.value == ""){
		alert("주소가 입력되지 않았습니다.")
		documentform.form.address.focus();
		return false;
	}
	var p1 = document.form.password.value;
	var p2 = document.form.password2.value;
	if( p1 != p2){
		alert("비밀번호가 일치 하지 않습니다");
		return false;
	}
	 document.form.submit();
}
</script>
</body>
</html>