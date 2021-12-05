package com.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entities.Test;
import com.entities.User;
import com.service.TestService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	TestService testService;
	/*@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public String dashboard() {
		return "AdminDashboard";
	}*/
	@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public ModelAndView createTest(ModelAndView mandv) {
		mandv.addObject("test",new Test());
		mandv.setViewName("AdminDashboard");
		return mandv;
	}
	@RequestMapping(value="/dashboard",method=RequestMethod.POST)
	public ModelAndView processTest(Test test,ModelAndView mandv) {

		
		Test temp = testService.findTestByTestName(test.getTname());
		if(temp == null) {
			mandv.addObject("msg","");
			System.out.println("Inserting...");
			testService.saveTest(test);
			mandv.setViewName("AdminDashboard");
			return mandv;
		}else {
			mandv.addObject("msg","Test with this name already exists");
			mandv.addObject("test", new Test());
			mandv.setViewName("AdminDashboard");
			return mandv;
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
