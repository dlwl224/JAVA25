package list.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import list.dao.TodoDAO;
import list.dto.TodoDTO;
import list.dto.UserDTO;

@WebServlet("/create")
public class TodoCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public TodoCreate() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("✅ TodoCreate 서블릿 실행됨"); // 서블릿이 실행되는지 확인

		//세션에서 사용자 정보 가져오기
		HttpSession session = request.getSession();
		UserDTO user=(UserDTO) session .getAttribute("user");
		
		if(user == null) {
			response.sendRedirect("./login.jsp");
			return;
		}
		//입력받은 데이터 처리 
		String title= request.getParameter("title");
		String description = request.getParameter("description");
		String dueDateStr = request.getParameter("dueDate"); 
		Timestamp dueDate = Timestamp.valueOf(dueDateStr.replace("T", " ") + ":00"); 

		
		
	
		
		
		//TodoDTO에 데이터 세팅 
		TodoDTO todo = new TodoDTO();
		todo.setUserNo(user.getUserNo());
		todo.setTitle(title);
		todo.setDescription(description);
		todo.setDueDate(dueDate);	     
			     
		request.setAttribute("todo", todo);
		
		TodoDAO dao = new TodoDAO();
		dao.insertTodo(todo);
		   
		
		System.out.println("✅ 할 일 저장 요청됨: " + todo.getTitle());
		
		response.sendRedirect(request.getContextPath() +"/todomain.jsp");

			
		
	}

}
