package com.emergentes.dao;

import com.emergentes.modelo.Usuario;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diman
 */
public class UsuarioDAOimpl extends ConexionDB implements UsuarioDAO {

    @Override
    public void insert(Usuario usuario) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO usuarios (usuario, contraseña, tipo_usuario) VALUES (?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getContraseña());
            ps.setString(3, usuario.getTipo_usuario());
            ps.executeUpdate();

            // Obtener el ID generado por la base de datos
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                usuario.setID_usuario(rs.getInt(1)); // Establecer el ID generado en el objeto usuario
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Usuario usuario) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE usuarios SET usuario = ?, contraseña = ?, tipo_usuario = ? WHERE ID_usuario = ?");
            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getContraseña());
            ps.setString(3, usuario.getTipo_usuario());
            ps.setInt(4, usuario.getID_usuario());
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
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM usuarios WHERE ID_usuario = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Usuario getById(int id) throws Exception {
        Usuario usr = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM usuarios WHERE ID_usuario = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usr = new Usuario();
                usr.setID_usuario(rs.getInt("ID_usuario"));
                usr.setUsuario(rs.getString("usuario"));
                usr.setContraseña(rs.getString("contraseña"));
                usr.setTipo_usuario(rs.getString("tipo_usuario"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return usr;
    }

    @Override
    public List<Usuario> getAll() throws Exception {
        List<Usuario> lista = new ArrayList<>();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM usuarios");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usr = new Usuario();
                usr.setID_usuario(rs.getInt("ID_usuario"));
                usr.setUsuario(rs.getString("usuario"));
                usr.setContraseña(rs.getString("contraseña"));
                usr.setTipo_usuario(rs.getString("tipo_usuario"));
                lista.add(usr);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }

    @Override
    public Usuario getByUsernameAndPassword(String usuario, String contraseña) throws Exception {
        Usuario user = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM usuarios WHERE usuario = ? AND contraseña = ?");
            ps.setString(1, usuario);
            ps.setString(2, contraseña);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("ID_usuario");
                String user_name = rs.getString("usuario");
                String password = rs.getString("contraseña");
                String tipo_usuario = rs.getString("tipo_usuario");
                user = new Usuario(id, user_name, password, tipo_usuario);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return user;
    }

}
