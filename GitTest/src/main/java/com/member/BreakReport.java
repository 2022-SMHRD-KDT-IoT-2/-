package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BreakDAO;



@WebServlet("/BreakReport")
public class BreakReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		int product_num = Integer.parseInt(request.getParameter("product_number"));
		String content=request.getParameter("content");
		
		BreakDAO dao=new BreakDAO();
		
		int cnt=dao.oneReport(name, phone, product_num, content);
		if(cnt>0) {
			response.sendRedirect("break.jsp");
		}else {
			response.sendRedirect("break.jsp");
		}
	}

}
