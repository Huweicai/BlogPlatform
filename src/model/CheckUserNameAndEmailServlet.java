package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.face.UserOp;
import service.impl.UserOpImpl;

public class CheckUserNameAndEmailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//获取用户名和email
		String eamil=request.getParameter("email");
		String username=request.getParameter("username");
		System.out.println(eamil);
		System.out.println(username);
		UserOp userOp=new UserOpImpl();
		boolean isExist=false;
		try {
			isExist=userOp.isUserByEmailAndUsername(username,eamil);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//以json的格式对页面进行相应
		response.getWriter().write("{\"isExist\":"+isExist+"}");
		System.out.println(isExist);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}