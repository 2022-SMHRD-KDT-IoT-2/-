package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.InstallDAO;

public class InstallModify implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		
		String name= request.getParameter("name");
		String status=request.getParameter("status");
		String loc = request.getParameter("loc");
		String phone = request.getParameter("phone");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(name+"\t"+status+"\t"+loc+"\t"+phone+"\t"+no);
		InstallDAO dao=new InstallDAO();
		
		int cnt=dao.modifyInstall(name, status, loc, phone, no);
		return "install.jsp";
	}

}
