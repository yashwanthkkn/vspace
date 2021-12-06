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
        <div class="px-5 mt-4">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item "><a href="/admin/dashboard" class="decor-none">Dashboard</a></li>
              <li class="breadcrumb-item active" aria-current="page">Test</li>
            </ol>
          </nav>
        </div>
        <div class="row mt-2 px-5">
            <div class="col-12">
                <div class="d-flex justify-content-between">
                  <div>
                    <div class="h5">Test : <span class="text-primary">${test.tname}</span></div>
                    <small class="text-secondary">Create and edit questions for the test</small>
                  </div>
                    <c:if test="${test.state == 'edit'}">
                      <div>
                        <a href="/admin/test/${test.tid}/start">
                          <button class="btn btn-primary btn-sm"><i class="fab fa-cloudscale"></i> Start Test</button>
                        </a>
                      </div>
                    </c:if>
                    <c:if test="${test.state == 'start'}">
                      <div>
                        <a href="/admin/test/${test.tid}/end">
                          <button class="btn btn-danger btn-sm"><i class="fab fa-cloudscale"></i> End Test</button>
                        </a>
                      </div>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="row mt-5 px-5">
            <div class="col-12">
                <div class="d-flex justify-content-between">
                    <div class="h5">Questions</div>
                    <c:if test="${test.state == 'edit'}">
                      <div><button class="btn btn-primary btn-sm" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"> <i class="fas fa-plus"></i> Add Question</button></div>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="row px-5">
            <div class="col-12">
                <table class="table  table-striped">
                    <thead>
                      <tr>
                        <th scope="col">S.No</th>
                        <th scope="col">Question</th>
                        <th scope="col">Marks</th>
                        <c:if test="${test.state == 'edit'}">
                          <th scope="col">Action</th>
                        </c:if>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${questions}" var="question" varStatus="loop" >
                        <tr>
                          <td scope="row">
                            ${loop.index+1}
                          </td>
                          <td>${question.qtext}</td>
                          <td>${question.mark}</td>
                          <c:if test="${test.state == 'edit'}">
                            <td colspan="2">
                              <!-- <button class="btn btn-primary btn-sm "><i class="fas fa-edit"></i> edit</button> -->
                              <span class="px-2"></span>
  
                              <a href="/admin/test/${test.tid}/qn/${question.qid}/d">
                                <button class="btn btn-danger btn-sm">delete</button>
                              </a>
                            </td>  
                          </c:if>
                        </tr>
                      </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


        <!-- MODAL -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
              <h5 id="offcanvasRightLabel">Add Question</h5>
              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <spring:form name="question" method="POST" action="/admin/test/${test.tid}/qn" modelAttribute="question">
                    <div class="mb-2">
                      <label for="question" class="form-label">Question</label>
                      <spring:textarea path="qtext" class="form-control form-control-sm" id="question" />
                    </div>
                    <div class="mb-1">
                        <label for="option1" class="form-label">Option 1</label>
                        <spring:input type="text" path='options[0].answer' class="form-control form-control-sm" id="option1" />
                    </div>
                    <div class="mb-1">
                        <label for="option2" class="form-label">Option 2</label>
                        <spring:input type="text" path='options[1].answer' class="form-control form-control-sm" id="option2" />
                    </div>
                    <div class="mb-1">
                        <label for="option3" class="form-label">Option 3</label>
                        <spring:input type="text" path='options[2].answer' class="form-control form-control-sm" id="option3" />
                    </div>
                    <div class="mb-3">
                        <label for="option4" class="form-label">Option 4</label>
                        <spring:input type="text" path='options[3].answer' class="form-control form-control-sm" id="option4" />
                    </div>
                    <div class="mb-3">
                      <label for="answer" class="form-label">Correct Option</label>
                        <spring:select path='answer' class="form-select form-control-sm" >
                            <spring:option value="0" label="1" />
                            <spring:option value="1" label="2" />
                            <spring:option value="2" label="3" />
                            <spring:option value="3" label="4" />
                        </spring:select>
                        
                    </div>
                    <div class="mb-4">
                      <label for="mark" class="form-label">Mark</label>
                      <spring:input type="text" path='mark' class="form-control form-control-sm" id="mark" />
                  </div>
                    <button type="submit" class="btn btn-primary btn-sm px-5"><i class="fas fa-save"></i> Save</button>
                  </spring:form>
            </div>
          </div>
    </div>
<jsp:include page="Footer.jsp" />