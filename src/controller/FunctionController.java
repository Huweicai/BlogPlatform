package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FunctionController {
	@RequestMapping("/tip")
	public String sayHey() {
		return "tip";
	}
}
