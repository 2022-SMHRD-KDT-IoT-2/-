package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.InstallDAO;

public class InstallDelete implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		InstallDAO dao=new InstallDAO();
		int cnt=dao.deleteInstall(no);
		return "install.jsp";
	}

}
