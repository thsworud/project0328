<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        
       body,html{
 	height: 100%;
 	width: 100%;
 }
 *{
            margin: 0;
            padding: 0;
        }
h3{
	margin: 10px 0 10px 5px;
	  float: left;
}
header{
            height: 12%;
            padding: 2% 0 5px 0;
            background-color: skyblue;
            font-size: 2em;
            color: white;
        }
        
 nav{
            height: 5%;
            background-color: #6b6b6b;
        }
    nav ul {
            list-style-type: none;
            padding: 0.5% 0 0.5% 0 ;
           
        }
   nav li{
            display: inline;
            padding: 0 2% 0 2%;
    }
     nav a{
 		color:white;
 		text-decoration:none;
 }
  section{
		height: 76%
	}
	 footer{
            height: 5%;
            padding: 0.5% 0 2% 0;
            background-color: #6b6b6b;
            text-align: center;
            color: white;
        }
	img{
        width: 68%;
      margin-top: 5px;
    }
    .img{
        text-align: center;
    }
    .right{
    	font-size: 0.5em;
    	float: right;
    	margin: 20px 0px 20px 5px;
    }
    
    </style>
</head>
<body>
<header>
<%
String checkName="";
checkName=(String)session.getAttribute("s_Name");
System.out.println("name : "+checkName);

if(checkName==null){
%>

    <h3>쇼핑물에 오신 것을 환영합니다.</h3>
    <div class="right">
   
    <fieldset id="s1">
    <form name="frm" method="post" action="loginprocess.jsp">
    회원 ID:<input type="text" name="id" id="lo1">
    비밀번호:<input type="password" name="password" id="lo1">
    <input type="submit" value="로그인" id="lo1">
    <a href="addmember.jsp">회원가입</a>
    </form>
    </fieldset>
    </div>
<%}else{
	
	session.setMaxInactiveInterval(100);//100초동안 유지 하겠다 
	%>

	 <h3>쇼핑물에 오신 것을 환영합니다.</h3>
	 <%=checkName %>님 환영합니다.
	 
	<a href="logout.jsp">logout</a>
	<a href="addmember.jsp">회원가입</a>
	
	<%
}

%>
<script>

</script>

</header>
</body>
</html>