<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
String sql="select max(num) from board2024";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

int no=0;
if(rs.next()){		
	no=rs.getInt(1)+1;
}else{
	no=1;
}


String title=request.getParameter("title");
String name=request.getParameter("name");
String password=request.getParameter("password");
String content=request.getParameter("content");

int hit=0;
int ref=0;
int indent=0;
int step=0;

sql="insert into board2024 values(?,?,?,?,?,sysdate,?,?,?,?)";
pstmt=conn.prepareStatement(sql);
pstmt.setInt(1, no);
pstmt.setString(2,name);
pstmt.setString(3,password);
pstmt.setString(4,title);
pstmt.setString(5,content);

pstmt.setInt(6, hit);
pstmt.setInt(7, ref);
pstmt.setInt(8, indent);
pstmt.setInt(9, step);

pstmt.executeUpdate();
%>
<script>
	alert("입력한 글을 저장하였습니다.");
	location.href="boardlist.jsp";
</script>
</body>
</html>