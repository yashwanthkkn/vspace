package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entities.User;
@Controller
@RequestMapping("user")
public class UserController {
	@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public String userDashboard() {
		return "StudentDashboard";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView processLoginPage(User user,ModelAndView mandv) {
		System.out.println(user.getEmailid()+":"+user.getPassword());
		mandv.addObject("userBean",user);
		mandv.setViewName("StudentDashboard");
		return mandv;
	}
	
	@RequestMapping(value="/test",method = RequestMethod.GET)
	public String testPage() {
		return "TestPage";
	}
	
}
