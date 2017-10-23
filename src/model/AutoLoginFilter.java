package model;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class AutoLoginFilter implements Filter{


	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletRequest resp=(HttpServletRequest)response;
		//获得cookie中用户名和密码进行登录
		//定义cookie_username
		String cookie_username=null;
		//定义cookie_password
		String cookie_password=null;
		//获得cookie
		Cookie[] cookies=req.getCookies();
		if(cookies!=null){
			
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	@Override
	public void destroy() {
		
	}

}
