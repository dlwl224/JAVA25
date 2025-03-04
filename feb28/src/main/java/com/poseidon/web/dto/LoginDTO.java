package com.poseidon.web.dto;

import lombok.Data;

/*
 * 어노테이션
 * @Controller :컨트롤러 기능
 * @Service : 서비스 기능 
 * @Repository : DAO기능
 * @Component : 그외 
 */

@Data
public class LoginDTO {
	private int count;
	private String user_id, user_pw, user_name;
	//더만들기 

}
