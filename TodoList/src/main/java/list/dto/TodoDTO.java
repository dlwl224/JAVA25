package list.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TodoDTO {
	private int todoNo, userNo;
    private String title, description;
    private Timestamp dueDate;
    private boolean status;
    private Timestamp createdAt;

}
