<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    
    %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
<style>
 		table { width: 400px; text-align: center; }
		th    { background-color: cyan; }
		td    { border: solid 1px black;}
</style>    

</head>
<body>
<table>
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>학년</th>
		<th>과목</th>	
	</tr>
  <%
  	request.setCharacterEncoding("utf-8");
	//2. 데이터를 받아와 변수 저장한다.(name, id ,pwd)
	String number = request.getParameter("number");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String Subject = request.getParameter("Subject");
	String input = request.getParameter("input");
		
	//3. db 연동을위해 jdbc 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	//4.DB 연결정보(url, user, password)
	String url = "jdbc:mariadb://localhost:3307/jspdb";
	String user = "root";
	String password = "1111";
	
	
	try(Connection con = DriverManager.getConnection(url, user, password);){
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from member");
		
		while(rs.next()){
	%>
		<tr>
			<td><%=rs.getString("number")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("year")%></td>
			<td><%=rs.getString("Subject")%></td>
		<tr>
	<%
		}
		con.close();
		stmt.close();
		rs.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</table>
</body>
</html>