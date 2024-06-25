package com.emergentes.dao;

import com.emergentes.modelo.Usuario;
import java.util.List;

/**
 *
 * @author Diman
 */
public interface UsuarioDAO {
    public void insert(Usuario usuario) throws Exception;
    public void update(Usuario usuario) throws Exception;
    public void delete(int id) throws Exception;
    public Usuario getById(int id) throws Exception;
    public List<Usuario> getAll() throws Exception;
    // Nuevo método para obtener un usuario por su nombre de usuario y contraseña
    public Usuario getByUsernameAndPassword(String usuario, String contraseña) throws Exception;
}
