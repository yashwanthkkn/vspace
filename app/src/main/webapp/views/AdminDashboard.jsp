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
                    <div>
                      <button class="btn btn-primary btn-sm" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                        <i class="fas fa-plus"></i> Create Test
                      </button>
                    </div>
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
                      <c:forEach items="${test}" var="test">

                      <tr>
                        <td scope="row">
                          <a href="/admin/test">${test.tname}</a>
                        </td>
                        <td>${test.date}</td>
                        <td>${test.start_time}</td>
                        <td>${test.duration}</td>
                        <td>30</td>
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
                        <th scope="col">Start Time</th>
                        <th scope="col">Duration</th>
                        <th scope="col">Questions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td scope="row">
                          <a href="/admin/result">RMK</a>
                        </td>
                        <td>12/12/12</td>
                        <td>12 am</td>
                        <td>1 hr</td>
                        <td>30</td>
                      </tr>
                     
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- MODAL -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
          <h5 id="offcanvasRightLabel">Add Test</h5>
          <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <spring:form name="dashboard" method="POST" action="/admin/dashboard" modelAttribute="test">
                <div class="mb-1">
                    <label for="testName" class="form-label">Test Name</label>
                    <spring:input placeholder="Aptitute-Kec" type="text" path="tname" class="form-control form-control-sm" />
                </div>
                <div class="mb-1">
                    <label for="date" class="form-label">Date</label>
                    <spring:input type="date" path="date" class="form-control form-control-sm" id="date" />
                </div>
                <div class="mb-1">
                    <label for="time" class="form-label">Start Time</label>
                    <spring:input type="time" path="start_time" class="form-control form-control-sm" id="time" />
                </div>
                <div class="mb-3">
                    <label for="duration" class="form-label">Duration</label>
                    <spring:input placeholder="eg. 1 hr" type="text" path="duration" class="form-control form-control-sm" id="duration" />
                </div>
                <button type="submit" class="btn btn-primary btn-sm px-5">Create Test</button>
              </spring:form>
        </div>
      </div>
  </div>
<jsp:include page="Footer.jsp" />