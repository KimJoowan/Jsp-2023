<%@page import="dit.cs.Logindao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"  %>
    
<%	
	request.setCharacterEncoding("utf-8");
	Logindao dao = new Logindao();
	String id = request.getParameter("id");
	dao.lossone(id);

%>
	
<script>
		let ans = alert("삭제되었습니다!");
		if (!ans){
			location.href='list.jsp';
		}
</script>


