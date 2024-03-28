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
	String id=request.getParameter("id");
	String pass=request.getParameter("password");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="select id,name,password from member2024 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String userID=rs.getString(1);
			String userName=rs.getString(2);
			String userPwd=rs.getString(3);
			if(pass.equals(userPwd)){
				%>
				<%=userName %>님 환영합니다.
				<%
				session.setAttribute("s_Name",userName);
				session.setAttribute("s_id",userID);
				response.sendRedirect("index.jsp");
				
			
		
			}else{
			%>
			<script>
			alert("패스워드가 일치하지 않습니다.");
			history.back(-1);
			</script>
			<% 
			}
	}else{
		%>
		<script>
		alert("등록되지 않은 id입니다");
		history.back(-1);
		</script>
		<% 
	}
	}catch(SQLException e){
		System.out.println("데이터베이스 읽기 실패");
	}
%>
</body>
</html>