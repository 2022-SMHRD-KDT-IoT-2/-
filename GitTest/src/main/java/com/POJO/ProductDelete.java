package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.ProductDAO;

public class ProductDelete implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");

		ProductDAO dao = new ProductDAO();
		int cnt = dao.deleteProduct(no);

		return "privacyproduct.jsp";
	}

}
