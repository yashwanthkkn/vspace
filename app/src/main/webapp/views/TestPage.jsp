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
            <a href="studentDashboard.html">
              <button class="btn btn-outline-primary btn-sm" type="submit">End Test</button>
            </a>
            
          </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row mt-5 px-5">
          <div class="col-12">
            <div class="card w-100 px-2 py-3" style="height: 360px;">
              <div class="row">
                
                <div class="col-7 border-end">
                  <div class="d-flex justify-content-between">
                    <div class="h5">Question ${question.idx}</div>
                    <p>Mark : <strong>2</strong></p>
                  </div>
                  <div class="mt-2">
                    <p>${question.qtext}</p>
                  </div>
                </div>

                <div class="col-5">
                  <div class="d-flex justify-content-between">
                    <div class="h5">Options</div>
                  </div>
                  <spring:form class="mt-2" method="POST" action="/user/test/${tid}/qn" modelAttribute="opt">
                    <c:forEach items="${options}" var="option" varStatus="loop">
                      <div class="card px-2 py-2 mb-2">
                        <div class="form-check">
                          <spring:radiobutton class="form-check-input" path="answer" id="${loop.index+1}" value="${option.answer}" />
                          <label class="form-check-label" for="${loop.index+1}">${option.answer}</label>
                        </div>
                      </div>
                    </c:forEach>
                    <!-- <div class="card px-2 py-2 mb-2">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="answer" id="option1" value="${options[0].answer}" />
                        <label class="form-check-label" for="option1">${options[0].answer}</label>
                      </div>
                    </div> -->
                    <!-- <div class="card px-2 py-2 mb-2">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="Options" id="option1" value="option1">
                        <label class="form-check-label" for="option1">Hello</label>
                      </div>
                    </div>
                    <div class="card px-2 py-2 mb-2">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="Options" id="option1" value="option1">
                        <label class="form-check-label" for="option1">Hello</label>
                      </div>
                    </div>
                    -->
                    <input type="submit" class="btn btn-primary btn-sm mt-5 px-5" label="Next" />
                  </spring:form>
                </div>
              </div>
            </div>
          </div>
        </div>        
    </div>
<jsp:include page="Footer.jsp" />