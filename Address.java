package com.poseidon.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/address")
public class Address extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Address() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// name, tel, addr
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String addr=request.getParameter("addr");
		
		//List<Map<String,Object>>
		Map<String,Object> dto= new HashMap<String,Object>();
		dto.put("name",name);
		dto.put("tel", request.getParameter("tel"));
		dto.put("addr", request.getParameter("addr"));
		List<Map<String,Object>> list=
				new ArrayList<Map<String,Object>>();
		
		
		
		
	}
