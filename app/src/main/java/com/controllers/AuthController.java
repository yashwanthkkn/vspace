package com.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entities.User;
import com.service.UserService;



@Controller
public class AuthController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login() {
		return "Login";
	}
	
	@RequestMapping(value="/signup",method = RequestMethod.GET)
	public ModelAndView loadLoginPage(ModelAndView mandv) {
		mandv.addObject("user",new User());
		mandv.addObject("msg","");
		mandv.setViewName("Signup");
		return mandv;
	}
	
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public ModelAndView processLoginPage(User user,ModelAndView mandv) {
		System.out.println(user.getName()+":"+user.getPassword());
		// check if user already exists
		User tempUser = userService.findUserByEmailid(user.getEmailid());
		if(tempUser != null) {
			System.out.println(tempUser);
			mandv.addObject("msg","Oops ! An account with the Email Id already exists");
			mandv.addObject("user",new User());
			mandv.setViewName("Signup");
			return mandv;
		}else {
			userService.saveUser(user);
			mandv.setViewName("Login");
			return mandv;
		}
		// user exits
		
	}
	
}
