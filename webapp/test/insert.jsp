<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    
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
	//2. 데이터를 받아와 변수 저장한다.(name, id ,pwd)
	String number = request.getParameter("number");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String Subject = request.getParameter("Subject");
		
	//3. db 연동을위해 jdbc 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	//4.DB 연결정보(url, user, password)
	String url = "jdbc:mariadb://localhost:3307/jspdb";
	String user = "root";
	String password = "1111";
	try(Connection con = DriverManager.getConnection(url, user, password);){
		String sql = "insert into member(number,name,year,Subject) values(?,?,?,?)";
		
		//7. PreparedStatement 겍채 생성
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, number);
		pstmt.setString(2, name);
		pstmt.setString(3, year);
		pstmt.setString(4, Subject);
		
		//8. SQL 실행
		int i = pstmt.executeUpdate();
	
		if(i == 1)
			out.println("입력성공"+"<br>");
			out.println("학번:"+number+"<br>");
			out.println("이름:"+name+"<br>");
			out.println("학년:"+year+"<br>");
			out.println("선택과목:"+Subject+"<br>");
		
		con.close();

	}catch(Exception e){
		e.printStackTrace();
	}	
	
	
	
	%>


  
</body>
</html>