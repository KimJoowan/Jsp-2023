package cs.dit.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/comments/*")
public class CommentsCountrool extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		System.out.println("bcode : "+ Integer.parseInt(request.getParameter("bcode")));

		String uri = request.getRequestURI();
		System.out.println("uri : "+uri);
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.length());	
		CommentsServie cservice = new CommentsServie();
		
		if(com != null && com.trim().equals("listComments")) {
			cservice.listComments(request, response);
			
	
		}else if(com != null && com.trim().equals("insertCommments")) {
			System.out.println("OK");
			cservice.insertCommments(request, response);
		}
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
