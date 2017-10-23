package controller;

import java.io.*;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.face.UserOp;
import utils.Const;

@Controller
public class UserController {
	//换行符号
	public String enter =  System.getProperty("line.separator");
	// 用线程安全的HashMap保存发送给邮箱的随机验证码
	public static Map<String, Integer> randomKeys = Collections.synchronizedMap(new HashMap<String, Integer>());
	//邮件内容
	String content = "LONERS 收到了您的重置密码请求。" + enter +
			"如果要重置密码，请单击下面的链接，或者将其复制并粘贴到浏览器中：\n"+enter
			+ "如果不想重置密码，请忽略此邮件，您的密码不会改变。如有任何疑问或顾虑，请联系 LONERS团队 获取支持。" +enter
			+ utils.Const.domain + "/resetPassword?userID=";

	// 给指定邮箱发送验证码
	public void sendKey(String email) throws Exception {
		int key = (int) (1000000000 * Math.random());
		//通过Spring获取实例
		UserOp userop = (UserOp) Const.context.getBean("userop");
		//获取用户ID
		String userID = userop.getIDByEamil(email);
		content = "尊敬的用户 "+ userID + ",您好 ！"+ enter +content;
		randomKeys.put(userID, key);
		utils.SendMailUtil.sendMail(email, content + userID +"?key=" + key, "重置密码");
	}
	@RequestMapping("/sendEmail")
	public String sendEmail(@RequestParam("email") String eamil) throws Exception {
		sendKey(eamil);
		return "afterSendEmail";
	}
	@RequestMapping("/resetpassword")
	public String setPasswordAgain(@RequestParam("userID") String userID , @RequestParam("key") int key) {
//		if( randomKeys.get(userID) == key) {
//			return "resetPassword";
//		}else {
//			return "resetPasswordFail";
//		}
		return "resetPassword";
	}
}