package model;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import service.face.UserOp;
import service.impl.UserOpImpl;
import domain.User;



public class registerServler extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//设置request编码-只适合post提交方式，用于解决中文乱码问题
		request.setCharacterEncoding("UTF-8");
		String username=getInitParameter("username");
		System.out.println(username);
		
		//1.或取数据将散装的数据封装到javabean中
		//使用BeanUtils进行自动映射封装
		//BeanUtils根据键值对进行封装
		//根据key的名字与实体属性的名字一样，被自动封装到实体中
		
		Map<String,String[]> properties=request.getParameterMap();
		//创建User对象
		User user=new User();
		try {
			BeanUtils.populate(user, properties);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		/*private String userID;
		private String username;
		private String email;
		private String password;
		private String sex;
		private int birth_year;
		private int birth_month;
		private int birth_day;
		private String self_introduce;
		private boolean isAdmin;
		private String color;*/
		user.setSex(null);
		user.setColor(null);
		user.setSelf_introduce(null);
		UserOp userOp=new UserOpImpl();
		try {
			userOp.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}