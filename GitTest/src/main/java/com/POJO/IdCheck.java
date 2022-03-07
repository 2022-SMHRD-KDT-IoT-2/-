package com.POJO;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.DAO.memberDAO;

public class IdCheck implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String id=request.getParameter("id");
		//2.memberDAO email이 사용할 수 있는 email인지 확인해주는 메소드(idCheck())
		 memberDAO dao=new memberDAO();
		boolean check=dao.idCheck(id);
		//반환값 :있는 아이디면 true/없는 아이디면 false
		return String.valueOf(check);
	}

}
