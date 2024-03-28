<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>

  <%
  	Connection conn = null;
  	try{//oracle DBC
  	
  	String jdbcDriver= "oracle.jdbc.OracleDriver";
  	String jdbcurl="jdbc:oracle:thin:@//localhost:1521/xe";
  	String user="system";//사용자
  	String pass="1234";//비밀번호
  	Class.forName(jdbcDriver);
  	conn=DriverManager.getConnection(jdbcurl,user,pass);
  	System.out.println("데이터베이스 연결 성공");
  	}catch(Exception e){
  		System.out.println("데이터베이스 연결 실패");
  		e.printStackTrace();
  	}
  %>
  