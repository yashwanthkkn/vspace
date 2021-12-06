package com.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entities.Test;
import com.entities.User;
import com.service.TestService;
import com.service.UserService;
@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	TestService testService;
	@Autowired
	UserService userService;

	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public ModelAndView processLoginPage(ModelAndView mandv,Principal principal) {
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		User user = userService.findUserByEmailid(principal.getName());
		List<Test> tests = testService.findAllTests();
		mandv.addObject("tests",tests);
		mandv.addObject("user",user);
		mandv.setViewName("StudentDashboard");
		return mandv;
	}
	
	@RequestMapping(value="/test",method = RequestMethod.GET)
	public String testPage() {
		return "TestPage";
	}
	
}
