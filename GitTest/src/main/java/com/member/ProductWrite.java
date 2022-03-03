package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ProductDAO;


@WebServlet("/ProductWrite")
public class ProductWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String pro_id = request.getParameter("pro_id");
		String loc = request.getParameter("loc");
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude=Double.parseDouble(request.getParameter("longitude"));
		String id = request.getParameter("id");
		
		ProductDAO dao=new ProductDAO();
		
		int cnt=dao.oneProduct(pro_id, loc, latitude, longitude, id);
		if(cnt>0) {
			response.sendRedirect("productlist.jsp");
			System.out.println("작성성공");
		}else {
			response.sendRedirect("productlist.jsp");
			System.out.println("작성실패");
		}
	}

}
