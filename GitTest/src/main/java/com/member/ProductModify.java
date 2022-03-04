package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ProductDAO;


@WebServlet("/ProductModify")
public class ProductModify extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String product_id = request.getParameter("product_id");
		String loc = request.getParameter("loc");
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude=Double.parseDouble(request.getParameter("longitude"));
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(product_id+"\t"+loc+"\t"+latitude+"\t"+longitude+"\t"+no);
		ProductDAO dao=new ProductDAO();
		
		int cnt=dao.modifyProduct(product_id, loc, latitude, longitude, no);
		if(cnt>0) {
			response.sendRedirect("privacyproduct.jsp");
			System.out.println("수정성공");
		}else {
			response.sendRedirect("privacyproduct.jsp");
			System.out.println("수정실패");
		}
		
	}

}
