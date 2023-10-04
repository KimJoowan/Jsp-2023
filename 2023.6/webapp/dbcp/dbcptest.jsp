<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbcp-test</title>
</head>
<body>
<%
	InitialContext initCtx = new InitialContext();

	Context ctx = (Context)initCtx.lookup("java:comp/env");
	
	DataSource ds = (DataSource)ctx.lookup("jdbc/jspdb");
	
	Connection con = ds.getConnection();
	
	con.createStatement();
	
	String sql = "SELECT * FROM login";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		 String id = rs.getString("id");
		 String name =rs.getString("name");
		 String pwd =rs.getString("pwd");	 		 
%>		
		<%=id%>
		<%=name%>		
		<%=pwd%>
			
	<%}
	rs.close();
    stmt.close();
    con.close();
	%>
		
  
</body>
</html>