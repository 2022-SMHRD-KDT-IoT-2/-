package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.BreakDAO;

public class BreakDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");

		BreakDAO dao = new BreakDAO();
		int cnt = dao.deleteOneBreak(no);

		return "breaklist.jsp";
	}

}
