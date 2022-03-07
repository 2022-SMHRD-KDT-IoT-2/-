package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.BreakDAO;

public class BreakAllDelete implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BreakDAO dao = new BreakDAO();
		int cnt = dao.deleteAllBreak();


		return "breaklist.jsp";
	}

}
