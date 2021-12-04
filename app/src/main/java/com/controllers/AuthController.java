package com.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// GET : /login
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public ModelAndView loadLoginPage(ModelAndView mandv) {

		mandv.addObject("user",new User());
		mandv.addObject("msg","");
		mandv.setViewName("Login");
		return mandv;

	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView processLoginPage(User user,ModelAndView mandv) {
		System.out.println(user.getEmailid()+":"+user.getPassword());
		// check if user exists
		User tempUser = userService.findUserByEmailid(user.getEmailid());
		System.out.println(tempUser);
		if(tempUser != null) 
		{
			//String password=passwordEncoder.encode(user.getPassword());
			//System.out.println(password+ " : "+tempUser.getPassword());
			if(tempUser.getPassword().equals(user.getPassword()))
			{
				return new ModelAndView("redirect:/admin/dashboard");
			
			}
			mandv.addObject("msg","Password Invalid ");
		}
		else 
		{
		mandv.addObject("msg","Username Invalid ");
		}
		mandv.setViewName("Login");
		return mandv;
	}

	@RequestMapping(value="/signup",method = RequestMethod.GET)
	public ModelAndView loadSignupPage(ModelAndView mandv) {
		mandv.addObject("user",new User());
		mandv.addObject("msg","");
		mandv.setViewName("Signup");
		return mandv;
	}
	
	// POST : /signup
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public ModelAndView processSignupPage(User user,ModelAndView mandv) {

		// check if user already exists
		User tempUser = userService.findUserByEmailid(user.getEmailid());
		if(tempUser != null) {
			// user exists
			mandv.addObject("msg","Oops ! An account with the Email Id already exists");
			mandv.addObject("user",new User());
			mandv.setViewName("Signup");
			return mandv;
		}else {
			// create new user
			String password = user.getPassword();
		//	user.setPassword(passwordEncoder.encode(password));
			userService.saveUser(user);
			return new ModelAndView("redirect:/login");
		}
		
	}
	
}
