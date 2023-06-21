/**===================================================
* 작성자 DIT
* 작성일 2023. 5. 10.
* 파일명 Logindao.java
* 파일명 프로그램설명
* 		-insertlogin() login 테이블에 접근하여 CRUD 기능 처리
* 		-list - login 테이블에 데이터 가져옴
* 		-getOne() :특정 레코드만 검색해서 가져옴
 =============================================================**/
package dit.cs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class Logindao{

//=============================================================================================================================================================================
// DBCP로 데이터베이스에 접근하여 connection 얻어오는 메소드
// 1. 접근제어자, 2. 반환 데이터 타임, 3. 입력 매개변수
//=============================================================================================================================================================================
	private Connection GetConnection() throws Exception{
		InitialContext Initcx = new InitialContext();
		DataSource ds = (DataSource)Initcx.lookup("java:comp/env/jdbc/jsp");
		Connection con = ds.getConnection();
		return con;		
		
	}
	
//=============================================================================================================================================================================
// from 에서 가져운 데이터의 db의 login 테이블에 저장
//=============================================================================================================================================================================
	public void insertLogin(Logindto dto){
		String sql ="insert into login values(?,?,?,?,?,?)";
			
		try(Connection con = GetConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);
		){
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getEmail());
			pstmt.executeUpdate();
				
		}catch(Exception e){
			e.printStackTrace();
		}	
	}

//=============================================================================================================================================================================
// 데이터베이스에서 테이블에있는 레코드를 가져오는 매소드
// 1. 접근제어자, 2. 반환 데이터 타임, 3. 입력 매개변수
//=============================================================================================================================================================================
	public ArrayList<Logindto> list(){
		String sql = "select * from login;";
		
		ArrayList<Logindto> dtos = new ArrayList<Logindto>();
		
		try(Connection con = GetConnection(); 
			Statement stmt = con.createStatement();
		){
			ResultSet rs = stmt.executeQuery(sql);
		
			// 3.생성된 연결을 통해 SQL문 실행 의뢰 준비
			while(rs.next()){
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String gender = rs.getString("gender");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				
				Logindto dto = new Logindto(id,name,pwd,gender,phone,email);
				dtos.add(dto);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	return dtos;
	}
	
//=============================================================================================================================================================================
// 1. 접근제어자, 2, 반환 데이터 타임, 3, 입력 매개변수
//=============================================================================================================================================================================
	public Logindto getOne(String id){
		String sql = "select * from login where id=?";
		Logindto dto = new Logindto();
		
		try(Connection con = GetConnection(); 
			PreparedStatement pst = con.prepareStatement(sql);
		){
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
		
			if(rs.next()){
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String gender = rs.getString("gender");
				String phone = rs.getString("phone");
				String email = rs.getString("email");

				dto =  new Logindto(id,name,pwd,gender,phone,email);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	return dto;
	}
//=============================================================================================================================================================================
// 1. 접근제어자, 2, 반환 데이터 타임, 3, 입력 매개변수
// 로그인 매소드
//=============================================================================================================================================================================
	public String Login(Logindto dto){
		String value = "Ture";
		String sql = "SELECT * FROM login WHERE id=? AND pwd=?";
		
		try(Connection con = GetConnection(); 
			PreparedStatement pst = con.prepareStatement(sql);
		){
			pst.setString(1, dto.getId());
			pst.setString(2, dto.getPwd());
			ResultSet rs = pst.executeQuery();
		
			if(rs.next()){
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				
			}else {
				value = "False";
			}
	
		}catch(Exception e){
			e.printStackTrace();
		}
	return value;
	}
	
//=============================================================================================================================================================================
// 삭제매소드 
//=============================================================================================================================================================================
	public void lossone(String id){
		String sql = "DELETE FROM login WHERE id=?";
	
		try(Connection con = GetConnection(); 
				PreparedStatement pstmt  = con.prepareStatement(sql);
		){
			pstmt.setString(1, id);
			pstmt.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
	}
				
//=====================================================================================================================================================================================
// 변경매소드	
//=====================================================================================================================================================================================

	public void update(Logindto dto) {
		String sql = "UPDATE login SET pwd=?, name=?, phone=?, email=? WHERE id=?";
		try(Connection con = GetConnection(); 
			PreparedStatement pstmt  = con.prepareStatement(sql);
		){
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getId());
			pstmt.executeUpdate();
				
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
}













	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

