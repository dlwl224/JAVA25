package feb18.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import feb18.DBConn;
import feb18.dto.LoginDTO;

public class LoginDAO {

	   public LoginDTO login(LoginDTO dto) {
	      Connection conn = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      String sql = "SELECT count(*) as count, user_no, user_name FROM user"
	            + " WHERE user_id='" + dto.getId()+ "' AND user_pw='" + dto.getPw() + "'";
	      // System.out.println(sql);
	      try {
	         conn = DBConn.getInstance().getConn();
	         stmt = conn.createStatement();
	         rs = stmt.executeQuery(sql);
	         if (rs.next()) {
	            //System.out.println(rs.getInt("count"));
	            //System.out.println(rs.getString("user_name"));
	            dto.setCount(rs.getInt("count"));
	            dto.setNo(rs.getInt("user_no"));
	            dto.setName(rs.getString("user_name"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            rs.close();
	            stmt.close();
	            conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }

	      return dto;
	   }
	}



//로그인하고 사용하는 게시판 만들기
//세션 <---> 쿠키
