<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
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
<body class="auth-bg-img w-100">
        <div class="d-flex align-items-center justify-content-around">
            <div class="card px-5 py-3 w-50 mt-3">      
                <div class="h3 mt-4 text-primary text-center"><i class="fab fa-pied-piper-alt"></i> Vspace</div>
                <small class="text-secondary text-center">Life's Better </small>             
                <div class="h5 mt-4 text-secondary text-center">S i g n  U P</div>    
                         
                <spring:form class="mt-3" method="POST" action="/signup" modelAttribute="user">
                    <div class="form-group">
                        <label for="email">Email id</label>
                        <spring:input type="email"    path="emailid" placeholder="Email" class="form-control" />
                    </div>
                    <div class="form-group mt-4">
                        <label for="name">Name</label>
                        <spring:input type="text"            path="name" placeholder="Name" class="form-control"/>
                    </div>
                    <div class="form-group mt-4">
                        <label for="password">Password</label>
                        <spring:input type="password"        path="password" placeholder="Password" class="form-control" />
                    </div>
                    <div class="text-center mt-4">
                        <input class="btn btn-primary btn-sm px-5" type="submit" value="Sign Up" />
                    </div>
                    <div class="my-2 text-center text-danger">
                        <%= request.getAttribute("msg") %>
                    </div>
                    <div class="mt-3 text-center">
                        <div class="text-secondary mb-2"> OR</div>
                        Already have an account ? <a href="/login" >Login</a><br>
                    </div>
                </spring:form>
            </div>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>