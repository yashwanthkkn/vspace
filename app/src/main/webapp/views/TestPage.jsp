<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vspace</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
      <nav class="navbar navbar-expand-lg navbar-light bg-light  px-5">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <!-- <img src="" alt="" width="30" height="24" class="d-inline-block align-text-top"> -->
                Vspace
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>