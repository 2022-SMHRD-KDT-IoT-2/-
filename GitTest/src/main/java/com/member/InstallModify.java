package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.InstallDAO;


@WebServlet("/InstallModify")
public class InstallModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String name= request.getParameter("name");
		String status=request.getParameter("status");
		String loc = request.getParameter("loc");
		String phone = request.getParameter("phone");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(name+"\t"+status+"\t"+loc+"\t"+phone+"\t"+no);
		InstallDAO dao=new InstallDAO();
		
		int cnt=dao.modifyInstall(name, status, loc, phone, no);
		if(cnt>0) {
			response.sendRedirect("install.jsp");
		}else {
			response.sendRedirect("install.jsp");
		}
	}

}
