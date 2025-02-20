package feb18.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {
	private int board_no, user_no, board_like;
	private String board_title, board_content, board_date, user_name;

}
