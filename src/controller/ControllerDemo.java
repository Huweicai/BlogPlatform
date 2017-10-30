package controller;

import java.io.*;

import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import domain.User;
import service.face.UserOp;
import service.impl.UserOpImpl;

@Controller
public class ControllerDemo {
//	@Autowired
//	WebProcessSerivce webs;

	@RequestMapping("/hello")
	public void sayHello(HttpServletRequest request, 
						HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		writer.write("HelloWorld");
		writer.close();
	}
	@RequestMapping("/hi")
	public String sayHello() {
		return "hello";
	}
	@RequestMapping("/hey")
	public ModelAndView sayHey() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("name", "LONERS");
		mav.setViewName("hello");
		return mav;
	}
	public static void main(String[] args) {
		UserOp userop =new UserOpImpl();
		User user=userop.getUserByID("1234");
		System.out.println(user.getUsername());
	}
}
