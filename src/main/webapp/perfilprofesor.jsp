<%-- 
    Document   : perfilprofesor
    Created on : 25 jun. 2024, 15:51:36
    Author     : Diman
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <title>Perfil de Usuario</title>
        <!-- Enlace al archivo CSS -->
        <link rel="stylesheet" href="Estilos/perfilprofesor.css">
        <!-- Enlace a Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>

        <!-- header section start -->


        <header>
            <div class="header-container">
                <div class="header-wrapper">
                    <div class="logoBox">
                        <img src="image/Dimbook-logo.png" alt="logo">
                    </div>
                    <div class="searchBox">
                        <input type="search">
                        <i class="fas fa-search"></i>
                    </div>
                    <div class="iconBox1">
                        <i class="fa-solid fa-house"></i>
                        <i class="fa-solid fa-graduation-cap"></i>
                        <i class="fa-solid fa-video"></i>

                    </div>
                    <div class="iconBox2">
                        <i class="fa-solid fa-circle-plus"></i>
                        <i class="fa-solid fa-comment-dots"></i>
                        <i class="fa-solid fa-bell"></i>
                        <label><img src="<c:out value='${sessionScope.userProfilePic}' />"></label>
                        <i class="fa-solid fa-caret-down" id="dropdown-toggle"></i>
                        <div class="dropdown-menu" id="dropdown-menu">
                            <a href="#">Perfil</a>
                            <a href="#">Configuracion</a>
                            <a href="#">Salir</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>


        <!-- header section end -->

        <section class="seccion-perfil-usuario">
            <div class="perfil-usuario-header">
                <div class="perfil-usuario-portada">
                    <div class="perfil-usuario-avatar">
                        <img src="<c:out value='${sessionScope.userProfilePic}' />" alt="img-avatar">
                        <button type="button" class="boton-avatar">
                            <i class="far fa-image"></i>
                        </button>
                    </div>
                    <button type="button" class="boton-portada">
                        <i class="far fa-image"></i> Cambiar fondo
                    </button>
                </div>
            </div>
            <div class="perfil-usuario-body">
                <div class="perfil-usuario-bio">
                    <h3 class="titulo"><c:out value='${sessionScope.userName}' /></h3>
                    <p class="texto">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
                <div class="perfil-usuario-footer">
                    <ul class="lista-datos">
                        <li><i class="icono fas fa-briefcase"></i> Trabaja en.</li>
                        <li><i class="icono fas fa-building"></i> Cargo</li>
                    </ul>
                </div>
                <div class="redes-sociales">
                    <a href="" class="boton-redes facebook fab fa-facebook-f"><i class="icon-facebook"></i></a>
                    <a href="" class="boton-redes twitter fab fa-twitter"><i class="icon-twitter"></i></a>
                    <a href="" class="boton-redes instagram fab fa-instagram"><i class="icon-instagram"></i></a>
                </div>
            </div>
        </section>

        <script src="script-menu.js"></script>

    </body>
</html>
