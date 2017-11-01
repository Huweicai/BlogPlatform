package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xpath.internal.operations.Mod;

@Controller
public class FunctionController {
	@RequestMapping("/tip")
	public String sayHey() {
		return "tip";
	}
	@RequestMapping("/afterresetpwd")
	public ModelAndView afterReset() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tip");
		mav.addObject("tip","密码修改成功，正在跳转回主页");
		return mav;
	}
}
