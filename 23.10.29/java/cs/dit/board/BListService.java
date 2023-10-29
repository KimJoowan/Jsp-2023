package cs.dit.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BListService implements boardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) throws ServletException, IOException {
		
		//1. boarddao 을 생성
		BoardDao dao = new BoardDao();
		
		//전체 래코드의 개수
		int count = dao.recordCount();
		
		//한번에 가져올 래코드 수
		int numberOFRecords = 10;
		
		// 한 화면에 표시할 페이지수
		int numofpages = 5; 
		
		//현재 페이지 번호
		int p = 1; 
		
		String page = request.getParameter("p");
		
		if(page!=null && !page.equals("")) {
			p = Integer.parseInt(page);
		}
		
		//2. dao의 해당매소드 호출
		List<BoardDto> dtos = dao.list(p, numberOFRecords);
		
		int startNum = p-(p-1)%numofpages;
		int lastNum = (int)Math.ceil((float)count/(float)numberOFRecords);			
		
		//3. 호출 결과 처리
		request.setAttribute("dtos", dtos);
		request.setAttribute("p", p);
		request.setAttribute("startNum", startNum);
		request.setAttribute("lastNum", lastNum);
		request.setAttribute("numofpages", numofpages);
		
		// 출력확인
		System.out.println("count : " + count);
		System.out.println("startNum : " + startNum);
		System.out.println("lastNum : " + lastNum);
		System.out.println("page : " + p);
		

	}

}
