package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.InstallDAO;


@WebServlet("/InstallDelete")
public class InstallDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String no = request.getParameter("no");
		InstallDAO dao=new InstallDAO();
		int cnt=dao.deleteInstall(no);
		if(cnt>0) {
			response.sendRedirect("install.jsp");
		}else {
			response.sendRedirect("install.jsp");
		}
	}

}
