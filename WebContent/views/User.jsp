<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Utilisateur</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />

    </head>


    <body class="authentication-bg authentication-bg-pattern">

        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-pattern">

                            <div class="card-body p-4">
                                
                                <div class="text-center w-75 m-auto">
                                    <a href="index.html">
                                        <span><img src="assets/images/convention.png" alt="" width="90" height="90"></span>
                                    </a>
                                    <p class="text-muted mb-4 mt-3">Saisissez votre adresse e-mail et votre mot de passe pour accéder au Dahsboard Convention.</p>
                                </div>

                                <form  method="post" action="../UserServlet">

                                    <div class="form-group mb-3">
                                        <label for="emailaddress">Identifiant</label>
                                        <input class="form-control" type="text" name="login" required="" placeholder="admin">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="password">Mot de passe</label>
                                        <input class="form-control" type="password" required="" name="password" placeholder="admin">
                                    </div>
                                  

                                    <div class="form-group mb-0 text-center">
                                    
                                        <button class="btn btn-primary btn-block" type="submit"> S'authentifier </button>
                                    <%if("inexistant".equals(request.getParameter("erreur"))){%>
                                <span style="color:red;">Compte Utilisateur Inexistant</span>
                                    
                                    <%} %>
                                    </div>

                                </form>

                                

                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

                        <div class="row mt-3">
                            <div class="col-12 text-center">
                                <p class="text-white-50">Vous n'avez pas du compte ?<a href="Register.jsp" class="text-white ml-1"><b>Créér compte</b></a></p>
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->


        

        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>
        
    </body>
</html>