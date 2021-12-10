package com.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.SubmissionsDAO;
import com.entities.Answer;
import com.entities.Participation;
import com.entities.ParticipationPk;
import com.entities.Question;
import com.entities.Submission;
import com.entities.SubmissionPk;
import com.entities.Test;
import com.entities.User;
import com.service.AnswerService;
import com.service.ParticipationService;
import com.service.QuestionService;
import com.service.SubmissionService;
import com.service.TestService;
import com.service.UserService;
import com.util.TestPart;
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
	@Autowired
	SubmissionService submissionService;
	
	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public ModelAndView processLoginPage(ModelAndView mandv,Principal principal) {
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		
		User user = userService.findUserByEmailid(principal.getName());
		List<Test> tests = testService.findAllTests();
		List<Test> liveTest = new ArrayList<Test>();
		List<Test> endTest = new ArrayList<Test>();
		List<Participation> participations = participationService.findParticipationsByUid(user.getUid());
		List<TestPart> currentTest = new ArrayList<TestPart>();
		List<TestPart> completedTest = new ArrayList<TestPart>();
		Iterator<Test> itr = tests.iterator();
		while(itr.hasNext()) {
			Test temp = itr.next();
			if(temp.getState().equals("start")) {
				liveTest.add(temp); 
			}
		}
		int i,j;
		for(i = 0 ; i < liveTest.size() ; i++) {
			int flag = 0;
			for(j = 0 ; j < participations.size() ; j++) {
				if(liveTest.get(i).getTid() == participations.get(j).getPk().getTid()) {
					flag = 1;
					if(participations.get(j).getLast_attempted() == participations.get(j).getTotalQn()) {
						// completed
						Test t = liveTest.get(i);
						Participation p = participations.get(j);
						TestPart tp = new TestPart(t,p);
						completedTest.add(tp);
					}else {
						// not completed
						Test t = liveTest.get(i);
						Participation p = participations.get(j);
						TestPart tp = new TestPart(t,p);
						currentTest.add(tp);
					}
				}
			}
			if(flag == 0) {
				Test t = liveTest.get(i);
				Participation p = new Participation();
				TestPart tp = new TestPart(t,p);
				
				currentTest.add(tp);
			}
		}
		itr =tests.iterator();
		while(itr.hasNext()) {
			Test temp = itr.next();
			if(temp.getState().equals("end")) {
				endTest.add(temp); 
			}
		}
		for(i = 0 ; i < endTest.size() ; i++) {
			int flag = 0;
			for(j = 0 ; j < participations.size() ; j++) {
				if(endTest.get(i).getTid() == participations.get(j).getPk().getTid()) {
					flag = 1;
					if(participations.get(j).getLast_attempted() == participations.get(j).getTotalQn()) {
						Test t = endTest.get(i);
						Participation p = participations.get(j);
						TestPart tp = new TestPart(t,p);
						completedTest.add(tp);
					}
				}
			}
		}
//		System.out.println("Current test");
//		Iterator<TestPart> itr1 = currentTest.iterator();
//		while(itr.hasNext()) {
//			System.out.println(itr.next());
//		}
//		System.out.println("Completed test");
//		itr1 = completedTest.iterator();
//		while(itr1.hasNext()) {
//			TestPart t = itr1.next();
//		}
		mandv.addObject("tests",tests);
		mandv.addObject("user",user);
		mandv.addObject("currentTest",currentTest);
		mandv.addObject("completedTest",completedTest);
		mandv.setViewName("StudentDashboard");
//		mandv.setViewName("LAlalal");
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
		if(participation == null || participation.getLast_attempted() == participation.getTotalQn()) {
			return new ModelAndView("redirect:/user/dashboard");
		}
		
		Question question = questionService.findQuestionByTidAndIdx(tid, participation.getLast_attempted()+1);
		List<Answer> options = answerService.findAllAnswerByQid(question.getQid());
		
		mandv.addObject("question",question);
		mandv.addObject("participation",participation);
		mandv.addObject("options",options);
		mandv.addObject("tid",tid);
		mandv.addObject("opt",new Answer());
		mandv.setViewName("TestPage");
		return mandv;
	}
	
	@RequestMapping(value = "/test/{tid}/qn",method = RequestMethod.POST)
	public String submitQuestion(Answer answer,ModelAndView mandv,@PathVariable int tid, Principal principal) {
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

		// checking the participation exists
		Participation participation = participationService.findById(pk);
		if(participation == null) {
			return "redirect:/user/dashboard";
		}
		System.out.println(participation);
		Question question = questionService.findQuestionByTidAndIdx(tid, participation.getLast_attempted()+1);

		SubmissionPk subPk = new SubmissionPk();
		subPk.setQid(question.getQid());
		subPk.setTid(tid);
		subPk.setUid(user.getUid());
		
		Submission sub = new Submission();
		sub.setCompkey(subPk);
		// check if the answer is right
		sub.setChoice(answer.getAnswer());
		sub.setRightanswer(question.getAnswer());
		if(answer.getAnswer().equals(question.getAnswer())) {
			// right answer
			participation.setScore(participation.getScore()+question.getMark());
			sub.setState("correct");
			sub.setMark(question.getMark());
		}else {
			// wrong answer
			sub.setState("wrong");
			sub.setMark(0);
		}
		System.out.println(sub);
		submissionService.saveSubmission(sub);
		participation.setLast_attempted(participation.getLast_attempted()+1);
		System.out.println(participation);
		participationService.updateParticipation(participation);
		if(participation.getLast_attempted() == participation.getTotalQn()) {
			return "redirect:/user/dashboard";
		}
		return "redirect:/user/test/"+tid+"/qn";
	}
	
	@RequestMapping(value = "/test/{tid}/payment",method = RequestMethod.GET)
	public ModelAndView payment(ModelAndView mandv,@PathVariable int tid) {
		Test test = testService.findById(tid);
		if(!test.isNeedPayment()) {
			return new ModelAndView("redirect:/user/dashboard");
		}
		mandv.addObject("test",test);
		mandv.setViewName("Payment");
		return mandv;
	}
	
	@RequestMapping(value = "/test/{tid}/s",method = RequestMethod.GET)
	public ModelAndView startTestUi(ModelAndView mandv,@PathVariable int tid) {
		Test test = testService.findById(tid);
		
		mandv.addObject("test",test);
		mandv.setViewName("StartTest");
		return mandv;
	}
}
