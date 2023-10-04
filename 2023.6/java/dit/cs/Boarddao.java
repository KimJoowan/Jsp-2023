/**===================================================
* 작성자 DIT
* 작성일 2023. 5. 23.
* 파일명 Boarddaoo.java
* 파일명 프로그램설명
 =============================================================**/
package dit.cs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * @author DIT
 *
 */
public class Boarddao{
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
				
//=============================================================================================================================================================================
// from 에서 가져운 데이터의 db의 login 테이블에 저장
//=============================================================================================================================================================================
		public void insertboaro(Boarddto dto){
			String sql ="insert into boaro values(?,?,?,?)";
				
			try(Connection con = GetConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql);
			){
				pstmt.setString(1, dto.getSUBJECT());
				pstmt.setString(2, dto.getCONTENT());
				pstmt.setString(3, dto.getWRITER());
				pstmt.setDate(4, dto.getREGDATE());
				pstmt.executeUpdate();
					
			}catch(Exception e){
				e.printStackTrace();
			}	
		}
//=============================================================================================================================================================================
// 데이터베이스에서 테이블에있는 레코드를 가져오는 매소드
// 출력 매소드 
// 1. 접근제어자, 2. 반환 데이터 타임, 3. 입력 매개변수
//=============================================================================================================================================================================
		public ArrayList<Boarddto> list(){
			String sql = "select * from boaro";
			
			ArrayList<Boarddto> dtos = new ArrayList<Boarddto>();
			
			try(Connection con = GetConnection(); 
				Statement stmt = con.createStatement();
			){
				ResultSet rs = stmt.executeQuery(sql);
			
				// 3.생성된 연결을 통해 SQL문 실행 의뢰 준비
				while(rs.next()){
					String SUBJECT = rs.getString("SUBJECT");
					String WRITER = rs.getString("WRITER");
					Date REGDATE = rs.getDate("REGDATE");
					
					Boarddto dto = new Boarddto(0, SUBJECT,WRITER,REGDATE);
					dtos.add(dto);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
		return dtos;
		}
		
//=============================================================================================================================================================================
// 1. 접근제어자, 2, 반환 데이터 타임, 3, 입력 매개변수
// 검색 매소드
//=============================================================================================================================================================================
		public Boarddto getOne(int BCODE){
			String sql = "select * from boaro where BCODE=?";
			Boarddto dto = new Boarddto();
				
			try(Connection con = GetConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql);
			){
				pstmt.setInt(1, BCODE);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()){
					String SUBJECT = rs.getString("SUBJECT");
					String CONTENT = rs.getString("CONTENT");
					String WRITER = rs.getString("WRITER");
					Date REGDATE = rs.getDate("REGDATE");
					dto = new Boarddto(BCODE,SUBJECT,CONTENT,WRITER,REGDATE);
						
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		return dto;
		}	
		
//=============================================================================================================================================================================
// 삭제매소드 
//=============================================================================================================================================================================
		public void Deletes(int BCODE){
			String sql = "DELETE FROM boaro WHERE BCODE=?";
			
			try(Connection con = GetConnection(); 
				PreparedStatement pstmt  = con.prepareStatement(sql);
			){
				pstmt.setInt(1, BCODE);
				pstmt.executeUpdate();

			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
//=====================================================================================================================================================================================
// 변경매소드	
//=====================================================================================================================================================================================
		public void update(Boarddto dto) {
			String sql = "UPDATE boaro SET SUBJECT=?, CONTENT=?, REGDATE=?, WRITER=? WHERE BCODE=?";
			try(Connection con = GetConnection(); 
					PreparedStatement pstmt  = con.prepareStatement(sql);
			){
				pstmt.setString(1, dto.getSUBJECT());
				pstmt.setString(2, dto.getCONTENT());
				pstmt.setDate(3, dto.getREGDATE());
				pstmt.setString(4, dto.getWRITER());
				pstmt.setInt(5, dto.getBCODE());
				pstmt.executeUpdate();
						
			}catch(Exception e){
				e.printStackTrace();
			}		
		}
	}
