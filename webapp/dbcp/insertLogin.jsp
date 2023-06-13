<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
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
	InitialContext initCtx = new InitialContext();
	
	Context ctx = (Context)initCtx.lookup("java:comp/env");

	DataSource ds = (DataSource)ctx.lookup("jdbc/jspdb");

	Connection con = ds.getConnection();

  	//1.한글처리
  	request.setCharacterEncoding("utf-8");

  	//2.홈에서 id pwd를 받늗다.
  	String id = request.getParameter("id");
  	String pwd = request.getParameter("pwd");
  	
  	//3.db 등록
 	Class.forName("org.mariadb.jdbc.Driver");
	
 	//5.sql문으로 db에 정의()
 	String sql = "SELECT * FROM login WHERE id = ? AND pwd = ?";
  	PreparedStatement pstmt = con.prepareStatement(sql);
  	pstmt.setString(1, id);
  	pstmt.setString(2, pwd);
 	
 	//6.질의 결과 확인
 	ResultSet rs = pstmt.executeQuery();
 	if(rs.next()){
 		session.setAttribute("id",id);
 		response.sendRedirect("welcome.jsp");
	
 	}else{
%>	
 	<script type="text/javascript">
 		if(confirm("존재하지않는 사용자입니다 등록하시겠습니까?")==true){
 			location.href="insertForm.jsp"
 		}else{
 			history.back();
 		}
 	</script>

 <%	}%>
 	

</body>
</html>