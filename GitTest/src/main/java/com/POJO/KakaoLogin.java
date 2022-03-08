package com.POJO;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Command.Command;
import com.VO.memberVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class KakaoLogin implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

//		StringBuffer sb = new StringBuffer();
//		String line = null;
//		try {
//		BufferedReader reader = request.getReader();
//		while((line = reader.readLine()) != null) {
//			sb.append(line);
//		}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		JsonParser parser = new JsonParser();
//		JsonElement element = parser.parse(sb.toString());
		
		//String email = element.getAsJsonObject().get("email").getAsString();
		//String name = element.getAsJsonObject().get("name").getAsString();
		String email=request.getParameter("id");
		String name=request.getParameter("name");
		System.out.println(email+"\t"+name);
		String phone="";
		String pw="";
		String addr="";
		String yn="N";
		memberVO vo = new memberVO(email,pw,name,phone,email,addr,yn);
		HttpSession session = request.getSession();
		session.setAttribute("loginvo", vo); 
		return "kakaosuccess";
	}

}
