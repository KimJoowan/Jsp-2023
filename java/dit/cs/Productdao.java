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
		DataSource ds = (DataSource)Initcx.lookup("java:comp/env/jdbc/jspdb");
		Connection con = ds.getConnection();
		return con;		
			
	}	
	
	
	public Productdto list(String ProductName,String item) {
		String sql = "select * from product where ProductName=?, item=?";
		Productdto dto = new Productdto();
		
		try(Connection con = GetConnection(); 
				PreparedStatement pst = con.prepareStatement(sql);
			){
			pst.setString(1, ProductName);
			pst.setString(2, item);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				String getProductName = rs.getString("ProductName");
				String getprice = rs.getString("price");
				dto = new Productdto(getProductName, getprice);	
			}
				
		}catch (Exception e) {
			e.printStackTrace();
		}	
		return dto;
	}
	
	
	
	
	
	

}
