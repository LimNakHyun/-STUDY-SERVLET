<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
 	Connection conn = null; 
 	String sql="INSERT INTO BOARD (BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT,"
 			+"BOARD_CONTENT, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT,"
 			+"BOARD_DATE) VALUES(3, '인구', 11, '인구의 글', '인구의 글의 내용', 1, 0, 0, 0, now());";
 	Statement stmt = null;
	try {
  		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/postgres");
  		conn = ds.getConnection();
  		stmt=conn.createStatement();
  		
  		int result=stmt.executeUpdate(sql);
  		if(result!=0){
  			out.println("<h3>레코드가 등록되었습니다.</h3>");
		}
	}catch(Exception e){
		out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
		e.printStackTrace();
 	}
	finally{
		try{
			stmt.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
%>
