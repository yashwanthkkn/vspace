<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp" />
      <nav class="navbar navbar-expand-lg navbar-light bg-light  px-5">
          <div class="container-fluid">
            <a class="navbar-brand text-primary" href="#">
              <i class="fab fa-pied-piper-alt"></i> Vspace
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
              </ul>
              <a href="/logout">
                <button class="btn btn-outline-primary btn-sm" type="submit">Logout</button>
              </a>
            </div>
          </div>
      </nav>
    <div class="container-fluid">

        <div class="row mt-4 px-5">
            <div class="col-12">
                <div class="h5">Payment</div>
            </div>
        </div>

        <div class="row mt-3 px-5">
            <div class="col-12">
                <div class="d-flex justify-content-between">
                    <div class="h5">Test Details : ${test.tname}</div>
                </div>
            </div>
        </div>
        <div class="row mt-2 px-5">
            <div class="col-12">
                <div class="d-flex justify-content-around">
                    <div class="card" style="width: 30rem;">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Test Name  : ${test.tname}</li>
                            <li class="list-group-item">Test Date  : ${test.date}</li>
                            <li class="list-group-item">Start Time : ${test.start_time}</li>
                            <li class="list-group-item">Duration   : ${test.duration} hr</li>
                            <li class="list-group-item">Total Marks: ${test.totalMarks}</li>
    
                        </ul>
                        <div class="card-footer">
                            <div class="text-end">
                                <button id="rzp-button" class="btn btn-danger text-white" url="${test.tid}">Pay <i class="fas fa-rupee-sign"></i> ${test.amount}</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- razorpay -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    
    <script type="text/javascript">
		
        function doPost(path, requestObject, isAsync) {
			var resp;
				$.ajax({
		            url: path,
		            type: 'POST',
		            data: requestObject,
		            contentType: "application/json; charset=UTF-8",
		            async: isAsync,
		            success: function (data) {	
                        console.log(data);
		            	resp = JSON.parse(data)
		            }
		       })
		       return resp;
			}

		
		
	</script>
	
	<script>
	var resp = null;
	
	/**
		Manual Checkout for Razor Pay
	**/
	
	var options = {
		    "key": "",
		    "amount": "", 
		    "name": "",
		    "description": "",
		    "image": "",
		    "order_id":"",
		    // "handler": function (response){
		    // 	alert(response.razorpay_payment_id); /* use this razorpay_payment_id for feature reference to this order */
		    // 	$('#msform')[0].reset();
		    // 	$('#pay-success').show();
		    	
		    // },
		    "prefill": {
		        "name": "",
		        "email": ""
		    },
		    "notes": {
		        "address": ""
		    },
		    "theme": {
		        "color": ""
		    },
			"callback_url":"",
  			"redirect": true
		};
		

		document.getElementById('rzp-button').onclick = function(e){
            var tid = document.getElementById('rzp-button').getAttribute("url");
            
			resp = doPost("/payment/test/${tid}/create",JSON.stringify({}), false);
            console.log("Made request");
			if(resp.statusCode == 200) {
				options.key = resp.razorPay.secretKey;
				options.order_id = resp.razorPay.razorpayOrderId;
				options.amount = resp.razorPay.applicationFee; //paise
				options.name = resp.razorPay.merchantName;
				options.description = resp.razorPay.purchaseDescription;
				options.image = resp.razorPay.imageURL;
				options.prefill.name = resp.razorPay.customerName;
				options.prefill.email = resp.razorPay.customerEmail;
				options.notes.address = resp.razorPay.notes;
				options.theme.color = resp.razorPay.theme;
				options.callback_url = "http://localhost:8080/payment/test/${tid}/callback"
				var rzp1 = new Razorpay(options);
				rzp1.open();
				e.preventDefault();
			} else {
				
			}
		}
	
	</script>
<jsp:include page="Footer.jsp" />