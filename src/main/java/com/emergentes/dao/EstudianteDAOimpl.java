package com.emergentes.dao;

import com.emergentes.modelo.Estudiante;
import com.emergentes.utiles.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diman
 */
public class EstudianteDAOimpl extends ConexionDB implements EstudianteDAO {

    public EstudianteDAOimpl() {
    }

    @Override
    public void insert(Estudiante estudiante) throws Exception {
        Connection conn = null;
        PreparedStatement psEstudiante = null;

        try {
            conn = this.conectar();
            conn.setAutoCommit(false); // Iniciar transacción

            // Insertar en la tabla estudiantes
            String sql = "INSERT INTO estudiantes (ID_usuario, nombre, apellido, codigo_curso, correo_electronico, usuario, contraseña, foto_perfil) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            psEstudiante = conn.prepareStatement(sql);
            psEstudiante.setInt(1, estudiante.getID_usuario());
            psEstudiante.setString(2, estudiante.getNombre());
            psEstudiante.setString(3, estudiante.getApellido());
            psEstudiante.setString(4, estudiante.getCodigo_curso());
            psEstudiante.setString(5, estudiante.getCorreo_electronico());
            psEstudiante.setString(6, estudiante.getUsuario());
            psEstudiante.setString(7, estudiante.getContraseña());
            psEstudiante.setString(8, estudiante.getFoto_perfil());

            int filasInsertadasEstudiante = psEstudiante.executeUpdate();

            if (filasInsertadasEstudiante > 0) {
                System.out.println("Registro insertado correctamente en la tabla estudiantes");
            } else {
                throw new SQLException("Error al insertar el registro en la tabla estudiantes");
            }

            conn.commit(); // Confirmar la transacción

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback en caso de error
                } catch (SQLException ex) {
                    System.out.println("Error al hacer rollback: " + ex.getMessage());
                }
            }
            throw e; // Lanzar excepción para manejo superior
        } finally {
            // Cerrar recursos
            if (psEstudiante != null) {
                psEstudiante.close();
            }
            this.desconectar();
        }
    }

    @Override
    public void update(Estudiante estudiante) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE estudiantes SET nombre = ?, apellido = ?, codigo_curso = ?, correo_electronico = ?, usuario = ?, contraseña = ?, foto_perfil = ? WHERE ID_estudiante = ?");
            ps.setString(1, estudiante.getNombre());
            ps.setString(2, estudiante.getApellido());
            ps.setString(3, estudiante.getCodigo_curso());
            ps.setString(4, estudiante.getCorreo_electronico());
            ps.setString(5, estudiante.getUsuario());
            ps.setString(6, estudiante.getContraseña());
            ps.setString(7, estudiante.getFoto_perfil());
            ps.setInt(8, estudiante.getID_estudiante());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM estudiantes WHERE ID_estudiante = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Estudiante getById(int id) throws Exception {
        Estudiante estudiante = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM estudiantes WHERE ID_estudiante = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                estudiante = new Estudiante();
                estudiante.setID_estudiante(rs.getInt("ID_estudiante"));
                estudiante.setID_usuario(rs.getInt("ID_usuario"));
                estudiante.setNombre(rs.getString("nombre"));
                estudiante.setApellido(rs.getString("apellido"));
                estudiante.setCodigo_curso(rs.getString("codigo_curso"));
                estudiante.setCorreo_electronico(rs.getString("correo_electronico"));
                estudiante.setUsuario(rs.getString("usuario"));
                estudiante.setContraseña(rs.getString("contraseña"));
                estudiante.setFoto_perfil(rs.getString("foto_perfil"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return estudiante;
    }

    @Override
    public List<Estudiante> getAll() throws Exception {
        List<Estudiante> lista = new ArrayList<>();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM estudiantes");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Estudiante estudiante = new Estudiante();
                estudiante.setID_estudiante(rs.getInt("ID_estudiante"));
                estudiante.setID_usuario(rs.getInt("ID_usuario"));
                estudiante.setNombre(rs.getString("nombre"));
                estudiante.setApellido(rs.getString("apellido"));
                estudiante.setCodigo_curso(rs.getString("codigo_curso"));
                estudiante.setCorreo_electronico(rs.getString("correo_electronico"));
                estudiante.setUsuario(rs.getString("usuario"));
                estudiante.setContraseña(rs.getString("contraseña"));
                estudiante.setFoto_perfil(rs.getString("foto_perfil"));
                lista.add(estudiante);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }

    @Override
    public Estudiante getByUserId(int userId) throws Exception {
        Estudiante estudiante = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM estudiantes WHERE ID_usuario = ?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                estudiante = new Estudiante();
                estudiante.setID_estudiante(rs.getInt("ID_estudiante"));
                estudiante.setID_usuario(rs.getInt("ID_usuario"));
                estudiante.setNombre(rs.getString("nombre"));
                estudiante.setApellido(rs.getString("apellido"));
                estudiante.setCodigo_curso(rs.getString("codigo_curso"));
                estudiante.setCorreo_electronico(rs.getString("correo_electronico"));
                estudiante.setUsuario(rs.getString("usuario"));
                estudiante.setContraseña(rs.getString("contraseña"));
                estudiante.setFoto_perfil(rs.getString("foto_perfil"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return estudiante;
    }

}
