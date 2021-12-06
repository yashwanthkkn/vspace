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
@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	TestService testService;
/*	@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public String userDashboard(Principal principal) {
		if(principal != null) {			
			System.out.println(principal.getName());
		}
		
		return "StudentDashboard";
	}*/
	
	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public ModelAndView processLoginPage(User user,ModelAndView mandv) {
		System.out.println(user.getEmailid()+":"+user.getPassword());
		mandv.addObject("userBean",user);
		List<Test> tests = testService.findAllTests();
		mandv.addObject("tests",tests);
		mandv.setViewName("StudentDashboard");
		return mandv;
	}
	
	@RequestMapping(value="/test",method = RequestMethod.GET)
	public String testPage() {
		return "TestPage";
	}
	
}
