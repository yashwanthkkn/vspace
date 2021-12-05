package com.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entities.Test;
import com.entities.User;
import com.service.TestService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	TestService testService;
	
	@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public ModelAndView createTest(ModelAndView mandv,@RequestParam(required = false) String error) {
		mandv.addObject("msg","");
		if(error != null) {
			mandv.addObject("msg","Test with the name already exists");
		}
		List<Test> tests = testService.findAllTests();
		mandv.addObject("tests",tests);
		mandv.addObject("test",new Test());
		mandv.setViewName("AdminDashboard");
		return mandv;
	}
	@RequestMapping(value="/dashboard",method=RequestMethod.POST)
	public ModelAndView processTest(Test test,ModelAndView mandv) {
	
		Test temp = testService.findTestByTestName(test.getTname());
		if(temp == null) {
			testService.saveTest(test);
			return new ModelAndView("redirect:/admin/dashboard");
		}else {
			return new ModelAndView("redirect:/admin/dashboard?error");
		}
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
