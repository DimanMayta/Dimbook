<%-- 
    Document   : PlatPadre
    Created on : 22 jun. 2024, 23:05:39
    Author     : Diman
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="image/favicon.ico" type="image/x-icon">
        <title>DimanBook</title>
        <!-- style css link -->
        <link rel="stylesheet" href="Estilos/platprofesor.css">
        <!-- fontawesome css link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="scripts/script-menu.js"></script>
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
                        <div class="container-dark">
                            <i class="fa-solid fa-moon"></i>
                            <label class="darkTheme"><span></span></label>
                        </div>
                    </div>
                    <div class="iconBox2">
                        <i class="fa-solid fa-circle-plus"></i>
                        <i class="fa-solid fa-comment-dots"></i>
                        <i class="fa-solid fa-bell"></i>
                        <label><img src="<c:out value='${sessionScope.userProfilePic}' />" alt="user"></label>
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
        <!-- home section start -->


        <div class="home">
            <div class="container">
                <div class="home-weapper">

                    <!-- home left start here -->
                    <div class="home-left">

                        <div class="profile">
                            <img src="<c:out value='${sessionScope.userProfilePic}' />" alt="user">
                            <h3><c:out value='${sessionScope.userName}' /></h3>
                        </div>

                        <div class="group">
                            <h4 class="mini-headign">GRUPOS</h4>
                            <label>
                                <img src="image/gg.png" alt="group01">
                                <span>Matematica-6B</span>
                            </label>

                            <button class="see-more-btn">Ver mas <i class="fa-solid fa-angle-down"></i></button>
                        </div>

                        <div class="explore">
                            <h4 class="mini-headign">Explorar</h4>

                            <a href="#"><i class="fa-solid fa-user-group"></i> Grupos</a>
                            <a href="#"><i class="fa-solid fa-star"></i></i> Favoritos</a>
                            <a href="#"><i class="fa-solid fa-bookmark"></i></i> Contactos</a>
                            <a href="#"><i class="fa-solid fa-clock"></i> Eventos</a>
                            <a href="#"><i class="fa-solid fa-flag"></i> Paginas</a>

                            <button class="see-more-btn">Ver mas <i class="fa-solid fa-angle-down"></i></button>
                        </div>

                    </div><!-- home left end here -->

                    <!-- home center start here -->

                    <div class="home-center">
                        <div class="home-center-wrapper">
                            <div class="stories">
                                <h3 class="mini-headign">HISTORIAS</h3>
                                <div class="stories-wrapper">

                                    <div class="single-stories">
                                        <label><img src="image/user.jpg" alt="user"></label>
                                        <div>
                                            <img src="image/user.jpg" alt="user">
                                            <i class="fa-solid fa-circle-plus"></i>
                                            <b>Crear historias</b>
                                        </div>
                                    </div>

                                    <div class="single-stories">
                                        <label><img src="image/us.png" alt="sp"></label>
                                        <div>
                                            <img src="image/ss.png" alt="ss">
                                            <b>Nombre</b>
                                        </div>
                                    </div>

                                    <div class="single-stories">
                                        <label><img src="image/us2.png" alt="sp2"></label>
                                        <div>
                                            <img src="image/ss2.png" alt="ss2">
                                            <b>Nombre</b>
                                        </div>
                                    </div>

                                    <div class="single-stories">
                                        <label><img src="image/us3.png" alt="sp3"></label>
                                        <div>
                                            <img src="image/ss3.png" alt="ss3">
                                            <b>Nombre</b>
                                        </div>
                                    </div>

                                    <div class="single-stories">
                                        <label><img src="image/us4.png" alt="sp4"></label>
                                        <div>
                                            <img src="image/ss4.jpg" alt="ss4">
                                            <b>Nombre</b>
                                        </div>
                                    </div>


                                </div>
                            </div>


                            <div class="createPost">

                                <h3 class="mini-headign">CREAR PUBLICACION</h3>
                                <div class="post-text">
                                    <img src="image/user.jpg" alt="user">
                                    <input type="text-area" placeholder="¿En que piensas,Diman?">
                                </div>

                                <div class="post-icon">
                                    <a href="#" id="select-file" style="background: #ffebed;">
                                        <i style="background: #ff4154;" class="fa-solid fa-camera"></i>
                                        Galeria</a>

                                    <a href="#" style="background: #ccdcff;">
                                        <i style="background: #0053ff;" class="fa-solid fa-video"></i>
                                        Video</a>

                                    <a href="#" style="background: #d7ffef;">
                                        <i style="background: #00d181;" class="fa-solid fa-location-dot"></i>
                                        Ubicacion</a>

                                    <a href="#" style="background: #cff3ff;">
                                        <i style="background: #04c3ff;" class="fa-solid fa-gift"></i>
                                        Archivos</a>

                                    <a href="#" style="background: #fff4d1;">
                                        <i style="background: #ffca28;" class="fa-solid fa-face-grin-beam"></i>
                                        Actividades</a>

                                    <a href="#" style="background: #115cbd;">
                                        <i style="background: #3f4172;" class="fa-solid fa-arrow-up-right-from-square"></i>
                                    </a>

                                </div>

                            </div>


                            <div class="fb-post1">
                                <div class="fb-post1-container">
                                    <div class="fb-post1-header">
                                        <ul>
                                            <li class="active">popular</li>
                                            <li>reciente</li>
                                            <li>mayoria</li>
                                        </ul>
                                    </div>
                                    <div class="fb-p1-main">
                                        <div class="post-title">
                                            <img src="image/user2.jpg" alt="user picture">
                                            <ul>
                                                <li><h3>Fernando Villca</h3></li>
                                                <li><span>02 march at 12:55 PM</span></li>
                                            </ul>
                                            <p>Hola a todos, hoy desperte de buen humor
                                            </p>
                                        </div>

                                        <div class="post-image">
                                            <div class="post-image1">

                                            </div>
                                            <div class="post-image2">

                                            </div>
                                        </div>

                                        <div class="like-comment">
                                            <ul>
                                                <li>
                                                    <i class="far fa-thumbs-up like-icon"></i>
                                                    <span class="like-count">0 me gusta</span>
                                                </li>
                                                <li>
                                                    <i class="far fa-heart heart-icon"></i>
                                                    <span class="heart-count">0 corazones</span>
                                                </li>
                                                <li><i class="far fa-comment-dots"></i> <span class="comment-count">0 comentarios</span></li>
                                                <li><i class="fas fa-share"></i> <span>0 share</span></li>
                                            </ul>
                                        </div>
                                        <!-- Campo para escribir comentario -->
                                        <textarea class="comment-box" id="comment-text" placeholder="Escribe un comentario..."></textarea>

                                        <!-- Botón para enviar comentario -->
                                        <button class="comment-btn" onclick="enviarComentario()">Comentar</button>

                                        <!-- Lista de comentarios -->
                                        <div class="comment-list" id="comment-list">
                                            <!-- Los comentarios se agregarán aquí dinámicamente -->
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div> <!-- home center wrapper end -->
                    </div> <!-- home center end -->

                    <div class="home-right">
                        <div class="home-right-wrapper">

                            <div class="event-friend">
                                <div class="event">
                                    <h3 class="heading">Archivos Privados<span>ver todo</span></h3>
                                    <h4>Archivo1.pdf</h4>
                                </div>

                                <hr>

                                <div class="friend">
                                    <h3 class="heading">Solicitudes de Amistad<span>ver todo</span></h3>
                                    <ul>
                                        <li><img src="image/user4.jpg" alt="user"></li>
                                        <li>
                                            <b>Jhaneth Machicado</b>
                                            <p>Lorem ipsum dolor sit amet.</p>
                                            <button>Confirmar</button><button class="friend-remove">Eliminar</button>
                                        </li>
                                    </ul>
                                </div>

                            </div>

                            <div class="messenger">
                                <div class="messenger-search">
                                    <i class="fa-solid fa-user-group"></i>
                                    <h4>Mensajes</h4>
                                    <input type="search" placeholder="Search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <ul>
                                    <li>
                                        <img src="image/us2.png" alt="user">
                                        <b>Pepito 1<span>En Linea</span></b>
                                        <i class="fa-brands fa-facebook-messenger"></i>
                                    </li>

                                    <li>
                                        <img src="image/us3.png" alt="user">
                                        <b>Pepito 2<span>Desconectado</span></b>
                                        <i class="fa-brands fa-facebook-messenger"></i>
                                    </li>

                                    <li>
                                        <img src="image/us4.png" alt="user">
                                        <b>Pepito 3 <span>En Linea</span></b>
                                        <i class="fa-brands fa-facebook-messenger"></i>
                                    </li>
                                </ul>
                            </div>

                        </div><!-- home right wrapper end -->
                    </div><!-- home right end -->






                </div>
            </div>
        </div>



        <!-- home section end -->

        <script>
            var darkButton = document.querySelector(".darkTheme");

            darkButton.onclick = function () {
                darkButton.classList.toggle("button-Active");
                document.body.classList.toggle("dark-color")
            }

        </script>

    </body>
</html>