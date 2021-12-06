package com.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entities.Answer;
import com.entities.Question;
import com.entities.Test;
import com.entities.User;
import com.service.QuestionService;
import com.service.TestService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	TestService testService;
	@Autowired
	QuestionService questionService;
	
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
	
	@RequestMapping(value="/test/{id}",method = RequestMethod.GET)
	public ModelAndView test(ModelAndView mandv, @PathVariable int id) {
		Test test = testService.findById(id);
		Question question = new Question();
		List<Answer> options = new ArrayList<>();
		for(int i = 0 ; i < 4 ; i++) {
			options.add(new Answer());
		}
		question.setOptions(options);
		mandv.addObject("question",question);
		mandv.addObject("test",test);
		mandv.setViewName("AdminQuestion");
		return mandv;
	}
	
	@RequestMapping(value="/test/{tid}/qn",method = RequestMethod.POST)
	public String postQuestion(Question question,@PathVariable int tid) {
		System.out.println(question);
		Iterator<Answer> options = question.getOptions().iterator();
		while(options.hasNext()) {
			System.out.println(options.next().toString());
		}
		return "redirect:/admin/test/"+tid;
	}
	
	@RequestMapping(value="/result",method = RequestMethod.GET)
	public String result() {
		return "AdminResult";
	}
}
