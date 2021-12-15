<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vspace</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark text-l bg-b  px-5">
        <div class="container-fluid">
          <a class="navbar-brand " href="#">
            <i class="fab fa-pied-piper-alt px-1"></i> Vspace
        </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="me-auto"></div>
            <!-- <a href="/user/test/${tid}/end">
                <button class="btn btn-outline-light btn-sm" type="submit">End Test</button>
            </a> -->
          </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row mt-5 px-5">
          <div class="col-12">
            <div class="card w-100 px-2 py-3" style="height: 360px;">
              <div class="row">
                
                <div class="col-5 border-end">
                  <div class="d-flex justify-content-between">
                    <div class="h5 text-b">Question ${question.idx}</div>
                    <p>Mark : <strong>${question.mark}</strong></p>
                  </div>
                  <div class="mt-2">
                    <p>${question.qtext}</p>
                  </div>
                </div>

                <div class="col-7">
                  <div class="d-flex justify-content-between">
                    <div class="h5 text-b">Options</div>
                  </div>
                  <spring:form class="mt-2" method="POST" action="/user/test/${tid}/qn" modelAttribute="opt">
                    <c:forEach items="${options}" var="option" varStatus="loop">
                      <div class="card px-2 py-2 mb-2">
                        <div class="form-check">
                          <spring:radiobutton class="form-check-input" path="answer" id="${loop.index+1}" value="${option.answer}" required="true" />
                          <label class="form-check-label" for="${loop.index+1}">${option.answer}</label>
                        </div>
                      </div>
                    </c:forEach>
                    <input type="submit" class="btn btn-primary btn-sm mt-5 px-5" label="Next" />
                  </spring:form>
                </div>
              </div>
            </div>
          </div>
        </div>        
    </div>
    <button class="btn btn-primary nav-btn px-1 py-4 bg-white text-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" ><i class="fas fa-arrow-left"></i></button>

        <div class="offcanvas offcanvas-end" style="width: 250px;margin-top: 104px;overflow: hidden;"  data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
          
          <div class="offcanvas-body w-100 pt-0 pl-0" style="margin-left: 25px; overflow: hidden;" >
                <div style="min-height: 250px;max-height: 250px;  width: 100%; overflow: scroll; overflow-x: hidden; padding-right: 17px; box-sizing: content-box;" class="border">
                  <div class="bg-b text-white text-center">Navigation</div>
                  <div class="row mt-2 px-3">
                    <c:forEach begin="0" end="${participation.totalQn - 1}" varStatus="loop">
                      <c:if test="${ loop.index < participation.last_attempted}">
                        <div class="col-3 text-white mt-2">
                          <button class="btn btn-primary rounded-circle">${loop.index+1}</button>
                        </div>                        
                      </c:if>
                      <c:if test="${ loop.index == participation.last_attempted}">
                        <div class="col-3 text-white mt-2">
                          <button class="btn bg-r text-white rounded-circle">${loop.index+1}</button>
                        </div>                        
                      </c:if>
                      <c:if test="${ loop.index > participation.last_attempted}">
                        <div class="col-3 text-white mt-2">
                          <button class="btn btn-outline-primary rounded-circle">${loop.index+1}</button>
                        </div>                        
                      </c:if>
                   </c:forEach>
                  </div>              
              </div>

              <div class="border" style="padding-right: 17px;">
                <div class="bg-b text-white text-center">Summary</div>
                <div class="row py-1 px-1">
                  <div class="col-8">
                    <div class="text-secondary">Total questions</div>
                  </div>
                  <div class="col-4 text-end">${participation.totalQn}</div>
                </div> 
                <div class="row py-1 px-1">
                  <div class="col-8">
                    <div class="text-secondary">Answered</div>
                  </div>
                  <div class="col-4 text-end">${participation.last_attempted}</div>
                </div> 
                <div class="row py-1 px-1">
                  <div class="col-8">
                    <div class="text-secondary">Saved</div>
                  </div>
                  <div class="col-4 text-end">${participation.last_attempted}</div>
                </div>    
                <div class="row py-1 px-1">
                  <div class="col-8">
                    <div class="text-secondary">Unanswered</div>
                  </div>
                  <div class="col-4 text-end">${ participation.totalQn - participation.last_attempted}</div>
                </div>    
            </div>
          </div>  
          <button class="btn btn-primary bg-white text-primary px-1 py-4 inner-nav-btn" data-bs-dismiss="offcanvas"><i class="fas fa-arrow-right"></i></button>
        </div>
    </div>
<jsp:include page="Footer.jsp" />