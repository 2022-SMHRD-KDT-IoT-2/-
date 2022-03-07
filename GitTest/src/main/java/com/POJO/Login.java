package com.POJO;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Command.Command;
import com.DAO.memberDAO;
import com.VO.memberVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class Login implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		StringBuffer sb = new StringBuffer();
		String line = null;
		try {
		BufferedReader reader = request.getReader();
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());
		
		String id = element.getAsJsonObject().get("id").getAsString();
		String pw = element.getAsJsonObject().get("pw").getAsString();
		
		
		memberDAO dao = new memberDAO();
		memberVO vo = dao.login(id,pw);

		String url="";
		if(vo!=null) {
			String name=vo.getName();
			String phone=vo.getPhone();
			String email=vo.getEmail();
			String addr=vo.getAddr();
			String yn=vo.getYn();
			memberVO vo1= new memberVO(id,pw,name,phone,email,addr,yn);
			HttpSession session = request.getSession();
			session.setAttribute("loginvo", vo1); 
			url="success";
		}else {
			url="fail";
		}
		return url;
	}

}
