package cs.dit.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(
		
	maxFileSize = 1024 * 1024 * 5,	
	maxRequestSize = 1024 * 1024 * 50	
						
)

@WebServlet("*.do" )
public class Boardcountrool extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		String viewpage  = null;
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
		
		System.out.println(com);
		
		if(com != null && com.trim().equals("list")) {
			boardService Service = new BListService();
			Service.execute(request, response);
			viewpage  = "/WEB-INF/View/list.jsp";
	
		}else if(com != null && com.trim().equals("delete")){
			boardService Service = new BDeleteServie();
			Service.execute(request, response);
			viewpage  = "/WEB-INF/View/list.do";
			
		}else if(com != null && com.trim().equals("insertForm")){
			viewpage  = "/WEB-INF/View/insertForm.jsp";
			
		}else if(com != null && com.trim().equals("update")){
			boardService Service = new BUpdateServie();
			Service.execute(request, response);
			viewpage  = "/WEB-INF/View/list.do";
			
		}else if(com != null && com.trim().equals("updateForm")){
			boardService Service = new BSearchServie();
			Service.execute(request, response);
			viewpage  = "/WEB-INF/View/updateForm.jsp";
			
		}else if(com != null && com.trim().equals("insert")){
			boardService Service = new BInsertServie();
			Service.execute(request, response);
			viewpage  = "/WEB-INF/View/list.do";
			
		}else if(com != null && com.trim().equals("index")){
			viewpage  = "/WEB-INF/View/index.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewpage);
		rd.forward(request, response);
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
