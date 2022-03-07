package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.InstallDAO;

public class InstallService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String loc = request.getParameter("loc");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String id=request.getParameter("id");
		
		InstallDAO dao=new InstallDAO();
		
		int cnt=dao.requestInstall(loc, name, phone, id);
		return "install.jsp";
	}

}
