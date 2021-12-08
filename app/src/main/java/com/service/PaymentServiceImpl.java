package com.service;

import java.math.BigDecimal;
import java.math.RoundingMode;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.entities.Test;
import com.entities.User;
import com.google.gson.Gson;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.util.PaymentUtils;
import com.util.RazorPay;
import com.util.Response;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	private RazorpayClient client;
	private static Gson gson = new Gson();
	private static final String SECRET_ID = "rzp_test_aSise3khb1DMqy";
	private static final String SECRET_KEY = "iquv1UlLJoAkJ0BkBVbwNkLg";
	
	public PaymentServiceImpl() throws RazorpayException {
		this.client =  new RazorpayClient(SECRET_ID, SECRET_KEY); 
	}
	
	public Response getResponse(RazorPay razorPay, int statusCode) {
		Response response = new Response();
		response.setStatusCode(statusCode);
		response.setRazorPay(razorPay);
		return response;
	}	
	
	public RazorPay getRazorPay(String orderId, Test test, User user) {
		RazorPay razorPay = new RazorPay();
		razorPay.setApplicationFee(convertRupeeToPaise(String.valueOf(test.getAmount())));
		razorPay.setCustomerName(user.getName());
		razorPay.setCustomerEmail(user.getEmailid());
		razorPay.setMerchantName("Vspace");
		razorPay.setPurchaseDescription("TEST PURCHASES");
		razorPay.setRazorpayOrderId(orderId);
		razorPay.setSecretKey(SECRET_ID);
		razorPay.setImageURL("/logo");
		razorPay.setTheme("#F37254");
		razorPay.setNotes(orderId);
		
		return razorPay;
	}
	
	public Order createRazorPayOrder(String amount) {
		
		JSONObject options = new JSONObject();
		options.put("amount", convertRupeeToPaise(amount));
		options.put("currency", "INR");
		options.put("receipt", "txn_123456");
		options.put("payment_capture", 1); // You can enable this if you want to do Auto Capture. 
		try {
			return client.Orders.create(options);
		} catch (RazorpayException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String convertRupeeToPaise(String paise) {
		BigDecimal b = new BigDecimal(paise);
		BigDecimal value = b.multiply(new BigDecimal("100"));
		return value.setScale(0, RoundingMode.UP).toString();
		 
	}
	
	public Boolean check(JSONObject options) {
		try {
			return PaymentUtils.verifyPaymentSignature(options,this.SECRET_KEY);
		} catch (RazorpayException e) {
			e.printStackTrace();
			return false;
		}
	}
}
