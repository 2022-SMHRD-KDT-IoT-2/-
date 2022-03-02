package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.InstallDAO;




@WebServlet("/InstallService")
public class InstallService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String loc = request.getParameter("loc");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String id=request.getParameter("id");
		
		InstallDAO dao=new InstallDAO();
		
		int cnt=dao.requestInstall(loc, name, phone, id);
		if(cnt>0) {
			response.sendRedirect("install.jsp");
			System.out.println("작성성공");
		}else {
			response.sendRedirect("install.jsp");
			System.out.println("작성실패");
		}
	}

}
