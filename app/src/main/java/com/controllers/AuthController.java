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
<<<<<<< HEAD
	public ModelAndView loadLoginPage1(ModelAndView mandv) {
=======
	public ModelAndView loadLoginPage(ModelAndView mandv) {
>>>>>>> 3d91b780de8f477ea29e3cdf8525dc89e8836dc6
		mandv.addObject("user",new User());
		mandv.addObject("msg","");
		mandv.setViewName("Login");
		return mandv;
<<<<<<< HEAD
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView processLoginPage1(User user,ModelAndView mandv) {
		System.out.println(user.getEmailid()+":"+user.getPassword());
		// check if user already exists
		User tempUser = userService.findUserByEmailid(user.getEmailid());
		if(tempUser != null) {
			userService.saveUser(user);
			mandv.setViewName("StudentDashboard");
			return mandv;
			
		}else {
			System.out.println(tempUser);
			mandv.addObject("msg","Oops ! An account with the Email Id doesn't exists..,SIGNUP first");
			mandv.addObject("user",new User());
			mandv.setViewName("Login");
			return mandv;
		}
	}
=======
	}
	
	// GET : /signup
>>>>>>> 3d91b780de8f477ea29e3cdf8525dc89e8836dc6
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
			user.setPassword(passwordEncoder.encode(password));
			userService.saveUser(user);
			return new ModelAndView("redirect:/login");
		}
		
	}
	
}
