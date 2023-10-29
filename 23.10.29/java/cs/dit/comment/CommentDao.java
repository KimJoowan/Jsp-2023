package cs.dit.comment;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mariadb.jdbc.CallableFunctionStatement;


public class CommentDao {
	private Connection getConnection() throws Exception{
		//1. JNDI를 이용하기 위한 객체 생성
		Context initCtx  = new InitialContext();
		
		//2. 등록된 네이밍 서비스로부터 등록된 자원을 가져옴
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		
		//3. 자원들 중 원하는 jdbc/jskim 자원을 찾아내어 데이터소스를 가져옴
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jskim");
		
		//4. 커넥션 얻어옴
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public JSONArray listComments(int bcode){
		String sql = "SELECT ccode, content, regdate from comments where bcode = ? ORDER BY ccode desc";
		JSONArray list = new JSONArray();
		
			try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			){
				pstmt.setInt(1, bcode);				
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					JSONObject json = new JSONObject();
					json.put("ccode", rs.getInt("ccode"));
					json.put("content", rs.getString("content"));
					json.put("regdate", rs.getDate("regdate").toString());
					list.add(json);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
	}
	
	public void insertCommments(CommentsDto dto) {
		String sql = "{call proc_comments(?, ?)}";
	
	
		try(Connection con = getConnection();
			CallableStatement cstmt = con.prepareCall(sql);
					
		){	
			cstmt.setInt(1, dto.getBcode());
			cstmt.setString(2, dto.getContent());
			cstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
