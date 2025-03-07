package com.poseidon.web.util;

import org.springframework.stereotype.Component;

@Component
public class Util {
	//엔터키 처리
	public String newLine(String str) {
		return str.replaceAll("\n", "<br>");
	}
	public String renewLine (String str) {
		return str.replaceAll("<br>", System.getProperty("line separator"));
	}
	//<. > 처리
	public String htmlTag(String str) {
		return str.replaceAll("<", "&lt;").replaceAll(">", "&gt");
	}

}
