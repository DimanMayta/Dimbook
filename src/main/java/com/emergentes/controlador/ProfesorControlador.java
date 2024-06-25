package com.emergentes.controlador;

import com.emergentes.dao.ProfesorDAO;
import com.emergentes.dao.ProfesorDAOimpl;
import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Profesor;
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
@WebServlet(name = "ProfesorControlador", urlPatterns = {"/ProfesorControlador"})
@MultipartConfig(maxFileSize = 16177215) // Tamaño máximo del archivo de imagen
public class ProfesorControlador extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAOimpl();
    private final ProfesorDAO profesorDAO = new ProfesorDAOimpl();

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
            String nombres = request.getParameter("NombresProfesor");
            String apellidos = request.getParameter("ApellidoProfesor");
            String email = request.getParameter("EmailProfesor");
            String username = request.getParameter("userNameProfesor");
            String password = request.getParameter("userPasswordProfesor");

            try {
                Usuario usuario = new Usuario();
                usuario.setUsuario(username);
                usuario.setContraseña(password);
                usuario.setTipo_usuario("profesor");

                usuarioDAO.insert(usuario);

                if (usuario.getID_usuario() == 0) {
                    throw new Exception("ID de usuario no generado");
                }

                Profesor profesor = new Profesor();
                profesor.setNombre(nombres);
                profesor.setApellido(apellidos);
                profesor.setCorreo_electronico(email);
                profesor.setUsuario(username);
                profesor.setContraseña(password);
                profesor.setID_usuario(usuario.getID_usuario());

                HttpSession session = request.getSession();
                session.setAttribute("profesor", profesor);

                request.getRequestDispatcher("fotoprofesor.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error al registrar. Inténtelo nuevamente.");
                request.getRequestDispatcher("login.jsp?section=profesores").forward(request, response);
            }
        } else if ("uploadPhoto".equals(action)) {
            try {
                HttpSession session = request.getSession();
                Profesor profesor = (Profesor) session.getAttribute("profesor");

                if (profesor == null) {
                    throw new ServletException("Profesor no encontrado en la sesión");
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
                    profesor.setFoto_perfil("uploads" + File.separator + fileName);
                }

                session.setAttribute("profesor", profesor);
                request.getRequestDispatcher("AreaProfesor.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error al cargar la fotografía de perfil. Inténtelo nuevamente.");
                request.getRequestDispatcher("fotoprofesor.jsp").forward(request, response);
            }
        } else if ("selectSubjects".equals(action)) {
            try {
                HttpSession session = request.getSession();
                Profesor profesor = (Profesor) session.getAttribute("profesor");

                if (profesor == null) {
                    throw new ServletException("Profesor no encontrado en la sesión");
                }

                String[] materias = request.getParameterValues("materia");
                if (materias != null) {
                    String materiasStr = String.join(",", materias);
                    profesor.setMaterias(materiasStr);
                }

                session.setAttribute("profesor", profesor);
                response.sendRedirect("UbicacionProfesor.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error al seleccionar las materias. Inténtelo nuevamente.");
                request.getRequestDispatcher("AreaProfesor.jsp").forward(request, response);
            }
        } else if ("registerLocation".equals(action)) {
            try {
                HttpSession session = request.getSession();
                Profesor profesor = (Profesor) session.getAttribute("profesor");

                if (profesor == null) {
                    throw new ServletException("Profesor no encontrado en la sesión");
                }

                String ubicacion = request.getParameter("ubicacion");
                if (ubicacion != null && !ubicacion.trim().isEmpty()) {
                    profesor.setUbicacion(ubicacion);
                    System.out.println("Ubicación registrada: " + ubicacion); // Verificación en el servidor

                    // Guarda la información del profesor en la base de datos
                    profesorDAO.insert(profesor);
                    
                    //vamos guardando la informacion en la sesion
                    session.setAttribute("userId", profesor.getID_usuario());
                    session.setAttribute("userName", profesor.getNombre());
                    session.setAttribute("userProfilePic", profesor.getFoto_perfil());
                    
                    response.sendRedirect("Platprofesor.jsp");
                } else {
                    throw new ServletException("Ubicación no proporcionada");
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error al registrar la ubicación. Inténtelo nuevamente.");
                request.getRequestDispatcher("UbicacionProfesor.jsp").forward(request, response);
            }
        }
    }

}
