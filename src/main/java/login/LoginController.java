package login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/login_login");
		return mv;
	}
	
	@RequestMapping("/loginjoin")
	public ModelAndView loginJoin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/login_join");
		return mv;
	}
	
	@RequestMapping("/logindeleteuser")
	public ModelAndView loginDeleteUser() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/login_deleteuser");
		return mv;
	}
	
	@RequestMapping("/loginuserinfo")
	public ModelAndView loginUserInfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/login_userinfo");
		return mv;
	}
}
