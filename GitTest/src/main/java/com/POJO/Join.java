package com.POJO;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.memberDAO;

public class Join implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");


		
		
		
		memberDAO dao = new memberDAO();
		int cnt = dao.join(id,pw,name,phone,email,addr);
		String url="";
		
		if (cnt > 0) {
			url="index.jsp";
		}else {
			url="index.jsp";
		}
		return url;
	}

}
