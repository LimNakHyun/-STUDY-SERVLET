<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn=null;

	String driver="org.postgresql.Driver";
	String url="jdbc:postgresql://localhost:5432/postgres";
	
	Boolean connect=false;
	
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,"postgres","1234");
		
		connect=true;
		
		conn.close();
	}catch(Exception e){
		connect=false;
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>
<%if(connect==true){ %>
	연결됨
<%}else{ %>
	연결안됨
<%} %>
</h3>
</body>
</html>