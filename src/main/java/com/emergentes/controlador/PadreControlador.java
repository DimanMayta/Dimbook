package com.emergentes.controlador;

import com.emergentes.dao.PadreDAO;
import com.emergentes.dao.PadreDAOimpl;
import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Padre;
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
@WebServlet(name = "PadreControlador", urlPatterns = {"/PadreControlador"})
@MultipartConfig(maxFileSize = 16177215) // Tamaño máximo del archivo de imagen
public class PadreControlador extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAOimpl();
    private final PadreDAO padreDAO = new PadreDAOimpl();

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
            String nombres = request.getParameter("userNamesPadre");
            String apellidos = request.getParameter("ApellidoPadre");
            String email = request.getParameter("EmailPadre");
            String usuario = request.getParameter("userNamePadre");
            String contrasena = request.getParameter("userPasswordPadre");
            String codigoCurso = request.getParameter("CodigoCursoP");
            String nombreEstudiante = request.getParameter("NombreEstudianteP");

            try {
                Usuario usuarioObj = new Usuario();
                usuarioObj.setUsuario(usuario);
                usuarioObj.setContraseña(contrasena);
                usuarioObj.setTipo_usuario("padre");

                usuarioDAO.insert(usuarioObj);

                if (usuarioObj.getID_usuario() == 0) {
                    throw new Exception("ID de usuario no generado");
                }

                Padre padre = new Padre();
                padre.setID_usuario(usuarioObj.getID_usuario());
                padre.setNombre(nombres);
                padre.setApellido(apellidos);
                padre.setCorreo_electronico(email);
                padre.setUsuario(usuario);
                padre.setContraseña(contrasena);
                padre.setCodigo_curso(codigoCurso);
                padre.setNombre_de_estudiante(nombreEstudiante);

                HttpSession session = request.getSession();
                session.setAttribute("padre", padre);

                request.getRequestDispatcher("fotopadre.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error al registrar. Inténtelo nuevamente.");
                request.getRequestDispatcher("login.jsp?section=padres").forward(request, response);
            }
        } else if ("uploadPhoto".equals(action)) {
            try {
                HttpSession session = request.getSession();
                Padre padre = (Padre) session.getAttribute("padre");

                if (padre == null) {
                    throw new ServletException("Padre no encontrado en la sesión");
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
                    padre.setFoto_perfil("uploads" + File.separator + fileName);
                }

                // Guarda la información del padre en la base de datos
                padreDAO.insert(padre);

                // Guardamos la información en la sesión
                session.setAttribute("userId", padre.getID_usuario());
                session.setAttribute("userName", padre.getNombre());
                session.setAttribute("userProfilePic", padre.getFoto_perfil());

                response.sendRedirect("PlatPadre.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error al cargar la fotografía de perfil. Inténtelo nuevamente.");
                request.getRequestDispatcher("fotopadre.jsp").forward(request, response);
            }
        }
    }

}
