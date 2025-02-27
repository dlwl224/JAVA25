package list.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import list.dao.TodoDAO;


@WebServlet("/todo/delete")
public class TodoDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TodoDelete() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int todoNo = Integer.parseInt(request.getParameter("todoNo"));

            TodoDAO dao = new TodoDAO();
            dao.deleteTodo(todoNo);

            String referer = request.getHeader("Referer"); // 사용자가 어디서 요청했는지 확인
            if (referer != null && referer.contains("index.jsp")) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/todomain.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/todomain.jsp?error=deleteFailed");
        }
	}

}
