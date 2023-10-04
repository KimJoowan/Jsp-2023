<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>

  <%
  	String number = request.getParameter("number"); 
  	String name = request.getParameter("name"); 
  	String year = request.getParameter("year"); 
  	String Subject = request.getParameter("Subject");
  	String Subject1 = request.getParameter("Subject1"); 
  
	request.setCharacterEncoding("utf-8");
	
	//3. db 연동을위해 jdbc 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");

	//4.DB 연결정보(url, user, password)
	String url = "jdbc:mariadb://localhost:3307/jspdb";
	String user = "root";
	String password = "1111";

	try(Connection con = DriverManager.getConnection(url, user, password);){
		
		//String sql = "UPDATE menber SET name=?, id=?, pwd=? where name=?";
		String sql = "UPDATE member SET Subject=? WHERE number=? AND name =? AND year=? AND Subject =?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, Subject1);
		stmt.setString(2, number);
		stmt.setString(3, name);
		stmt.setString(4, year);
		stmt.setString(5, Subject);
		stmt.executeUpdate();
		out.println("변경완료");
		con.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

  
  %>

</body>
</html>