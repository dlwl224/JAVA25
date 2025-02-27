package list.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import list.dao.UserDAO;
import list.dto.UserDTO;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Login() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       String userId = request.getParameter("userId");
	        String userPw = request.getParameter("userPw");

	        UserDTO dto = new UserDTO();
	        dto.setUserId(userId);
	        dto.setUserPw(userPw);

	        UserDAO dao = new UserDAO();
	        UserDTO user = dao.login(dto);

	        if (user.getCount() == 1) {
	            HttpSession session = request.getSession();
	            session.setAttribute("user", user);
	            response.sendRedirect("./index.jsp");
	        } else {
	            response.sendRedirect("./login.jsp?error=error");
	        }
		
	}

}
