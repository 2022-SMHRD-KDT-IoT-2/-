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
		//2.memberDAO email�� ����� �� �ִ� email���� Ȯ�����ִ� �޼ҵ�(idCheck())
		 memberDAO dao=new memberDAO();
		boolean check=dao.idCheck(id);
		//��ȯ�� :�ִ� ���̵�� true/���� ���̵�� false
		return String.valueOf(check);
	}

}
