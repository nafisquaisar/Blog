
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 95%, 77% 100%, 47% 96%, 20% 100%, 0 96%, 0% 35%, 0 0);
            }

        </style>

        <!--heading logo--> 
        <link
            rel="shortcut icon"
            href="image/logo.png"
            type="image/x-icon"
            />
        <link
            rel="icon"
            href="image/logo.png"
            type="image/x-icon"
            />

    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>

        <main class="primary-background p-5 banner-background">

            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa fa-user-circle fa-3x "></span>
                                <h3>Register here!!</h3>
                            </div>
                            <div class="card-body">

                                <form action="RegisterServlet" id="reg-form" method="POST">
                                    <div class="form-group">
                                        <label for="user_name">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter your Name">

                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your Email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>


                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter your Password">
                                    </div>

                                    <br><!-- comment -->

                                    <label for="birthday">Date of Birth</label>
                                    <input name="user_dob" type="date" id="birthday" >

                                    <br>
                                    <br>


                                    <div class="form-group">
                                        <label for="gender">Select Gender</label>
                                        <br>

                                        <input type="radio" id="gender" name="gender" value="Male">Male
                                        <input type="radio" id="gender" name="gender" value="Female">Female
                                    </div>



                                    <br>
                                    <div class="form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
                                    </div>

                                    <br>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-4x "></span>
                                        <h3>Please wait...</h3>
                                    </div>

                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </form>

                            </div>

                        </div>  






                    </div>
                </div>
            </div>

        </main>



        <!--javascript-->
        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded...");
            });
            $('#reg-form').on('submit', function (event) {
                event.preventDefault();

                let form = new FormData(this);

                $("#submit-btn").hide();
                $("#loader").show();


                //send register servlet:

                $.ajax({
                    url: "RegisterServlet",
                    type: "POST",
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);

                        $("#submit-btn").show();
                        $("#loader").hide();

                        if (data.trim() === 'done')
                        {
                            swal("Registration Successfully. We are going to redirect to Login page")
                                    .then((value) => {
                                        window.location = "loginpage.jsp";
                                    });
                        } else {
                            swal(data);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Something went wrong try Again.");

                        $("#submit-btn").show();
                        $("#loader").hide();
                    },
                    processData: false,
                    contentType: false
                });

            });


        </script>


    </body>
</html>
