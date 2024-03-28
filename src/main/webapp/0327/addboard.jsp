<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

section{
text-align: center;
}
table{
margin: 0 auto;

}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<%
checkName=(String)session.getAttribute("s_Name");
//로그인 유효성 코드
if(checkName==null){
	%>
	<script>
	alert("먼저 로그인 하세요.");
	location.href="index.jsp";
	</script>
	<%
}
%>
<section>
<h2>글쓰기</h2><br>
<form name="form" method="post" action="boardprocess.jsp">
<table style="border-bottom: 1px black solid;">

<tr>
<th>제목</th>
<td><input type="text" name="title"></td>
</tr>

<tr>
<th>이름</th>
<td><input type="text" name="name" value="<%=checkName%>"></td>
</tr>

<tr>
<th>비밀번호</th>
<td><input type="password" name="password"></td>
</tr>

<tr>
<th>내용</th>
<td><input type="text" name="content" style="height:50px;"></td>
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
function Entry(){
	if(document.form.title.value == ""){
		alert("제목이 입력되지 않았습니다")
		documentform.form.title.focus();
		return false;
	}
	
	if(document.form.password.value == ""){
		alert("비밀번호가 입력되지 않았습니다")
		documentform.form.password.focus();
		return false;
	}
	if(document.form.content.value == ""){
		alert("내용이 입력되지 않았습니다")
		documentform.form.content.focus();
		return false;
	}
	document.form.submit();
}
</script>
</body>
</html>