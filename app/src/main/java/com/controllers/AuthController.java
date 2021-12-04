package com.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entities.User;
import com.service.UserService;



@Controller
@RequestMapping("auth")
public class AuthController {
	@Autowired
	UserService service;
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login() {
		List<User> users=service.findAllUsers();
		User user=new User("Yazhini","secret","yazhini@gmail.com");
		//service.saveUser(user);
		System.out.println(users);
		return "Login";
	}
	
	@RequestMapping(value="/signup",method = RequestMethod.GET)
	public String signup() {
		return "Signup";
	}
}
