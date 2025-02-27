package list.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import list.dao.TodoDAO;
import list.dto.TodoDTO;

@WebServlet("/todo/update")
public class TodoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TodoUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int todoNo = Integer.parseInt(request.getParameter("todoNo"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dueDateStr = request.getParameter("dueDate"); 
            Timestamp dueDate = Timestamp.valueOf(dueDateStr.replace("T", " ") + ":00");
            boolean status = request.getParameter("status") != null; // 체크박스 값 확인

            TodoDTO todo = new TodoDTO();
            todo.setTodoNo(todoNo);
            todo.setTitle(title);
            todo.setDescription(description);
            todo.setDueDate(dueDate);
            todo.setStatus(status);

            TodoDAO dao = new TodoDAO();
            dao.updateTodo(todo);

            response.sendRedirect(request.getContextPath() + "/todomain.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/todomain.jsp?error=updateFailed");
        }
	}

}