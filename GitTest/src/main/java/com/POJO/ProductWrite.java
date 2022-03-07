package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.ProductDAO;

public class ProductWrite implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String pro_id = request.getParameter("pro_id");
		String loc = request.getParameter("loc");
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude=Double.parseDouble(request.getParameter("longitude"));
		String id = request.getParameter("id");
		
		ProductDAO dao=new ProductDAO();
		
		int cnt=dao.oneProduct(pro_id, loc, latitude, longitude, id);

		return "productlist.jsp";
	}

}
