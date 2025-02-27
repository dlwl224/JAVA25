package list.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import list.DBConn;
import list.dto.UserDTO;

public class UserDAO {
    public UserDTO login(UserDTO dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT count(*) as count, user_no, user_name FROM user"
                   + " WHERE user_id=? AND user_pw=?";

        try {
            conn = DBConn.getInstance().getConn();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getUserId());
            pstmt.setString(2, dto.getUserPw());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto.setCount(rs.getInt("count"));
                dto.setUserNo(rs.getInt("user_no"));
                dto.setUserName(rs.getString("user_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
            	rs.close();
                pstmt.close();if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return dto;
    }
}