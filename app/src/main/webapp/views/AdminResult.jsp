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
      <div class="px-5 mt-4">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item text-primary"><a href="/admin/dashboard" class="decor-none"> Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Result</li>
          </ol>
        </nav>
      </div>

        <div class="row mt-3 px-5">
            <div class="col-12">
                <div class="h5">Result</div>
                <small class="text-secondary">Submissions of Test takers</small>
            </div>
        </div>

        <div class="row mt-5 px-5">
            <div class="col-12">
                <div class="d-flex justify-content-between">
                    <div class="h5">Test : <span class="text-primary">KEC</span></div>
                    <div> <a href="/admin/excelExport/${tid}" class="btn btn-success"><i class="fas fa-download"></i> Download Result</a></div>
                </div>
            </div>
        </div>

        <div class="row px-5">
            <div class="col-12">
                <table class="table  table-striped">
                    <thead>
                      <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Score</th>
                        <th scope="col">Rank</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${users}" var="users" varStatus="loop">
                      <tr>
                        <td scope="row">${users.user.name}</td>
                        <td>${users.user.emailid}</td>
                        <td>${users.participation.score}</td>
                        <td>${loop.index+1}</td>
                      </tr>
                     </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

       
    </div>
<jsp:include page="Footer.jsp" />