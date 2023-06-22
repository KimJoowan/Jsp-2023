/**===================================================
* 작성자 DIT
* 작성일 2023. 6. 13.
* 파일명 Productdao.java
* 파일명 프로그램설명
 =============================================================**/
package dit.cs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * @author DIT
 *
 */
public class Productdao{
	
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
	
	public ArrayList<Productdto> list(String ProductName){
		String sql = "select * from product where ProductName=?";
		ArrayList<Productdto> dtos = new ArrayList<Productdto>();
	
		try(Connection con = GetConnection(); 
				PreparedStatement pst = con.prepareStatement(sql);
		){
			pst.setString(1, ProductName);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String getProductName = rs.getString("ProductName");
				int getprice = rs.getInt("price");
				Productdto dto = new Productdto(getProductName, getprice);
				dtos.add(dto);

				
			}
				
		}catch (Exception e) {
			e.printStackTrace();
		}	
		return dtos;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
