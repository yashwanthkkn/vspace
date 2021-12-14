<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp" />
      
    <div class="container-fluid mb-5">

        <div class="row mt-4 px-5">
            <div class="col-12">
                <div class="h5 text-b">My Test</div>
            </div>
            <div class="col-12">
                <p>List of all my completed tests</p>
            </div>
        </div>

        <div class="row mt-3 px-5">
            <div class="col-12">
                <div class="d-flex justify-content-between">
                    <div class="h5 text-b">Completed Test</div>
                </div>
            </div>
        </div>

        <div class="row px-5">

          <c:forEach items="${completedTest}" var="test">
            <div class="col-4 mt-4">
              <div class="shadow">
                <div class="card-header text-img text-d" style="height: 120px;">
                    <a href="/user/studentresult/${test.test.tid}/${test.participation.pk.uid}" class="decor-none">
                        <h4>${test.test.tname}</h4>
                      </a>
                </div>
                <div class="px-3 py-2">
                  <div class="d-flex justify-content-between">
                    <div>
                        <small>Date : <strong>${test.test.date}</strong></small>
                    </div>
                  </div>
                  <div class="mt-1">
                    <small>Total Marks : ${test.test.totalMarks}</small>
                  </div>
                  <div class="mt-1">
                      <small>Marks Scored : ${test.participation.score} </small>
                  </div>
                  
                </div>
              </div>
            </div>
          </c:forEach>
          
        </div>

        <!-- <div class="row px-5">
            <div class="col-12">
                <table class="table  table-striped">
                    <thead>
                      <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Date</th>
                        <th scope="col">Start Time</th>
                        <th scope="col">Duration</th>
                        <th scope="col">Questions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${currentTest}" var="test">
                          <tr>
                            <td scope="row"> ${test.test.tname}</td>
                            <td>${test.test.date}</td>
                            <td>${test.test.start_time}</td>
                            <td>${test.test.duration}</td>
                            <td>30</td>
                            <c:if test="${test.test.needPayment == 'false'}">
                              <td> 
                                <div>
                                  <a href="/user/test/${test.test.tid}/start">
                                    <button class="btn btn-primary btn-sm"><i class="fab fa-cloudscale"></i> Start Test</button>
                                  </a>
                                </div>
                              </td>
                            </c:if>
                            <c:if test="${test.test.needPayment == 'true'}">
                             
                              <c:if test="${test.participation.paymentDone == 'false'}">
                                <td> 
                                  <div>
                                    <a href="/user/test/${test.test.tid}/payment">
                                      <button class="btn btn-warning btn-sm text-white"><i class="fas fa-rupee-sign"></i> Pay ${test.test.amount}</button>
                                    </a>
                                  </div>
                                </td>
                              </c:if>
                              <c:if test="${test.participation.paymentDone == 'true'}">
                                <td> 
                                  <div>
                                    <a href="/user/test/${test.test.tid}/start">
                                      <button class="btn btn-primary btn-sm"><i class="fab fa-cloudscale"></i> Start Test</button>
                                    </a>
                                  </div>
                                </td>
                              </c:if>
                            </c:if>
                            
                          </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div> -->

     <!--  <div class="row mt-5 px-5">
            <div class="col-12">
                <div class="h5 text-b">Completed</div>
            </div>
        </div>

        <div class="row px-5">
            <div class="col-12">
                <table class="table  table-striped">
                    <thead>
                     
                      <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Date</th>
                        <th scope="col">Total Marks</th>
                        <th scope="col">Marks Scored</th>
                         <th scope="col">Rank</th> 
                      </tr>
                      
                    </thead>
                    <tbody>
                      <c:forEach items="${completedTest}" var="test">
                      <tr>
                        <td scope="row"><a href="/user/studentresult/${test.test.tid}/${test.participation.pk.uid}">${test.test.tname}</a></td>
                        <td>${test.test.date}</td>
                        <td>${test.test.totalMarks}</td>
                        <td>${test.participation.score}</td>
                         <td>3</td> 
                      </tr>
                     </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>--> 

<jsp:include page="Footer.jsp" />