package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BreakDAO;

/**
 * Servlet implementation class BreakDelete
 */
@WebServlet("/BreakDelete")
public class BreakDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String no = request.getParameter("no");

		BreakDAO dao = new BreakDAO();
		int cnt = dao.deleteOneBreak(no);

		if (cnt > 0) {
			response.sendRedirect("breaklist.jsp");
		} else {
			response.sendRedirect("breaklist.jsp");
		}	}

}
