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
<section>

	<h2 style=text-align:center;>게시판</h2>
	<div class="container">
	<table class="bordtb" border='1'>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
		<%@ include file="DBConn.jsp" %>
		
		<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int totalCount = 0;
	int Count = 1;
	Statement stmt = null;
	ResultSet countRs = null;
	String countSql = "SELECT COUNT(*) AS total FROM board2024";
	    
	    try {
	        stmt = conn.createStatement();
	        countRs = stmt.executeQuery(countSql);
	    	if (countRs.next()) {
	            totalCount = countRs.getInt("total");
	        }
	    } catch (SQLException e) {
	      
	        e.printStackTrace();
	    }
	    
%>
		
		<caption>
				총 게시물 : <%=totalCount %>개
		</caption>
		
		
		
<%
	
	String sql = "select * from board2024";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	int counter = 1;
	while(rs.next()){
		String num = rs.getString("num");
		String name = rs.getString("name");
		String title = rs.getString("title");
		String time = rs.getString("time");
		String hit = rs.getString("hit");
		
	
%>
		<tr>
			<td><%=num %></td>
			<td><a href="productDelete.jsp?id=<%=title %>"><%=title %></a></td>
			<td><%=name %></td>
			<td><%=time %></td>
			<td><%=hit %></td>
			
			
			
			
		</tr>
<% 	
		}
%>	
	</table>
		<div class="buttons">
			<button class="register-btn" onclick="window.location.href='addboard.jsp'">작성</button>
		</div>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>