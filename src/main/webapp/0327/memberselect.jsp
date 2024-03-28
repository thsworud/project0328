<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
  <%
  PreparedStatement pstmt=null;
  ResultSet rs=null;
  String sql="select count(*) from member2024";
  pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=0;
	if(rs.next()){		
		no=rs.getInt(1);
	}
	%>
<section>
<h3>회원 목록</h3>
<table border='1'>
<caption>총 <%=no %>명의 회원이 있습니다.</caption>

<tr>
<th>id</th>
<th>성명</th>
<th>비밀번호</th>
<th>성별</th>
<th>생년월일</th>
<th>이메일</th>
<th>연락처</th>
<th>주소</th>
<th>관심분야</th>
<th>구분</th>
</tr>

<%
sql="select * from member2024";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	String id=rs.getString("id");
	String name=rs.getString("name");
	String password=rs.getString("password");
	String gender=rs.getString("gender");
	String bt=rs.getString("birth");
	String email=rs.getString("email");
	String phone=rs.getString("phone");
	String address=rs.getString("address");
	String field=rs.getString("interest");

	 String genderStr = "";
     if (gender.equals("1")) {
         genderStr = "남성";
     } else if (gender.equals("2")) {
         genderStr = "여성";
     }
 
%>
<tr>
<th><%=id %></th>
<th><%=name %></th>
<th><%=password %></th>
<th><%=genderStr %></th>
<th><%=bt %></th>
<th><%=email %></th>
<th><%=phone %></th>
<th><%=address %></th>
<th><%=field %></th>
<th>
<a href="memberupdate.jsp?id=<%=id %>">수정</a> /
<a href="studdelete.jsp?id=<%=id%>" onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제</a>
</th>
</tr>
<%} %>
</table>
</section>
</body>
</html>