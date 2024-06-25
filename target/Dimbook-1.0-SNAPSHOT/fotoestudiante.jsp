<%-- 
    Document   : fotoestudiante
    Created on : 27 may. 2024, 19:20:44
    Author     : Diman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Perfil de Estudiante</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                font-size: 150%; /* Aumentar el tamaño del texto */
            }

            .container {
                max-width: 1200px; /* Aumentar el ancho máximo del contenedor */
                margin: 0 auto;
                padding: 30px;
            }

            h2 {
                color: #333;
                margin-bottom: 30px; /* Aumentar el espacio inferior */
                text-align: center;
                font-size: 200%; /* Aumentar el tamaño del título */
            }

            #form-imagen {
                margin-bottom: 30px; /* Aumentar el espacio inferior */
                text-align: center;
            }

            #preview-container {
                width: 225px; /* Aumentar el tamaño del contenedor de la imagen */
                height: 225px; /* Aumentar el tamaño del contenedor de la imagen */
                border: 4px solid #ccc; /* Aumentar el grosor del borde */
                border-radius: 50%;
                overflow: hidden;
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f0f0f0;
                margin: 0 auto 30px; /* Aumentar el espacio inferior */
            }

            #preview-imagen {
                max-width: 100%;
                max-height: 100%;
                border-radius: 50%;
            }

            .custom-file-upload {
                display: inline-block;
                padding: 15px 30px; /* Aumentar el tamaño del botón */
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 6px; /* Aumentar el radio del borde */
                cursor: pointer;
                text-align: center;
                font-size: 120%; /* Aumentar el tamaño del texto */
            }

            .custom-file-upload:hover {
                background-color: #45a049;
            }

            input[type="submit"] {
                display: block;
                width: 300px; /* Aumentar el ancho del botón */
                margin: 0 auto;
                padding: 15px 30px; /* Aumentar el tamaño del botón */
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 6px; /* Aumentar el radio del borde */
                cursor: pointer;
                font-size: 120%; /* Aumentar el tamaño del texto */
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Actualizar tu perfil de Estudiante</h2>
            <form action="EstudianteControlador" method="POST" enctype="multipart/form-data" id="form-imagen">
                <div id="preview-container">
                    <img id="preview-imagen" src="#" alt="Vista previa de la imagen" style="display: none;">
                </div>
                <br>
                <input type="file" id="imagen" name="imagen" accept="image/*" onchange="mostrarImagen()" required>
                <br><br>
                <input type="hidden" name="action" value="uploadPhoto">
                <input type="hidden" name="idUsuario" value="${estudiante.ID_usuario}">
                <input type="submit" value="Terminar paso">
            </form>
        </div>
        <script>
            function mostrarImagen() {
                var fileInput = document.getElementById('imagen');
                var previewImage = document.getElementById('preview-imagen');
                var file = fileInput.files[0];
                var reader = new FileReader();
                reader.onload = function (event) {
                    previewImage.src = event.target.result;
                    previewImage.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        </script>
    </body>
</html>
