package list.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import list.DBConn;
import list.dto.TodoDTO;

public class TodoDAO {

	public void insertTodo(TodoDTO dto) {
		
        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "INSERT INTO todo (user_no, title, description, due_date) VALUES (?, ?, ?, ?)";

        try {
            conn = DBConn.getInstance().getConn();
            
            if (conn == null) {
    		    System.out.println("❌ DB 연결 실패");
    		    return;
    		} else {
    		    System.out.println("✅ DB 연결 성공");
    		}
            
            pstmt = conn.prepareStatement(sql);
            
            System.out.println("✅ user_no: " + dto.getUserNo());
            System.out.println("✅ title: " + dto.getTitle());
            System.out.println("✅ description: " + dto.getDescription());
            System.out.println("✅ due_date: " + dto.getDueDate());

            pstmt.setInt(1, dto.getUserNo());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getDescription());
            pstmt.setTimestamp(4, dto.getDueDate());

            int result =pstmt.executeUpdate();

           
            if (result > 0) {
                System.out.println("✅ 할 일 저장 성공: " + dto.getTitle());
            } else {
                System.out.println("❌ 할 일 저장 실패");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
            	pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
     public List<TodoDTO> getTodoByUser(int userNo){
        List<TodoDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
           
        String sql="SELECT * FROM todo WHERE user_no = ? ORDER BY created_at DESC";
        	
        
        try {
        	conn=DBConn.getInstance().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TodoDTO dto = new TodoDTO();
				dto.setTodoNo(rs.getInt("todo_no"));
                dto.setUserNo(rs.getInt("user_no"));
                dto.setTitle(rs.getString("title"));
                dto.setDescription(rs.getString("description"));
                dto.setDueDate(rs.getTimestamp("due_date"));
                dto.setStatus(rs.getBoolean("status"));
                dto.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
        return list;
        
      }
     
     
     public void updateTodo(TodoDTO dto) {
    	 Connection conn= null;
    	 PreparedStatement pstmt = null;
    	
    	 String sql="UPDATE todo SET title= ?, description= ?,due_date= ?, status= ? WHERE todo_no=?";
    	 
    	
    	 try { 
    		conn=DBConn.getInstance().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getDescription());
            pstmt.setTimestamp(3, dto.getDueDate());
            pstmt.setBoolean(4, dto.isStatus());
            pstmt.setInt(5, dto.getTodoNo());
            
            
            pstmt.executeUpdate();
            
      
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
    	 
    			 
    	 
     }
     
     public TodoDTO getTodoById(int todoNo) {
    	 Connection conn=null;
    	 PreparedStatement pstmt =null;
    	 ResultSet rs=null;
    	 TodoDTO todo = null;
    	 String sql = "SELECT * FROM todo WHERE todo_no = ?";

    	 
    	  
    	  try {
    		  conn = DBConn.getInstance().getConn();
    		  pstmt = conn.prepareStatement(sql);
    		  pstmt.setInt(1, todoNo);
    		  
    		  rs= pstmt.executeQuery();
    		  if (rs.next()) {
    			  todo = new TodoDTO();
    	          todo.setTodoNo(rs.getInt("todo_no"));
    	          todo.setUserNo(rs.getInt("user_no"));
    	          todo.setTitle(rs.getString("title"));
    	          todo.setDescription(rs.getString("description"));
    	          todo.setDueDate(rs.getTimestamp("due_date"));
    	          todo.setStatus(rs.getBoolean("status"));
    	          todo.setCreatedAt(rs.getTimestamp("created_at"));
    	       }
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
    	return todo;
    }
    	 
     
     public void updateTodoStatus(int todoNo, boolean status) {
    	 Connection conn= null;
    	 PreparedStatement pstmt = null;
    	 
    	 String sql = "UPDATE todo SET status = ? WHERE todo_no = ?";

    	  
    	  try {
    		  conn = DBConn.getInstance().getConn();
    		  pstmt  = conn.prepareStatement(sql);
    		  pstmt.setBoolean(1, status);
    	      pstmt.setInt(2, todoNo);

    	      int result = pstmt.executeUpdate();
    	      if (result > 0) {
    	           System.out.println("✅ 완료 상태 업데이트 성공 (todo_no: " + todoNo + ", status: " + status + ")");
    	      } else {
    	           System.out.println("❌ 완료 상태 업데이트 실패");
    	      }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}


     }


     public List<TodoDTO> getTodosByUser(int userNo) {
         List<TodoDTO> todos = new ArrayList<>();
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;

         String sql = "SELECT todo_no, title, description, due_date,status FROM todo WHERE user_no = ?";

         try {
             conn = DBConn.getInstance().getConn();
             pstmt = conn.prepareStatement(sql);
             pstmt.setInt(1, userNo);
             rs = pstmt.executeQuery();

             while (rs.next()) {
                 TodoDTO todo = new TodoDTO();
                 todo.setTodoNo(rs.getInt("todo_no"));
                 todo.setTitle(rs.getString("title"));
                 todo.setDescription(rs.getString("description"));
                 todo.setDueDate(rs.getTimestamp("due_date"));
                 todo.setStatus(rs.getBoolean("status"));

                 todos.add(todo);
             }
         } catch (SQLException e) {
             e.printStackTrace();
         } finally {
             try {
                 rs.close();
                 pstmt.close();
                 conn.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
         }

         return todos;
     }
     
     public List<TodoDTO> getAllTodos(){
    	    List<TodoDTO> todoList = new ArrayList<>();
    	    String sql = "SELECT * FROM todo WHERE status = true";
    	    Connection conn=null;
    	    PreparedStatement pstmt =null;
    	    ResultSet rs= null;
    	    
    	    try {
                conn = DBConn.getInstance().getConn();
                pstmt = conn.prepareStatement(sql); 
                rs = pstmt.executeQuery(); 
                while (rs.next()) {
                    TodoDTO todo = new TodoDTO();
                    todo.setTodoNo(rs.getInt("todo_no"));
                    todo.setTitle(rs.getString("title"));
                    todo.setDescription(rs.getString("description"));
                    todo.setDueDate(rs.getTimestamp("due_date"));
                    todo.setStatus(rs.getBoolean("status"));  
                    todoList.add(todo);
                }
            } catch (SQLException e) {
                e.printStackTrace();  
            } finally {
                try {
					rs.close();
					pstmt.close(); 
	                conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
                
            }
            
            return todoList;
        }

    	    
    	   
    	


     public void deleteTodo(int todoNo) {
    	 Connection conn =null;
    	 PreparedStatement pstmt= null;
    	 
    	 String sql= "DELETE FROM todo WHERE todo_no =?";
    	 
    	 
    	 try {
    		conn=DBConn.getInstance().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, todoNo);
			
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
     }
    
}

