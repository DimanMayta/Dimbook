<%-- 
    Document   : index
    Created on : 26 abr. 2024, 18:37:24
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DIMBOOK</title>
        <link rel="stylesheet" href="Estilos/stylep.css">
        <link rel="stylesheet" href="Estilos/pacman.css">
    </head>
    <body>
        <div id="particles-js"></div>
        <header class="header">
            <div class="menu container">
                <a href="#" class="logo">DimBook</a>
                <input type="checkbox" id="menu">
                <label for="menu">
                    <img src="imagens/menu.png"  class="menu-icono" alt="munu"/>
                </label>
                <nav class="navbar">
                    <ul>
                        <li> <a href="#">Inicio</a> </li>
                        <li> <a href="#">Servicios</a> </li>
                        <li> <a href="#">Libros</a> </li>
                        <li> <a href="#">Contacto</a> </li>
                        <li> <a href="login.jsp" id="entrar-link">Entrar</a> </li>
                        
                    </ul>
                </nav>
            </div>
            
            <div class="header-content container">
                <div class="header-txt"> 
                    <h1>De Vuelta al <span>Colegio</span><br>Con Dimbook </h1>
                    <p>El centro de comunicaciones seguro y gratuito para 
                        conectarse con estudiantes, otros profesores y familiares</p>
                    <p style="text-align: center;">Crea tu cuenta gratuita</p>
                    <div class="butons">
                        <a href="login.jsp?section=profesores" class="btn-1">Soy un Profesor</a>
                        <a href="login.jsp?section=estudiantes" class="btn-2">Soy un Estudiante</a>
                        <a href="login.jsp?section=padres" class="btn-3">Soy un Padre</a>
                    </div>
                </div>
            </div>

        </header>
        
        <!-- Pie de página con el Pac-Man -->
        <footer class="footer">
            <!-- contenido adicional del pie de página -->
            <div class="pacman-container">
                <div class="pacman"></div>
                <div class="path"></div>
                <div class="path"></div>
                <div class="path"></div>
                <div class="path"></div>
                <div class="path"></div>
                <div class="path"></div>
                <div class="path"></div>
                <div class="path"></div>
            </div>
        </footer>

        <script src="PARTICLES.JS/particles.min.js"></script>
        <script>
            particlesJS.load('particles-js', 'PARTICLES.JS/particlesjs-config.json');
        </script>

    </body>
</html>
