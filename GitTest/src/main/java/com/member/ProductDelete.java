package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ProductDAO;

@WebServlet("/ProductDelete")
public class ProductDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String no = request.getParameter("no");

		ProductDAO dao = new ProductDAO();
		int cnt = dao.deleteProduct(no);

		if (cnt > 0) {
			response.sendRedirect("privacyproduct.jsp");
		} else {
			response.sendRedirect("privacyproduct.jsp");
		}
	}

}
