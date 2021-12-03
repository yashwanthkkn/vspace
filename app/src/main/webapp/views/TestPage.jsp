<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
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
                    <div class="h5">Question</div>
                    <p>Mark : <strong>2</strong></p>
                  </div>
                  <div class="mt-2">
                    <p>If A means +, B means-, C means *, and D means /, then determine the value of following expression.</p>
                  </div>
                </div>

                <div class="col-5">
                  <div class="d-flex justify-content-between">
                    <div class="h5">Options</div>
                  </div>
                  <form class="mt-2">
                    <div class="card px-2 py-2 mb-2">
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
                    <div class="card px-2 py-2 mb-2">
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
                   
                    <button type="submit" class="btn btn-primary btn-sm mt-5 px-5"><i class="fas fa-save"></i> Submit</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>        
    </div>
<jsp:include page="Footer.jsp" />