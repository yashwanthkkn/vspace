package com.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entities.Participation;
import com.entities.ParticipationPk;
import com.entities.Test;
import com.entities.User;
import com.google.gson.Gson;
import com.razorpay.Order;
import com.service.ParticipationService;
import com.service.PaymentService;
import com.service.TestService;
import com.service.UserService;
import com.util.RazorPay;

@Controller
@RequestMapping("payment")
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
	@Autowired
	TestService testService;
	@Autowired
	UserService userService;
	@Autowired
	ParticipationService participationService;
	private static Gson gson = new Gson();
	
	
	@RequestMapping(value="/test/{tid}/create", method=RequestMethod.POST)
	public ResponseEntity<String> createOrder(Principal principal,@PathVariable int tid){
		if(principal == null) {
			return null;
		}
		User user = userService.findUserByEmailid(principal.getName());
		Test test = testService.findById(tid);
		
		ParticipationPk pk = new ParticipationPk();
		pk.setTid(tid);
		pk.setUid(user.getUid());
		try {			
			Order order = paymentService.createRazorPayOrder(String.valueOf(test.getAmount()));
			RazorPay razorPay = paymentService.getRazorPay((String)order.get("id"), test, user);
			return new ResponseEntity<String>(gson.toJson(paymentService.getResponse(razorPay, 200)),
					HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<String>(gson.toJson(paymentService.getResponse(new RazorPay(), 500)),
				HttpStatus.BAD_GATEWAY);
	}

}
