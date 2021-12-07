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
      <button class="btn btn-outline-primary btn-sm" type="submit">Logout</button>
      
    </div>
  </div>
</nav>
    <div class="container-fluid">
      <div class="row mt-5">
        <div class="col-xs-4  text-center">
            <p>Test Name </p>  
           
        </div>
        <div class="row mt-5">
            <div class="col-xs-4  text-center">
                <i class="fas fa-lock" aria-hidden="true">  Lock Section : No  </i>
               
            </div>
        </div>
        <div class="row ">
            <div class="col-xs-4  text-center">
                <i class="fab fa-algolia">   Attempts : 1</i>
            </div>
        </div>
        <div class="row ">
            <div class="col-xs-4  text-center"> 
            <i class="fas fa-camera">  Proctoring : No</i>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-xs-8 text-center">
                <table class="table table-borderless">
                    <thead class="thead-dark">
                      <tr>
                        <th scope="col">Sections</th>
                        <th scope="col">Questions</th>
                        <th scope="col">Duration</th>
                        <th scope="col">Marks</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>30</td>
                        <td>60 m</td>
                        <td>50</td>
                      </tr>
        
                    </tbody>
                  </table>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-xs-4 text-center">
            <a href="#" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Primary link</a>
        </div>
        </div>
    </div>
    <jsp:include page="Footer.jsp" />

   