package cs.dit.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

public class CommentsServie {
	
	CommentDao dao = new CommentDao();
	public void listComments(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		response.setContentType("application/x-json;charset=utf-8");
		
		JSONArray list = new JSONArray();
		
		list = dao.listComments(bcode);
		
		response.getWriter().print(list);	
	}
	
	public void insertCommments(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		String comments = request.getParameter("comments");
		
		CommentsDto dto = new CommentsDto(0, 0, bcode, comments, null);
		
		dao.insertCommments(dto);
		
	
	}
	
}
