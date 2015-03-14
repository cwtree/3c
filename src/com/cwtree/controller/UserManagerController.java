package com.cwtree.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cwtree.bean.UserInfo;
import com.cwtree.service.UserService;

@Controller
public class UserManagerController {

	@Resource
	private UserService userService;

	@RequestMapping(value = "/")
	public String welcome(HttpServletRequest request, ModelMap modelMap,
			UserInfo ui) {
		modelMap.put("userInfo", new UserInfo());
		request.getSession().invalidate();
		return "index";
	}

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, ModelMap modelMap,
			UserInfo ui, BindingResult bindingResult) {
		boolean flag = this.userService.userLogin(ui.getUsername(), ui.getPassword());
		HttpSession session = request.getSession();
		session.setAttribute("username", ui.getUsername());
		session.setAttribute("pwd", ui.getPassword());
		session.setAttribute("date", new SimpleDateFormat("yyyy /MM / dd").format(new Date()));
		if (flag) {
			return "main";
		} else {
			bindingResult.reject("userpwd", "请检查用户名密码！");
			session.removeAttribute("username");
			return "index";
		}
	}
	
	@RequestMapping(value = "repwd")
	public String beforeChangePwd(HttpServletRequest request, ModelMap modelMap,
			UserInfo ui, BindingResult bindingResult) {
		return "user/repwd";
	}
	
	@RequestMapping(value = "/rechangepwd")
	public String rechangepwd(HttpServletRequest request, ModelMap modelMap,
			UserInfo ui, BindingResult bindingResult) {
		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		HttpSession session = request.getSession();
		if(!oldpwd.equals(session.getAttribute("pwd").toString())) {
			bindingResult.reject("pwdwrong","原密码输入错误，重新登录！");
			session.removeAttribute("username");
			return "index";
		}else {
			int res = this.userService.updatePwd(session.getAttribute("username").toString(),newpwd);
			if(res>0)
				return "main";
			else 
				return "index";
		}
	}
	
}
