package feb18.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import feb18.DBConn;
import feb18.dto.BoardDTO;

public class BoardDAO {

	   public List<BoardDTO> list() { // select ResultSet
	      List<BoardDTO> list = null;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "SELECT board_no, board_title, user_no, user_name,"
	            + " board_date, board_like FROM viewboard LIMIT 0, 10";

	      try {
	         conn = DBConn.getInstance().getConn();
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();

	         list = new ArrayList<BoardDTO>();
	         while (rs.next()) {
	            BoardDTO dto = new BoardDTO();
	            dto.setBoard_no(rs.getInt("board_no"));
	            dto.setBoard_title(rs.getString("board_title"));
	            dto.setUser_no(rs.getInt("user_no"));
	            dto.setUser_name(rs.getString("user_name"));
	            dto.setBoard_date(rs.getString("board_date"));
	            dto.setBoard_like(rs.getInt("board_like"));
	            list.add(dto);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rs, pstmt, conn);
	      }

	      return list;
	   }

	   public int write(BoardDTO dto) {
	      int result = 0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      String sql = "INSERT INTO board (board_title, board_content, user_no)"
	            + " VALUES(?, ?, ?)";

	      try {
	         conn = DBConn.getInstance().getConn();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getBoard_title());
	         pstmt.setString(2, dto.getBoard_content());
	         pstmt.setInt(3, dto.getUser_no());

	         result = pstmt.executeUpdate(); // 영향받은 행

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(null, pstmt, conn);
	      }

	      return result;
	   }

	   private void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
	      if (rs != null) {
	         try {
	            rs.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      if (pstmt != null) {
	         try {
	            pstmt.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      if (conn != null) {
	         try {
	            conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	   }

	}
