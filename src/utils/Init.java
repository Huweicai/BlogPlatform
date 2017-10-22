package utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 应用初始化操作
 * @author Star
 *
 */
public class Init implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("应用启动");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

}
