package feb18.servlet;

import java.io.IOException;

import feb18.dao.LoginDAO;
import feb18.dto.LoginDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class Login extends HttpServlet {
   private static final long serialVersionUID = 1L;
     
    public Login() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      //System.out.println(id);
      //System.out.println(pw);
      
      LoginDTO dto = new LoginDTO();
      dto.setId(id);
      dto.setPw(pw);
      
      LoginDAO dao = new LoginDAO();
      dto = dao.login(dto);
      
      if(dto.getCount()==1) {// 아이디 패스워드 일치
         System.out.println("정상 로그인: 사용자 이름: " + dto.getName());
         // 세션만들기
         HttpSession session = request.getSession(); //세션 객체
         session.setAttribute("mid", id); //(이름, 값)
         session.setAttribute("user_no", dto.getNo());
         
         response.sendRedirect("./board.jsp");
      }else {
         System.out.println("문제가 발생했습니다.");
         response.sendRedirect("./login.jsp?error=error");
      }
      
      
   }

}
