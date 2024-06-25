package com.emergentes.dao;

import com.emergentes.modelo.Padre;
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
public class PadreDAOimpl extends ConexionDB implements PadreDAO {

    public PadreDAOimpl() {
    }

    @Override
    public void insert(Padre padre) throws Exception {
        Connection conn = null;
        PreparedStatement psPadre = null;

        try {
            conn = this.conectar();
            conn.setAutoCommit(false); // Iniciar transacción

            // Insertar en la tabla padres
            String sql = "INSERT INTO padres (ID_usuario, nombre, apellido, correo_electronico, usuario, contraseña, codigo_curso, nombre_de_estudiante, foto_perfil) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            psPadre = conn.prepareStatement(sql);
            psPadre.setInt(1, padre.getID_usuario());
            psPadre.setString(2, padre.getNombre());
            psPadre.setString(3, padre.getApellido());
            psPadre.setString(4, padre.getCorreo_electronico());
            psPadre.setString(5, padre.getUsuario());
            psPadre.setString(6, padre.getContraseña());
            psPadre.setString(7, padre.getCodigo_curso());
            psPadre.setString(8, padre.getNombre_de_estudiante());
            psPadre.setString(9, padre.getFoto_perfil());

            int filasInsertadasPadre = psPadre.executeUpdate();

            if (filasInsertadasPadre > 0) {
                System.out.println("Registro insertado correctamente en la tabla padres");
            } else {
                throw new SQLException("Error al insertar el registro en la tabla padres");
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
            if (psPadre != null) {
                psPadre.close();
            }
            this.desconectar();
        }
    }

    @Override
    public void update(Padre padre) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE padres SET nombre = ?, apellido = ?, correo_electronico = ?, usuario = ?, contraseña = ?, foto_perfil = ?, codigo_curso = ?, nombre_de_estudiante = ? WHERE ID_padre = ?");
            ps.setString(1, padre.getNombre());
            ps.setString(2, padre.getApellido());
            ps.setString(3, padre.getCorreo_electronico());
            ps.setString(4, padre.getUsuario());
            ps.setString(5, padre.getContraseña());
            ps.setString(6, padre.getFoto_perfil());
            ps.setString(7, padre.getCodigo_curso());
            ps.setString(8, padre.getNombre_de_estudiante());
            ps.setInt(9, padre.getID_padre());
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
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM padres WHERE ID_padre = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Padre getById(int id) throws Exception {
        Padre padre = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM padres WHERE ID_padre = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                padre = new Padre();
                padre.setID_padre(rs.getInt("ID_padre"));
                padre.setID_usuario(rs.getInt("ID_usuario"));
                padre.setNombre(rs.getString("nombre"));
                padre.setApellido(rs.getString("apellido"));
                padre.setCorreo_electronico(rs.getString("correo_electronico"));
                padre.setUsuario(rs.getString("usuario"));
                padre.setContraseña(rs.getString("contraseña"));
                padre.setFoto_perfil(rs.getString("foto_perfil"));
                padre.setCodigo_curso(rs.getString("codigo_curso"));
                padre.setNombre_de_estudiante(rs.getString("nombre_de_estudiante"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return padre;
    }

    @Override
    public List<Padre> getAll() throws Exception {
        List<Padre> lista = new ArrayList<>();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM padres");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Padre padre = new Padre();
                padre.setID_padre(rs.getInt("ID_padre"));
                padre.setID_usuario(rs.getInt("ID_usuario"));
                padre.setNombre(rs.getString("nombre"));
                padre.setApellido(rs.getString("apellido"));
                padre.setCorreo_electronico(rs.getString("correo_electronico"));
                padre.setUsuario(rs.getString("usuario"));
                padre.setContraseña(rs.getString("contraseña"));
                padre.setFoto_perfil(rs.getString("foto_perfil"));
                padre.setCodigo_curso(rs.getString("codigo_curso"));
                padre.setNombre_de_estudiante(rs.getString("nombre_de_estudiante"));
                lista.add(padre);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }

    @Override
    public Padre getByUserId(int userId) throws Exception {
        Padre padre = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM padres WHERE ID_usuario = ?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                padre = new Padre();
                padre.setID_padre(rs.getInt("ID_padre"));
                padre.setID_usuario(rs.getInt("ID_usuario"));
                padre.setNombre(rs.getString("nombre"));
                padre.setApellido(rs.getString("apellido"));
                padre.setCorreo_electronico(rs.getString("correo_electronico"));
                padre.setUsuario(rs.getString("usuario"));
                padre.setContraseña(rs.getString("contraseña"));
                padre.setFoto_perfil(rs.getString("foto_perfil"));
                padre.setCodigo_curso(rs.getString("codigo_curso"));
                padre.setNombre_de_estudiante(rs.getString("nombre_de_estudiante"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return padre;
    }

}
