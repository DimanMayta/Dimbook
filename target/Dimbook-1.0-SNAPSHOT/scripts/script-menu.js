document.addEventListener('DOMContentLoaded', function () {
    const dropdownToggle = document.getElementById('dropdown-toggle');
    const dropdownMenu = document.getElementById('dropdown-menu');

    dropdownToggle.addEventListener('click', function () {
        dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
    });

    // Close the dropdown if the user clicks outside of it
    window.addEventListener('click', function (e) {
        if (!dropdownToggle.contains(e.target) && !dropdownMenu.contains(e.target)) {
            dropdownMenu.style.display = 'none';
        }
    });
});



//reacciones y comentarios        

document.addEventListener('DOMContentLoaded', function () {
    const likeIcon = document.querySelector('.like-icon');
    const heartIcon = document.querySelector('.heart-icon');
    const commentList = document.getElementById('comment-list');
    const commentBox = document.getElementById('comment-text');
    const commentBtn = document.querySelector('.comment-btn');

    likeIcon.addEventListener('click', function () {
        this.classList.toggle('active');
        updateLikeCount();
    });

    heartIcon.addEventListener('click', function () {
        this.classList.toggle('active');
        updateHeartCount();
    });

    function updateLikeCount() {
        const likeCountElement = document.querySelector('.like-count');
        const isLiked = likeIcon.classList.contains('active');
        likeCountElement.textContent = isLiked ? '1 me gusta' : '0 me gusta';
        likeCountElement.style.display = isLiked ? 'inline-block' : 'none'; // Mostrar solo si está activo
    }

    function updateHeartCount() {
        const heartCountElement = document.querySelector('.heart-count');
        const isHearted = heartIcon.classList.contains('active');
        heartCountElement.textContent = isHearted ? '1 corazón' : '0 corazones';
        heartCountElement.style.display = isHearted ? 'inline-block' : 'none'; // Mostrar solo si está activo
    }

    function enviarComentario() {
        const commentText = commentBox.value.trim();
        if (commentText !== '') {
            mostrarComentario(commentText);
            limpiarCampo();
        } else {
            alert('Por favor, escribe un comentario antes de enviar.');
        }
    }

    function mostrarComentario(comment) {
        // Mostrar la lista de comentarios
        commentList.classList.add('active');

        // Crear el elemento de comentario
        const commentItem = document.createElement('div');
        commentItem.classList.add('comment-item');

        // Contenido del comentario
        const commentContent = document.createElement('p');
        commentContent.classList.add('comment-content');
        commentContent.textContent = comment;

        // Autor del comentario (nombre de usuario desde la sesión)
        const commentAuthor = document.createElement('span');
        commentAuthor.classList.add('comment-author');
        commentAuthor.textContent = '<c:out value=\'${sessionScope.userName}\' />'; // Nombre del autor desde la sesión

        // Agregar contenido al comentario
        commentItem.appendChild(commentContent);
        commentItem.appendChild(commentAuthor);

        // Agregar el comentario a la lista
        commentList.appendChild(commentItem);
        actualizarContadorComentarios();
    }

    function actualizarContadorComentarios() {
        const commentCountElement = document.querySelector('.comment-count');
        const commentItems = document.querySelectorAll('.comment-item');
        commentCountElement.textContent = commentItems.length === 1 ? '1 comentario' : `${commentItems.length} comentarios`;
    }

    function limpiarCampo() {
        commentBox.value = '';
    }
});




//subir archivos a publicacion

document.addEventListener('DOMContentLoaded', function () {
    const selectFileLink = document.getElementById('select-file');

    selectFileLink.addEventListener('click', function (event) {
        event.preventDefault(); // Prevenir el comportamiento por defecto del enlace

        // Crear un input de tipo file en el DOM
        const input = document.createElement('input');
        input.type = 'file';
        input.style.display = 'none'; // Ocultar el input de tipo file

        // Agregar el input al DOM
        document.body.appendChild(input);

        // Simular el clic en el input para abrir el selector de archivos
        input.click();

        // Escuchar cuando se seleccione un archivo
        input.addEventListener('change', function () {
            const selectedFile = input.files[0]; // Obtener el archivo seleccionado
            if (selectedFile) {
                console.log('Archivo seleccionado:', selectedFile.name);
                // Aquí puedes procesar el archivo seleccionado como desees
            }
            document.body.removeChild(input); // Remover el input del DOM después de seleccionar el archivo
        });
    });
});


