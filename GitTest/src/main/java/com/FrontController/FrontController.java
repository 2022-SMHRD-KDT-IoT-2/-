package com.FrontController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Command.Command;
import com.POJO.BreakAllDelete;
import com.POJO.BreakDelete;
import com.POJO.BreakReport;
import com.POJO.IdCheck;
import com.POJO.InstallDelete;
import com.POJO.InstallModify;
import com.POJO.InstallService;
import com.POJO.Join;
import com.POJO.KakaoLogin;
import com.POJO.Login;
import com.POJO.Logout;
import com.POJO.PrivacyUpdate;
import com.POJO.ProductDelete;
import com.POJO.ProductModify;
import com.POJO.ProductWrite;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		// 요청 URI
		String reqURI = request.getRequestURI();
		System.out.println("요청URI :" + reqURI);

		// 프로젝트 명
		String path = request.getContextPath();
		System.out.println("프로젝트명 :" + path);

		// 문자열자르기 -> reqURI-프로젝트명/
		String result = reqURI.substring(path.length() + 1);
		System.out.println(result);
		
		Command command = null;
		//여기서 command 에 대한 객체를 각각 Con 에 맞게 수정해주셔야 해용
		if (result.equals("Login.do")) {
			command = new Login();
		} else if (result.equals("Join.do")) {
			command = new Join();
		} else if (result.equals("Logout.do")) {
			command = new Logout();
		} else if (result.equals("IdCheck.do")) {
			command = new IdCheck();
		}else if (result.equals("BreakAllDelete.do")) {
			command = new BreakAllDelete();
		}else if (result.equals("BreakDelete.do")) {
			command = new BreakDelete();
		}else if (result.equals("BreakReport.do")) {
			command = new BreakReport();
		}else if (result.equals("InstallDelete.do")) {
			command = new InstallDelete();
		}else if (result.equals("InstallModify.do")) {
			command = new InstallModify();
		}else if (result.equals("InstallService.do")) {
			command = new InstallService();
		}else if (result.equals("PrivacyUpdate.do")) {
			command = new PrivacyUpdate();
		}else if (result.equals("ProductDelete.do")) {
			command = new ProductDelete();
		}else if (result.equals("ProductModify.do")) {
			command = new ProductModify();
		}else if (result.equals("ProductWrite.do")) {
			command = new ProductWrite();
		}else if (result.equals("KakaoLogin.do")) {
			command = new KakaoLogin();
		}
		response.setContentType("text/html; charset=euc-kr");
		String url = command.execute(request, response);
		if (url.equals("true") || url.equals("false")) {
			PrintWriter out = response.getWriter();
			out.print(url);
		}else if(url.equals("success") || url.equals("fail")) {
			PrintWriter out = response.getWriter();
			out.print(url);
		}else if(url.equals("joinsuccess")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('회원가입 성공'); location.href = 'login.jsp'; </script>");
		}else if(url.equals("joinfail")) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('회원가입 실패'); location.href = 'join.jsp';</script>");
		}else if(url.equals("kakaosuccess") || url.equals("kakaofail")) {
			PrintWriter out = response.getWriter();
			out.print(url);
		}
		
		else {
			response.sendRedirect(url);
		}
	}
	}


