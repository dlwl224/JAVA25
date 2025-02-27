package list.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import list.dao.TodoDAO;


@WebServlet("/todo/updateStatus")
public class TodoUpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TodoUpdateStatus() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int todoNo = Integer.parseInt(request.getParameter("todoNo"));
        boolean status = Integer.parseInt(request.getParameter("status")) == 1;

        TodoDAO dao = new TodoDAO();
        dao.updateTodoStatus(todoNo, status);

        response.setStatus(HttpServletResponse.SC_OK);
		
	}

}