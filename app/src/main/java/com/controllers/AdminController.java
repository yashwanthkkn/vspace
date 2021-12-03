package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin")
public class AdminController {
	@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public String dashboard() {
		return "AdminDashboard";
	}
	
	@RequestMapping(value="/test",method = RequestMethod.GET)
	public String test() {
		return "AdminQuestion";
	}
	
	@RequestMapping(value="/result",method = RequestMethod.GET)
	public String result() {
		return "AdminResult";
	}
}
