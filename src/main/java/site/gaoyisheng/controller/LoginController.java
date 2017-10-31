package site.gaoyisheng.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.service.LoginService;

/**
 * 登陆Controller类.
 * @author gaoyisheng
 *
 */
@Controller
@RequestMapping("/user")
@SessionAttributes(types = { User11.class }) // 设置会话属性
public class LoginController {

	@Autowired
	private LoginService loginService;

	/**
	 * .
	 * TODO 登陆
	 * @param request
	 * @param number
	 * @param password
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request,
			@RequestParam(value = "number", required = true) String number,
			@RequestParam(value = "password", required = true) String password) {

		ModelAndView mv = new ModelAndView();

		if (!(number.equals("") && password.equals(""))) {// not null

			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("number", number);
			parameterMap.put("password", password);
			// ajax + jQuery find User in DB or not?
			User11 currentUser = loginService.selectByNumberAndPassword(parameterMap);
			mv.addObject("currentUser", currentUser)
			  .setViewName("home");

			return mv;
		} else {
			return new ModelAndView("error");
		}
	}
	
	/**
	 * .
	 * TODO 判断是否已登陆
	 * @param session
	 * @return
	 */
	public boolean isLoggedIn(HttpSession session) {
		User11 currentUser =(User11) session.getAttribute("currentUser");
		
		return currentUser!=null; 
	}
	
	/**
	 * .
	 * TODO 登出
	 * @return
	 */
	public ModelAndView Logout(HttpSession session) {
		session.setAttribute("currentUser", null);
		
		return new ModelAndView();
	}
}
