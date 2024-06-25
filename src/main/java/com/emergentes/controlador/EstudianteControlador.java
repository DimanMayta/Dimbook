package com.emergentes.controlador;

import com.emergentes.dao.EstudianteDAO;
import com.emergentes.dao.EstudianteDAOimpl;
import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Estudiante;
import com.emergentes.modelo.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Diman
 */
@WebServlet(name = "EstudianteControlador", urlPatterns = {"/EstudianteControlador"})
@MultipartConfig(maxFileSize = 16177215) // Tamaño máximo del archivo de imagen
public class EstudianteControlador extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAOimpl();
    private final EstudianteDAO estudianteDAO = new EstudianteDAOimpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            String nombres = request.getParameter("NombresEstudiante");
            String apellidos = request.getParameter("ApellidoEstudiante");
            String email = request.getParameter("EmailEstudiante");
            String username = request.getParameter("userNameEstudiante");
            String password = request.getParameter("userPasswordEstudiante");
            String codigoCurso = request.getParameter("CodigoCursoE");

            try {
                Usuario usuario = new Usuario();
                usuario.setUsuario(username);
                usuario.setContraseña(password);
                usuario.setTipo_usuario("estudiante");

                usuarioDAO.insert(usuario);

                if (usuario.getID_usuario() == 0) {
                    throw new Exception("ID de usuario no generado");
                }

                Estudiante estudiante = new Estudiante();
                estudiante.setNombre(nombres);
                estudiante.setApellido(apellidos);
                estudiante.setCorreo_electronico(email);
                estudiante.setUsuario(username);
                estudiante.setContraseña(password);
                estudiante.setID_usuario(usuario.getID_usuario());
                estudiante.setCodigo_curso(codigoCurso);

                HttpSession session = request.getSession();
                session.setAttribute("estudiante", estudiante);

                request.getRequestDispatcher("fotoestudiante.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error al registrar. Inténtelo nuevamente.");
                request.getRequestDispatcher("login.jsp?section=estudiantes").forward(request, response);
            }
        } else if ("uploadPhoto".equals(action)) {
            try {
                HttpSession session = request.getSession();
                Estudiante estudiante = (Estudiante) session.getAttribute("estudiante");

                if (estudiante == null) {
                    throw new ServletException("Estudiante no encontrado en la sesión");
                }

                Part filePart = request.getPart("imagen");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = filePart.getSubmittedFileName();
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }

                    filePart.write(uploadPath + File.separator + fileName);
                    estudiante.setFoto_perfil("uploads" + File.separator + fileName);
                }

                // Guarda la información del estudiante en la base de datos
                estudianteDAO.insert(estudiante);

                // Guardamos la información en la sesión
                session.setAttribute("userId", estudiante.getID_usuario());
                session.setAttribute("userName", estudiante.getNombre());
                session.setAttribute("userProfilePic", estudiante.getFoto_perfil());

                response.sendRedirect("PlatEstudiante.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error al cargar la fotografía de perfil. Inténtelo nuevamente.");
                request.getRequestDispatcher("fotoestudiante.jsp").forward(request, response);
            }
        }
    }

}
