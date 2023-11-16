<%-- 
    Document   : contactUs
    Created on : 16-Nov-2023, 10:31:45 am
    Author     : nafis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>

        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
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


        <%@include file="normal_navbar.jsp"  %>


        <!-- ========== Contact section Start ========== -->
        <section class="section pb-0" id="contact">
            <div class="container ">
                <div class="row"  >
                    <div class="col-lg-6 mb-5 mb-lg-0 offset-md-3 primary-background" style="margin-top: 40px">
                        <h2 class="mb-4 mb-lg-5 text-center" style="color:white">Contact Us</h2>
                        <form
                            action="https://formspree.io/f/xknlabkq "
                            method="post"
                            >
                            <div class="form-group mb-4">
                                <label for="name">Your Name</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="name"
                                    name="name"
                                    placeholder="Your Name"
                                    />
                            </div>
                            <div class="form-group mb-4">
                                <label for="email">Your Email</label>
                                <input
                                    type="email"
                                    class="form-control"
                                    id="email"
                                    name="email"
                                    placeholder="Your Email"
                                    />
                            </div>
                            <div class="form-group mb-4">
                                <label for="message">Your Message</label>
                                <textarea
                                    class="form-control"
                                    id="message"
                                    name="message"
                                    placeholder="Your Message"
                                    ></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-primary" style="margin-bottom: 10px;" type="submit" value="send">
                                    Send Now
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- ========== Contact section End ========== -->

        <!-- ========== Footer Start ========== -->
        <footer class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center" style=" ">
                        <ul class="list-inline social-icons mb-5">
                            <li class="list-inline-item">
                                <a href="https://www.facebook.com/9801999829a"
                                   ><i class="fa-brands fa-facebook fa-2x " ></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a href="https://twitter.com/NafisKamran"
                                   ><i class="fab fa-twitter fa-2x" style="color:blue"  ></i
                                    ></a>
                            </li>
                            <li class="list-inline-item">
                                <a href="https://youtube.com/@nafiskamran6900?si=A4iediRb79Q6MrfW"
                                   ><i class="fab fa-youtube fa-2x" style="color:red" ></i
                                    ></a>
                            </li>
                            <li class="list-inline-item">
                                <a href="https://github.com/nafisquaisar"
                                   ><i class="fab fa-github fa-2x" style="color:black" ></i
                                    ></a>
                            </li>
                            <li class="list-inline-item">
                                <a href="https://www.linkedin.com/in/nafis-quaisar-b35a4725a"
                                   ><i class="fab fa-linkedin fa-2x"></i
                                    ></a>
                            </li>
                        </ul>
                        <hr class="mx-auto border-default" style="width: 90px" />
                        <p class="mt-5">
                            Copyright © 2023 
                        <div align="center">Made with ❤️ by <a href="https://github.com/nafisquaisar" target="_blank">Nafis Quaisar</a></div>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- ========== Footer End ========== -->

    </body>
</html>
