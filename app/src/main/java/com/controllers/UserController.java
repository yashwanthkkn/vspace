package com.controllers;

import java.security.Principal;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entities.Answer;
import com.entities.Participation;
import com.entities.ParticipationPk;
import com.entities.Question;
import com.entities.Test;
import com.entities.User;
import com.service.AnswerService;
import com.service.ParticipationService;
import com.service.QuestionService;
import com.service.TestService;
import com.service.UserService;
@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	TestService testService;
	@Autowired
	UserService userService;
	@Autowired
	ParticipationService participationService;
	@Autowired
	QuestionService questionService;
	@Autowired
	AnswerService answerService;
	
	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public ModelAndView processLoginPage(ModelAndView mandv,Principal principal) {
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		User user = userService.findUserByEmailid(principal.getName());
		List<Test> tests = testService.findAllTests();
		mandv.addObject("tests",tests);
		mandv.addObject("user",user);
		mandv.setViewName("StudentDashboard");
		return mandv;
	}
	
	@RequestMapping(value="/test",method = RequestMethod.GET)
	public String testPage() {
		return "TestPage";
	}
	
	@RequestMapping(value="/test/{tid}/start",method = RequestMethod.GET)
	public String start(@PathVariable int tid, Principal principal) {
		
		// checking if the user id authorised
		if(principal == null) {
			return "redirect:/login";
		}
		
		String username = principal.getName();
		User user = userService.findUserByEmailid(username);

		// generating primary key
		ParticipationPk pk = new ParticipationPk();
		pk.setTid(tid);
		pk.setUid(user.getUid());
		
		// getting total number of questions
		int totalQuestions = questionService.findQuestionsByTid(tid).size();

		// checking the participation exists
		Participation check = participationService.findById(pk);
		if(check != null) {
			return "redirect:/user/test/"+tid+"/qn";
		}
		
		// creating new participation
		Participation participation = new Participation();
		participation.setPk(pk);
		participation.setScore(0);
		participation.setLast_attempted(0);
		participation.setTotalQn(totalQuestions);
		participationService.saveParticipation(participation);
		
		return "redirect:/user/test/"+tid+"/qn";
	}	
	
	@RequestMapping(value = "/test/{tid}/qn",method = RequestMethod.GET)
	public ModelAndView getQuestion(ModelAndView mandv,@PathVariable int tid, Principal principal) {
		// checking if the user id authorised
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		
		String username = principal.getName();
		User user = userService.findUserByEmailid(username);

		// generating primary key
		ParticipationPk pk = new ParticipationPk();
		pk.setTid(tid);
		pk.setUid(user.getUid());

		// checking the participation exists
		Participation participation = participationService.findById(pk);
		if(participation == null) {
			return new ModelAndView("/user/dashboard");
		}
		System.out.println(participation);
		Question question = questionService.findQuestionByTidAndIdx(tid, participation.getLast_attempted()+1);
		List<Answer> options = answerService.findAllAnswerByQid(question.getQid());
		
		mandv.addObject("question",question);
		mandv.addObject("options",options);
		mandv.addObject("tid",tid);
		mandv.addObject("opt",new Answer());
		mandv.setViewName("TestPage");
		return mandv;
	}
}
