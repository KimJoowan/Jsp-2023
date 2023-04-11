<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String function = request.getParameter("function");
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://localhost:3307/jsp";
	String user = "root";
	String password = "1111";
	
	if (function.equals("Create")){
		try(Connection con = DriverManager.getConnection(url, user, password);){
			//6. SQL(insert)
			String sql = "insert into bulletinboard(name,content) values(?,?)";
			//7. PreparedStatement 겍채 생성
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, content);
		
			//8. SQL 실행
			int i = pstmt.executeUpdate();
				
			if(i == 1)
				out.println("입력성공");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
			
	}else if(function.equals("Read")){
		try(Connection con = DriverManager.getConnection(url, user, password);){
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from bulletinboard");
			while(rs.next()){
				String getname = rs.getString("name");
				String getcontent = rs.getString("content");
				out.println("제목 : "+getname);
				out.println("내용 : "+getcontent+"<br>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		
	}else if(function.equals("Update")){
		try(Connection con = DriverManager.getConnection(url, user, password);){
			String sql = "Update bulletinboard SET name=?, content=? where name=?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, content);
			stmt.setString(3, name);
			stmt.executeUpdate();
			out.println("변경완료");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}else if(function.equals("Delete")){
		try(Connection con = DriverManager.getConnection(url, user, password);){
			String sql = "Delete from bulletinboard where name=?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.executeUpdate();
			out.println("삭제완료");
	
		}catch(Exception e){
			e.printStackTrace();
		}	
	}
	
%>
</body>
</html>