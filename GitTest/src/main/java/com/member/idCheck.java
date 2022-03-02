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
		//2.memberDAO email�� ����� �� �ִ� email���� Ȯ�����ִ� �޼ҵ�(idCheck())
		 memberDAO dao=new memberDAO();
		boolean check=dao.idCheck(id);
		//��ȯ�� :�ִ� ���̵�� true/���� ���̵�� false
		
		//3.console �� true/false(��ȯ��) ���
		PrintWriter out=response.getWriter();
		out.println(check);
	}

}