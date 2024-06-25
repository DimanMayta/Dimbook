const btnSignInProfesores = document.getElementById("sign-in-profesores"),
        btnSignUpProfesores = document.getElementById("sign-up-profesores"),
        btnSignInEstudiantes = document.getElementById("sign-in-estudiantes"),
        btnSignUpEstudiantes = document.getElementById("sign-up-estudiantes"),
        btnSignInPadres = document.getElementById("sign-in-padres"),
        btnSignUpPadres = document.getElementById("sign-up-padres"),
        containerFormRegisterProfesores = document.getElementById("register-profesores"),
        containerFormRegisterEstudiantes = document.getElementById("register-estudiantes"),
        containerFormRegisterPadres = document.getElementById("register-padres"),
        containerFormLogin = document.querySelector(".container-form.login");

btnSignUpProfesores.addEventListener("click", e => {
    containerFormLogin.classList.add("hide");
    containerFormRegisterProfesores.classList.remove("hide");
});

btnSignInProfesores.addEventListener("click", e => {
    containerFormRegisterProfesores.classList.add("hide");
    containerFormLogin.classList.remove("hide");
});

btnSignUpEstudiantes.addEventListener("click", e => {
    containerFormLogin.classList.add("hide");
    containerFormRegisterEstudiantes.classList.remove("hide");
});

btnSignInEstudiantes.addEventListener("click", e => {
    containerFormRegisterEstudiantes.classList.add("hide");
    containerFormLogin.classList.remove("hide");
});

btnSignUpPadres.addEventListener("click", e => {
    containerFormLogin.classList.add("hide");
    containerFormRegisterPadres.classList.remove("hide");
});

btnSignInPadres.addEventListener("click", e => {
    containerFormRegisterPadres.classList.add("hide");
    containerFormLogin.classList.remove("hide");
});

// Ocultar la sección de login por defecto
containerFormLogin.classList.add("hide");


// Direccion de los botones a login

function showSection() {
    var urlParams = new URLSearchParams(window.location.search);
    var section = urlParams.get('section');

    if (section) {
        var element = document.getElementById('register-' + section);
        if (element) {
            element.classList.remove('hide');
        }
    } else {
        // Si no se especifica ninguna sección, mostrar la sección de login por defecto
        document.getElementById('login-section').classList.remove('hide');
    }
}
window.onload = showSection;
