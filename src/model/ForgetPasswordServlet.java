package model;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 确认邮箱，用于找回密码及注册时
 * 验证邮箱时会向指定邮箱发送一个包含随机验证码参数的链接，并在本地保存
 * 在用户点击时判断验证码是否与本地验证码相同
 * 
 * @author huweicai
 *
 */
public class ForgetPasswordServlet extends HttpServlet{
	//用线程安全的HashMap保存发送给邮箱的随机验证码
	public static Map<String,Integer> randomKeys = 
			Collections.synchronizedMap(new HashMap<String,Integer>());
	String content ="LONERS 收到了您的重置密码请求。\n" + 
			"如果要重置密码，请单击下面的链接，或者将其复制并粘贴到浏览器中：\n" + 
			"如果不想重置密码，请忽略此邮件，您的密码不会改变。如有任何疑问或顾虑，请联系 LONERS团队 获取支持。\n"+
			utils.Const.domain+"/resetPassword?eamil=";
	//给指定邮箱发送验证码
	public void sendKey(String email) {
		int key = (int) (1000000000*Math.random());
		randomKeys.put(email, key);
		utils.SendMailUtil.sendMail(email, content+email+"&?key="+key , "重置密码");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//检查验证码
		String email = req.getParameter("email");
		int  key = Integer.valueOf(req.getParameter("key"));
		if(randomKeys.get(email) == key) {
			//这个我感觉还是没法写啊……
			//验证通过
		}else {
			//验证不通过
		}
	}
}
