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
<body class="auth-bg-img w-100 mt-5">
        <div class="d-flex align-items-center justify-content-around">
            <div class="card px-5 py-3 w-50">
                
                <div class="h3 mt-4 text-primary text-center"><i class="fab fa-pied-piper-alt"></i> Vspace</div>
                <small class="text-secondary text-center">Life's Better </small>             
                <div class="h5 mt-4 text-secondary text-center">L o g i n</div>     
        
                <spring:form class="mt-3" name="login" method="POST" action="/login" modelAttribute="user">
                    <div class="form-group">
                        <label for="email">Email id</label>
                        <spring:input type="email"  path="emailid" placeholder="Email" class="form-control" />
                    </div>
                    <div class="form-group mt-4">
                        <label for="password">Password</label>
                        <spring:input type="password" path="password" placeholder="Password" class="form-control" />
                    </div>
                    <!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
                    <div class="text-center mt-4">
                        <input class="btn btn-primary btn-sm px-5" type="submit" value="Login" />
                    </div>
                    <div class="my-2 text-center text-danger">
                        <%= request.getAttribute("msg") %>
                    </div>
                    <div class="mt-3 text-center">
                        <div class="text-secondary mb-2"> OR</div>
                        Don't have an account ? <a href="/signup" >Sign Up</a><br>
                    </div>
                </spring:form>
            </div>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>