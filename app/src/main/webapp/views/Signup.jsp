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
                <form class="mt-3" method="POST" action="/login">
                    <div class="form-group">
                        <label for="email">Email id</label>
                        <spring:input type="email" name="email" id="email" placeholder="Email" class="form-control" required>
                    </div>
                    <div class="form-group mt-4">
                        <label for="name">Name</label>
                        <input type="text" name="username" id="username" placeholder="Name" class="form-control" required>
                    </div>
                    <div class="form-group mt-4">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" placeholder="Password" class="form-control" required>
                    </div>
                    <div class="text-center mt-4">
                        <button class="btn btn-primary btn-sm px-5">Sign Up</button>
                    </div>
                
                    <div class="mt-3 text-center">
                        <div class="text-secondary mb-2"> OR</div>
                        Already have an account ? <a href="/auth/login" >Login</a><br>
                    </div>
                </form>
            </div>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>