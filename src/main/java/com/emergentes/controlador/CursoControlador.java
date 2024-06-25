package com.emergentes.controlador;

import com.emergentes.dao.CursoDAO;
import com.emergentes.dao.CursoDAOimpl;
import com.emergentes.modelo.Curso;
import com.emergentes.modelo.Profesor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "CursoControlador", urlPatterns = {"/CursoControlador"})
public class CursoControlador extends HttpServlet {

    private final CursoDAO cursoDAO = new CursoDAOimpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Platprofesor.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            String titulo = request.getParameter("titulo");
            String descripcion = request.getParameter("descripcion");
            String codigoCurso = request.getParameter("codigoCurso");

            // Obtener el ID del profesor desde la sesión
            HttpSession session = request.getSession();
            Profesor profesor = (Profesor) session.getAttribute("profesor");

            if (profesor == null) {
                // Redirigir al login si no hay profesor en la sesión
                response.sendRedirect("login.jsp");
                return;
            }

            int idProfesor = profesor.getID_profesor();

            try {
                Curso curso = new Curso(titulo, descripcion, codigoCurso, idProfesor);
                cursoDAO.insert(curso);

                // Redirigir a la misma página Platprofesor.jsp después del registro exitoso
                response.sendRedirect("Platprofesor.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error al registrar el curso. Inténtelo nuevamente.");
                request.getRequestDispatcher("curso.jsp").forward(request, response);
            }
        }
    }

}
