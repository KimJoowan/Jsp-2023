package cs.dit.board;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDao {
	
	//전역변수 sqlMapper(SqlSessionFactory) 선언 
	
	//sqlMapper 생성하는 getlnstance() 선언  SqlSessionFactory 사용
	
	private static SqlSessionFactory sqlMapper = null;

	/**======================================================================
	 * 패키지명 : cs.dit.board
	 * 파일명   : BoardDao.java
	 * 작성자  : 김진숙
	 * 변경이력 : 
	 * 2022-9-11/ 최초작성/ 김진숙
	 * 프로그램 설명 : board 테이블의 내용과 연동하여 회원관리
	*======================================================================*/
	
	public static SqlSessionFactory getInstance() {
		if(sqlMapper == null) {
			try{
				InputStream InputStream = Resources.getResourceAsStream("cs/dit/board/board-config.xml");
				sqlMapper = new SqlSessionFactoryBuilder().build(InputStream);
				InputStream.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sqlMapper;
		
	}
	
	public void insert(BoardDto dto) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			session.insert("cs.dit.board.insert", dto);
			session.commit();	
		}finally{
			session.close();
		}
	}
	
	public List<BoardDto> list(int p, int numofRecords){
		sqlMapper = getInstance();
		
		SqlSession session = sqlMapper.openSession();
		Map<String, Object> param = new HashMap<>();
		param.put("page", (p-1) * numofRecords);
		param.put("numofRecords", numofRecords);
		
		try{
			return session.selectList("cs.dit.board.selectAll", param);
			
		}finally {
			session.close();
		}
	}
	
	public int recordCount(){
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectOne("cs.dit.board.recordCount");
		}finally {
			session.close();
		}
	}
	

	public BoardDto selectOne(int bcode) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			return session.selectOne("cs.dit.board.selectOne", bcode);
		}finally {
			session.close();
		}
			
	}
	
	public void update(BoardDto dto) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			session.update("cs.dit.board.update",dto);
			session.commit();
		}finally {
			session.close();
		}
	
	}
	

	public void delete(int bcode) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		try {
			session.delete("cs.dit.board.delete",bcode);
			session.commit();
		}finally {
			session.close();
		}		
	}
	
}
