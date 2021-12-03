package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user")
public class UserController {
	@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public String page() {
		return "AdminDashboard";
	}
}
