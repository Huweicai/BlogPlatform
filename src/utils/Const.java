package utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * 常量类，用于保存一些全局常量
 * 
 * @author huweicai
 *
 */
public class Const {
	//网站域名
	public static  String domain="http://localhost:8080/BlogPlatform";
	//Spring应用上下文
	public static ApplicationContext context= new ClassPathXmlApplicationContext("configuration/beans.xml");;
}

