package feb18.dto;

import lombok.Data;

@Data

public class LoginDTO {
	private int no,count; //로그인 성공 여부 : 성공하면 1, 아니면 0
	private String id, pw, name;


}
