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
	//1. 한글 처리
	request.setCharacterEncoding("utf-8");
		
	//2. 데이터를 받아와 변수 저장한다.(name, id ,pwd)
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String function = request.getParameter("function");
		
	//3. db 연동을위해 jdbc 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	//4.DB 연결정보(url, user, password)
	String url = "jdbc:mariadb://localhost:3307/jsp";
	String user = "root";
	String password = "1111";
	
	//5.DB와의 커넥션 생성(drivermanger겍체 사용)
	if (function.equals("Create")){
		try(Connection con = DriverManager.getConnection(url, user, password);){
			//6. SQL(insert)
			String sql = "insert into menber(name,id,pwd) values(?,?,?)";
			//7. PreparedStatement 겍채 생성
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pwd);
		
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
			ResultSet rs = stmt.executeQuery("select * from menber");
			while(rs.next()){
				String getname = rs.getString("name");
				String getid = rs.getString("id");
				String getpassword = rs.getString("pwd");
				out.println("이름 : "+getname);
				out.println("아이디 : "+getid);
				out.println("비밀번호 :"+getpassword+"<br>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		
	}else if(function.equals("Update")){
		try(Connection con = DriverManager.getConnection(url, user, password);){
			String sql = "UPDATE menber SET name=?, id=?, pwd=? where name=?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, id);
			stmt.setString(3, pwd);
			stmt.setString(4, name);
			stmt.executeUpdate();
			out.println("변경완료");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}else if(function.equals("Delete")){
		try(Connection con = DriverManager.getConnection(url, user, password);){
			String sql = "Delete from menber where name=?";
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