package cs.dit.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface boardService {

	public void execute(HttpServletRequest request, HttpServletResponse reponse)
throws ServletException, IOException;
	
}
