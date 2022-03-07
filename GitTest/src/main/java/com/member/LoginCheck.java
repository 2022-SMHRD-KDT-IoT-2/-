package com.member;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.VO.memberVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		StringBuffer sb = new StringBuffer();
		String line = null;
		
		BufferedReader reader = request.getReader();
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());
		
		String id = element.getAsJsonObject().get("id").getAsString();
		String pw = element.getAsJsonObject().get("pw").getAsString();
		
		memberDAO dao=new memberDAO();
		memberVO vo=dao.login(id, pw);
		if(vo!=null) {
			
		}
	}

}
