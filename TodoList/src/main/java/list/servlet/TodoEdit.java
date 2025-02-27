package list.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import list.dao.TodoDAO;
import list.dto.TodoDTO;


@WebServlet("/todo/edit")
public class TodoEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TodoEdit() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	     try {
	          int todoNo = Integer.parseInt(request.getParameter("todoNo"));
	          TodoDAO dao = new TodoDAO();
	          TodoDTO todo = dao.getTodoById(todoNo);

	          if (todo == null) {
	        	  response.sendRedirect(request.getContextPath() + "/todomain.jsp?error=notFound");
	              return;
	          }

	          request.setAttribute("todo", todo);
	          request.getRequestDispatcher("/edit.jsp").forward(request, response);
	      } catch (Exception e) {
	          e.printStackTrace();
	          response.sendRedirect(request.getContextPath() + "/todomain.jsp?error=editError");
	      }
	   }

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
