<%-- 
    Document   : UbicacionProfesor
    Created on : 22 jun. 2024, 21:57:29
    Author     : Diman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encuentra tu Escuela</title>
        <link rel="stylesheet" href="Estilos/ubicacionprofesor.css">
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var registroBtn = document.querySelector('.registro-btn');
                registroBtn.addEventListener('click', function () {
                    var buscarEscuela = document.getElementById('buscarEscuela').value.trim();
                    if (buscarEscuela !== '') {
                        // Crear formulario dinámico para enviar la ubicación
                        var form = document.querySelector('form');

                        // Elimina campos ocultos previos si existen
                        var hiddenInputs = form.querySelectorAll('input[name="ubicacion"]');
                        hiddenInputs.forEach(function (input) {
                            input.remove();
                        });

                        // Añadir la ubicación al formulario
                        var input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = 'ubicacion';
                        input.value = buscarEscuela;
                        form.appendChild(input);

                        // Enviar el formulario al servlet
                        form.submit();
                    } else {
                        alert('Ingrese la ubicación de la escuela.');
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Encuentra tu escuela</h1>
            <div class="search-box">
                <input type="text" placeholder="Buscar escuela" id="buscarEscuela">
            </div>
            <!-- El formulario inicia aquí -->
            <form action="ProfesorControlador?action=registerLocation" method="POST">
                <input type="hidden" name="action" value="registerLocation">
                <button type="button" class="registro-btn">Terminar Registro</button>
            </form>
            <!-- El formulario termina aquí -->
        </div>
    </body>
</html>
