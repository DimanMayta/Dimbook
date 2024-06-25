<%-- 
    Document   : curso
    Created on : 25 jun. 2024, 14:01:54
    Author     : Diman
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear grupo de estudio</title>
    </head>
    <body>

        <!-- Formulario para registrar un curso -->
        <div class="form-container">
            <h2>Registrar Curso</h2>
            <form class="form form-register" action="Platprofesor.jsp" method="POST">
                <input type="hidden" name="action" value="register">

                <label for="titulo">Título del curso:</label><br>
                <input type="text" id="titulo" name="titulo" required><br>

                <label for="descripcion">Descripción:</label><br>
                <textarea id="descripcion" name="descripcion" rows="4" required></textarea><br>

                <label for="codigoCurso">Código del curso:</label><br>
                <input type="text" id="codigoCurso" name="codigoCurso" required><br>

                <button type="submit">Registrar Curso</button>
            </form>
        </div>

    </body>
</html>
