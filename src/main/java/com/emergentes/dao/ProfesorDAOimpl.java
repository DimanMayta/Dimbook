package com.emergentes.dao;

import com.emergentes.modelo.Profesor;
import com.emergentes.modelo.Usuario;
import com.emergentes.utiles.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diman
 */
public class ProfesorDAOimpl extends ConexionDB implements ProfesorDAO {

    @Override
    public void insert(Profesor profesor) throws Exception {
        Connection conn = null;
        PreparedStatement psProfesor = null;

        try {
            conn = this.conectar();
            conn.setAutoCommit(false); // Iniciar transacción

            // Insertar en la tabla profesores
            String sql = "INSERT INTO profesores (ID_usuario, nombre, apellido, correo_electronico, usuario, contraseña, foto_perfil, materias, ubicacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            psProfesor = conn.prepareStatement(sql);
            psProfesor.setInt(1, profesor.getID_usuario());
            psProfesor.setString(2, profesor.getNombre());
            psProfesor.setString(3, profesor.getApellido());
            psProfesor.setString(4, profesor.getCorreo_electronico());
            psProfesor.setString(5, profesor.getUsuario());
            psProfesor.setString(6, profesor.getContraseña());
            psProfesor.setString(7, profesor.getFoto_perfil());
            psProfesor.setString(8, profesor.getMaterias());
            psProfesor.setString(9, profesor.getUbicacion());

            int filasInsertadasProfesor = psProfesor.executeUpdate();

            if (filasInsertadasProfesor > 0) {
                System.out.println("Registro insertado correctamente en la tabla profesores");
            } else {
                throw new SQLException("Error al insertar el registro en la tabla profesores");
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
            if (psProfesor != null) {
                psProfesor.close();
            }
            this.desconectar();
        }
    }

    @Override
    public void update(Profesor profesor) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE profesores SET nombre = ?, apellido = ?, correo_electronico = ?, usuario = ?, contraseña = ?, foto_perfil = ?, materias = ?, ubicacion = ? WHERE ID_profesor = ?");
            ps.setString(1, profesor.getNombre());
            ps.setString(2, profesor.getApellido());
            ps.setString(3, profesor.getCorreo_electronico());
            ps.setString(4, profesor.getUsuario());
            ps.setString(5, profesor.getContraseña());
            ps.setString(6, profesor.getFoto_perfil());
            ps.setString(7, profesor.getMaterias());
            ps.setString(8, profesor.getUbicacion());
            ps.setInt(9, profesor.getID_profesor());
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
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM profesores WHERE ID_profesor = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Profesor getById(int id) throws Exception {
        Profesor prof = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM profesores WHERE ID_profesor = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                prof = new Profesor();
                prof.setID_profesor(rs.getInt("ID_profesor"));
                prof.setID_usuario(rs.getInt("ID_usuario"));
                prof.setNombre(rs.getString("nombre"));
                prof.setApellido(rs.getString("apellido"));
                prof.setCorreo_electronico(rs.getString("correo_electronico"));
                prof.setUsuario(rs.getString("usuario"));
                prof.setContraseña(rs.getString("contraseña"));
                prof.setFoto_perfil(rs.getString("foto_perfil"));
                prof.setMaterias(rs.getString("materias"));
                prof.setUbicacion(rs.getString("ubicacion"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return prof;
    }

    @Override
    public List<Profesor> getAll() throws Exception {
        List<Profesor> lista = new ArrayList<>();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM profesores");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Profesor prof = new Profesor();
                prof.setID_profesor(rs.getInt("ID_profesor"));
                prof.setID_usuario(rs.getInt("ID_usuario"));
                prof.setNombre(rs.getString("nombre"));
                prof.setApellido(rs.getString("apellido"));
                prof.setCorreo_electronico(rs.getString("correo_electronico"));
                prof.setUsuario(rs.getString("usuario"));
                prof.setContraseña(rs.getString("contraseña"));
                prof.setFoto_perfil(rs.getString("foto_perfil"));
                prof.setMaterias(rs.getString("materias"));
                prof.setUbicacion(rs.getString("ubicacion"));
                lista.add(prof);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }

    @Override
    public Profesor getByUserId(int userId) throws Exception {
        Profesor prof = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM profesores WHERE ID_usuario = ?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                prof = new Profesor();
                prof.setID_profesor(rs.getInt("ID_profesor"));
                prof.setID_usuario(rs.getInt("ID_usuario"));
                prof.setNombre(rs.getString("nombre"));
                prof.setApellido(rs.getString("apellido"));
                prof.setCorreo_electronico(rs.getString("correo_electronico"));
                prof.setUsuario(rs.getString("usuario"));
                prof.setContraseña(rs.getString("contraseña"));
                prof.setFoto_perfil(rs.getString("foto_perfil"));
                prof.setMaterias(rs.getString("materias"));
                prof.setUbicacion(rs.getString("ubicacion"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return prof;
    }

}
