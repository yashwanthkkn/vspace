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
         
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <span class="px-4"></span>
            
            <div class="me-auto"></div>
            <a href="/logout">
                <button class="btn btn-outline-light btn-sm" type="submit">Logout</button>
            </a>
          </div>
        </div>
    </nav>
    <div class="container-fluid">
      <div class="px-5 mt-4">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item text-primary"><a href="/user/dashboard" class="decor-none"> Dashboard</a></li>
          </ol>
        </nav>
      </div>

      <div class="row mt-3 px-5">
          <div class="col-12">
              <div class="h5 text-b">Submission</div>
              <small class="text-secondary">Submissions of your test Question-wise</small>
          </div>
      </div>

      <div class="row mt-5 px-5">
          <div class="col-12">
              <div class="d-flex justify-content-between">
                  <div class="h5 text-b">Test : <span class="text-primary">${tname}</span></div>
                  <div> <a href="/user/sendMail/${tid}/${uid}" class="btn bg-b text-white btn-sm"><i class="fa fa-share-alt"></i> Share Result</a>
                    <a href="/user/exportpdf/${tid}/${uid}" class="btn bg-b text-white btn-sm"><i class="fas fa-download"></i> Download Result</a></div>
                  
              </div>
          </div>
      </div>
      
      <div class="row px-5">
          <div class="col-12">
              <table class="table  table-striped">
                  <thead>
                    <tr>
                      <th scope="col">Question</th>
                      <th scope="col">Correct Answer</th>
                      <th scope="col">Your Choice</th>
                      <th scope="col">Status</th>
                      <th scope="col">Mark</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${reports}" var="reports" varStatus="loop">
                      <tr>
                        <td scope="row">${reports.question.qtext}</td>
                        <td>${reports.question.answer}</td>
                        <td>${reports.submission.choice}</td>
                        <td>${reports.submission.state}</td>
                        <td>${reports.submission.mark}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
              </table>
          </div>
      </div> 
    </div>
<jsp:include page="Footer.jsp" />