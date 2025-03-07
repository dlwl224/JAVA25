package com.poseidon.web.dto;

import lombok.Data;

//ResultMap 사용하기 용입니다.
//BoardDTO를 다르게 만듭니다. 
@Data
public class TempDTO {
	
	private int no, u_no, like;
	private String title, content, date, u_name, u_id;

}
