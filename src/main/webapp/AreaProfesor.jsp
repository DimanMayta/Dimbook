<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Área de Estudio</title>
        <link rel="stylesheet" href="Estilos/areaProfesor.css">
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var materias = document.querySelectorAll('.materia');
                materias.forEach(function (materia) {
                    materia.addEventListener('click', function () {
                        this.classList.toggle('selected');
                    });
                });

                var terminarBtn = document.querySelector('.terminar-btn');
                terminarBtn.addEventListener('click', function () {
                    var selectedMaterias = [];
                    var selectedElements = document.querySelectorAll('.materia.selected');
                    selectedElements.forEach(function (element) {
                        selectedMaterias.push(element.textContent.trim());
                    });

                    if (selectedMaterias.length > 0) {
                        // Usa el formulario existente
                        var form = document.querySelector('form');

                        // Elimina campos ocultos previos si existen
                        var hiddenInputs = form.querySelectorAll('input[name="materia"]');
                        hiddenInputs.forEach(function (input) {
                            input.remove();
                        });

                        // Añadir las materias seleccionadas al formulario
                        selectedMaterias.forEach(function (materia) {
                            var input = document.createElement('input');
                            input.type = 'hidden';
                            input.name = 'materia';
                            input.value = materia;
                            form.appendChild(input);
                        });

                        // Enviar el formulario al servlet
                        form.submit();
                    } else {
                        alert('Selecciona al menos una materia.');
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Área de Estudio / Qué Materias Enseñas</h1>
            <p>Haz clic en las materias que enseñas como profesor</p>
            <div class="materias-grid">
                <div class="materia">Matemáticas</div>
                <div class="materia">Ciencias</div>
                <div class="materia">Historia</div>
                <div class="materia">Literatura</div>
                <div class="materia">Arte</div>
                <div class="materia">Música</div>
                <div class="materia">Educación Física</div>
                <div class="materia">Tecnología</div>
                <div class="materia">Idiomas</div>
                <div class="materia">Otra materia</div>
            </div>
            <!-- El formulario inicia aquí -->
            <form action="ProfesorControlador?action=selectSubjects" method="POST">
                <input type="hidden" name="action" value="selectSubjects">
                <button type="button" class="terminar-btn">Siguiente Paso</button>
            </form>
            <!-- El formulario termina aquí -->
        </div>
    </body>
</html>
