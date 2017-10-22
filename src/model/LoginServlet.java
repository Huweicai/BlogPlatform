package model;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import domain.User;
import service.face.UserOp;
import service.impl.UserOpImpl;
import utils.Const;

public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//解决中文乱码问题
		request.setCharacterEncoding("UTF-8");
		//验证码校验
		
		//获取验证码
		String checkCode=request.getParameter("checkCode");
		String username=request.getParameter("username");
		System.out.println(username);
		
		String password=request.getParameter("password");
		System.out.println(password);
		System.out.println(checkCode);
		//获得生成图片的验证码比对
		String checkCode_session=(String) request.getSession().getAttribute("checkcode_session");
		System.out.println(checkCode_session);
		boolean isCheckCode=false;
		boolean isLogin=false;
		if(checkCode.equals(checkCode_session)){
			isCheckCode=true;
		}
		//进行用户名和密码的比对
		UserOp userOp=(UserOp) Const.context.getBean("userop");
		User loginUser=(User) Const.context.getBean("user");
		try {
			loginUser=userOp.canLogin(username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(loginUser!=null){
			//用户名和密码正确
			isLogin=true;
		}
		System.out.println(isLogin);
		response.getWriter().write("{\"isLogin\":"+isLogin+",\"isCheckCode\":"+isCheckCode+"}");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}