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

  		request.setCharacterEncoding("utf-8");
	
		//3. db 연동을위해 jdbc 드라이버 로드
		Class.forName("org.mariadb.jdbc.Driver");
	
		//4.DB 연결정보(url, user, password)
		
		String url = "jdbc:mariadb://localhost:3307/jspdb";
		String user = "root";
		String password = "1111";
		DriverManager.getConnection(url, user, password);

		try(Connection con = DriverManager.getConnection(url, user, password);){
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from member WHERE number = " + number);
			out.print("신청한과목"+"<br>");
			
			
			while(rs.next()){
				String getnumber = rs.getString("number");
				String getname = rs.getString("name");
				String getyear = rs.getString("year");
				String getSubject = rs.getString("Subject");
				out.println("학번 : "+getnumber);
				out.println("이름 :"+getname+"<br>");
				out.println("학년 : "+getyear);
				out.println("선택과목 :"+getSubject+"<br>"); 
				out.println("=============================================================================="+"<br>");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}  
%>		
		<form method="get" action="update_ok.jsp">
   			학번: <input type="text" name ="number"><br>
    		이름: <input type="text" name ="name"><br>
    		학년: <input type="text" name ="year"><br>
    		수정과목: <input type="text" name ="Subject"><br>
    		수정후과목: <input type="text" name ="Subject1"><br>
			<input type="submit" value="edit">
		</form>
		
		<form method="get" action="delete_ok.jsp">
   			학번: <input type="text" name ="number"><br>
    		이름: <input type="text" name ="name"><br>
    		학년: <input type="text" name ="year"><br>
    		삭제과목: <input type="text" name ="Subject"><br>
    		<input type="submit" value="edit">
		</form>
</body>
</html>