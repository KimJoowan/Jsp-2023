package cs.dit.board;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class BUpdateServie implements boardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		Date regDate = Date.valueOf(request.getParameter("regDate"));
		String filename = null;
		String dir = null;
		
		// 요청의 내용 유형을 가져옵니다
		String contentType = request.getContentType();
		System.out.print("contentType:"+ contentType);
		
		// 요청에 멀티파트 데이터가 포함되어 있는지 확인(파일 업로드)
		if(contentType!=null && contentType.startsWith("multipart/")) {
			
			// 업로드된 파일을 저장하기 위한 실제 경로 가져오기
			dir = request.getServletContext().getRealPath("/uploadfiles");
		}
		
		// 디렉토리가 없는 경우 디렉토리 만들기
		File f = new File(dir);
		if(!f.exists()) {
			f.mkdir();
		}
		
		// 멀티파트 요청(파일 업로드)의 일부를 처리
		Collection<Part> parts  = request.getParts();
		
		for(Part p:parts) {
			if(p.getHeader("Content-Disposition").contains("filename=")) {
				if(p.getSize() > 0) {
					// 제출된 파일 이름을 가져와 파일 경로를 만듭니다
					filename = p.getSubmittedFileName();
					
					String filePath = dir + File.separator + filename;
					
					// 업로드한 파일을 지정된 경로에 쓰기
					p.write(filePath);
					
					// 임시 부분 삭제
					p.delete();
					
				}
			}
		}
		
		
		BoardDto dto = new BoardDto(bcode, subject, content, writer, regDate, filename); 
		BoardDao dao = new BoardDao();
		
		dao.update(dto);		
		

	}

}
