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
                <div class="h5">My Test</div>
            </div>
            <div class="col-12">
                <p>List of all my tests</p>
            </div>
        </div>

        <div class="row mt-3 px-5">
            <div class="col-12">
                <div class="d-flex justify-content-between">
                    <div class="h5">Current Test</div>
                </div>
            </div>
        </div>

        <div class="row px-5">
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
        </div>

        <div class="row mt-5 px-5">
            <div class="col-12">
                <div class="h5">Completed</div>
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
                        <!-- <th scope="col">Rank</th> -->
                      </tr>
                      
                    </thead>
                    <tbody>
                      <c:forEach items="${completedTest}" var="test">
                      <tr>
                        <td scope="row">${test.test.tname}</td>
                        <td>${test.test.date}</td>
                        <td>${test.test.totalMarks}</td>
                        <td>${test.participation.score}</td>
                        <!-- <td>3</td> -->
                      </tr>
                     </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<jsp:include page="Footer.jsp" />