package com.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;




@WebServlet("/idCheck")
public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		//2.memberDAO email이 사용할 수 있는 email인지 확인해주는 메소드(idCheck())
		 memberDAO dao=new memberDAO();
		boolean check=dao.idCheck(id);
		//반환값 :있는 아이디면 true/없는 아이디면 false
		
		//3.console 에 true/false(반환값) 출력
		PrintWriter out=response.getWriter();
		out.print(check);
	}

}
