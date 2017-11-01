/*package site.gaoyisheng.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.service.UserService;

*//**
 * Admin Controller类.
 * @author gaoyisheng
 *
 *//*
@Controller
@RequestMapping("/admin")
public class AdminOpsController {

	@Autowired
	private UserService userService;
	
//	@Autowired
//	private XXService service;
	
	*//**
	 * .
	 * TODO admin主页
	 * @param session
	 * @return
	 *//*
	@RequestMapping("/home")
	public ModelAndView home(HttpSession session) {
		
		User11 currentUser =(User11) session.getAttribute("currentUser");
		System.out.println("home:" + currentUser.toString());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("currentUser",currentUser)
		  .setViewName("/admin/home");
		
		return mv;
	}
	
	*//**
	 * .
	 * TODO 用户列表
	 * @param session
	 * @return
	 *//*
	@RequestMapping("/user-list")
	public ModelAndView userList(HttpSession session) {
		User11 currentUser =(User11) session.getAttribute("currentUser");
		
//		List<User11> users = userService.selectAllUsers();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("currentUser", currentUser)
//		  .addObject("users", users)
		  .setViewName("/user/user-list");
		
		return mv;
	}
	
	*//**
	 * .
	 * TODO 更新用户的表单页面
	 * @param userId
	 * @return
	 *//*
	@RequestMapping("/updateUser/{userId}")
	public ModelAndView editUserForm(@PathVariable("userId") Integer userId) {
		
		User11 user = userService.selectUserByPrimaryKey(userId);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("selectedUser", user)
		  .setViewName("/admin/updateUser");
		
		return mv;
	}
	
	*//**
	 * .
 	 * TODO 提交用户更新
	 * @param user
	 * @return
	 *//*
	@RequestMapping("/update")
	public ModelAndView updateUser(@ModelAttribute User11 user) {
		
		userService.updateByPrimaryKey(user);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:" + "/admin/userList");
		
		return mv;
	}

	*//**
	 * .
	 * TODO 下载文件
	 * @return
	 *//*
	@RequestMapping("")
	public ModelAndView download() {
		
		return new ModelAndView();
	}
	
	*//**
	 * .
	 * TODO 上传文件
	 * @return
	 *//*
	@RequestMapping()
	public ModelAndView upload() {
		
		return new ModelAndView();
	}
	
}
*/