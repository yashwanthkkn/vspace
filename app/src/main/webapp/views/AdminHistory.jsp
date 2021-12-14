<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="AdminHeader.jsp" />

    <div class="container-fluid">

        <div class="row mt-4 px-5">
          <div class="col-12">
              <div class="h5 text-b">My Test</div>
              <small class="text-secondary">List of all my tests completed</small>
          </div>
        </div>

        <div class="row mt-3 px-5">
            <div class="col-12">
                    <div class="h5 text-b">Completed Test</div>
            </div>
        </div>

        <div class="row px-5">

          <c:forEach items="${completedtests}" var="test">
              <div class="col-4 mt-4">
                <div class="shadow">
                  <div class="card-header text-img text-d" style="height: 120px;">
                   <a href="/admin/result/${test.tid}" class="decor-none">
                     <h4>${test.tname}</h4>
                   </a>
                  </div>
                  <div class="px-3 py-2">
                    <div class="d-flex justify-content-between">
                      <div>
                         <small>Date : <strong>${test.date}</strong></small>
                      </div>
                      
                    </div>
                    <div class="mt-1">
                      <small>Start Time : ${test.start_time}</small>
                    </div>
                    <div class="mt-1">
                       <small>Duration : ${test.duration} hr</small>
                    </div>
                    <div class="mt-1">
                       <small>Total Marks : ${test.totalMarks}
                      </small>
                    </div>
                  </div>
                </div>
              </div>
          </c:forEach>
          
        </div>

       <!--<div class="row mt-5 px-5">
            <div class="col-12">
              <div class="d-flex justify-content-between">
                <div class="h5 text-b">Completed</div>
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

                      <c:forEach items="${completedtests}" var="test">
                        <c:if test="${test.state == 'end'}">
                          <tr>
                            <td scope="row">
                              <a href="/admin/result/${test.tid}">${test.tname}</a>
                            </td>
                            <td>${test.date}</td>
                            <td>${test.start_time}</td>
                            <td>${test.duration}</td>
                            <td>30</td>
                          </tr>
                        </c:if>
                     </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
--> 
    
<jsp:include page="Footer.jsp" />