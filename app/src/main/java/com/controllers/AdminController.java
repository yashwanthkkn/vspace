package com.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
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
import com.entities.Participation;
import com.entities.ParticipationPk;
import com.entities.Question;
import com.entities.Submission;
import com.entities.Test;
import com.entities.User;
import com.service.ParticipationService;
import com.service.QuestionService;
import com.service.SubmissionService;
import com.service.TestService;
import com.service.UserService;
import com.util.UserPart;
import com.view.ExcelExport;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	TestService testService;
	@Autowired
	QuestionService questionService;
	@Autowired
	SubmissionService submissionService;
	@Autowired
	ParticipationService participationService;
	@Autowired
	UserService userService;
	List<UserPart> userPart=new ArrayList<UserPart>();
	
	@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public ModelAndView createTest(ModelAndView mandv,@RequestParam(required = false) String error) {
		mandv.addObject("msg","");
		if(error != null) {
			mandv.addObject("msg","Test with the name already exists");
		}
		List<Test> tests = testService.findAllTests();
		List<Test> completedTest=new ArrayList<Test>();
		Iterator<Test> itr = tests.iterator();
		while(itr.hasNext()) {
			Test temp = itr.next();
			if(temp.getState().equals("end")) {
				completedTest.add(temp); 
			}
		}
		mandv.addObject("completedtests",completedTest);
		mandv.addObject("tests", tests);
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
		List<Question> questions = questionService.findQuestionsByTid(id);
		List<Answer> options = new ArrayList<>();
		for(int i = 0 ; i < 4 ; i++) {
			options.add(new Answer());
		}
		question.setOptions(options);
		mandv.addObject("question",question);
		mandv.addObject("test",test);
		mandv.addObject("questions",questions);
		mandv.setViewName("AdminQuestion");
		return mandv;
	}
	
	@RequestMapping(value="/test/{tid}/qn",method = RequestMethod.POST)
	public String postQuestion(Question question,@PathVariable int tid) {
		Test test = testService.findById(tid);
		question.setTest(test);
		question.setAnswer(question.getOptions().get(Integer.parseInt(question.getAnswer())).getAnswer());
		Iterator<Answer> options = question.getOptions().iterator();
		while(options.hasNext()) {
			options.next().setQuestion(question);
		}
		questionService.saveQuestion(question);
		return "redirect:/admin/test/"+tid;
	}
	
	@RequestMapping(value="/test/{tid}/qn/{qid}/d",method = RequestMethod.GET)
	public String deleteQuestion(@PathVariable int tid,@PathVariable int qid) {
		questionService.deleteQuestionById(qid);
		return "redirect:/admin/test/"+tid;
	}
	
	@RequestMapping(value="/result/{tid}",method = RequestMethod.GET)
	public ModelAndView result(ModelAndView mandv,@PathVariable int tid) {
		ParticipationPk pk=new ParticipationPk();
		pk.setTid(tid);
		List<Participation> participations=participationService.findParticipationsByTid(tid);
		//List<UserPart> userPart=new ArrayList<UserPart>();
		Iterator<Participation> itr=participations.iterator();
		while(itr.hasNext()) {
			Participation temp=itr.next();
			int uid=temp.getPk().getUid();
			User user=userService.findById(uid);
			UserPart up=new UserPart(user,temp);
			userPart.add(up);
		}
		Collections.sort(userPart);
		Iterator<UserPart> itr1=userPart.iterator();
		while(itr1.hasNext()) {
			UserPart s=itr1.next();
			System.out.println(s.toString());
		}
		
		
		//int uid=part.getPk().getUid();
		//User users=userService.findById(uid);
		//UserPart userPart=new UserPart(users, part);
		mandv.addObject("users",userPart);
		mandv.setViewName("AdminResult");
		return mandv;
	}
	
	@RequestMapping(value="/test/{tid}/start",method = RequestMethod.GET)
	public String startTest(@PathVariable int tid) {
		Test test = testService.findById(tid);
		test.setState("start");
		int idx = 1;
		Iterator<Question> questions = questionService.findQuestionsByTid(tid).iterator();
		int totalMark = 0;
		while(questions.hasNext()) {
			Question qn = questions.next();
			qn.setIdx(idx++);
			totalMark += qn.getMark();
			System.out.println(qn.toString());
			questionService.updateQuestion(qn);
		}
		test.setTotalMarks(totalMark);
		testService.updateTest(test);
		return "redirect:/admin/test/"+tid;
	}
	
	@RequestMapping(value="/test/{tid}/end",method = RequestMethod.GET)
	public String endTest(@PathVariable int tid) {
		Test test = testService.findById(tid);
		test.setState("end");
		testService.updateTest(test);
		return "redirect:/admin/dashboard";
	}
	@RequestMapping(value="/excelExport",method = RequestMethod.GET)
	public ModelAndView exportToExcel() {
		ModelAndView mandv=new ModelAndView();
		mandv.setView(new ExcelExport());
		
		//List<Submission> list=submissionService.findAllSubmissions();
		mandv.addObject("list",userPart);
		return mandv;
	}
}
