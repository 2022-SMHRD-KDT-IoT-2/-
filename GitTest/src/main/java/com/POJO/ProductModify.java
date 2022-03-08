package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.ProductDAO;

public class ProductModify implements Command{


	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String product_id = request.getParameter("product_id");
		String loc = request.getParameter("loc");
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude=Double.parseDouble(request.getParameter("longitude"));
		int no = Integer.parseInt(request.getParameter("no"));
		ProductDAO dao=new ProductDAO();
		
		int cnt=dao.modifyProduct(product_id, loc, latitude, longitude, no);

		return "privacyproduct.jsp";
	}
}
