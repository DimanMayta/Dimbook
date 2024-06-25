package com.emergentes.controlador;

import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Usuario;
import com.emergentes.utiles.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diman
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/UsuarioControlador"})
public class UsuarioControlador extends HttpServlet {

    private UsuarioDAO usuarioDAO = new UsuarioDAOimpl(); // Instancia del DAO para operaciones con usuarios

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("userName");
        String contraseña = request.getParameter("userPassword");

        try {
            Usuario user = usuarioDAO.getByUsernameAndPassword(usuario, contraseña);

            if (user != null) {
                // Usuario y contraseña válidos
                System.out.println("Usuario y contraseña correctos");

                // Determinar a qué página redirigir según el tipo de usuario
                String tipoUsuario = user.getTipo_usuario();
                String redirectPage = "PlatEstudiante.jsp"; // Página por defecto para estudiante

                if ("profesor".equals(tipoUsuario)) {
                    redirectPage = "Platprofesor.jsp";
                } else if ("padre".equals(tipoUsuario)) {
                    redirectPage = "PlatPadre.jsp";
                }

                HttpSession ses = request.getSession();
                ses.setAttribute("usuario", user.getUsuario()); // Guardar el nombre de usuario en la sesión
                RequestDispatcher dispatcher = request.getRequestDispatcher(redirectPage);
                dispatcher.forward(request, response);
            } else {
                // Usuario o contraseña incorrectos
                System.out.println("Usuario o contraseña incorrectos");
                response.sendRedirect("login.jsp?error=1"); // Redirigir al formulario de inicio de sesión con un parámetro de error
            }
        } catch (Exception ex) {
            // Error al conectar con la base de datos
            ex.printStackTrace();
            response.sendRedirect("login.jsp?error=2"); // Redirigir al formulario de inicio de sesión con un parámetro de error
        }
    }

}
