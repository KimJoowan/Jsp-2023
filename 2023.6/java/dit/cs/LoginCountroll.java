package dit.cs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginCountroll extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        request.setCharacterEncoding("utf-8");
        String url = request.getRequestURI();
        System.out.print(url);

        String com = url.substring(1, 6);
        System.out.println(url.lastIndexOf("/") + 1 + "," + url.indexOf(".do"));
        
        String viewPage = null; // Initialize viewPage variable
        
        if(com.equals("list") && com != null) {
            Logindao dao = new Logindao();
            ArrayList<Logindto> dtos = dao.list();
            request.setAttribute("dtos", dtos);
            viewPage = "/dao-dto/list.jsp";

        }if(com.equals("insertForm") && com != null) {
            viewPage = "/dao-dto/insertForm.jsp";

        }if(com.equals("insert") && com != null) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String pwd = request.getParameter("pwd");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
			String email = request.getParameter("email");
            Logindto dto = new Logindto(id,name,pwd,gender,phone,email);
            Logindao dao = new Logindao();
            dao.insertLogin(dto);
            viewPage = "list.do";

        }if(com.equals("index") && com != null)
        	viewPage ="/WEB-INF/view/index.jsp";
        	
        	
        	
        	
        	

        System.out.println(url.lastIndexOf("/"));
        System.out.println(com);

        RequestDispatcher rd = request.getRequestDispatcher(viewPage);
        rd.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
