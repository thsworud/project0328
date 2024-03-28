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
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String gender=request.getParameter("gender");
	String bt=request.getParameter("bt_year")+"/"+request.getParameter("bt_month")+"/"+request.getParameter("bt_day");
	String email=request.getParameter("email")+"@"+request.getParameter("email2");
	String phone=request.getParameter("phone")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
	String address=request.getParameter("address");
	String[] val=request.getParameterValues("field");
	String field="";
	if(val != null){
		for(int i=0;i<val.length;i++){
			if(i==(val.length-1)){
			field+=val[i];
		}else{
			field+=val[i]+",";
		}
	}
}	
	
	String sql="insert into member2024 values(?,?,?,?,?,?,?,?,?,sysdate)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, bt);
	pstmt.setString(6, email);
	pstmt.setString(7, phone);
	pstmt.setString(8, address);
	pstmt.setString(9, field);
	
	pstmt.executeUpdate();
%>
<script>
	alert("입력이 완료되었습니다.");
	location.href="memberselect.jsp";

</script>
</body>
</html>