package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.BreakDAO;

public class BreakReport implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		int product_num = Integer.parseInt(request.getParameter("product_number"));
		String content=request.getParameter("content");
		
		BreakDAO dao=new BreakDAO();
		
		int cnt=dao.oneReport(name, phone, product_num, content);
		return "break.jsp";
	}

}
