<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.*, java.util.*, list.dao.TodoDAO, list.dto.TodoDTO, list.dto.UserDTO" %>

<%
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    // 세션에서 로그인한 사용자 정보 가져오기
    UserDTO user = (UserDTO) session.getAttribute("user");
    if (user == null) {
        out.print("[]"); // 로그인하지 않은 경우 빈 배열 반환
        return;
    }

    // DAO에서 일정 목록 가져오기
    TodoDAO dao = new TodoDAO();
    List<TodoDTO> todos = dao.getTodosByUser(user.getUserNo());

    // JSON 형식으로 변환
	JSONArray eventsArray = new JSONArray();
	for (TodoDTO todo : todos) {
    	JSONObject eventObj = new JSONObject();
    	eventObj.put("id", todo.getTodoNo()); 
    	eventObj.put("title", todo.getTitle());
    	eventObj.put("start", todo.getDueDate().toString());
    	eventObj.put("description", todo.getDescription()); 
    	eventObj.put("status", todo.isStatus());
    
    	if (todo.isStatus()) {
            eventObj.put("className", "completed"); 
        } else {
            eventObj.put("className", "todo");
        }
        eventsArray.add(eventObj);
    }
    out.print(eventsArray.toJSONString());

%>