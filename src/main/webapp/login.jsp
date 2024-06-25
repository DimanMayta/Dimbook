<%-- 
    Document   : login
    Created on : 20 may. 2024, 13:49:44
    Author     : Diman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FORMULARIO DE REGISTRO E INICIO SESIÓN</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="Estilos/iniciars.css">
    </head>
    <body>
        <div class="container-form login" id="login-section">
            <div class="information">
                <div class="info-childs">
                    <h2>Bienvenido</h2>
                    <p><p>Registrate ahora es.</p></p>
                    <p><p>¡ES GRATIS!</p></p>

                    <input type="button" value="PROFESORES" id="sign-up-profesores">
                    <input type="button" value="ESTUDIANTES" id="sign-up-estudiantes">
                    <input type="button" value="PADRES" id="sign-up-padres">
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs" >
                    <h2>Acceder a Dimbook</h2>
                    <div class="icons">
                        <i class='devicon--google'></i>
                        <i class='bx bxl-twitter'></i>
                        <i class='bx bxl-instagram'></i>
                    </div>
                    <p>Acceso para usuarios ya registrados</p>
                    <form class="form form-login" action="UsuarioControlador" method="POST">
                        <div>
                            <label >
                                <i class='bx bx-envelope' ></i>
                                <input type="text" placeholder="Ingrese usuario" name="userName">
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-lock-alt' ></i>
                                <input type="password" placeholder="Contraseña" name="userPassword">
                            </label>
                        </div>
                        <input type="hidden" name="action" value="login"> 
                        <input type="submit" value="Entrar">
                    </form>
                </div>
            </div>
        </div>

        <div class="container-form register hide" id="register-profesores">
            <div class="information">
                <div class="info-childs">
                    <h2>Bienvenido profesor</h2>
                    <p>Para unirte a nuestra comunidad por favor Inicia Sesión con tus datos</p>
                    <input type="button" value="Iniciar Sesión" id="sign-in-profesores">
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Crear una Cuenta</h2>
                    <h2>Profesor</h2>

                    <form class="form form-register" action="ProfesorControlador" method="POST">
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Nombres" name="NombresProfesor" required>
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Apellidos" name="ApellidoProfesor" required>
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-envelope'></i>
                                <input type="email" placeholder="Correo Electronico" name="EmailProfesor" required>
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Nombre Usuario" name="userNameProfesor" required>
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-lock-alt'></i>
                                <input type="password" placeholder="Contraseña" name="userPasswordProfesor" required>
                            </label>
                        </div>
                        <input type="hidden" name="action" value="register"> 
                        <input type="submit" value="Registrarse">
                    </form>
                </div>
            </div>
        </div>

        <div class="container-form register hide" id="register-estudiantes">
            <div class="information">
                <div class="info-childs">
                    <h2>Bienvenido estudiante</h2>
                    <p>Para unirte a nuestra comunidad por favor Inicia Sesión con tus datos</p>
                    <input type="button" value="Iniciar Sesión" id="sign-in-estudiantes">
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Crear una Cuenta</h2>
                    <h2>Estudiante</h2>

                    <form class="form form-register" action="EstudianteControlador" method="POST">
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Codigo Curso" name="CodigoCursoE" id="CodigoCursoE" onblur="verificarCodigoCurso()">
                            </label>
                            <div id="mensajeCodigoCurso"></div>
                        </div>

                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Nombres" name="NombresEstudiante">
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Apellidos" name="ApellidoEstudiante">
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-envelope'></i>
                                <input type="email" placeholder="Correo Electronico" name="EmailEstudiante">
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Nombre Usuario" name="userNameEstudiante">
                            </label>
                        </div>

                        <div>
                            <label>
                                <i class='bx bx-lock-alt'></i>
                                <input type="password" placeholder="Contraseña" name="userPasswordEstudiante">
                            </label>
                        </div>
                        <input type="hidden" name="action" value="register"> 
                        <input type="submit" value="Registrarse">
                    </form>
                </div>
            </div>
        </div>

        <div class="container-form register hide" id="register-padres">
            <div class="information">
                <div class="info-childs">
                    <h2>Bienvenido padre</h2>
                    <p>Para unirte a nuestra comunidad por favor Inicia Sesión con tus datos</p>
                    <input type="button" value="Iniciar Sesión" id="sign-in-padres">
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Crear una Cuenta</h2>
                    <h2>Padre/Madre</h2>
                    <form class="form form-register" action="PadreControlador" method="POST">
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Nombres" name="userNamesPadre">
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Apellidos" name="ApellidoPadre">
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-envelope'></i>
                                <input type="email" placeholder="Correo Electronico" name="EmailPadre">
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Nombre Usuario" name="userNamePadre">
                            </label>
                        </div>

                        <div>
                            <label>
                                <i class='bx bx-lock-alt'></i>
                                <input type="password" placeholder="Contraseña" name="userPasswordPadre">
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Codigo Grupo Estudiante" name="CodigoCursoP">
                            </label>
                        </div>
                        <div>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" placeholder="Nombre Estudiante/Hijo" name="NombreEstudianteP">
                            </label>
                        </div>
                        <input type="hidden" name="action" value="register"> 
                        <input type="submit" value="Registrarse">
                    </form>
                </div>
            </div>
        </div>

        <script src="Login/script.js"></script>
    </body>
</html>
