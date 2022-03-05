package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BreakDAO;

/**
 * Servlet implementation class BreakAllDelete
 */
@WebServlet("/BreakAllDelete")
public class BreakAllDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		BreakDAO dao = new BreakDAO();
		int cnt = dao.deleteAllBreak();

		if (cnt > 0) {
			response.sendRedirect("breaklist.jsp");
		} else {
			response.sendRedirect("breaklist.jsp");
		}	
	}

}
