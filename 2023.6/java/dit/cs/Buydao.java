package dit.cs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Buydao {
	
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
// from 에서 가져운 데이터의 db의 buy 테이블에 저장
//=============================================================================================================================================================================
	public void buy(Buydto dto) {
		String sql ="insert into buy value(?,?,?)";
		
		try(Connection con = GetConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);
		){
			pstmt.setString(1, dto.getProductName());
			pstmt.setInt(2, dto.getCounts());
			pstmt.setString(3, dto.getId());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
//=============================================================================================================================================================================
// 구매리스트
//=============================================================================================================================================================================	
	public ArrayList<Buydto>list(String id){
		String sql = "select * from buy where id=?";
		ArrayList<Buydto> dtos  = new ArrayList<Buydto>();
		
		
		try(Connection con = GetConnection(); 
				PreparedStatement pst = con.prepareStatement(sql);
		){
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()){
				String ProductName = rs.getString("ProductName");
				int counts = rs.getInt("counts");
				Buydto dto = new Buydto(ProductName, counts, id);
				dtos.add(dto);
			}	
				
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	return dtos;
	}
	
//=============================================================================================================================================================================
// 환불 리스트
//=============================================================================================================================================================================		
	public Buydto getOne(Buydto dto){
		String sql = "select * from buy WHERE ProductName=?, counts=?";
	
		try(Connection con = GetConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);
		){
			pstmt.setString(1, dto.getProductName());
			pstmt.setInt(2, dto.getCounts());
			ResultSet rs = pstmt.executeQuery();
		
			if(rs.next()){
				String getProductName = rs.getString("ProductName");
				int counts = rs.getInt("counts");
		
				dto =  new Buydto(getProductName,counts);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	return dto;
	}
	
//=============================================================================================================================================================================
//환붛 매소드
//=============================================================================================================================================================================		
	public void deletList(Buydto dto) {
		String sql = "DELETE from buy WHERE ProductName=? and counts=?";
		
		try(Connection con = GetConnection(); 
			PreparedStatement pstmt  = con.prepareStatement(sql);
		){
			pstmt.setString(1, dto.getProductName());
			pstmt.setInt(2, dto.getCounts());
			pstmt.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
		
	
}


	