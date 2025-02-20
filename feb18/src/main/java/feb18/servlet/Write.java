package feb18.servlet;

import java.io.IOException;

import feb18.dao.BoardDAO;
import feb18.dto.BoardDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/write")
public class Write extends HttpServlet {
   private static final long serialVersionUID = 1L;

    public Write() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //로그인 검사
      HttpSession session = request.getSession();
      String mid = (String) session.getAttribute("mid");
      
      if(mid != null) {
         RequestDispatcher rd = request.getRequestDispatcher("/write.jsp");
         rd.forward(request, response);
      } else {
         response.sendRedirect("./login.jsp");
      }
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 값 받기
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      // 조립하기
      BoardDTO dto = new BoardDTO();
      dto.setBoard_title(title);
      dto.setBoard_content(content);
      // 세션에 값을 가져와서 대입하는 코드 필요
      // dto.setUser_name("사용자 아이디를 적어주세요.");
      
      // 세션에 올라간 user_no 가져오기
      HttpSession session = request.getSession();
      String user_no = String.valueOf(session.getAttribute("user_no")) ;
      dto.setBoard_no(Integer.parseInt(user_no)); //여기는 사용자의 번호가 필요
      
      // DAO에 전송하기
      BoardDAO dao = new BoardDAO();
      int result = dao.write(dto);
      
      // page이동
      if(result==1) {
         response.sendRedirect("./board.jsp");
      }else {
         response.sendRedirect("./error");
      }
   }

}
